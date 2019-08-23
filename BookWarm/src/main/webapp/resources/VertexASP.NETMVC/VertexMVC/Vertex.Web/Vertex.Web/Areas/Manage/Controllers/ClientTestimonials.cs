using System;
using System.Linq;
using System.Web.Mvc;
using Telerik.Web.Mvc;
using Vertex.Core;
using Vertex.Core.Cache;
using Vertex.Core.Extensions;
using Vertex.Service;
using Vertex.Web.Areas.Manage.Models;
using Vertex.Web.Framework.Attributes;
using Vertex.Web.Framework.Controllers;

namespace Vertex.Web.Areas.Manage.Controllers
{
    [Authorize]
    public partial class ClientTestimonialsController : BaseController
    {
        #region Fields

        private readonly ISettingService settingService;
        private readonly IUrlService urlService;
        private readonly IClietTestimonialsService testimonialsService;
        private readonly ISocialNetworkService socialNetworkService;
        private readonly IMediaStorageService mediaStorageService;
        private readonly ICacheManager cacheManager;

        #endregion Fields

        #region Ctor

        public ClientTestimonialsController(ISettingService _settingService,
            IUrlService _urlService,
            IClietTestimonialsService _testimonialsService,
            ISocialNetworkService _socialNetworkService,
            IMediaStorageService _mediaStorageService,
            ICacheManager _cacheManager)
        {
            settingService = _settingService;
            urlService = _urlService;
            testimonialsService = _testimonialsService;
            socialNetworkService = _socialNetworkService;
            mediaStorageService = _mediaStorageService;
            cacheManager = _cacheManager;
        }

        #endregion Ctor

        public ActionResult List()
        {
            var model = testimonialsService.GetTestimonials().Select(x => new TestimonialsModel
            {
                Id = x.Id,
                ClientName = x.ClientName.HasValue() ? x.ClientName : " ", // telerik grid bug
                WhatSayAboutUs = x.WhatSayAboutUs,
                IsActive = x.IsActive,
                PersonName = x.PersonName.HasValue() ? x.PersonName : " ", // telerik grid bug
                PersonPosition = x.PersonPosition,
                Star = x.Star,
                Website = x.Website,
                OrderNo = x.OrderNo
            }).ToList();

            return View(new GridModel<TestimonialsModel>
            {
                Data = model,
                Total = model.Count()
            });
        }

        public ActionResult Create()
        {
            var model = new TestimonialsModel();
            model.IsActive = true;
            return View(model);
        }

        /// <summary>
        /// Create a testimonials
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Create")]
        public ActionResult Create(TestimonialsModel model)
        {
            if (ModelState.IsValid)
            {
                var testimonials = new Core.Entities.ClientTestimonials
                {
                    Id = model.Id,
                    ClientName = model.ClientName,
                    WhatSayAboutUs = model.WhatSayAboutUs,
                    PersonName = model.PersonName,
                    PersonPosition = model.PersonPosition,
                    Star = model.Star,
                    Website = model.Website,
                    IsActive = model.IsActive,
                    OrderNo = model.OrderNo,
                    CreateDateUtc = DateTime.UtcNow,
                    TypeName = model.TypeName,
                    ClientLogoId = model.ClientLogoId,
                    PersonPictureId = model.PersonPictureId
                };

                var result  = testimonialsService.Insert(testimonials);
                if (result)
                    this.NotifySuccess("Successfully saved.");
                else
                    this.NotifyError("Item can not saved!");

                return RedirectToAction("Edit", new { Id = testimonials.Id });
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

            var testimonials = testimonialsService.GetById(id.Value);
            if (testimonials == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            var model = new TestimonialsModel
            {
                Id = testimonials.Id,
                ClientName = testimonials.ClientName,
                WhatSayAboutUs = testimonials.WhatSayAboutUs,
                PersonName = testimonials.PersonName,
                PersonPosition = testimonials.PersonPosition,
                Star = testimonials.Star,
                IsActive = testimonials.IsActive,
                Website = testimonials.Website,
                ClientLogoId = testimonials.ClientLogoId,
                PersonPictureId = testimonials.PersonPictureId,
                OrderNo = testimonials.OrderNo,
                TypeName = testimonials.TypeName
            };

            return View(model);
        }

        /// <summary>
        /// Edit a testimonials
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Edit")]
        public ActionResult Edit(TestimonialsModel model)
        {
            if (ModelState.IsValid)
            {
                var testimonials = testimonialsService.GetById(model.Id);
                if (testimonials == null)
                {
                    this.NotifyError("Item not found.");
                    return RedirectToAction("List");
                }
                else
                {
                    testimonials.ClientName = model.ClientName;
                    testimonials.WhatSayAboutUs = model.WhatSayAboutUs;
                    testimonials.PersonName = model.PersonName;
                    testimonials.PersonPosition = model.PersonPosition;
                    testimonials.Star = model.Star;
                    testimonials.IsActive = model.IsActive;
                    testimonials.Website = model.Website;
                    testimonials.PersonPictureId = model.PersonPictureId;
                    testimonials.ClientLogoId = model.ClientLogoId;
                    testimonials.UpdateDateUtc = DateTime.UtcNow;
                    testimonials.OrderNo = model.OrderNo;
                    testimonials.TypeName = model.TypeName;

                    var result = testimonialsService.Update(testimonials);
                    if (result)
                        this.NotifySuccess("Successfully saved.");
                    else
                        this.NotifyError("Item can not saved!");
                }

                return RedirectToAction("Edit", new { id = model.Id });
            }

            return View(model);
        }

        /// <summary>
        /// Delete a testimonials
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [MultipleButtonAction(Name = "action", Argument = "Delete")]
        public ActionResult Delete(int id)
        {
            var testimonials = testimonialsService.GetById(id);
            if (testimonials == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }
            else
            {
                var deleted = testimonialsService.Delete(testimonials);
                if (deleted)
                    this.NotifySuccess("Successfully deleted.");
                else
                    this.NotifyError("Item can not deleted!");
            }

            return RedirectToAction("List");
        } 
    }
}