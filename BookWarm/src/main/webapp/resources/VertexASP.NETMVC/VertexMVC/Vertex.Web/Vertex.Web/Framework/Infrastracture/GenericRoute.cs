using System.Web;
using System.Web.Routing;
using Vertex.Core.Entities;
using Vertex.Core.Infrastructure;
using Vertex.Service;

namespace Vertex.Web.Framework.Infrastructure
{
    public class GenericRoute : Route
    {
        public GenericRoute(string url, IRouteHandler routeHandler)
               : base(url, routeHandler)
        {
        }

        public GenericRoute(string url, RouteValueDictionary defaults, IRouteHandler routeHandler)
            : base(url, defaults, routeHandler)
        {
        }

        public GenericRoute(string url, RouteValueDictionary defaults, RouteValueDictionary constraints, IRouteHandler routeHandler)
            : base(url, defaults, constraints, routeHandler)
        {
        }

        public GenericRoute(string url, RouteValueDictionary defaults, RouteValueDictionary constraints, RouteValueDictionary dataTokens, IRouteHandler routeHandler)
            : base(url, defaults, constraints, dataTokens, routeHandler)
        {
        }

        /// <summary>
        /// Yönlendirme sırasında tetiklenir ve o anki yönlendirme bilgilerini verir
        /// </summary>
        /// <param name="httpContext"></param>
        /// <returns></returns>
        public override RouteData GetRouteData(HttpContextBase httpContext)
        {
            RouteData routeData = base.GetRouteData(httpContext);

            if (routeData == null)
                return base.GetRouteData(httpContext);

            if (routeData.Values["PortfolioItem"] != null)
            {
                var url = routeData.Values["PortfolioItem"] as string;
                var urlRecord = Engine.Resolve<IUrlService>().GetByUrl(url, nameof(Portfolio));

                routeData.Values["controller"] = "Portfolio";
                routeData.Values["action"] = "Portfolio";
                routeData.Values["Id"] = urlRecord.EntityId;
            }
            else if (routeData.Values["JobDetail"] != null)
            {
                var url = routeData.Values["JobDetail"] as string;
                var urlRecord = Engine.Resolve<IUrlService>().GetByUrl(url, nameof(Job));

                routeData.Values["controller"] = "Page";
                routeData.Values["action"] = "JobDetail";
                routeData.Values["Id"] = urlRecord.EntityId;
            }
            else if (routeData.Values["PortfolioCategory"] != null)
            {
                var url = routeData.Values["PortfolioCategory"] as string;
                var urlRecord = Engine.Resolve<IUrlService>().GetByUrl(url, nameof(PortfolioCategory));

                routeData.Values["controller"] = "Portfolio";
                routeData.Values["action"] = "PortfolioCategory";
                routeData.Values["Id"] = urlRecord.EntityId;
            }
            else if (routeData.Values["SeName"] != null)
            {
                var url = routeData.Values["SeName"] as string;
                var urlRecord = Engine.Resolve<IUrlService>().GetByUrl(url);

                if (urlRecord != null)
                {
                    switch (urlRecord.EntityName)
                    {
                        case nameof(Post):
                            {
                                routeData.Values["controller"] = "Blog";
                                routeData.Values["action"] = "Post";
                                routeData.Values["Id"] = urlRecord.EntityId;
                                break;
                            }
                        case nameof(Category):
                            {
                                routeData.Values["controller"] = "Blog";
                                routeData.Values["action"] = "Category";
                                routeData.Values["Id"] = urlRecord.EntityId;
                                break;
                            }
                    }
                }
                else
                {
                    routeData.Values["controller"] = routeData.Values["SeName"];
                    routeData.Values["action"] = "Index";
                }
            }

            return routeData;
        }
    }
}
