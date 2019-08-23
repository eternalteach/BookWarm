using System;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Vertex.Web.Framework.Attributes
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, Inherited = true, AllowMultiple = true)]
    public class DemoAuthorizeAttribute : AuthorizeAttribute
    {
        private readonly string[] allowedroles;

        public DemoAuthorizeAttribute(params string[] roles)
        {
            this.allowedroles = roles;
        }

        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            foreach (var role in allowedroles)
            {
                if (httpContext.User.IsInRole(role))
                    return true;
            }

            return false;
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            filterContext.Result = new RedirectToRouteResult(
                        new RouteValueDictionary(
                            new
                            {
                                controller = "User",
                                action = "NoPermission",
                                //returnUrl = filterContext.HttpContext.Request.Url.GetComponents(UriComponents.PathAndQuery, UriFormat.SafeUnescaped)
                            }));
        }
    }
}