using Vertex.Core.Entities;
using System.Collections.Generic;

namespace Vertex.Service
{
    public interface IJobCategoryService
    {
        JobCategory GetById(int Id);
        IEnumerable<JobCategory> GetActives();
        IEnumerable<JobCategory> GetCategories();
        bool Insert(JobCategory jobCategory);
        bool Update(JobCategory jobCategory);
        bool Delete(JobCategory jobCategory);
    }
}