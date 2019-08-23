using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Web.Routing;

namespace Vertex.Web.Framework.Paging
{
    public static class PagingExtensions
    {
        #region HtmlHelper extensions

        public static Pager Pager(this HtmlHelper htmlHelper, int pageSize, int currentPage, int totalItemCount)
        {
            return new Pager(htmlHelper, pageSize, currentPage, totalItemCount);
        }

        public static Pager Pager(this HtmlHelper htmlHelper, int pageSize, int currentPage, int totalItemCount, AjaxOptions ajaxOptions)
        {
            return new Pager(htmlHelper, pageSize, currentPage, totalItemCount).Options(o => o.AjaxOptions(ajaxOptions));
        }

        public static Pager<TModel> Pager<TModel>(this HtmlHelper<TModel> htmlHelper, int pageSize, int currentPage, int totalItemCount)
        {
            return new Pager<TModel>(htmlHelper, pageSize, currentPage, totalItemCount);
        }

        public static Pager<TModel> Pager<TModel>(this HtmlHelper<TModel> htmlHelper, int pageSize, int currentPage, int totalItemCount, AjaxOptions ajaxOptions)
        {
            return new Pager<TModel>(htmlHelper, pageSize, currentPage, totalItemCount).Options(o => o.AjaxOptions(ajaxOptions));
        }

        #endregion

        #region IQueryable<T> extensions

        public static IPagedList<T> ToPagedList<T>(this IQueryable<T> source, int pageIndex, int pageSize, int? totalCount = null)
        {
            return new PagedList<T>(source, pageIndex, pageSize, totalCount);
        }

        #endregion

        #region IEnumerable<T> extensions

        public static IPagedList<T> ToPagedList<T>(this IEnumerable<T> source, int pageIndex, int pageSize, int? totalCount = null)
        {
            if (pageIndex < 0)
                pageIndex = 0;
            return new PagedList<T>(source, pageIndex, pageSize, totalCount);
        }

        public static RouteValueDictionary FixListRouteDataValues(this RouteValueDictionary routes)
        {
            var newRv = new RouteValueDictionary();
            foreach (var key in routes.Keys)
            {
                var value = routes[key];
                if (value is System.Collections.IEnumerable && !(value is string))
                {
                    var index = 0;
                    foreach (var val in (System.Collections.IEnumerable)value)
                    {
                        newRv.Add(string.Format("{0}[{1}]", key, index), val);
                        index++;
                    }
                }
                else
                {
                    newRv.Add(key, value);
                }
            }
            return newRv;
        }
        #endregion
    }
}
