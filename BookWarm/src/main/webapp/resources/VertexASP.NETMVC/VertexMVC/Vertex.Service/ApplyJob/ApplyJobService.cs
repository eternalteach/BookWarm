using System.Collections.Generic;
using System.Linq;
using Vertex.Core;
using Vertex.Core.Cache;
using Vertex.Core.Entities;
using Vertex.Core.Extensions;
using Vertex.Data;

namespace Vertex.Service
{
    public class ApplyJobService : IApplyJobService
    {
        #region Fields

        private readonly IRepository<ApplyJob> applyJobRepository;
        private readonly ICacheManager cacheManager;
        private readonly IRepository<Job> jobService;

        #endregion Fields

        #region Ctor

        public ApplyJobService(IRepository<ApplyJob> _applyJobRepository,
            ICacheManager _cacheManager,
            IRepository<Job> _jobService)
        {
            applyJobRepository = _applyJobRepository;
            cacheManager = _cacheManager;
            jobService = _jobService;
        }

        #endregion Ctor

        #region Methods

        public IEnumerable<ApplyJob> GetApplyJobs()
        {
            var applyJobs = (from p in applyJobRepository.TableNoTracking
                             orderby p.ApplyDateUtc descending
                             select p).ToList();
            return applyJobs;
        }

        public IEnumerable<ApplyJob> GetApplyJobsByJobId(int jobId)
        {
            var applyJobs = (from p in applyJobRepository.TableNoTracking
                             orderby p.ApplyDateUtc descending
                             where p.JobId == jobId
                             select p).ToList();
            return applyJobs;
        }

        public ApplyJob GetById(int id)
        {
            var applyJob = applyJobRepository.Find(x => x.Id == id);
            if (applyJob != null)
            {
                var job = jobService.Find(applyJob.JobId);
                applyJob.Job = job;
            }
            return applyJob;
        }

        public bool Save(ApplyJob applyJob)
        {
            if (applyJob.Id > 0)
            {
                cacheManager.Remove(CacheConstant.JOB_ITEM_APPLY_JOBS.FormatInvariant(applyJob.JobId));
                return applyJobRepository.Update(applyJob);
            }
            else
            {
                cacheManager.Remove(CacheConstant.JOB_ITEM_APPLY_JOBS.FormatInvariant(applyJob.JobId));
                return applyJobRepository.Insert(applyJob);
            }
        }

        public bool Delete(ApplyJob applyJob)
        {
            return applyJobRepository.Delete(applyJob);
        }

        #endregion Methods
    }
}