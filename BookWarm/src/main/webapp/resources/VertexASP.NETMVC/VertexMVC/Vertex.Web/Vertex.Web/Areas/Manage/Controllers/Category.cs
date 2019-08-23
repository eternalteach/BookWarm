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
    public partial class CategoryController : BaseController
    {
        #region Fields

        private readonly ICategoryService categoryService;
        private readonly IPostService postService;
        private readonly IUrlService urlService;

        #endregion Fields

        #region Ctor

        public CategoryController(
            IPostService _postService,
            ICategoryService _categoryService,
            IUrlService _urlService)
        {
            postService = _postService;
            categoryService = _categoryService;
            urlService = _urlService;
        }

        #endregion Ctor

        public ActionResult List()
        {
            var model = categoryService.GetCategories().Select(x => new CategoryModel
            {
                Id = x.Id,
                Name = x.Name,
                IsActive = x.IsActive,
                PostCount = postService.GetCount(x.Id)
            }).ToList();

            return View(new GridModel<CategoryModel>
            {
                Data = model,
                Total = model.Count()
            });
        }

        public ActionResult Create()
        {
            var model = new CategoryModel();
            model.IsActive = true;
            return View(model);
        }

        /// <summary>
        /// Create a category
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Create")]
        public ActionResult Create(CategoryModel model)
        {
            if (ModelState.IsValid)
            {
                var category = new Category
                {
                    Name = model.Name,
                    IsActive = model.IsActive
                };

                var result = categoryService.Insert(category);
                if (result)
                    this.NotifySuccess("Successfully saved.");
                else
                    this.NotifyError("Item can not saved!");

                var urlRecord = new UrlRecord
                {
                    EntityId = category.Id,
                    EntityName = nameof(Category),
                    Slug = model.Name.ToUrlSlug()
                };
                urlService.Save(urlRecord);

                return RedirectToAction("Edit", new { Id = category.Id });
            }

            return View(model);
        }

        /// <summary>
        /// Category Edit
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Edit(int? id)
        {
            if (!id.HasValue)
                return RedirectToAction("List");

            var category = categoryService.GetById(id.Value);
            if (category == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            var model = new CategoryModel
            {
                Id = category.Id,
                Name = category.Name,
                IsActive = category.IsActive,
                PostCount = postService.GetCount(category.Id),
                Url = urlService.GetUrl(category.Id, nameof(Category))
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
        public ActionResult Edit(CategoryModel model)
        {
            if (ModelState.IsValid)
            {
                var category = categoryService.GetById(model.Id);
                if (category == null)
                {
                    this.NotifyError("Item not found.");
                    return RedirectToAction("List");
                }

                category.Name = model.Name;
                category.IsActive = model.IsActive;

                var result = categoryService.Update(category);
                if (result)
                    this.NotifySuccess("Successfully saved.");
                else
                    this.NotifyError("Item can not saved!");

                urlService.Save(new UrlRecord()
                {
                    EntityId = category.Id,
                    EntityName = nameof(Category),
                    Slug = model.Name.ToUrlSlug()
                });

                return RedirectToAction("Edit", new { id = model.Id });
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
        public ActionResult Delete(int id)
        {
            var category = categoryService.GetById(id);
            if (category == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            var result = categoryService.Delete(category);
            if (result)
                this.NotifySuccess("Successfully deleted.");
            else
                this.NotifyError("Item can not deleted!");

            return RedirectToAction("List");
        }

    }
}