using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Telerik.Web.Mvc;
using Vertex.Core;
using Vertex.Core.Entities;
using Vertex.Service;
using Vertex.Web.Framework.Attributes;
using Vertex.Web.Framework.Controllers;
using Vertex.Web.Areas.Manage.Models;

namespace Vertex.Web.Areas.Manage.Controllers
{
    [Authorize]
    public partial class TeamMemberController : BaseController
    {
        #region Fields

        private readonly ITeamMemberService teamMemberService;
        private readonly ISocialNetworkService socialNetworkService;
        private readonly IMediaStorageService mediaStorageService;

        #endregion Fields

        #region Ctor

        public TeamMemberController(ITeamMemberService _teamMemberService,
            ISocialNetworkService _socialNetworkService,
            IMediaStorageService _mediaStorageService)
        {
            teamMemberService = _teamMemberService;
            socialNetworkService = _socialNetworkService;
            mediaStorageService = _mediaStorageService;
        }

        #endregion Ctor

        public ActionResult List()
        {
            var model = teamMemberService.GetTeamMembers().Select(x => new TeamMemberModel
            {
                Id = x.Id,
                Name = x.FullName,
                Position = x.Position,
                OrderNo = x.OrderNo,
                IsActive = x.IsActive,
                PictureId = x.PictureId,
                PictureUrl = mediaStorageService.GetPictureUrl(x.PictureId)
            }).ToList();

            return View(new GridModel<TeamMemberModel>
            {
                Data = model,
                Total = model.Count()
            });
        }

        public ActionResult Create()
        {
            var model = new TeamMemberModel();
            model.IsActive = true;
            model.CreateDateUtc = DateTime.UtcNow;
            return View(model);
        }

        /// <summary>
        /// Create a teamMember
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Create")]
        public ActionResult Create(TeamMemberModel model)
        {
            if (ModelState.IsValid)
            {
                var teamMember = new Core.Entities.TeamMember
                {
                    Id = model.Id,
                    FullName = model.Name,
                    Position = model.Position,
                    OrderNo = model.OrderNo,
                    IsActive = model.IsActive,
                    PictureId = model.PictureId,
                    Description = model.Description,
                    CreateDateUtc = DateTime.UtcNow
                };
                var result = teamMemberService.Insert(teamMember);
                if (result)
                    this.NotifySuccess("Successfully saved.");
                else
                    this.NotifyError("Item can not saved!");

                return RedirectToAction("Edit", new { Id = teamMember.Id });
            }

            return View(model);
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Edit(int? id)
        {
            if (!id.HasValue)
                return RedirectToAction("List");

            var teamMember = teamMemberService.GetById(id.Value);
            if (teamMember == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            var model = new TeamMemberModel
            {
                Id = teamMember.Id,
                Name = teamMember.FullName,
                Position = teamMember.Position,
                IsActive = teamMember.IsActive,
                OrderNo = teamMember.OrderNo,
                PictureId = teamMember.PictureId,
                Description = teamMember.Description
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
        public ActionResult Edit(TeamMemberModel model)
        {
            if (ModelState.IsValid)
            {
                var teamMember = teamMemberService.GetById(model.Id);
                if (teamMember == null)
                {
                    this.NotifyError("Item not found.");
                    return RedirectToAction("List");
                }

                teamMember.FullName = model.Name;
                teamMember.IsActive = model.IsActive;
                teamMember.OrderNo = model.OrderNo;
                teamMember.PictureId = model.PictureId;
                teamMember.Description = model.Description;
                teamMember.UpdateDateUtc = DateTime.UtcNow;

                var result = teamMemberService.Update(teamMember);
                if (result)
                    this.NotifySuccess("Successfully saved.");
                else
                    this.NotifyError("Item can not saved!");

                return RedirectToAction("Edit", new { id = model.Id });
            }

            return View(model);
        }

        /// <summary>
        /// Delete a teamMember
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [MultipleButtonAction(Name = "action", Argument = "Delete")]
        public ActionResult Delete(int id)
        {
            var teamMember = teamMemberService.GetById(id);
            if (teamMember == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            var result = teamMemberService.Delete(teamMember);
            if (result)
                this.NotifySuccess("Successfully deleted.");
            else
                this.NotifyError("Item can not deleted!");

            return RedirectToAction("List");
        }

        #region SocialNetworks

        [HttpPost, GridAction(EnableCustomBinding = true)]
        public ActionResult SocialNetworkList(GridCommand command, int entityId)
        {
            var list = socialNetworkService.GetByEntity(entityId, nameof(Core.Entities.TeamMember));

            var model = new List<SocialNetworkModel>();
            foreach (var item in list)
            {
                model.Add(new SocialNetworkModel()
                {
                    EntityId = item.EntityId,
                    Id = item.Id,
                    Name = item.Name,
                    WebAddress = item.WebAddress,
                    OrderNo = item.OrderNo,
                    IsActive = item.IsActive
                });
            }
            return new JsonResult { Data = model };
        }

        [GridAction(EnableCustomBinding = true)]
        public ActionResult SocialNetworkInsert(GridCommand command, SocialNetworkModel model)
        {
            socialNetworkService.Save(new SocialNetwork()
            {
                EntityId = model.EntityId,
                EntityName = nameof(Core.Entities.TeamMember),
                Name = model.Name,
                WebAddress = model.WebAddress,
                OrderNo = model.OrderNo,
                IsActive = true,
            });
            return SocialNetworkList(command, Convert.ToInt32(model.EntityId));
        }

        [GridAction(EnableCustomBinding = true)]
        public ActionResult SocialNetworkUpdate(GridCommand command, SocialNetworkModel model)
        {
            socialNetworkService.Save(new SocialNetwork()
            {
                EntityId = model.EntityId,
                EntityName = nameof(Core.Entities.TeamMember),
                Name = model.Name,
                WebAddress = model.WebAddress,
                OrderNo = model.OrderNo,
                IsActive = true,
            });
            return SocialNetworkList(command, Convert.ToInt32(model.EntityId));
        }

        [GridAction(EnableCustomBinding = true)]
        public ActionResult SocialNetworkDelete(int id, GridCommand command)
        {
            var socialNetwork = socialNetworkService.GetById(id);
            if (socialNetwork != null)
            {
                var entityId = socialNetwork.EntityId;
                socialNetworkService.Delete(socialNetwork);
                return SocialNetworkList(command, Convert.ToInt32(entityId));
            }
            return SocialNetworkList(command, -1);
        }

        #endregion SocialNetworks
    }
}