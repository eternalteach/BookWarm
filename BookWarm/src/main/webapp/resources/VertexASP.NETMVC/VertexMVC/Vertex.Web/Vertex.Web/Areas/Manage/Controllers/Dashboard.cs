using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Telerik.Web.Mvc;
using Vertex.Core;
using Vertex.Core.Helpers;
using Vertex.Service;
using Vertex.Web.Areas.Manage.Models;
using Vertex.Web.Framework.Attributes;
using Vertex.Web.Framework.Controllers;

namespace Vertex.Web.Areas.Manage.Controllers
{
    [Authorize]
    public partial class DashboardController : BaseController
    {
        #region Fields

        private readonly ISettingService settingService;
        private readonly IJobService jobService;
        private readonly IApplyJobService applyJobService;
        private readonly IJobCategoryService jobCategoryService;
        private readonly IUrlService urlService;
        private readonly IContactService contactService;
        private readonly IPostService postService;
        private readonly ApplicationUserService userService;
        private readonly IMediaStorageService mediaStorageService;

        #endregion Fields

        #region Ctor

        public DashboardController(ApplicationUserService _userService,
            ISettingService _settingService,
            IUrlService _urlService,
            IJobService _jobService,
            IJobCategoryService _jobCategoryService,
            IApplyJobService _applyJobService,
            IPostService _postService,
            IMediaStorageService _mediaStorageService,
            IContactService _contactService)
        {
            userService = _userService;
            settingService = _settingService;
            urlService = _urlService;
            jobService = _jobService;
            jobCategoryService = _jobCategoryService;
            applyJobService = _applyJobService;
            contactService = _contactService;
            postService = _postService;
            mediaStorageService = _mediaStorageService;
        }

        #endregion Ctor

        public ActionResult Index()
        {
            int takeCount = 5;

            var users = userService.Users.ToList().Select(x => new ApplicationUserModel
            {
                Id = x.Id,
                UserName = x.UserName,
                Email = x.Email,
                EmailConfirmed = x.EmailConfirmed,
                IsActive = x.IsActive,
                AvatarId = x.PictureId,
                AvatarUrl = mediaStorageService.GetPictureUrl(x.PictureId),
            }).Take(takeCount).ToList();

            var contacts = contactService.GetContacts().Select(x => new ContactManageModel
            {
                Id = x.Id,
                FullName = x.FullName,
                Email = x.Email,
                Message = x.Message,
                Subject = x.Subject,
                IsRead = x.IsRead,
                Date = x.DateUtc
            }).Take(takeCount).ToList();

            var comments = postService.GetWaitingForApproveComments().Where(s => !string.IsNullOrEmpty(s.Commentary)).Select(x => new CommentListModel
            {
                Id = x.Id,
                PostId = x.PostId,
                ParentId = x.ParentId,
                FullName = x.FullName,
                Comment = x.Commentary,
                CreateDate = x.CommentDateUtc.ToRelativeFormat(),
                Approved = x.Approved,
                UserId = x.UserId
            }).Take(takeCount).ToList();

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
            }).Take(takeCount).ToList();

            var model = new DashboardViewModel();
            model.Contacts = contacts;
            model.Comments = comments;
            model.ApplyJobs = applyJobs;
            model.LatestUsers = users;

            return View(model);
        }

    }
}