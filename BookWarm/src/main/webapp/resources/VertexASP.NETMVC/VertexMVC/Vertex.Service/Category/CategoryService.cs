using Vertex.Core.Entities;
using Vertex.Data;
using System.Collections.Generic;
using System.Linq;

namespace Vertex.Service
{
    public class CategoryService : ICategoryService
    {
        #region Fields
        private readonly IRepository<Category> categoryRepository;
        private readonly IUrlService urlService;
        #endregion

        #region Ctor
        public CategoryService(IRepository<Category> _categoryRepository,
            IUrlService _urlService)
        {
            categoryRepository = _categoryRepository;
            urlService = _urlService;
        }
        #endregion

        #region Method
        public Category GetById(int id)
        {
            var cat = categoryRepository.Find(x => x.Id == id);
            if (cat != null)
                cat.Url = urlService.GetUrl(id, nameof(Category));

            return cat;
        }

        public IEnumerable<Category> GetActives()
        {
            return (from c in categoryRepository.Table
                    where c.IsActive && !c.IsDelete
                    orderby c.Name
                    select c).ToList();
        }

        public IEnumerable<Category> GetCategories()
        {
            return (from c in categoryRepository.Table
                    orderby c.Name
                    select c).ToList();
        }
        
        public bool Insert(Category category)
        {
            return categoryRepository.Insert(category);
        }

        public bool Update(Category category)
        {
            return categoryRepository.Update(category);
        }

        public bool Delete(Category category)
        {
            return categoryRepository.Delete(category);
        }
        #endregion
    }
}