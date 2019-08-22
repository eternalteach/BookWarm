using System;
using System.Web.Mvc;
using Vertex.Service;
using Vertex.Web.Framework.Controllers;

namespace Vertex.Web.Controllers
{
    public class UserController : BaseController
    {
        #region Fields

        private readonly ISettingService settingService;
        private readonly IPostService postService;
        private readonly ICategoryService categoryService;
        private readonly IUrlService urlService;
        private readonly IContactService contactService;
        private readonly IMediaStorageService mediaStorageService;
        private readonly ApplicationUserService userService;

        #endregion Fields

        #region Ctor

        public UserController(ISettingService _settingService,
            IPostService _postService,
            ICategoryService _categoryService,
            IUrlService _urlService,
            IContactService _contactService,
            IMediaStorageService _mediaStorageService,
            ApplicationUserService _userService)
        {
            settingService = _settingService;
            postService = _postService;
            categoryService = _categoryService;
            urlService = _urlService;
            contactService = _contactService;
            mediaStorageService = _mediaStorageService;
            userService = _userService; 
        }

        #endregion Ctor

        #region Methods

        public ActionResult Index(string userName)
        {
            ViewBag.UserName = userName;
            return View("Index");
        }

        #endregion Methods
    }
}