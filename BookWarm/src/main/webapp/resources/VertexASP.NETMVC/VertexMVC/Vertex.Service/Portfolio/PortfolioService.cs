using System.Collections.Generic;
using System.Linq;
using Vertex.Core;
using Vertex.Core.Cache;
using Vertex.Core.Entities;
using Vertex.Core.Extensions;
using Vertex.Data;

namespace Vertex.Service
{
    public class PortfolioService : IPortfolioService
    {
        #region Fields

        private readonly IRepository<Portfolio> portfolioRepository;
        private readonly ICacheManager cacheManager;
        private readonly IPortfolioCategoryService categoryService;
        private readonly IUrlService urlService;
        private readonly ApplicationUserService userService;
        private readonly IMediaStorageService mediaStorageService;
        private readonly ISocialNetworkService socialNetworkService;

        #endregion Fields

        #region Ctor

        public PortfolioService(IRepository<Portfolio> _portfolioRepository,
            ICacheManager _cacheManager,
            IMediaStorageService _mediaStorageService,
            IPortfolioCategoryService _categoryService,
            IUrlService _urlService,
            ApplicationUserService _userService,
            ISocialNetworkService _socialNetworkService)
        {
            portfolioRepository = _portfolioRepository;
            cacheManager = _cacheManager;
            mediaStorageService = _mediaStorageService;
            categoryService = _categoryService;
            urlService = _urlService;
            userService = _userService;
            socialNetworkService = _socialNetworkService;
        }

        #endregion Ctor

        #region Methods

        public IEnumerable<Portfolio> GetPortfolios()
        {
            var portfolios = (from p in portfolioRepository.TableNoTracking
                              orderby p.CreateDateUtc descending
                              select p).ToList();

            foreach (var portfolio in portfolios)
                this.SetPortfolio(portfolio);

            return portfolios;
        }

        public Portfolio GetById(int id)
        {
            var portfolio = portfolioRepository.Find(x => x.Id == id);
            this.SetPortfolio(portfolio);
            return portfolio;
        }

        public IEnumerable<Portfolio> GetActives()
        {
            var portfolios = this.GetPortfolios();
            return (from p in portfolios
                    where p.IsActive && !p.IsDelete
                    orderby p.CreateDateUtc descending
                    select p);
        }

        public IEnumerable<Portfolio> GetActives(int categoryId)
        {
            var portfolios = this.GetPortfolios();
            return (from p in portfolios
                    where p.CategoryId == categoryId &&
                    p.IsActive && !p.IsDelete
                    orderby p.CreateDateUtc descending
                    select p).ToList();
        }

        public IEnumerable<Portfolio> GetActives(string userId)
        {
            var portfolios = this.GetPortfolios();
            return (from p in portfolios
                    where p.UserId == userId &&
                    p.IsActive && !p.IsDelete
                    orderby p.CreateDateUtc descending
                    select p).ToList();
        }

        public IEnumerable<Portfolio> GetLatestPortfolios()
        {
            var portfolios = this.GetActives();
            return (from p in portfolios
                    orderby p.CreateDateUtc descending
                    select p).Take(10).ToList();
        }

        public IEnumerable<Portfolio> GetPopularPortfolios()
        {
            var portfolios = this.GetPortfolios();
            return (from p in portfolios
                    where p.IsActive && !p.IsDelete
                    orderby p.ViewCount descending
                    select p).Take(10).ToList();
        }

        public IEnumerable<Portfolio> GetRelatedPortfolios(int categoryId, int portfolioId)
        {
            var portfolios = this.GetPortfolios();
            return (from p in portfolios
                    where p.CategoryId == categoryId && p.Id != portfolioId &&
                    p.IsActive && !p.IsDelete
                    orderby p.ViewCount descending
                    select p).Take(3).ToList();
        }

        public int GetCount(int categoryId)
        {
            return (from p in portfolioRepository.TableNoTracking
                    where p.CategoryId == categoryId &&
                    p.IsActive && !p.IsDelete
                    orderby p.CreateDateUtc descending
                    select p).Count();
        }

        public IEnumerable<Portfolio> SearchPortfolios(string term)
        {
            return (from p in portfolioRepository.TableNoTracking
                    where (p.IsActive && !p.IsDelete) &&
                    (p.Title.Contains(term) ||
                    p.Description.Contains(term) || p.Description.Contains(term))
                    orderby p.CreateDateUtc descending
                    select p).ToList();
        }

        public bool Update(Portfolio portfolio)
        {
            var result = portfolioRepository.Update(portfolio);

            if (result)
                this.ClearCache(portfolio);
            return result;
        }

        public bool Insert(Portfolio portfolio)
        {
            var result = portfolioRepository.Insert(portfolio);
            if (result)
                this.ClearCache(portfolio);
            return result;
        }

        public bool Delete(Portfolio portfolio)
        {
            var pictureId = portfolio.PictureId.HasValue ? portfolio.PictureId.Value : 0;
            var deleted = portfolioRepository.Delete(portfolio);
            if (deleted)
            {
                mediaStorageService.Delete(pictureId);
                if (portfolio.Pictures != null && portfolio.Pictures.Count > 0)
                {
                    foreach (var picture in portfolio.Pictures)
                    {
                        mediaStorageService.Delete(picture.Id);
                    }
                }
            }
            return deleted;
        }

        #endregion Methods

        #region Helper Methods

        private void SetPortfolio(Portfolio portfolio)
        {
            if (portfolio == null)
                return;

            portfolio.Url = cacheManager.Get(CacheConstant.PORTFOLIO_URL_ITEM.FormatInvariant(portfolio.Id), () =>
            {
                return urlService.GetUrl(portfolio.Id, nameof(Portfolio));
            });
            portfolio.Picture = cacheManager.Get(CacheConstant.MEDIA_STORAGE_ITEM.FormatInvariant(portfolio.PictureId), () =>
            {
                return mediaStorageService.GetById(portfolio.PictureId);
            });
            portfolio.Category = cacheManager.Get(CacheConstant.PORTFOLIO_CATEGORY_ITEM.FormatInvariant(portfolio.CategoryId), () =>
            {
                return categoryService.GetById(portfolio.CategoryId);
            });
            portfolio.User = cacheManager.Get(CacheConstant.USER_ID.FormatInvariant(portfolio.UserId), () =>
            {
                return userService.GetById(portfolio.UserId);
            });
            var pictures = cacheManager.Get(CacheConstant.MEDIA_STORAGE_PORTFOLIO_ITEM_PISTURES.FormatInvariant(portfolio.Id, nameof(Portfolio)), () =>
            {
                return mediaStorageService.GetByEntity(portfolio.Id.ToString(), nameof(Portfolio)).ToList();
            });
            portfolio.Pictures = new List<MediaStorage>();
            portfolio.Pictures.Add(portfolio.Picture);
            portfolio.Pictures.AddRange(pictures);
        }

        private void ClearCache(Portfolio portfolio)
        {
            cacheManager.Remove(CacheConstant.PORTFOLIO_URL_ITEM.FormatInvariant(portfolio.Id));
            cacheManager.Remove(CacheConstant.MEDIA_STORAGE_ITEM.FormatInvariant(portfolio.PictureId));
            cacheManager.Remove(CacheConstant.PORTFOLIO_CATEGORY_ITEM.FormatInvariant(portfolio.CategoryId));
            cacheManager.Remove(CacheConstant.USER_ID.FormatInvariant(portfolio.UserId));
            cacheManager.Remove(CacheConstant.MEDIA_STORAGE_PORTFOLIO_ITEM_PISTURES.FormatInvariant(portfolio.Id, nameof(Portfolio)));
            if (portfolio.User != null)
            {
                cacheManager.Remove(CacheConstant.MEDIA_STORAGE_ITEM.FormatInvariant(portfolio.User.PictureId));
                cacheManager.Remove(CacheConstant.SOCIAL_NETWORK_ITEM.FormatInvariant(portfolio.User.Id));
            }
        }

        #endregion Helper Methods
    }
}