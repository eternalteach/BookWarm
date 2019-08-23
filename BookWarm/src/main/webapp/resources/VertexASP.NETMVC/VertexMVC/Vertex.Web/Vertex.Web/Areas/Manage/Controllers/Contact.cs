using System;
using System.Linq;
using System.Web.Mvc;
using Telerik.Web.Mvc;
using Vertex.Core;
using Vertex.Core.Extensions;
using Vertex.Service;
using Vertex.Web.Framework.Attributes;
using Vertex.Web.Framework.Controllers;
using Vertex.Web.Areas.Manage.Models;

namespace Vertex.Web.Areas.Manage.Controllers
{
    [Authorize]
    public partial class ContactController : BaseController
    {
        #region Fields

        private readonly ISettingService settingService;
        private readonly IContactService contactService;

        #endregion Fields

        #region Ctor

        public ContactController(ISettingService _settingService,
            IContactService _contactService)
        {
            settingService = _settingService;
            contactService = _contactService;
        }

        #endregion Ctor

        public ActionResult List()
        {
            var contacts = contactService.GetContacts().Select(x => new ContactManageModel
            {
                Id = x.Id,
                FullName = x.FullName.HasValue() ? x.FullName : "No name",
                Email = x.Email,
                Message = x.Message,
                Subject = x.Subject,
                IsRead = x.IsRead,
                Date = x.DateUtc
            }).ToList();

            return View(new GridModel<ContactManageModel>
            {
                Data = contacts,
                Total = contacts.Count()
            });
        }

        public ActionResult Edit(int? id)
        {
            if (!id.HasValue)
                return RedirectToAction("List");

            var contact = contactService.GetById(id.Value);
            if (contact == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            if (contact.IsRead == false)
            {
                contact.IsRead = true;
                contactService.Save(contact);
            }

            var model = new ContactManageModel
            {
                Id = contact.Id,
                FullName = contact.FullName,
                Email = contact.Email,
                IsRead = contact.IsRead,
                Subject = contact.Subject,
                Message = contact.Message,
                Date = contact.DateUtc,
            };

            return View(model);
        }

        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Edit")]
        public ActionResult Edit(ContactManageModel model)
        {
            if (model == null)
                return RedirectToAction("List");

            if (ModelState.IsValid)
            {
                var contact = contactService.GetById(model.Id);
                if (contact == null)
                {
                    this.NotifyError("Item not found.");
                    return RedirectToAction("List");
                }
                else
                {
                    contact.Email = model.Email;
                    contact.FullName = model.FullName;

                    var result = contactService.Save(contact);
                    if (result)
                        this.NotifySuccess("Successfully saved.");
                    else
                        this.NotifyError("Item can not saved!");
                }
            }

            return View(model);
        }

        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [MultipleButtonAction(Name = "action", Argument = "Delete")]
        public ActionResult Delete(int id)
        {
            var contact = contactService.GetById(id);
            if (contact == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }
            else
            {
                contact.DateUtc = DateTime.UtcNow;
                contact.IsDeleted = true;
                var deleted = contactService.Save(contact);

                if (deleted)
                    this.NotifySuccess("Successfully deleted.");
                else
                    this.NotifyError("Item can not deleted!");
            }

            return RedirectToAction("List");
        }
    }
}