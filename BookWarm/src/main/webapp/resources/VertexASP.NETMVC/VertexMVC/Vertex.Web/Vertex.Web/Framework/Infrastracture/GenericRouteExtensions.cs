using System;
using System.Web.Mvc;
using System.Web.Routing;

namespace Vertex.Web.Framework.Infrastructure
{
    public static class GenericRouteExtensions
    {
        public static Route MapGenericPathRoute(this RouteCollection routes, string name, string url)
        {
            return MapGenericPathRoute(routes, name, url, null, null);
        }

        public static Route MapGenericPathRoute(this RouteCollection routes, string name, string url, object defaults)
        {
            return MapGenericPathRoute(routes, name, url, defaults, null);
        }

        public static Route MapGenericPathRoute(this RouteCollection routes, string name, string url, object defaults, object constraints)
        {
            return MapGenericPathRoute(routes, name, url, defaults, constraints, null);
        }

        public static Route MapGenericPathRoute(this RouteCollection routes, string name, string url, string[] namespaces)
        {
            return MapGenericPathRoute(routes, name, url, null, null, namespaces);
        }

        public static Route MapGenericPathRoute(this RouteCollection routes, string name, string url, object defaults, string[] namespaces)
        {
            return MapGenericPathRoute(routes, name, url, defaults, null, namespaces);
        }

        /// <summary>
        /// RouteConfig içerisinde MapRoute yerine bu method kullanılırsa url generic kontrolünden geçer
        /// </summary>
        /// <param name="routes"></param>
        /// <param name="name"></param>
        /// <param name="url"></param>
        /// <param name="defaults"></param>
        /// <param name="constraints"></param>
        /// <param name="namespaces"></param>
        /// <returns></returns>
        public static Route MapGenericPathRoute(this RouteCollection routes, string name, string url, object defaults, object constraints, string[] namespaces)
        {
            if (routes == null)
                throw new ArgumentNullException(nameof(routes));

            if (url == null)
                throw new ArgumentNullException(nameof(url));

            //Route sınıfı yerine GenericRoute adında oluşturduğumuz sınıfı kullanıyoruz.
            var route = new GenericRoute(url, new MvcRouteHandler())
            {
                Defaults = new RouteValueDictionary(defaults),
                Constraints = new RouteValueDictionary(constraints),
                DataTokens = new RouteValueDictionary()
            };

            if (namespaces != null && namespaces.Length > 0)
                route.DataTokens["Namespaces"] = namespaces;

            //RouteConfig içerisinde oluşturulan route'ların isimleride kendisiyle beraber saklanıyor
            //Isme göre route kontrolü için gerekiyor
            route.DataTokens["RouteName"] = name;
            routes.Add(name, route);

            return route;
        }
    }
}
