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
using Vertex.Service;
using Vertex.Web.Areas.Manage.Models;
using Vertex.Web.Framework.Attributes;
using Vertex.Web.Framework.Controllers;

namespace Vertex.Web.Areas.Manage.Controllers
{
    [Authorize]
    public partial class PortfolioController : BaseController
    {
        #region Fields

        private readonly ISettingService settingService;
        private readonly IPostService postService;
        private readonly IPortfolioService portfolioService;
        private readonly ICategoryService categoryService;
        private readonly IPortfolioCategoryService portfolioCategoryService;

        private readonly IJobService jobService;
        private readonly IApplyJobService applyJobService;
        private readonly IJobCategoryService jobCategoryService;
        private readonly IUrlService urlService;
        private readonly ITeamMemberService teamMemberService;
        private readonly IClietTestimonialsService testimonialsService;
        private readonly ISocialNetworkService socialNetworkService;
        private readonly IMediaStorageService mediaStorageService;
        private readonly IPostTagService postTagService;
        private readonly ICacheManager cacheManager;
        private readonly ISubscriberService subscriberService;
        private readonly IContactService contactService;

        #endregion Fields

        #region Ctor

        public PortfolioController(ISettingService _settingService,
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
            settingService = _settingService;
            portfolioService = _portfolioService;
            postService = _postService;
            categoryService = _categoryService;
            urlService = _urlService;
            teamMemberService = _teamMemberService;
            testimonialsService = _testimonialsService;
            socialNetworkService = _socialNetworkService;
            mediaStorageService = _mediaStorageService;
            postTagService = _postTagService;
            portfolioCategoryService = _portfolioCategoryService;
            cacheManager = _cacheManager;
            jobService = _jobService;
            jobCategoryService = _jobCategoryService;
            subscriberService = _subscriberService;
            applyJobService = _applyJobService;
            contactService = _contactService;
        }

        #endregion Ctor

        public ActionResult List()
        {
            var portfolios = portfolioService.GetPortfolios().Select(x => new PortfolioModel
            {
                Id = x.Id,
                Title = x.Title,
                CreateDate = x.CreateDateUtc,
                Url = urlService.GetUrl(x.Id, nameof(Portfolio)),
                CategoryName = portfolioCategoryService.GetById(x.CategoryId).Name,
                CategoryUrl = urlService.GetUrl(x.CategoryId, nameof(Portfolio)),
                ViewCount = x.ViewCount,
                IsActive = x.IsActive,
                UserName = x.User.UserName,
                PictureId = x.PictureId,
                PicturePath = x.Picture.FilePath,
                UserId = x.UserId
            }).ToList();

            return View(new GridModel<PortfolioModel>
            {
                Data = portfolios,
                Total = portfolios.Count()
            });
        }

        public ActionResult Create()
        {
            var model = new PortfolioModel();
            model.CreateDate = DateTime.UtcNow;
            model.IsActive = true;
            model.ViewName = "View.Default";
            model.Categories = portfolioCategoryService.GetActives();
            model.AvailableViewNames = this.GetViewNames(nameof(Portfolio));
            return View(model);
        }

        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Create")]
        public ActionResult Create(PortfolioModel model)
        {
            model.Categories = portfolioCategoryService.GetActives();
            if (ModelState.IsValid)
            {
                var portfolio = new Portfolio()
                {
                    CategoryId = model.CategoryId,
                    Description = model.Content,
                    IsActive = model.IsActive,
                    IsDelete = model.IsDelete,
                    UserId = User.Identity.GetUserId(),
                    Title = model.Title,
                    CreateDateUtc = DateTime.UtcNow,
                    UpdateDateUtc = DateTime.UtcNow,
                    Format = model.PortfolioFormat.ToString(),
                    FormatValue = model.PortfolioFormatValue,
                    PictureId = model.PictureId,
                    ViewName = model.ViewName
                };

                var result = portfolioService.Insert(portfolio);
                if (result)
                    this.NotifySuccess("Successfully saved.");
                else
                    this.NotifyError("Item can not saved!");

                var urlRecord = new UrlRecord
                {
                    EntityId = portfolio.Id,
                    EntityName = nameof(Portfolio),
                    Slug = model.Title.ToUrlSlug()
                };
                urlService.Save(urlRecord);

                return RedirectToAction("Edit", new { Id = portfolio.Id });
            }

            return View(model);
        }

        public ActionResult Edit(int? id)
        {
            if (!id.HasValue)
                return RedirectToAction("List");

            var portfolio = portfolioService.GetById(id.Value);
            if (portfolio == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            var model = new PortfolioModel
            {
                Id = portfolio.Id,
                Title = portfolio.Title,
                CategoryId = portfolio.CategoryId,
                Content = portfolio.Description,
                ViewCount = portfolio.ViewCount,
                ViewName = portfolio.ViewName,
                IsDelete = portfolio.IsDelete,
                CreateDate = portfolio.CreateDateUtc,
                UpdateDate = portfolio.UpdateDateUtc,
                IsActive = portfolio.IsActive,
                PortfolioFormat = GetPortfolioFormat(portfolio.Format),
                PortfolioFormatValue = portfolio.FormatValue,
                PictureId = portfolio.PictureId,
                Categories = portfolioCategoryService.GetActives(),
                Url = urlService.GetUrl(portfolio.Id, nameof(Portfolio)),
                AvailableViewNames = this.GetViewNames(nameof(Portfolio))
            };

            return View(model);
        }

        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Edit")]
        public ActionResult Edit(PortfolioModel model)
        {
            if (model == null)
                return RedirectToAction("List");

            var portfolio = portfolioService.GetById(model.Id);
            if (portfolio == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            if (ModelState.IsValid)
            {
                portfolio.IsActive = model.IsActive;
                portfolio.CategoryId = model.CategoryId;
                portfolio.Description = model.Content;
                portfolio.Title = model.Title;
                portfolio.UpdateDateUtc = DateTime.UtcNow;
                portfolio.Format = model.PortfolioFormat.ToString();
                portfolio.FormatValue = model.PortfolioFormatValue;
                portfolio.PictureId = model.PictureId;
                portfolio.ViewName = model.ViewName;

                var result = portfolioService.Update(portfolio);
                if (result)
                    this.NotifySuccess("Successfully saved.");
                else
                    this.NotifyError("Item can not saved!");

                urlService.Save(new UrlRecord()
                {
                    EntityId = portfolio.Id,
                    EntityName = nameof(Portfolio),
                    Slug = model.Title.ToUrlSlug()
                });
            }

            model.Categories = portfolioCategoryService.GetActives();
            model.AvailableViewNames = this.GetViewNames(nameof(Portfolio));
            model.Url = urlService.GetUrl(portfolio.Id, nameof(Portfolio));
            model.CreateDate = portfolio.CreateDateUtc;
            model.UpdateDate = portfolio.UpdateDateUtc;
            model.ViewCount = portfolio.ViewCount;

            return View(model);
        }

        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [MultipleButtonAction(Name = "action", Argument = "Delete")]
        public ActionResult Delete(int id)
        {
            var portfolio = portfolioService.GetById(id);
            if (portfolio == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            var deleted = portfolioService.Delete(portfolio);
            if (deleted)
                this.NotifySuccess("Successfully deleted.");
            else
                this.NotifyError("Item can not deleted!");

            return RedirectToAction("List");
        }
        
        #region GalleryMethods

        public ActionResult PictureAdd(int pictureId, int displayOrder, int portfolioId)
        {
            var image = mediaStorageService.GetById(pictureId);
            if (image != null)
            {
                image.EntityId = portfolioId.ToString();
                image.EntityName = nameof(Portfolio);
                image.OrderNo = displayOrder;
                var result = mediaStorageService.Save(image);
                if (result)
                {
                    cacheManager.Remove(CacheConstant.MEDIA_STORAGE_PORTFOLIO_ITEM_PISTURES.FormatInvariant(portfolioId, nameof(Portfolio)));
                }
            }

            return Json(new { Result = true, message = "Added" }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost, GridAction(EnableCustomBinding = true)]
        public ActionResult PictureList(GridCommand command, int portfolioId)
        {
            var modelList = new List<PortfolioModel.PortfolioPictureModel>();
            var list = mediaStorageService.GetByEntity(portfolioId.ToString(), nameof(Portfolio));

            foreach (var item in list)
            {
                modelList.Add(new PortfolioModel.PortfolioPictureModel()
                {
                    PictureId = item.Id,
                    PortfolioId = portfolioId,
                    PictureUrl = item.FilePath,
                    DisplayOrder = item.OrderNo
                });
            }
            return new JsonResult { Data = modelList };
        }

        [GridAction(EnableCustomBinding = true)]
        public ActionResult PictureUpdate(GridCommand command, PortfolioModel.PortfolioPictureModel model)
        {
            var image = mediaStorageService.GetById(model.PictureId);
            if (image != null)
            {
                image.OrderNo = model.DisplayOrder;
                mediaStorageService.Save(image);
            }
            return PictureList(command, model.PortfolioId);
        }

        [GridAction(EnableCustomBinding = true)]
        public ActionResult PictureDelete(int pictureId, int portfolioId, GridCommand command)
        {
            mediaStorageService.Delete(pictureId);
            return PictureList(command, portfolioId);
        }

        #endregion

        #region HelperMethods

        private PortfolioFormat GetPortfolioFormat(string format)
        {
            if (!format.HasValue())
                return PortfolioFormat.Standard;

            return (PortfolioFormat)Enum.Parse(typeof(PortfolioFormat), format, true);
        }

        private List<String> GetViewNames(string name)
        {
            String path = Server.MapPath(string.Format("~/Views/{0}/Single", name));
            List<String> ret = new List<String>();
            String[] files = Directory.GetFiles(path);
            foreach (String file in files)
            {
                var fileName = Path.GetFileName(file).Replace(".cshtml", string.Empty);
                ret.Add(fileName);
            }
            return ret;
        }

        #endregion
    }
}