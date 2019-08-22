using System;
using System.Linq;
using System.Web.Mvc;
using Telerik.Web.Mvc;
using Vertex.Core;
using Vertex.Core.Entities;
using Vertex.Core.Extensions;
using Vertex.Service;
using Vertex.Web.Areas.Manage.Models;
using Vertex.Web.Framework.Attributes;
using Vertex.Web.Framework.Controllers;

namespace Vertex.Web.Areas.Manage.Controllers
{
    [Authorize]
    public partial class JobController : BaseController
    {
        #region Fields

        private readonly ISettingService settingService;
        private readonly IJobService jobService;
        private readonly IApplyJobService applyJobService;
        private readonly IJobCategoryService jobCategoryService;
        private readonly IUrlService urlService;

        #endregion Fields

        #region Ctor

        public JobController(ISettingService _settingService,
            IUrlService _urlService,
            IJobService _jobService,
            IJobCategoryService _jobCategoryService,
            IApplyJobService _applyJobService)
        {
            settingService = _settingService;
            urlService = _urlService;
            jobService = _jobService;
            jobCategoryService = _jobCategoryService;
            applyJobService = _applyJobService;
        }

        #endregion Ctor

        public ActionResult List()
        {
            var jobs = jobService.GetJobs().Select(x => new JobModel
            {
                Id = x.Id,
                Title = x.Title,
                CreateDate = x.CreateDateUtc,
                Url = urlService.GetUrl(x.Id, nameof(Job)),
                CategoryName = jobCategoryService.GetById(x.CategoryId).Name,
                ViewCount = x.ViewCount,
                IsActive = x.IsActive
            }).ToList();

            return View(new GridModel<JobModel>
            {
                Data = jobs,
                Total = jobs.Count()
            });
        }

        public ActionResult Create()
        {
            var model = new JobModel();
            model.CreateDate = DateTime.UtcNow;
            model.IsActive = true;
            model.Categories = jobCategoryService.GetActives();
            return View(model);
        }

        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Create")]
        public ActionResult Create(JobModel model)
        {
            model.Categories = jobCategoryService.GetActives();
            if (ModelState.IsValid)
            {
                var job = new Job()
                {
                    CategoryId = model.CategoryId,
                    Description = model.Description,
                    IsActive = model.IsActive,
                    IsDelete = model.IsDelete,
                    JobType = model.WorkType,
                    Location = model.Location,
                    SallaryMin = model.SallaryMin,
                    SallaryMax = model.SallaryMax,
                    Title = model.Title,
                    CreateDateUtc = DateTime.UtcNow,
                    UpdateDateUtc = DateTime.UtcNow,
                };

                var result = jobService.Insert(job);
                if (result)
                    this.NotifySuccess("Successfully saved.");
                else
                    this.NotifyError("Item can not saved!");

                var urlRecord = new UrlRecord
                {
                    EntityId = job.Id,
                    EntityName = nameof(Job),
                    Slug = model.Title.ToUrlSlug()
                };
                urlService.Save(urlRecord);

                return RedirectToAction("Edit", new { Id = job.Id });
            }

            return View(model);
        }


        public ActionResult Edit(int? id)
        {
            if (!id.HasValue)
                return RedirectToAction("List");

            var job = jobService.GetById(id.Value);
            if (job == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            var model = new JobModel
            {
                Id = job.Id,
                Title = job.Title,
                CategoryId = job.CategoryId,
                Description = job.Description,
                ViewCount = job.ViewCount,
                IsDelete = job.IsDelete,
                Location = job.Location,
                WorkType = job.JobType,
                SallaryMin = job.SallaryMin,
                SallaryMax = job.SallaryMax,
                CreateDate = job.CreateDateUtc,
                UpdateDate = job.UpdateDateUtc,
                IsActive = job.IsActive,
                Categories = jobCategoryService.GetActives(),
                Url = urlService.GetUrl(job.Id, nameof(Job)),
                ApplyJobs = job.ApplyJobs.Select(c => new ApplyJobModel
                {
                    Id = c.Id,
                    Email = c.Email,
                    FullName = c.FullName,
                    ApplyDate = c.ApplyDateUtc,
                    IsActive = c.IsActive,
                    Message = c.Message,
                    Phone = c.Phone,
                    Website = c.Website,
                    JobId = c.JobId,
                    JobName = job.Title,
                }).ToList()
            };

            return View(model);
        }

        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Edit")]
        public ActionResult Edit(JobModel model)
        {
            if (model == null)
                return RedirectToAction("List");

            var job = jobService.GetById(model.Id);
            if (job == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            if (ModelState.IsValid)
            {
                job.IsActive = model.IsActive;
                job.CategoryId = model.CategoryId;
                job.Description = model.Description;
                job.Title = model.Title;
                job.UpdateDateUtc = DateTime.UtcNow;
                job.Location = model.Location;
                job.SallaryMin = model.SallaryMin;
                job.SallaryMax = model.SallaryMax;
                job.JobType = model.WorkType;

                var result = jobService.Update(job);
                if (result)
                    this.NotifySuccess("Successfully saved.");
                else
                    this.NotifyError("Item can not saved!");

                urlService.Save(new UrlRecord()
                {
                    EntityId = job.Id,
                    EntityName = nameof(Job),
                    Slug = model.Title.ToUrlSlug()
                });
            }

            model.Categories = jobCategoryService.GetActives();
            model.Url = urlService.GetUrl(job.Id, nameof(Job));
            model.CreateDate = job.CreateDateUtc;
            model.UpdateDate = job.UpdateDateUtc;
            model.ViewCount = job.ViewCount;
            model.ApplyJobs = job.ApplyJobs.Select(c => new ApplyJobModel
            {
                Id = c.Id,
                Email = c.Email,
                FullName = c.FullName,
                ApplyDate = c.ApplyDateUtc,
                IsActive = c.IsActive,
                Message = c.Message,
                Phone = c.Phone,
                Website = c.Website,
                JobId = c.JobId,
                JobName = job.Title,
            }).ToList();

            return View(model);
        }

        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [MultipleButtonAction(Name = "action", Argument = "Delete")]
        public ActionResult Delete(int id)
        {
            var job = jobService.GetById(id);
            if (job == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }
            else
            {
                var deleted = jobService.Delete(job);
                if (deleted)
                    this.NotifySuccess("Successfully deleted.");
                else
                    this.NotifyError("Item can not deleted!");
            }

            return RedirectToAction("List");
        }
    }
}