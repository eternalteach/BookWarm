using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.Mvc;
using Telerik.Web.Mvc;
using Vertex.Core;
using Vertex.Core.Cache;
using Vertex.Core.Entities;
using Vertex.Core.Extensions;
using Vertex.Core.Helpers;
using Vertex.Service;
using Vertex.Web.Areas.Manage.Models;
using Vertex.Web.Framework.Attributes;
using Vertex.Web.Framework.Controllers;

namespace Vertex.Web.Areas.Manage.Controllers
{
    [Authorize]
    public partial class PostController : BaseController
    {
        #region Fields

        private readonly ISettingService settingService;
        private readonly IPostService postService;
        private readonly ICategoryService categoryService;
        private readonly IUrlService urlService;
        private readonly IMediaStorageService mediaStorageService;
        private readonly IPostTagService postTagService;
        private readonly ICacheManager cacheManager;

        #endregion Fields

        #region Ctor

        public PostController(ISettingService _settingService,
            IPostService _postService,
            ICategoryService _categoryService,
            IUrlService _urlService,
            IMediaStorageService _mediaStorageService,
            IPostTagService _postTagService,
            ICacheManager _cacheManager)
        {
            settingService = _settingService;
            postService = _postService;
            categoryService = _categoryService;
            urlService = _urlService;
            mediaStorageService = _mediaStorageService;
            postTagService = _postTagService;
            cacheManager = _cacheManager;
        }

        #endregion Ctor

        public ActionResult List()
        {
            var posts = postService.GetPosts().Select(x => new PostModel
            {
                Id = x.Id,
                Title = x.Title,
                CreateDate = x.CreateDateUtc,
                Url = x.Url,
                CommentCount = postService.GetCommentCount(x.Id, null),
                CategoryName = x.Category.Name,
                CategoryUrl = x.Category.Url,
                ViewCount = x.ViewCount,
                IsActive = x.IsActive,
                UserName = x.UserName,
                PictureId = x.PictureId,
                PicturePath = x.Picture.FilePath,
                UserId = x.UserId
            }).ToList();

            return View(new GridModel<PostModel>
            {
                Data = posts,
                Total = posts.Count()
            });
        }

        public ActionResult Create()
        {
            var model = new PostModel();
            model.CreateDate = DateTime.UtcNow;
            model.IsActive = true;
            model.ApproveComment = true;
            model.AllowComment = true;
            model.ViewName = "View.Default";
            model.Categories = categoryService.GetActives();
            model.AvailableViewNames = this.GetViewNames();
            model.AvailableTags = new MultiSelectList(postTagService.GetAllTags().Select(s => s.Name), model.Tags);
            return View(model);
        }

        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Create")]
        public ActionResult Create(PostModel model)
        {
            if (ModelState.IsValid)
            {
                var post = new Post()
                {
                    AllowComment = model.AllowComment,
                    CategoryId = model.CategoryId,
                    Description = model.FullContent,
                    IsActive = model.IsActive,
                    ApproveComment = model.ApproveComment,
                    IsDelete = model.IsDelete,
                    UserId = User.Identity.GetUserId(),
                    Title = model.Title,
                    CreateDateUtc = DateTime.UtcNow,
                    UpdateDateUtc = DateTime.UtcNow,
                    Format = model.PostFormat.ToString(),
                    FormatValue = model.PostFormatValue,
                    PictureId = model.PictureId,
                    ViewName = model.ViewName
                };

                var result = postService.Insert(post);
                if (result)
                    this.NotifySuccess("Successfully saved.");
                else
                    this.NotifyError("Item can not saved!");

                this.SavePostTags(post, model.Tags);

                var urlRecord = new UrlRecord
                {
                    EntityId = post.Id,
                    EntityName = nameof(Post),
                    Slug = model.Title.ToUrlSlug()
                };
                urlService.Save(urlRecord);

                return RedirectToAction("Edit", new { Id = post.Id });
            }
             
            model.Categories = categoryService.GetActives();
            model.AvailableViewNames = this.GetViewNames();
            model.AvailableTags = new MultiSelectList(postTagService.GetAllTags().Select(s => s.Name), model.Tags);
            return View(model);
        }

        public ActionResult Edit(int? id)
        {
            if (!id.HasValue)
                return RedirectToAction("List");

            var post = postService.GetById(id.Value);
            if (post == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            var model = new PostModel
            {
                Id = post.Id,
                Title = post.Title,
                CategoryId = post.CategoryId,
                AllowComment = post.AllowComment,
                CreateDate = post.CreateDateUtc,
                FullContent = post.Description,
                ViewCount = post.ViewCount,
                ViewName = post.ViewName,
                IsDelete = post.IsDelete,
                UpdateDate = post.UpdateDateUtc,
                IsActive = post.IsActive,
                ApproveComment = post.ApproveComment,
                PostFormat = GetPostFormat(post.Format),
                PostFormatValue = post.FormatValue,
                PictureId = post.PictureId,
                Categories = categoryService.GetActives(),
                Url = urlService.GetUrl(post.Id, nameof(Post)),
                Tags = postTagService.GetTagsByPostId(post.Id).Select(s => s.Name).ToArray(),
                AvailableViewNames = this.GetViewNames()
            };

            model.AvailableTags = new MultiSelectList(postTagService.GetAllTags().Select(s => s.Name), model.Tags);

            return View(model);
        }

        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Edit")]
        public ActionResult Edit(PostModel model)
        {
            if (model == null)
                return RedirectToAction("List");

            var post = postService.GetById(model.Id);
            if (post == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            if (ModelState.IsValid)
            {
                post.IsActive = model.IsActive;
                post.ApproveComment = model.ApproveComment;
                post.AllowComment = model.AllowComment;
                post.CategoryId = model.CategoryId;
                post.Description = model.FullContent;
                post.Title = model.Title;
                post.UpdateDateUtc = DateTime.UtcNow;
                post.Format = model.PostFormat.ToString();
                post.FormatValue = model.PostFormatValue;
                post.PictureId = model.PictureId;
                post.ViewName = model.ViewName;

                var result = postService.Update(post);
                if (result)
                    this.NotifySuccess("Successfully saved.");
                else
                    this.NotifyError("Item can not saved!");

                urlService.Save(new UrlRecord()
                {
                    EntityId = post.Id,
                    EntityName = nameof(Post),
                    Slug = model.Title.ToUrlSlug()
                });

                this.SavePostTags(post, model.Tags);
            }

            model.Categories = categoryService.GetActives();
            model.AvailableViewNames = this.GetViewNames();
            model.AvailableTags = new MultiSelectList(postTagService.GetAllTags().Select(s => s.Name), model.Tags);
            model.Tags = postTagService.GetTagsByPostId(post.Id).Select(s => s.Name).ToArray();
            model.Url = urlService.GetUrl(post.Id, nameof(Post));
            model.CreateDate = post.CreateDateUtc;
            model.UpdateDate = post.UpdateDateUtc;
            model.ViewCount = post.ViewCount;

            return View(model);
        }

        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [MultipleButtonAction(Name = "action", Argument = "Delete")]
        public ActionResult Delete(int id)
        {
            var post = postService.GetById(id);
            if (post == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            post.IsDelete = true;
            var deleted = postService.Update(post);
            if (deleted)
                this.NotifySuccess("Successfully deleted.");
            else
                this.NotifyError("Item can not deleted!");

            return RedirectToAction("List");
        }

        [NonAction]
        protected void SavePostTags(Post post, params string[] rawPostTags)
        {
            #region AddNewTags

            var allTags = postTagService.GetAllTags().ToList();
            var tagsToInsert = rawPostTags.Except(allTags.Select(s => s.Name));

            foreach (var newTagName in tagsToInsert)
                postTagService.Save(newTagName);

            #endregion AddNewTags

            #region AddOrRemoveTags

            var oldTags = postTagService.GetTagsByPostId(post.Id).ToList();
            var newTags = rawPostTags;

            var tagsToRemove = oldTags.Select(s => s.Name).Except(newTags);
            foreach (var tagName in tagsToRemove)
                postTagService.Delete(post.Id, tagName);

            var tagsToAdd = newTags.Except(oldTags.Select(s => s.Name));
            foreach (var tagName in tagsToAdd)
                postTagService.Save(post.Id, tagName);

            #endregion AddOrRemoveTags
        }

        [HttpPost, GridAction(EnableCustomBinding = true)]
        public ActionResult CommentList(GridCommand command, int postId)
        {
            var comments = postService.GetComments(postId, null).Select(x => new CommentListModel
            {
                Id = x.Id,
                PostId = x.PostId,
                ParentId = x.ParentId,
                FullName = x.FullName,
                Comment = x.Commentary,
                CreateDate = x.CommentDateUtc.ToRelativeFormat(),
                Approved = x.Approved,
                UserId = x.UserId,
                ChildComments = postService.GetChildComments(postId, x.Id, null).Select(c => new CommentListModel
                {
                    Id = c.Id,
                    PostId = c.PostId,
                    ParentId = c.ParentId,
                    FullName = c.FullName,
                    Comment = c.Commentary,
                    Approved = c.Approved,
                    UserId = c.UserId,
                    CreateDate = c.CommentDateUtc.ToRelativeFormat(),
                }).ToList()
            }).ToList();

            return new JsonResult { Data = comments };
        }

        [GridAction(EnableCustomBinding = true)]
        public ActionResult CommentUpdate(GridCommand command, CommentListModel model)
        {
            var comment = postService.GetCommentById(model.Id);
            if (comment != null)
            {
                comment.FullName = model.FullName;
                comment.Commentary = model.Comment;
                comment.Approved = model.Approved;
                postService.SaveComment(comment);
            }

            return CommentList(command, model.PostId);
        }

        [GridAction(EnableCustomBinding = true)]
        public ActionResult CommentDelete(int id, GridCommand command)
        {
            var comment = postService.GetCommentById(id);
            var postId = comment.PostId;
            postService.DeleteComment(comment);
            return CommentList(command, postId);
        }

        private PostFormat GetPostFormat(string format)
        {
            if (!format.HasValue())
                return PostFormat.Standard;

            return (PostFormat)Enum.Parse(typeof(PostFormat), format, true);
        }

        private List<string> GetViewNames(string name = "Blog")
        {
            string path = Server.MapPath(string.Format("~/Views/{0}/Single", name));
            List<string> ret = new List<string>();
            string[] files = Directory.GetFiles(path);
            foreach (string file in files)
            {
                var fileName = Path.GetFileName(file).Replace(".cshtml", string.Empty);
                ret.Add(fileName);
            }
            return ret;
        }
    }
}