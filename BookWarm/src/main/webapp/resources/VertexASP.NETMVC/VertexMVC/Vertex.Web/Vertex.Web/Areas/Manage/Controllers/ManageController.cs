using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Vertex.Core.Cache;
using Vertex.Data;
using Vertex.Service;
using Vertex.Web.Areas.Manage.Models;
using Vertex.Web.Controllers;
using Vertex.Web.Framework.Controllers;

namespace Vertex.Web.Areas.Manage.Controllers
{
    [Authorize]
    public partial class ManageController : BaseController
    {
        #region Fields

        private readonly DataContext db;

        private readonly ISettingService settingService;
        private readonly IPostService postService;
        private readonly IPortfolioService portfolioService;
        private readonly ICategoryService categoryService;
        private readonly IPortfolioCategoryService portfolioCategoryService;

        private readonly IJobService jobService;
        private readonly IApplyJobService applyJobService;
        private readonly IJobCategoryService jobCategoryService;
        private readonly IUrlService urlService;
        private readonly ITeamMemberService teamMemberService;
        private readonly IClietTestimonialsService testimonialsService;
        private readonly ISocialNetworkService socialNetworkService;
        private readonly IMediaStorageService mediaStorageService;
        private readonly IPostTagService postTagService;
        private readonly ICacheManager cacheManager;
        private readonly ISubscriberService subscriberService;
        private readonly IContactService contactService;

        private ApplicationSignInService _aplicationSignInService;

        public ApplicationSignInService AplicationSignInService
        {
            get { return _aplicationSignInService ?? HttpContext.GetOwinContext().Get<ApplicationSignInService>(); }
            private set { _aplicationSignInService = value; }
        }

        private ApplicationUserService _aplicationUserService;

        public ApplicationUserService AplicationUserService
        {
            get { return _aplicationUserService ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserService>(); }
            private set { _aplicationUserService = value; }
        }

        #endregion Fields

        #region Ctor

        public ManageController(ISettingService _settingService,
            IPostService _postService,
            IPortfolioService _portfolioService,
            ICategoryService _categoryService,
            IPortfolioCategoryService _portfolioCategoryService,
            IUrlService _urlService,
            ITeamMemberService _teamMemberService,
            IClietTestimonialsService _testimonialsService,
            ISocialNetworkService _socialNetworkService,
            IMediaStorageService _mediaStorageService,
            IPostTagService _postTagService,
            ICacheManager _cacheManager,
            IJobService _jobService,
            IJobCategoryService _jobCategoryService,
            ISubscriberService _subscriberService,
            IApplyJobService _applyJobService,
            IContactService _contactService)
        {
            settingService = _settingService;
            portfolioService = _portfolioService;
            postService = _postService;
            categoryService = _categoryService;
            urlService = _urlService;
            teamMemberService = _teamMemberService;
            testimonialsService = _testimonialsService;
            socialNetworkService = _socialNetworkService;
            mediaStorageService = _mediaStorageService;
            postTagService = _postTagService;
            portfolioCategoryService = _portfolioCategoryService;
            cacheManager = _cacheManager;
            jobService = _jobService;
            jobCategoryService = _jobCategoryService;
            subscriberService = _subscriberService;
            applyJobService = _applyJobService;
            contactService = _contactService;

            db = new DataContext();
        }

        #endregion Ctor

        #region ManageUser

        //
        // GET: /Manage/Index
        public async Task<ActionResult> Index(ManageMessageId? message)
        {
            ViewBag.StatusMessage =
                message == ManageMessageId.ChangePasswordSuccess ? "Your password has been changed."
                : message == ManageMessageId.SetPasswordSuccess ? "Your password has been set."
                : message == ManageMessageId.SetTwoFactorSuccess ? "Your two-factor authentication provider has been set."
                : message == ManageMessageId.Error ? "An error has occurred."
                : message == ManageMessageId.AddPhoneSuccess ? "Your phone number was added."
                : message == ManageMessageId.RemovePhoneSuccess ? "Your phone number was removed."
                : "";

            var userId = User.Identity.GetUserId();
            var currentUser = AplicationUserService.FindById(userId);

            var model = new ManageIndexViewModel
            {
                HasPassword = HasPassword(),
                PhoneNumber = await AplicationUserService.GetPhoneNumberAsync(userId),
                TwoFactor = await AplicationUserService.GetTwoFactorEnabledAsync(userId),
                Logins = await AplicationUserService.GetLoginsAsync(userId),
                BrowserRemembered = await AuthenticationManager.TwoFactorBrowserRememberedAsync(userId),
                AvatarId = currentUser.PictureId,
                AvatarUrl = mediaStorageService.GetPictureUrl(currentUser.PictureId),
                UserName = currentUser.UserName,
                Email = currentUser.Email,
                Description = currentUser.Description,
                Roles = string.Join(", ", AplicationUserService.GetRoles(userId).ToArray())
            };
            return RedirectToAction("UserEdit", new { Id = userId });
        }

        //
        // POST: /Manage/RemoveLogin
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> RemoveLogin(string loginProvider, string providerKey)
        {
            ManageMessageId? message;
            var result = await AplicationUserService.RemoveLoginAsync(User.Identity.GetUserId(), new UserLoginInfo(loginProvider, providerKey));
            if (result.Succeeded)
            {
                var user = await AplicationUserService.FindByIdAsync(User.Identity.GetUserId());
                if (user != null)
                {
                    await AplicationSignInService.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                }
                message = ManageMessageId.RemoveLoginSuccess;
            }
            else
            {
                message = ManageMessageId.Error;
            }
            return RedirectToAction("ManageLogins", new { Message = message });
        }

        //
        // GET: /Manage/AddPhoneNumber
        public ActionResult AddPhoneNumber()
        {
            return View();
        }

        //
        // POST: /Manage/AddPhoneNumber
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> AddPhoneNumber(AddPhoneNumberViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            // Generate the token and send it
            var code = await AplicationUserService.GenerateChangePhoneNumberTokenAsync(User.Identity.GetUserId(), model.Number);
            if (AplicationUserService.SmsService != null)
            {
                var message = new IdentityMessage
                {
                    Destination = model.Number,
                    Body = "Your security code is: " + code
                };
                await AplicationUserService.SmsService.SendAsync(message);
            }
            return RedirectToAction("VerifyPhoneNumber", new { PhoneNumber = model.Number });
        }

        //
        // POST: /Manage/EnableTwoFactorAuthentication
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> EnableTwoFactorAuthentication()
        {
            await AplicationUserService.SetTwoFactorEnabledAsync(User.Identity.GetUserId(), true);
            var user = await AplicationUserService.FindByIdAsync(User.Identity.GetUserId());
            if (user != null)
            {
                await AplicationSignInService.SignInAsync(user, isPersistent: false, rememberBrowser: false);
            }
            return RedirectToAction("Index", "Manage");
        }

        //
        // POST: /Manage/DisableTwoFactorAuthentication
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DisableTwoFactorAuthentication()
        {
            await AplicationUserService.SetTwoFactorEnabledAsync(User.Identity.GetUserId(), false);
            var user = await AplicationUserService.FindByIdAsync(User.Identity.GetUserId());
            if (user != null)
            {
                await AplicationSignInService.SignInAsync(user, isPersistent: false, rememberBrowser: false);
            }
            return RedirectToAction("Index", "Manage");
        }

        //
        // GET: /Manage/VerifyPhoneNumber
        public async Task<ActionResult> VerifyPhoneNumber(string phoneNumber)
        {
            var code = await AplicationUserService.GenerateChangePhoneNumberTokenAsync(User.Identity.GetUserId(), phoneNumber);
            // Send an SMS through the SMS provider to verify the phone number
            return phoneNumber == null ? View("Error") : View(new VerifyPhoneNumberViewModel { PhoneNumber = phoneNumber });
        }

        //
        // POST: /Manage/VerifyPhoneNumber
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> VerifyPhoneNumber(VerifyPhoneNumberViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var result = await AplicationUserService.ChangePhoneNumberAsync(User.Identity.GetUserId(), model.PhoneNumber, model.Code);
            if (result.Succeeded)
            {
                var user = await AplicationUserService.FindByIdAsync(User.Identity.GetUserId());
                if (user != null)
                {
                    await AplicationSignInService.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                }
                return RedirectToAction("Index", new { Message = ManageMessageId.AddPhoneSuccess });
            }
            // If we got this far, something failed, redisplay form
            ModelState.AddModelError("", "Failed to verify phone");
            return View(model);
        }

        //
        // GET: /Manage/RemovePhoneNumber
        public async Task<ActionResult> RemovePhoneNumber()
        {
            var result = await AplicationUserService.SetPhoneNumberAsync(User.Identity.GetUserId(), null);
            if (!result.Succeeded)
            {
                return RedirectToAction("Index", new { Message = ManageMessageId.Error });
            }
            var user = await AplicationUserService.FindByIdAsync(User.Identity.GetUserId());
            if (user != null)
            {
                await AplicationSignInService.SignInAsync(user, isPersistent: false, rememberBrowser: false);
            }
            return RedirectToAction("Index", new { Message = ManageMessageId.RemovePhoneSuccess });
        }

        //
        // GET: /Manage/ChangePassword
        public ActionResult ChangePassword()
        {
            return View();
        }

        //
        // POST: /Manage/ChangePassword
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ChangePassword(ChangePasswordViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var result = await AplicationUserService.ChangePasswordAsync(User.Identity.GetUserId(), model.OldPassword, model.NewPassword);
            if (result.Succeeded)
            {
                var user = await AplicationUserService.FindByIdAsync(User.Identity.GetUserId());
                if (user != null)
                {
                    await AplicationSignInService.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                }
                return RedirectToAction("Index", new { Message = ManageMessageId.ChangePasswordSuccess });
            }
            AddErrors(result);
            return View(model);
        }

        //
        // GET: /Manage/SetPassword
        public ActionResult SetPassword()
        {
            return View();
        }

        //
        // POST: /Manage/SetPassword
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> SetPassword(SetPasswordViewModel model)
        {
            if (ModelState.IsValid)
            {
                var result = await AplicationUserService.AddPasswordAsync(User.Identity.GetUserId(), model.NewPassword);
                if (result.Succeeded)
                {
                    var user = await AplicationUserService.FindByIdAsync(User.Identity.GetUserId());
                    if (user != null)
                    {
                        await AplicationSignInService.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                    }
                    return RedirectToAction("Index", new { Message = ManageMessageId.SetPasswordSuccess });
                }
                AddErrors(result);
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Manage/ManageLogins
        public async Task<ActionResult> ManageLogins(ManageMessageId? message)
        {
            ViewBag.StatusMessage =
                message == ManageMessageId.RemoveLoginSuccess ? "The external login was removed."
                : message == ManageMessageId.Error ? "An error has occurred."
                : "";
            var user = await AplicationUserService.FindByIdAsync(User.Identity.GetUserId());
            if (user == null)
            {
                return View("Error");
            }
            var userLogins = await AplicationUserService.GetLoginsAsync(User.Identity.GetUserId());
            var otherLogins = AuthenticationManager.GetExternalAuthenticationTypes().Where(auth => userLogins.All(ul => auth.AuthenticationType != ul.LoginProvider)).ToList();
            ViewBag.ShowRemoveButton = user.PasswordHash != null || userLogins.Count > 1;
            return View(new ManageLoginsViewModel
            {
                CurrentLogins = userLogins,
                OtherLogins = otherLogins
            });
        }

        //
        // POST: /Manage/LinkLogin
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LinkLogin(string provider)
        {
            // Request a redirect to the external login provider to link a login for the current user
            return new AccountController.ChallengeResult(provider, Url.Action("LinkLoginCallback", "Manage"), User.Identity.GetUserId());
        }

        //
        // GET: /Manage/LinkLoginCallback
        public async Task<ActionResult> LinkLoginCallback()
        {
            var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync(XsrfKey, User.Identity.GetUserId());
            if (loginInfo == null)
            {
                return RedirectToAction("ManageLogins", new { Message = ManageMessageId.Error });
            }
            var result = await AplicationUserService.AddLoginAsync(User.Identity.GetUserId(), loginInfo.Login);
            return result.Succeeded ? RedirectToAction("ManageLogins") : RedirectToAction("ManageLogins", new { Message = ManageMessageId.Error });
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && _aplicationUserService != null)
            {
                _aplicationUserService.Dispose();
                _aplicationUserService = null;
            }

            base.Dispose(disposing);
        }

        #region Helpers

        // Used for XSRF protection when adding external logins
        private const string XsrfKey = "XsrfId";

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        private bool HasPassword()
        {
            var user = AplicationUserService.FindById(User.Identity.GetUserId());
            if (user != null)
            {
                return user.PasswordHash != null;
            }
            return false;
        }

        private bool HasPhoneNumber()
        {
            var user = AplicationUserService.FindById(User.Identity.GetUserId());
            if (user != null)
            {
                return user.PhoneNumber != null;
            }
            return false;
        }

        public enum ManageMessageId
        {
            AddPhoneSuccess,
            ChangePasswordSuccess,
            SetTwoFactorSuccess,
            SetPasswordSuccess,
            RemoveLoginSuccess,
            RemovePhoneSuccess,
            Error
        }

        #endregion Helpers

        #endregion ManageUser
    }
}