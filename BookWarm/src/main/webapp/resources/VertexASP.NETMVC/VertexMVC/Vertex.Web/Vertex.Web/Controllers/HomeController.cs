using System.Web.Mvc;
using Vertex.Core.Cache;
using Vertex.Service;
using Vertex.Web.Framework.Controllers;

namespace Vertex.Web.Controllers
{
    public class HomeController : BaseController
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

        public HomeController(ICategoryService _categoryService,
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
            return View();
        }

        public ActionResult Index2()
        {
            return View();
        }

        public ActionResult Index3()
        {
            return View();
        }

        public ActionResult Index4()
        {
            return View();
        }

        public ActionResult Index5()
        {
            return View();
        }

        #endregion Methods
    }
}