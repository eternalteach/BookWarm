using System;
using System.Linq;
using System.Web.Mvc;
using Telerik.Web.Mvc;
using Vertex.Core;
using Vertex.Core.Extensions;
using Vertex.Service;
using Vertex.Web.Areas.Manage.Models;
using Vertex.Web.Framework.Attributes;
using Vertex.Web.Framework.Controllers;

namespace Vertex.Web.Areas.Manage.Controllers
{
    [Authorize]
    public partial class SubscriberController : BaseController
    {
        #region Fields
        
        private readonly ISubscriberService subscriberService;

        #endregion Fields

        #region Ctor

        public SubscriberController(
            ISubscriberService _subscriberService)
        {
            subscriberService = _subscriberService;
        }

        #endregion Ctor

        public ActionResult List()
        {
            var subscribers = subscriberService.GetSubscribers().Select(x => new SubscriberModel
            {
                Id = x.Id,
                FullName = x.FullName.HasValue() ? x.FullName : " ",
                Email = x.Email,
                IsActive = x.IsActive,
                SubscribeDate = x.SubscribeDateUtc,
                UnsubscribeDate = x.UnSubscribeDateUtc
            }).ToList();

            return View(new GridModel<SubscriberModel>
            {
                Data = subscribers,
                Total = subscribers.Count()
            });
        }

        public ActionResult Edit(int? id)
        {
            if (!id.HasValue)
                return RedirectToAction("List");

            var subscriber = subscriberService.GetById(id.Value);
            if (subscriber == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            var model = new SubscriberModel
            {
                Id = subscriber.Id,
                IsActive = subscriber.IsActive,
                FullName = subscriber.FullName,
                Email = subscriber.Email,
                SubscribeDate = subscriber.SubscribeDateUtc,
                UnsubscribeDate = subscriber.UnSubscribeDateUtc
            };

            return View(model);
        }

        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Edit")]
        public ActionResult Edit(SubscriberModel model)
        {
            if (model == null)
                return RedirectToAction("List");

            var subscriber = subscriberService.GetById(model.Id);
            if (subscriber == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }
            else
            {
                subscriber.IsActive = model.IsActive;
                subscriber.Email = model.Email;
                subscriber.FullName = model.FullName;

                var result = subscriberService.Save(subscriber);
                if (result)
                    this.NotifySuccess("Successfully saved.");
                else
                    this.NotifyError("Item can not saved!");
            }

            return View(model);
        }

        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [MultipleButtonAction(Name = "action", Argument = "Delete")]
        public ActionResult Delete(int id)
        {
            var subscriber = subscriberService.GetById(id);
            if (subscriber == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }
            else
            {
                subscriber.IsActive = false;
                subscriber.UnSubscribeDateUtc = DateTime.UtcNow;

                var result = subscriberService.Save(subscriber);
                if (result)
                    this.NotifySuccess("Successfully deleted.");
                else
                    this.NotifyError("Item can not deleted!");
            }

            return RedirectToAction("List");
        }
    }
}