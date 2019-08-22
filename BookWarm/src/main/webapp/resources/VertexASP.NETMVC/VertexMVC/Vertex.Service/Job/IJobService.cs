using Vertex.Core.Entities;
using System.Collections.Generic;

namespace Vertex.Service
{
    public interface IJobService
    {
        IEnumerable<Job> GetJobs();
        Job GetById(int Id);
        IEnumerable<Job> GetActives();
        IEnumerable<Job> GetActives(int categoryId);
        IEnumerable<Job> GetRelatedJobs(int categoryId, int jobId);
        int GetCount(int categoryId);
        bool Update(Job job);
        bool Insert(Job job);
        bool Delete(Job job);
    }
}