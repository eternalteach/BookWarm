using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.Mvc;
using Vertex.Core;
using Vertex.Core.Entities;
using Vertex.Core.Helpers;
using Vertex.Service;
using Vertex.Web.Framework.Controllers;
using Vertex.Web.Framework.Helpers;
using Vertex.Web.Framework.UI;
using Vertex.Web.Framework.Utilities;
using Vertex.Web.Models;

namespace Vertex.Web.Controllers
{
    public class BlogController : BaseController
    {
        #region Fields

        private readonly ICategoryService categoryService;
        private readonly IPostService postService;
        private readonly IUrlService urlService;
        private readonly IPostTagService tagService;
        private readonly ISettingService settingService;
        private readonly IMediaStorageService mediaStorageService;
        private readonly ISocialNetworkService socialNetworkService;
        private readonly ApplicationUserService userService;

        #endregion Fields

        #region Ctor

        public BlogController(ICategoryService _categoryService,
            IPostService _postService,
            IUrlService _urlService,
            IPostTagService _tagService,
            ISettingService _settingService,
            IMediaStorageService _mediaStorageService,
            ISocialNetworkService _socialNetworkService,
            ApplicationUserService _userService)
        {
            categoryService = _categoryService;
            postService = _postService;
            urlService = _urlService;
            tagService = _tagService;
            settingService = _settingService;
            mediaStorageService = _mediaStorageService;
            socialNetworkService = _socialNetworkService;
            userService = _userService;
        }

        #endregion Ctor

        #region Actions

        public ActionResult ListRightSidebar()
        {
            return View();
        }

        public ActionResult ListLeftSidebar()
        {
            return View();
        }

        public ActionResult ListFullWidth()
        {
            return View();
        }

        public ActionResult GridRightSidebar()
        {
            return View();
        }

        public ActionResult GridLeftSidebar()
        {
            return View();
        }

        public ActionResult GridFullWidth()
        {
            return View();
        }

        public ActionResult CardRightSidebar()
        {
            return View();
        }

        public ActionResult CardLeftSidebar()
        {
            return View();
        }

        public ActionResult CardFullWidth()
        {
            return View();
        }

        #endregion Actions

        #region Methods

        public ActionResult Category(int? Id)
        {
            if (!Id.HasValue)
                return NotFound();

            var category = categoryService.GetById(Id.Value);

            if (category == null)
                return NotFound();

            if (!category.IsActive || category.IsDelete)
                return NotActive();

            var model = new CategoryDetailModel()
            {
                Id = category.Id,
                Name = category.Name
            };

            return View(model);
        }

        public ActionResult Post(int? Id)
        {
            if (!Id.HasValue)
                return HomePage();

            var post = postService.GetById(Id.Value);

            if (post == null)
                return NotFound();

            if (!post.IsActive || post.IsDelete)
                return NotActive();

            string cookieKey = string.Format(CookieConstant.POST_VIEW, post.Id);
            if (!CookieHelper.Exists(cookieKey))
            {
                CookieHelper.Set(cookieKey, WebHelper.IpAddress, 1);
                post.ViewCount += 1;
                postService.Update(post);
            }

            var model = new PostDetailModel
            {
                Id = post.Id,
                Title = post.Title,
                Content = post.Description,
                PicturePath = post.Picture.FilePath,
                Url = urlService.GetUrl(post.Id, nameof(Post)),
                User = post.User,
                CreateDate = post.CreateDateUtc,
                UpdateDate = post.UpdateDateUtc,
                ViewCount = post.ViewCount,
                CategoryName = post.Category.Name,
                CategoryUrl = post.Category.Url,
                AllowComment = post.AllowComment,
                PostFormat = post.Format,
                PostFormatValue = post.FormatValue,
                ApproveComment = post.ApproveComment,
                CommentCount = postService.GetCommentCount(post.Id, true),
                Tags = tagService.GetTagsByPostId(postId: post.Id).Select(x => new TagModel
                {
                    Name = x.Name
                }).ToList()
            };
            model.User.SocialNetworks = post.User.SocialNetworks;

            if (settingService.GetByName("post.related.view").BoolValue)
            {
                model.RelatedPosts = postService.GetRelatedPosts(post.CategoryId, post.Id).Select(x => new PostModel
                {
                    Id = x.Id,
                    Title = x.Title,
                    PicturePath = mediaStorageService.GetPictureUrl(x.PictureId),
                    CreateDate = x.CreateDateUtc,
                    CategoryName = categoryService.GetById(x.CategoryId).Name,
                    User = userService.FindByIdAsync(x.UserId).Result,
                    CommentCount = 0,
                    ViewCount = x.ViewCount,
                    Url = urlService.GetUrl(x.Id, nameof(Post))
                }).ToList();
            }

            if (settingService.GetByName("post.comment.enabled").BoolValue)
            {
                model.Comments = postService.GetComments(post.Id, true).Select(x => new CommentListModel
                {
                    Id = x.Id,
                    ParentId = x.ParentId,
                    FullName = x.FullName,
                    Comment = x.Commentary,
                    UserId = x.UserId,
                    UserAvatarUrl = userService.GetById(x.UserId).Avatar.FilePath,
                    Approved = x.Approved,
                    CreateDate = x.CommentDateUtc.ToRelativeFormat(),
                    ChildComments = postService.GetChildComments(post.Id, x.Id, approved: true).Select(c => new CommentListModel
                    {
                        Id = c.Id,
                        ParentId = c.ParentId,
                        FullName = c.FullName,
                        Comment = c.Commentary,
                        UserId = c.UserId,
                        UserAvatarUrl = userService.GetById(x.UserId).Avatar.FilePath,
                        Approved = c.Approved,
                        CreateDate = c.CommentDateUtc.ToRelativeFormat(),
                    }).ToList()
                }).ToList();
            }

            return View(this.GetViewName(post), model);
        }

        [HttpPost]
        public JsonResult Comment(AddCommentModel model)
        {
            var alert = HtmlHelper.Vertex().Alert();
            try
            {
                bool isValid = !string.IsNullOrEmpty(model.Content);
                if (!Request.IsAuthenticated)
                {
                    isValid = !(string.IsNullOrEmpty(model.FullName) ||
                                string.IsNullOrEmpty(model.Email) ||
                                string.IsNullOrEmpty(model.Content));
                }

                if (isValid)
                {
                    var post = postService.GetById(model.PostId);

                    var comment = new Comment();
                    var userAvatarUrl = mediaStorageService.GetPictureUrl(null);

                    if (Request.IsAuthenticated)
                    {
                        var userId = User.Identity.GetUserId();
                        var currentUser = userService.FindById(userId);

                        comment.UserId = userId;
                        comment.FullName = currentUser.UserName;
                        comment.Email = currentUser.Email;
                        userAvatarUrl = mediaStorageService.GetPictureUrl(currentUser.PictureId);
                    }
                    else
                    {
                        comment.UserId = null;
                        comment.FullName = model.FullName;
                        comment.Email = model.Email;
                    }

                    if (model.ParentId.HasValue && model.ParentId.Value > 0)
                        comment.ParentId = model.ParentId;

                    comment.PostId = model.PostId;
                    comment.Commentary = model.Content;
                    comment.Approved = post.ApproveComment;
                    comment.CommentDateUtc = DateTime.UtcNow;

                    comment.Commentary = WebHelper.ConvertPlainTextToHtml(comment.Commentary);

                    var result = postService.SaveComment(comment);
                    if (result)
                    {
                        #region Comment Template

                        string subCommentTemplate =
                            @"<div class='comment-subitem media mt-4'>" +
                                "<a href='#'>" +
                                    "<img class='avatar comment-user-avatar mr-3 pi-img-round' src='/Content/img/nophoto.jpg' alt='@FullName' title='@FullName' />" +
                                "</a>" +
                                "<div class='media-body'>" +
                                    "<h4 class='h6 mb-1'>@FullName <span class='small ml-2 text-muted comment-date'>@CreateDate</span></h4>" +
                                    "<p class='mb-1 comment-content'>" +
                                        "@Content" +
                                    "</p>" +
                                "</div>" +
                            "</div>";
                        subCommentTemplate = subCommentTemplate.Replace("@FullName", comment.FullName)
                            .Replace("@CreateDate", comment.CommentDateUtc.ToRelativeFormat())
                            .Replace("@Content", comment.Commentary)
                            .Replace("/Content/img/nophoto.jpg", userAvatarUrl);

                        string contentTemplate =
                            @"<li class='comment-item media mt-5'>" +
                                "<a href='#'>" +
                                    "<img class='avatar comment-user-avatar mr-3 pi-img-round' src='/Content/img/nophoto.jpg' alt='@FullName' title='@FullName' />" +
                                "</a>" +
                                "<div class='media-body clearfix'>" +
                                    "<h4 class='h6 mb-1 comment-full-name'>@FullName <span class='small ml-2 text-muted comment-date'>@CreateDate</span></h4>" +
                                    "<p class='mb-1 comment-content'>" +
                                        "@Content" +
                                    "</p>" +
                                    "<a href='javascript:void(0)' data-comment-id='@Id' class='comment-reply text-primary anim-link-2 anim-link-2-primary small'>Reply</a>" +
                                "</div>" +
                            "</li>";
                        contentTemplate = contentTemplate.Replace("@FullName", comment.FullName)
                            .Replace("@CreateDate", comment.CommentDateUtc.ToRelativeFormat())
                            .Replace("@Content", comment.Commentary)
                            .Replace("@Id", comment.Id.ToString())
                            .Replace("/Content/img/nophoto.jpg", userAvatarUrl);

                        #endregion Comment Template

                        string appromeMessage = alert.Text("Thanks, your comment sent to approve.").Color(BootstrapColor.Success).ToHtmlString();

                        if (comment.ParentId.HasValue)
                        {
                            return Json(new
                            {
                                success = true,
                                postId = comment.PostId,
                                parentId = comment.ParentId,
                                result = comment.Approved ? subCommentTemplate : appromeMessage
                            }, JsonRequestBehavior.AllowGet);
                        }
                        else
                        {
                            return Json(new
                            {
                                success = true,
                                postId = comment.PostId,
                                result = comment.Approved ? contentTemplate : appromeMessage
                            }, JsonRequestBehavior.AllowGet);
                        }
                    }
                }

                return Json(new
                {
                    success = false,
                    postId = model.PostId,
                    parentId = (model.ParentId.HasValue && model.ParentId.Value > 0) ? model.ParentId.Value : 0,
                    result = alert.Text("Enter required fields.").Color(BootstrapColor.Warning).AppendCssClass("mt-2").ToHtmlString()
                }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    success = false,
                    postId = model.PostId,
                    parentId = (model.ParentId.HasValue && model.ParentId.Value > 0) ? model.ParentId.Value : 0,
                    result = alert.Text("Something is wrong, please try again.\n Detail: " + ex.Message).Color(BootstrapColor.Danger).ToHtmlString()
                }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public ActionResult Search(string term)
        {
            if (string.IsNullOrEmpty(term))
                return HomePage();

            var model = new PostSearchModel()
            {
                Term = term
            };

            return View(model);
        }

        private string GetViewName(Post post)
        {
            string viewName = "View.Default";
            if (!string.IsNullOrEmpty(post.ViewName))
                viewName = post.ViewName;

            return String.Format("Single/{0}", viewName);
        }

        #endregion Methods
    }
}