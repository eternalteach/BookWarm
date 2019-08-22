using System;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Telerik.Web.Mvc;
using Vertex.Core.Infrastructure;
using Vertex.Service;
using Vertex.Web.Framework.Helpers;

namespace Vertex.Web
{
    public class MvcApplication : HttpApplication
    {
        protected void Application_Start()
        { 
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            DependencyRegister.Register();

            WebAssetDefaultSettings.ScriptFilesPath = "~/Content/vendor/telerik/js";
            WebAssetDefaultSettings.StyleSheetFilesPath = "~/Content/vendor/telerik/css";
        }

        protected void Application_End()
        {
        }

        protected void Session_Start(object sender, EventArgs e)
        {
        }

        protected void Session_End(object sender, EventArgs e)
        {
            WebHelper.ClearSession();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            if (WebHelper.IsLocal)
                return;

            if (WebHelper.IsStaticResource(Request))
                return;

            var exception = Server.GetLastError();
            var httpException = exception as HttpException;
            if (httpException != null)
            {
                Response.Clear();
                Server.ClearError();
                Response.TrySkipIisCustomErrors = true;

                //Logging
                var logService = Engine.Resolve<ILogService>();
                logService.Error(WebHelper.GetCurrentPageUrl(true), WebHelper.GetUrlReferrer,
                    WebHelper.IpAddress, exception.Message, exception);

                if (httpException.GetHttpCode() == 404)
                    Context.Response.Redirect("/NotFound.html", true);
                else
                    Context.Response.Redirect("/Error.html", true);
            }
        }
    }
}