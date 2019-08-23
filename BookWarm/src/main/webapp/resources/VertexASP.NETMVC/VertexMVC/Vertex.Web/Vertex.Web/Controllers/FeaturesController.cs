using System.Web.Mvc;
using Vertex.Core.Cache;
using Vertex.Service;
using Vertex.Web.Framework.Controllers;

namespace Vertex.Web.Controllers
{
    public class FeaturesController : BaseController
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

        public FeaturesController(ICategoryService _categoryService,
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

        public ActionResult BlogPost()
        {
            return View();
        }

        public ActionResult TeamMember()
        {
            return View();
        }

        public ActionResult Jobs()
        {
            return View();
        }

        public ActionResult Portfolio()
        {
            return View();
        }

        public ActionResult Testimonials()
        {
            return View();
        }

        public ActionResult Clients()
        {
            return View();
        }

        public ActionResult HtmlEditor()
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
        
        #endregion Methods
    }
}