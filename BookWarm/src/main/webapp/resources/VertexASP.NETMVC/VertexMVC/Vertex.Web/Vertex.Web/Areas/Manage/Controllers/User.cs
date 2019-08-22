using Microsoft.AspNet.Identity;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;
using Telerik.Web.Mvc;
using Vertex.Core;
using Vertex.Core.Cache;
using Vertex.Core.Entities;
using Vertex.Data;
using Vertex.Service;
using Vertex.Web.Framework.Attributes;
using Vertex.Web.Framework.Controllers;
using Vertex.Web.Areas.Manage.Models;

namespace Vertex.Web.Areas.Manage.Controllers
{
    [Authorize]
    public partial class UserController : BaseController
    {
        #region Fields

        private readonly DataContext db;
        private readonly ApplicationUserService userService;
        private readonly ISettingService settingService;
        private readonly IPostService postService;
        private readonly IPortfolioService portfolioService;
        private readonly IUrlService urlService;
        private readonly ISocialNetworkService socialNetworkService;
        private readonly IMediaStorageService mediaStorageService;
        private readonly ICacheManager cacheManager;

        #endregion Fields

        #region Ctor

        public UserController(ApplicationUserService _userService,
            ISettingService _settingService,
            IPostService _postService,
            IPortfolioService _portfolioService,
            IUrlService _urlService,
            ISocialNetworkService _socialNetworkService,
            IMediaStorageService _mediaStorageService,
            ICacheManager _cacheManager)
        {
            userService = _userService;
            settingService = _settingService;
            portfolioService = _portfolioService;
            postService = _postService;
            urlService = _urlService;
            socialNetworkService = _socialNetworkService;
            mediaStorageService = _mediaStorageService;
            cacheManager = _cacheManager;

            db = new DataContext();
        }

        #endregion Ctor

        public ActionResult Index()
        {
            var userId = User.Identity.GetUserId();
            var user = userService.FindById(userId);
            if (user == null)
            {
                this.NotifyError("User not found.");
                return RedirectToAction("List");
            }

            return RedirectToAction("Edit", new { Id = userId });
        }

        public ActionResult List()
        {
            var model = userService.Users.ToList().Select(x => new ApplicationUserModel
            {
                Id = x.Id,
                UserName = x.UserName,
                Email = x.Email,
                Name = x.Name,
                Surname = x.Surname,
                Location = x.Location,
                EmailConfirmed = x.EmailConfirmed,
                IsActive = x.IsActive,
                AvatarId = x.PictureId,
                AvatarUrl = mediaStorageService.GetPictureUrl(x.PictureId),
            }).ToList();

            return View(new GridModel<ApplicationUserModel>
            {
                Data = model,
                Total = model.Count()
            });
        }

        /// <summary>
        /// Edit user
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Edit(string id)
        {
            var user = userService.GetById(id);
            if (user == null)
            {
                this.NotifyError("User not found.");
                return RedirectToAction("List");
            }

            var roles = db.Roles.Select(x => new ApplicationRoleModel
            {
                Id = x.Id,
                Name = x.Name
            }).ToList();

            var posts = postService.GetActives(id).Select(x => new PostModel
            {
                Id = x.Id,
                Title = x.Title,
                CreateDate = x.CreateDateUtc,
                Url = urlService.GetUrl(x.Id, nameof(Post)),
                CommentCount = postService.GetCommentCount(x.Id, null),
                ViewCount = x.ViewCount,
                IsActive = x.IsActive,
                UserName = x.UserName,
                PicturePath = x.Picture.FilePath
            }).ToList();

            var model = new ApplicationUserModel
            {
                Id = user.Id,
                UserName = user.UserName,
                Email = user.Email,
                EmailConfirmed = user.EmailConfirmed,
                IsActive = user.IsActive,
                AvatarId = user.PictureId,
                Description = user.Description,
                Location = user.Location,
                Name = user.Name,
                Surname = user.Surname,
                AvatarUrl = mediaStorageService.GetPictureUrl(user.PictureId),
                Roles = roles,
                SelectedRoleNames = userService.GetRoles(user.Id).ToArray(),
                IsAdmin = roles.Any(s => s.Name == SystemRoles.Admin),
                IsOwnAccount = User.Identity.GetUserId() == user.Id,
                Posts = posts
            };

            return View(model);
        }

        /// <summary>
        /// Edit a teamMember
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Edit")]
        public ActionResult Edit(ApplicationUserModel model)
        {
            model.Roles = db.Roles.Select(x => new ApplicationRoleModel
            {
                Id = x.Id,
                Name = x.Name
            }).ToList();

            if (ModelState.IsValid)
            {
                var user = userService.FindById(model.Id);
                if (user == null)
                {
                    this.NotifyError("User not found.");
                    return RedirectToAction("List");
                }

                var oldRoles = userService.GetRoles(model.Id).ToArray();
                var newRoles = model.SelectedRoleNames;

                user.IsActive = model.IsActive;
                user.UserName = model.UserName;
                user.Email = model.Email;
                user.EmailConfirmed = model.EmailConfirmed;
                user.Description = model.Description;
                user.PictureId = model.AvatarId;
                user.Name = model.Name;
                user.Surname = model.Surname;
                user.Location = model.Location;

                #region AddOrRemoveRoles

                var rolesToRemove = oldRoles.Except(newRoles);
                foreach (var role in rolesToRemove)
                    userService.RemoveFromRole(user.Id, role);

                var rolesToAdd = newRoles.Except(oldRoles);
                foreach (var role in rolesToAdd)
                    userService.AddToRole(user.Id, role);

                #endregion AddOrRemoveRoles

                var result = userService.Update(user);
                if (result.Succeeded)
                    this.NotifySuccess("Successfully saved.");
                else
                    this.NotifyError("User can not saved!");

                return RedirectToAction("Edit", new { id = model.Id });
            }

            return View(model);
        }

        public ActionResult ChangePassword()
        {
            var model = new ChangePasswordViewModel();
            var userId = User.Identity.GetUserId();
            var user = userService.GetById(userId);
            model.UserName = user.UserName;

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ChangePassword(ChangePasswordViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var result = await userService.ChangePasswordAsync(User.Identity.GetUserId(), model.OldPassword, model.NewPassword);
            if (result.Succeeded)
            {
                this.NotifySuccess("Successfully changed.");
                return RedirectToAction("Index", new { Message = "" });
            }
            else
            {
                this.NotifyError("Password can not change!");
            }

            return View(model);
        }

        #region SocialNetworkMethods

        [HttpPost, GridAction(EnableCustomBinding = true)]
        public ActionResult SocialNetworkList(GridCommand command, string entityId)
        {
            var modelList = new List<SocialNetworkModel>();
            var list = socialNetworkService.GetByEntity(entityId, nameof(ApplicationUser));

            foreach (var item in list)
            {
                modelList.Add(new SocialNetworkModel()
                {
                    EntityId = item.EntityId,
                    Id = item.Id,
                    Name = item.Name,
                    WebAddress = item.WebAddress,
                    OrderNo = item.OrderNo,
                    IsActive = item.IsActive
                });
            }
            return new JsonResult { Data = modelList };
        }

        [GridAction(EnableCustomBinding = true)]
        public ActionResult SocialNetworkInsert(GridCommand command, SocialNetworkModel model)
        {
            socialNetworkService.Save(new SocialNetwork()
            {
                EntityId = model.EntityId,
                EntityName = nameof(ApplicationUser),
                Name = model.Name,
                WebAddress = model.WebAddress,
                OrderNo = model.OrderNo,
                IsActive = true,
            });
            return SocialNetworkList(command, model.EntityId);
        }

        [GridAction(EnableCustomBinding = true)]
        public ActionResult SocialNetworkUpdate(GridCommand command, SocialNetworkModel model)
        {
            socialNetworkService.Save(new SocialNetwork()
            {
                EntityId = model.EntityId,
                EntityName = nameof(ApplicationUser),
                Name = model.Name,
                WebAddress = model.WebAddress,
                OrderNo = model.OrderNo,
                IsActive = true,
            });
            return SocialNetworkList(command, model.EntityId);
        }

        [GridAction(EnableCustomBinding = true)]
        public ActionResult SocialNetworkDelete(int id, GridCommand command)
        {
            var socialNetwork = socialNetworkService.GetById(id);
            if (socialNetwork != null)
            {
                var entityId = socialNetwork.EntityId;
                socialNetworkService.Delete(socialNetwork);
                return SocialNetworkList(command, entityId);
            }
            return SocialNetworkList(command, "-1");
        }

        #endregion
    }
}