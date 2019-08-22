using System.Linq;
using System.Web.Mvc;
using Telerik.Web.Mvc;
using Vertex.Core;
using Vertex.Service;
using Vertex.Web.Areas.Manage.Models;
using Vertex.Web.Framework.Attributes;
using Vertex.Web.Framework.Controllers;

namespace Vertex.Web.Areas.Manage.Controllers
{
    [Authorize]
    public partial class ApplyJobController : BaseController
    {
        #region Fields

        private readonly ISettingService settingService;
        private readonly IJobService jobService;
        private readonly IApplyJobService applyJobService;
        private readonly IJobCategoryService jobCategoryService;
        private readonly IUrlService urlService; 

        #endregion Fields

        #region Ctor

        public ApplyJobController(ISettingService _settingService,
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
            var applyJobs = applyJobService.GetApplyJobs().Select(x => new ApplyJobModel
            {
                Id = x.Id,
                FullName = x.FullName,
                Email = x.Email,
                IsActive = x.IsActive,
                ApplyDate = x.ApplyDateUtc,
                IsRead = x.IsRead,
                Message = x.Message,
                Phone = x.Phone,
                Website = x.Website,
                JobId = x.JobId,
                JobName = jobService.GetById(x.JobId).Title
            }).ToList();

            return View(new GridModel<ApplyJobModel>
            {
                Data = applyJobs,
                Total = applyJobs.Count()
            });
        }

        public ActionResult Edit(int? id)
        {
            if (!id.HasValue)
                return RedirectToAction("List");

            var applyJob = applyJobService.GetById(id.Value);
            if (applyJob == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            if (applyJob.IsRead == false)
            {
                applyJob.IsRead = true;
                applyJobService.Save(applyJob);
            }

            var model = new ApplyJobModel
            {
                Id = applyJob.Id,
                FullName = applyJob.FullName,
                Email = applyJob.Email,
                Phone = applyJob.Phone,
                ApplyDate = applyJob.ApplyDateUtc,
                Message = applyJob.Message,
                IsActive = applyJob.IsActive,
                JobName = applyJob.Job.Title
            };

            return View(model);
        }

        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Edit")]
        public ActionResult Edit(ApplyJobModel model)
        {
            if (model == null)
                return RedirectToAction("List");

            if (ModelState.IsValid)
            {
                var applyJob = applyJobService.GetById(model.Id);
                if (applyJob == null)
                {
                    this.NotifyError("Item not found.");
                    return RedirectToAction("List");
                }
                else
                {
                    applyJob.IsActive = model.IsActive;
                    applyJob.FullName = model.FullName;
                    applyJob.Email = model.Email;
                    applyJob.Phone = model.Phone;
                    applyJob.Message = model.Message;

                    var result = applyJobService.Save(applyJob);
                    if (result)
                        this.NotifySuccess("Successfully saved.");
                    else
                        this.NotifyError("Item can not saved!");
                }
            }

            return View(model);
        }
       
        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [MultipleButtonAction(Name = "action", Argument = "Delete")]
        public ActionResult Delete(int id)
        {
            var applyJob = applyJobService.GetById(id);
            if (applyJob == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }
            else
            {
                bool deleted = applyJobService.Delete(applyJob);
                if (deleted)
                    this.NotifySuccess("Successfully deleted.");
                else
                    this.NotifyError("Item can not deleted!");
            }

            return RedirectToAction("List");
        }
    }
}