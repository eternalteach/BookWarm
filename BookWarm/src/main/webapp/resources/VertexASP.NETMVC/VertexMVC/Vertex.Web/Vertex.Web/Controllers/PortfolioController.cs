using System;
using System.Linq;
using System.Web.Mvc;
using Vertex.Core;
using Vertex.Core.Entities;
using Vertex.Service;
using Vertex.Web.Framework.Controllers;
using Vertex.Web.Framework.Helpers;
using Vertex.Web.Models;

namespace Vertex.Web.Controllers
{
    public class PortfolioController : BaseController
    {
        #region Fields

        private readonly IPortfolioCategoryService portfolioCategoryService;
        private readonly IPortfolioService portfolioService;
        private readonly IUrlService urlService;
        private readonly IMediaStorageService mediaStorageService;

        #endregion Fields

        #region Ctor

        public PortfolioController(IPortfolioCategoryService _portfolioCategoryService,
            IPortfolioService _portfolioService,
            IUrlService _urlService,
            IMediaStorageService _mediaStorageService,
            ISocialNetworkService _socialNetworkService)
        {
            portfolioCategoryService = _portfolioCategoryService;
            portfolioService = _portfolioService;
            urlService = _urlService;
            mediaStorageService = _mediaStorageService;
        }

        #endregion Ctor

        #region Methods

        public ActionResult PortfolioCategory(int? Id)
        {
            if (!Id.HasValue)
                return HomePage();

            var portfolioCategory = portfolioCategoryService.GetById(Id.Value);

            if (portfolioCategory == null)
                return NotFound();

            if (!portfolioCategory.IsActive || portfolioCategory.IsDelete)
                return NotActive();

            var model = new PortfolioCategoryDetailModel()
            {
                Id = portfolioCategory.Id,
                Name = portfolioCategory.Name
            };

            return View(model);
        }

        public ActionResult Portfolio(int? Id)
        {
            if (!Id.HasValue)
                return HomePage();

            var portfolio = portfolioService.GetById(Id.Value);

            if (portfolio == null)
                return NotFound();

            if (!portfolio.IsActive || portfolio.IsDelete)
                return NotActive();

            string cookieKey = string.Format(CookieConstant.PORTFOLIO_VIEW, portfolio.Id);
            if (!CookieHelper.Exists(cookieKey))
            {
                CookieHelper.Set(cookieKey, WebHelper.IpAddress, 1);
                portfolio.ViewCount += 1;
                portfolioService.Update(portfolio);
            }

            var model = new PortfolioDetailModel
            {
                Id = portfolio.Id,
                Title = portfolio.Title,
                Content = portfolio.Description,
                PicturePath = mediaStorageService.GetPictureUrl(portfolio.PictureId),
                Url = urlService.GetUrl(portfolio.Id, nameof(Portfolio)),
                User = portfolio.User,
                CreateDate = portfolio.CreateDateUtc,
                UpdateDate = portfolio.UpdateDateUtc,
                ViewCount = portfolio.ViewCount,
                CategoryName = portfolio.Category.Name,
                CategoryUrl = portfolio.Category.Url,
                Pictures = portfolio.Pictures
            };

            model.RelatedPortfolios = portfolioService.GetRelatedPortfolios(portfolio.CategoryId, portfolio.Id)
                .Select(x => new PortfolioModel
                {
                    Id = x.Id,
                }).ToList();

            return View(this.GetViewName(portfolio), model);
        }

        [HttpGet]
        public ActionResult Search(string term)
        {
            if (string.IsNullOrEmpty(term))
                return HomePage();

            var model = new PostSearchModel()
            {
                Term = term
            };

            return View(model);
        }

        public ActionResult Agency()
        {
            return View();
        }

        public ActionResult AwesomeWork()
        {
            return View();
        }

        public ActionResult JuicyProjects()
        {
            return View();
        }

        public ActionResult Masonry()
        {
            return View();
        }

        public ActionResult MasonryProjects()
        {
            return View();
        }

        public ActionResult Mosaic()
        {
            return View();
        }

        public ActionResult MosaicFlat()
        {
            return View();
        }

        public ActionResult MosaicProjects()
        {
            return View();
        }

        #endregion Methods

        private string GetViewName(Portfolio portfolio)
        {
            string viewName = "View.Default";
            if (!string.IsNullOrEmpty(portfolio.ViewName))
                viewName = portfolio.ViewName;

            return String.Format("Single/{0}", viewName);
        }
    }
}