using System.Collections.Generic;
using System.Linq;
using Vertex.Core.Entities;
using Vertex.Data;

namespace Vertex.Service
{
    public class JobCategoryService : IJobCategoryService
    {
        #region Fields

        private readonly IRepository<JobCategory> categoryRepository;

        #endregion Fields

        #region Ctor

        public JobCategoryService(IRepository<JobCategory> _categoryRepository)
        {
            categoryRepository = _categoryRepository;
        }

        #endregion Ctor

        #region Method

        public JobCategory GetById(int id)
        {
            var cat = categoryRepository.Find(x => x.Id == id);
            return cat;
        }

        public IEnumerable<JobCategory> GetActives()
        {
            return (from c in categoryRepository.Table
                    where c.IsActive && !c.IsDelete
                    orderby c.Name
                    select c).ToList();
        }

        public IEnumerable<JobCategory> GetCategories()
        {
            return (from c in categoryRepository.Table
                    orderby c.Name
                    select c).ToList();
        }

        public bool Insert(JobCategory category)
        {
            return categoryRepository.Insert(category);
        }

        public bool Update(JobCategory category)
        {
            return categoryRepository.Update(category);
        }

        public bool Delete(JobCategory category)
        {
            return categoryRepository.Delete(category);
        }

        #endregion Method
    }
}