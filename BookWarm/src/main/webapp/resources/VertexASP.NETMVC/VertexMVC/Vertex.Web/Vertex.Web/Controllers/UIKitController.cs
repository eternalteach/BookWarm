using System.Web.Mvc;
using Vertex.Core.Cache;
using Vertex.Service;
using Vertex.Web.Framework.Controllers;

namespace Vertex.Web.Controllers
{
    public class UIKitController : BaseController
    {
        #region Fields

        private readonly ICategoryService categoryService;
        private readonly IPostService postService;
        private readonly IUrlService urlService;
        private readonly IPostTagService tagService;
        private readonly ICacheManager cacheManager;
        private readonly ISettingService settingService;

        #endregion Fields

        #region Ctor

        public UIKitController(ICategoryService _categoryService,
            IPostService _postService,
            IUrlService _urlService,
            IPostTagService _tagService,
            ICacheManager _cacheManager,
            ISettingService _settingService)
        {
            categoryService = _categoryService;
            postService = _postService;
            urlService = _urlService;
            tagService = _tagService;
            cacheManager = _cacheManager;
            settingService = _settingService;
        }

        #endregion Ctor

        #region Methods

        public ActionResult Index()
        {
            return RedirectToAction("Accordion");
        }

        public ActionResult HtmlEditor()
        {
            return View();
        }

        public ActionResult Popup()
        {
            return View();
        }

        public ActionResult PictureUploader()
        {
            return View();
        }

        public ActionResult FileUploader()
        {
            return View();
        }

        public ActionResult Accordion()
        {
            return View();
        }

        public ActionResult Tab()
        {
            return View();
        }

        public ActionResult Alert()
        {
            return View();
        }

        public ActionResult Button()
        {
            return View();
        }

        public ActionResult Card()
        {
            return View();
        }

        public ActionResult Countup()
        {
            return View();
        }

        public ActionResult OvalDivider()
        {
            return View();
        }

        public ActionResult Form()
        {
            return View();
        }

        public ActionResult IconBox()
        {
            return View();
        }

        public ActionResult Progress()
        {
            return View();
        }

        public ActionResult Slider()
        {
            return View();
        }

        public ActionResult Tooltip()
        {
            return View();
        }

        public ActionResult Popover()
        {
            return View();
        }

        public ActionResult Typing()
        {
            return View();
        }

        #endregion Methods
    }
}