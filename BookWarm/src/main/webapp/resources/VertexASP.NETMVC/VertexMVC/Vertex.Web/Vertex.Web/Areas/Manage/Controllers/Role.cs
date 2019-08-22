using System;
using System.Linq;
using System.Web.Mvc;
using Telerik.Web.Mvc;
using Vertex.Core;
using Vertex.Core.Cache;
using Vertex.Data;
using Vertex.Service;
using Vertex.Web.Framework.Attributes;
using Vertex.Web.Framework.Controllers;
using Vertex.Web.Areas.Manage.Models;

namespace Vertex.Web.Areas.Manage.Controllers
{
    [Authorize]
    public partial class RoleController : BaseController
    {
        private readonly DataContext db;

        #region Ctor

        public RoleController(ISettingService _settingService,
            IPostService _postService,
            IPortfolioService _portfolioService,
            ICategoryService _categoryService,
            IPortfolioCategoryService _portfolioCategoryService,
            IUrlService _urlService,
            ITeamMemberService _teamMemberService,
            IClietTestimonialsService _testimonialsService,
            ISocialNetworkService _socialNetworkService,
            IMediaStorageService _mediaStorageService,
            IPostTagService _postTagService,
            ICacheManager _cacheManager,
            IJobService _jobService,
            IJobCategoryService _jobCategoryService,
            ISubscriberService _subscriberService,
            IApplyJobService _applyJobService,
            IContactService _contactService)
        {

            db = new DataContext();
        }

        #endregion Ctor

        public ActionResult List()
        {
            var model = db.Roles.Select(x => new ApplicationRoleModel
            {
                Id = x.Id,
                Name = x.Name,
                UserCount = x.Users.Count
            }).ToList();

            return View(new GridModel<ApplicationRoleModel>
            {
                Data = model,
                Total = model.Count()
            });
        }

        public ActionResult Create()
        {
            var model = new ApplicationRoleModel();
            return View(model);
        }

        /// <summary>
        /// Create a Role
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Create")]
        public ActionResult Create(ApplicationRoleModel model)
        {
            if (ModelState.IsValid)
            {
                var newRole = new Microsoft.AspNet.Identity.EntityFramework.IdentityRole();
                newRole.Name = model.Name;
                db.Roles.Add(newRole);

                var result = db.SaveChanges();
                if (result > 0)
                    this.NotifySuccess("Successfully saved.");
                else
                    this.NotifyError("Role can not save!");

                return RedirectToAction("Edit", new { Id = newRole.Id });
            }

            return View(model);
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Edit(string id)
        {
            var role = db.Roles.Find(id);
            if (role == null)
            {
                this.NotifyError("Role not found.");
                return RedirectToAction("List");
            }

            var model = new ApplicationRoleModel
            {
                Id = role.Id,
                Name = role.Name,
                UserCount = role.Users.Count
            };

            return View(model);
        }

        /// <summary>
        /// Edit a category
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Edit")]
        public ActionResult Edit(ApplicationRoleModel model)
        {
            if (ModelState.IsValid)
            {
                var role = db.Roles.Find(model.Id);
                if (role == null)
                {
                    this.NotifyError("Role not found.");
                    return RedirectToAction("List");
                }
                 
                if (!role.Name.Equals(model.Name, StringComparison.CurrentCultureIgnoreCase))
                {
                    role.Name = model.Name;

                    var result = db.SaveChanges();
                    if (result > 0)
                        this.NotifySuccess("Successfully saved.");
                    else
                        this.NotifyError("Role can not saved!");
                }
                else
                {
                    this.NotifyInfo("No any change to save.");
                }
                return RedirectToAction("Edit", new { name = role.Name });
            }

            return View(model);
        } 

        /// <summary>
        /// Delete a category
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [MultipleButtonAction(Name = "action", Argument = "Delete")]
        public ActionResult Delete(string id)
        {
            var role = db.Roles.Find(id);
            if (role == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            bool hasUsers = role.Users.Count > 0;
            if (hasUsers)
            {
                this.NotifyWarning("Role has users, you can not delete.");
                return RedirectToAction("Edit", new { Id = role.Id });
            }

            db.Roles.Remove(role);

            var result = db.SaveChanges();
            if (result > 0)
                this.NotifySuccess("Successfully deleted.");
            else
                this.NotifyError("Role can not delete!");

            return RedirectToAction("List");
        }
    }
}