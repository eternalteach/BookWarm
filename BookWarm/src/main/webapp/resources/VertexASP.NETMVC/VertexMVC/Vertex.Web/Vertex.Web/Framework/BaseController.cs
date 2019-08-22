using System;
using System.IO;
using System.Web.Mvc;
using System.Web.Routing;
using Vertex.Core.Cache;
using Vertex.Core.Infrastructure;
using Vertex.Web.Framework.Helpers;
using Vertex.Web.Framework.UI;
using HtmlHelper = System.Web.Mvc.HtmlHelper;

namespace Vertex.Web.Framework.Controllers
{
    public abstract class BaseController : Controller
    {
        protected override void Initialize(RequestContext requestContext)
        {
            base.Initialize(requestContext);
        }

        #region Redirect

        [AllowAnonymous]
        public virtual ActionResult Error()
        {
            return Redirect("/Error.html");
        }

        [AllowAnonymous]
        public virtual ActionResult NotFound()
        {
            return Redirect("/NotFound.html");
        }

        [AllowAnonymous]
        public virtual ActionResult NotActive()
        {
            return Redirect("/NotFound.html");
        }

        public virtual ActionResult HomePage()
        {
            return RedirectToAction("Index", "Home");
        }

        #endregion Redirect

        public ActionResult ClearCache()
        {
            Engine.Resolve<ICacheManager>().Clear();
            NotifySuccess("Cache cleared.");

            string urlReferer = WebHelper.GetUrlReferrer;
            if (String.IsNullOrEmpty(urlReferer))
                return RedirectToAction("Index", "Home");
            else
                return Redirect(urlReferer);
        }

        public ActionResult NoPermission()
        {
            return View();
        }

        public virtual void NotifySuccess(string message)
        {
            TempData["NotifySuccess"] = HtmlHelper.Vertex().Popup()
                                             .AutoShow()
                                             .Message(message)
                                             .BgColor(Utilities.BootstrapColor.Success)
                                             .ToHtmlString();
        }

        public virtual void NotifyError(string message)
        {
            TempData["NotifyError"] = HtmlHelper.Vertex().Popup()
                                         .AutoShow()
                                         .Message(message)
                                         .BgColor(Utilities.BootstrapColor.Danger)
                                         .ToHtmlString();
        }

        public virtual void NotifyInfo(string message)
        {
            TempData["NotifyInfo"] = HtmlHelper.Vertex().Popup()
                                          .AutoShow()
                                          .Message(message)
                                          .BgColor(Utilities.BootstrapColor.Info)
                                          .ToHtmlString();
        }

        public virtual void NotifyWarning(string message)
        {
            TempData["NotifyWarning"] = HtmlHelper.Vertex().Popup()
                                          .AutoShow()
                                          .Message(message)
                                          .BgColor(Utilities.BootstrapColor.Warning)
                                          .ToHtmlString();
        }

        /// <summary>
        /// Fake HtmlHelper
        /// </summary>
        public HtmlHelper HtmlHelper
        {
            get
            {
                return new HtmlHelper(new ViewContext(ControllerContext,
                    new WebFormView(ControllerContext, "omg"),
                    new ViewDataDictionary(),
                    new TempDataDictionary(),
                    new StringWriter()), new ViewPage());
            }
        }
    }
}