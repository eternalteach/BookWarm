using System.Collections.Generic;
using System.Linq;
using Vertex.Core.Entities;
using Vertex.Data;

namespace Vertex.Service
{
    public class PortfolioCategoryService : IPortfolioCategoryService
    {
        #region Fields

        private readonly IRepository<PortfolioCategory> categoryRepository;
        private readonly IUrlService urlService;

        #endregion Fields

        #region Ctor

        public PortfolioCategoryService(IRepository<PortfolioCategory> _categoryRepository,
            IUrlService _urlService)
        {
            categoryRepository = _categoryRepository;
            urlService = _urlService;
        }

        #endregion Ctor

        #region Method

        public PortfolioCategory GetById(int id)
        {
            var cat = categoryRepository.Find(x => x.Id == id);
            if (cat != null)
                cat.Url = urlService.GetUrl(id, nameof(PortfolioCategory));

            return cat;
        }

        public IEnumerable<PortfolioCategory> GetActives()
        {
            return (from c in categoryRepository.Table
                    where c.IsActive && !c.IsDelete
                    orderby c.Name
                    select c).ToList();
        }

        public IEnumerable<PortfolioCategory> GetCategories()
        {
            return (from c in categoryRepository.Table
                    orderby c.Name
                    select c).ToList();
        }

        public bool Insert(PortfolioCategory category)
        {
            return categoryRepository.Insert(category);
        }

        public bool Update(PortfolioCategory category)
        {
            return categoryRepository.Update(category);
        }

        public bool Delete(PortfolioCategory category)
        {
            return categoryRepository.Delete(category);
        }

        #endregion Method
    }
}