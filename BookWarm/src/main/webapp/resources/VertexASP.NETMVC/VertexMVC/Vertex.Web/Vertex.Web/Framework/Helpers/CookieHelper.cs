using System;
using System.Web;

namespace Vertex.Web.Framework.Helpers
{
    public static class CookieHelper
    {
        /// <summary>
        /// Set cookie into browser
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <param name="day"></param>
        public static void Set(string key, string value, int day)
        {
            if (WebHelper.IsRequestAvailable)
            {
                var c = new HttpCookie(key)
                {
                    Value = value,
                    Expires = DateTime.UtcNow.AddDays(day),
                };
                HttpContext.Current.Response.Cookies.Add(c);
            }
        }

        /// <summary>
        /// Get cookie by cookie name from browser
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public static string Get(string key)
        {
            var value = string.Empty;

            if (WebHelper.IsRequestAvailable)
            {
                var c = HttpContext.Current.Request.Cookies[key];
                return c != null ? HttpContext.Current.Server.HtmlEncode(c.Value).Trim() : value;
            }
            return value;
        }
        
        /// <summary>
        /// Exists cookie in browser return true
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public static bool Exists(string key)
        {
            if (WebHelper.IsRequestAvailable)
                return HttpContext.Current.Request.Cookies[key] != null;

            return false;
        }

        /// <summary>
        /// Delete cookie by name from browser
        /// </summary>
        /// <param name="key"></param>
        public static void Delete(string key)
        {
            if (WebHelper.IsRequestAvailable)
            {
                if (Exists(key))
                {
                    var c = new HttpCookie(key)
                    {
                        Expires = DateTime.UtcNow.AddDays(-1)
                    };
                    HttpContext.Current.Response.Cookies.Add(c);
                }
            }
        }

        /// <summary>
        /// Remove all cookie from browser
        /// </summary>
        public static void RemoveAll()
        {
            if (WebHelper.IsRequestAvailable)
            {
                for (int i = 0; i <= HttpContext.Current.Request.Cookies.Count - 1; i++)
                {
                    if (HttpContext.Current.Request.Cookies[i] != null)
                        Delete(HttpContext.Current.Request.Cookies[i].Name);
                }
            }
        }
    }
}