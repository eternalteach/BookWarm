using System.Linq;
using System.Web.Mvc;
using Telerik.Web.Mvc;
using Vertex.Core;
using Vertex.Core.Entities;
using Vertex.Core.Extensions;
using Vertex.Service;
using Vertex.Web.Areas.Manage.Models;
using Vertex.Web.Framework.Attributes;
using Vertex.Web.Framework.Controllers;

namespace Vertex.Web.Areas.Manage.Controllers
{
    [Authorize]
    public partial class PortfolioCategoryController : BaseController
    {
        #region Fields

        private readonly IPortfolioCategoryService portfolioCategoryService;
        private readonly IPortfolioService portfolioService;
        private readonly IUrlService urlService;

        #endregion Fields

        #region Ctor

        public PortfolioCategoryController(
            IPortfolioService _portfolioService,
            IPortfolioCategoryService _portfolioCategoryService,
            IUrlService _urlService)
        {
            portfolioService = _portfolioService;
            portfolioCategoryService = _portfolioCategoryService;
            urlService = _urlService;
        }

        #endregion Ctor

        public ActionResult List()
        {
            var model = portfolioCategoryService.GetCategories().Select(x => new PortfolioCategoryModel
            {
                Id = x.Id,
                Name = x.Name,
                IsActive = x.IsActive,
                PortfolioCount = portfolioService.GetCount(x.Id)
            }).ToList();

            return View(new GridModel<PortfolioCategoryModel>
            {
                Data = model,
                Total = model.Count()
            });
        }

        public ActionResult Create()
        {
            var model = new PortfolioCategoryModel();
            model.IsActive = true;
            return View(model);
        }

        /// <summary>
        /// Create a portfolioCategory
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Create")]
        public ActionResult Create(PortfolioCategoryModel model)
        {
            if (ModelState.IsValid)
            {
                var portfolioCategory = new PortfolioCategory
                {
                    Name = model.Name,
                    IsActive = model.IsActive
                };

                var result = portfolioCategoryService.Insert(portfolioCategory);
                if (result)
                    this.NotifySuccess("Successfully saved.");
                else
                    this.NotifyError("Item can not saved!");

                var urlRecord = new UrlRecord
                {
                    EntityId = portfolioCategory.Id,
                    EntityName = nameof(PortfolioCategory),
                    Slug = model.Name.ToUrlSlug()
                };
                urlService.Save(urlRecord);

                return RedirectToAction("Edit", new { Id = portfolioCategory.Id });
            }

            return View(model);
        }

        /// <summary>
        /// PortfolioCategory Edit
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Edit(int? id)
        {
            if (!id.HasValue)
                return RedirectToAction("List");

            var portfolioCategory = portfolioCategoryService.GetById(id.Value);
            if (portfolioCategory == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            var model = new PortfolioCategoryModel
            {
                Id = portfolioCategory.Id,
                Name = portfolioCategory.Name,
                IsActive = portfolioCategory.IsActive,
                PortfolioCount = portfolioService.GetCount(portfolioCategory.Id),
                Url = urlService.GetUrl(portfolioCategory.Id, nameof(PortfolioCategory))
            };

            return View(model);
        }

        /// <summary>
        /// Edit a portfolioCategory
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Edit")]
        public ActionResult Edit(PortfolioCategoryModel model)
        {
            if (ModelState.IsValid)
            {
                var portfolioCategory = portfolioCategoryService.GetById(model.Id);
                if (portfolioCategory == null)
                {
                    this.NotifyError("Item not found.");
                    return RedirectToAction("List");
                }

                portfolioCategory.Name = model.Name;
                portfolioCategory.IsActive = model.IsActive;

                var result = portfolioCategoryService.Update(portfolioCategory);
                if (result)
                    this.NotifySuccess("Successfully saved.");
                else
                    this.NotifyError("Item can not saved!");

                urlService.Save(new UrlRecord()
                {
                    EntityId = portfolioCategory.Id,
                    EntityName = nameof(PortfolioCategory),
                    Slug = model.Name.ToUrlSlug()
                });

                return RedirectToAction("Edit", new { id = model.Id });
            }

            return View(model);
        }

        /// <summary>
        /// Delete a portfolioCategory
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [MultipleButtonAction(Name = "action", Argument = "Delete")]
        public ActionResult Delete(int id)
        {
            var portfolioCategory = portfolioCategoryService.GetById(id);
            if (portfolioCategory == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            var deleted = portfolioCategoryService.Delete(portfolioCategory);
            if (deleted)
                this.NotifySuccess("Successfully deleted.");
            else
                this.NotifyError("Item can not deleted!");

            return RedirectToAction("List");
        }

    }
}