using System.Collections.Generic;
using System.Linq;
using Vertex.Core;
using Vertex.Core.Cache;
using Vertex.Core.Entities;
using Vertex.Core.Extensions;
using Vertex.Data;

namespace Vertex.Service
{
    public class JobService : IJobService
    {
        #region Fields

        private readonly IRepository<Job> jobRepository;
        private readonly ICacheManager cacheManager;
        private readonly IJobCategoryService categoryService;
        private readonly IUrlService urlService;
        private readonly IApplyJobService applyJobService;

        #endregion Fields

        #region Ctor

        public JobService(IRepository<Job> _jobRepository,
            ICacheManager _cacheManager,
            IMediaStorageService _mediaStorageService,
            IJobCategoryService _categoryService,
            ApplicationUserService _userService,
            ISocialNetworkService _socialNetworkService,
            IUrlService _urlService,
            IApplyJobService _applyJobService)
        {
            jobRepository = _jobRepository;
            cacheManager = _cacheManager;
            categoryService = _categoryService;
            urlService = _urlService;
            applyJobService = _applyJobService;
        }

        #endregion Ctor

        #region Methods

        public IEnumerable<Job> GetJobs()
        {
            var jobs = (from p in jobRepository.TableNoTracking
                        orderby p.CreateDateUtc descending
                        select p).ToList();

            foreach (var job in jobs)
                this.PrepareJob(job);

            return jobs;
        }

        public Job GetById(int id)
        {
            var job = jobRepository.Find(x => x.Id == id);
            this.PrepareJob(job);
            return job;
        }

        public IEnumerable<Job> GetActives()
        {
            var jobs = this.GetJobs();

            foreach (var job in jobs)
                this.PrepareJob(job);

            return (from p in jobs
                    where p.IsActive && !p.IsDelete
                    orderby p.CreateDateUtc descending
                    select p);
        }

        public IEnumerable<Job> GetActives(int categoryId)
        {
            var jobs = this.GetJobs();

            foreach (var job in jobs)
                this.PrepareJob(job);

            return (from p in jobs
                    where p.CategoryId == categoryId &&
                    p.IsActive && !p.IsDelete
                    orderby p.CreateDateUtc descending
                    select p).ToList();
        }

        public IEnumerable<Job> GetRelatedJobs(int categoryId, int jobId)
        {
            var jobs = this.GetJobs();
            return (from p in jobs
                    where p.CategoryId == categoryId && p.Id != jobId &&
                    p.IsActive && !p.IsDelete
                    orderby p.ViewCount descending
                    select p).Take(3).ToList();
        }

        public int GetCount(int categoryId)
        {
            return (from p in jobRepository.TableNoTracking
                    where p.CategoryId == categoryId &&
                    p.IsActive && !p.IsDelete
                    orderby p.CreateDateUtc descending
                    select p).Count();
        }

        public bool Update(Job job)
        {
            var result = jobRepository.Update(job);
            if (result)
            {
                this.ClearCache(job);
            }
            return result;
        }

        public bool Insert(Job job)
        {
            var result = jobRepository.Insert(job);
            return result;
        }

        public bool Delete(Job job)
        {
            return jobRepository.Delete(job);
        }

        #endregion Methods

        #region HelperMethods

        private void PrepareJob(Job job)
        {
            if (job == null)
                return;

            job.Url = cacheManager.Get(CacheConstant.JOB_URL_ITEM.FormatInvariant(job.Id), () =>
            {
                return urlService.GetUrl(job.Id, nameof(Job));
            });

            job.Category = cacheManager.Get(CacheConstant.JOB_CATEGORY_ITEM.FormatInvariant(job.CategoryId), () =>
            {
                return categoryService.GetById(job.CategoryId);
            });

            job.ApplyJobs = cacheManager.Get(CacheConstant.JOB_ITEM_APPLY_JOBS.FormatInvariant(job.Id), () =>
            {
                return applyJobService.GetApplyJobsByJobId(job.Id).ToList();
            });
        }

        private void ClearCache(Job job)
        {
            cacheManager.Remove(CacheConstant.JOB_URL_ITEM.FormatInvariant(job.Id));
            cacheManager.Remove(CacheConstant.JOB_CATEGORY_ITEM.FormatInvariant(job.CategoryId));
            cacheManager.Remove(CacheConstant.JOB_ITEM_APPLY_JOBS.FormatInvariant(job.Id));
        }

        #endregion
    }
}