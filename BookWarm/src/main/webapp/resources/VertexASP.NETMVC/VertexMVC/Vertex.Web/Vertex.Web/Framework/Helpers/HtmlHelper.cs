using System;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using Vertex.Core;
using Vertex.Core.Cache;
using Vertex.Core.Infrastructure;

namespace Vertex.Web.Framework.Helpers
{
    public static class HtmlHelper
    {
        #region Enum Helper

        public static MvcHtmlString EnumSelectListFor<TModel, TEnum>(this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TEnum>> expression, object htmlAttributes)
        {
            return EnumSelectListFor(htmlHelper, expression, null, htmlAttributes);
        }

        public static MvcHtmlString EnumSelectListFor<TModel, TEnum>(this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TEnum>> expression, string optionLabel, object htmlAttributes)
        {
            ModelMetadata metadata = ModelMetadata.FromLambdaExpression(expression, htmlHelper.ViewData);
            Type enumType = metadata.ModelType;

            Type underlyingType = Nullable.GetUnderlyingType(enumType);
            if (underlyingType != null)
                enumType = underlyingType;

            var values = from Enum value in Enum.GetValues(enumType)
                         select new
                         {
                             Id = value,
                             Name = value.GetType().Name
                         };

            return htmlHelper.DropDownListFor(expression, new SelectList(values, "Id", "Name", metadata.Model), optionLabel, htmlAttributes);
        }

        public static MvcHtmlString EnumDisplayNameFor<TModel, TEnum>(this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TEnum>> expression)
        {
            ModelMetadata metadata = ModelMetadata.FromLambdaExpression(expression, htmlHelper.ViewData);
            var type = (Enum)metadata.Model;

            return new MvcHtmlString(type.GetType().Name);
        }

        #endregion Enum Helper

        #region Ckeditor

        /// <summary>
        /// Returns html to render Ckeditor with the specified form name
        /// </summary>
        /// <param name="htmlHelper"></param>
        /// <param name="name"></param>
        /// <param name="config">A Ckeditor config object which can contain any setting mentioned here: http://docs.ckeditor.com/#!/api/CKEDITOR.config e.g. new { height = 500 }</param>
        /// <returns></returns>
        public static MvcHtmlString Ckeditor(this System.Web.Mvc.HtmlHelper htmlHelper, string name, object config = null)
        {
            return htmlHelper.Editor(name, "Ckeditor", new { Config = config });
        }

        /// <summary>
        /// Returns html to render Ckeditor for the specified model property
        /// </summary>
        /// <typeparam name="TModel"></typeparam>
        /// <typeparam name="TProperty"></typeparam>
        /// <param name="htmlHelper"></param>
        /// <param name="expression"></param>
        /// <param name="config">A Ckeditor config object which can contain any setting mentioned here: http://docs.ckeditor.com/#!/api/CKEDITOR.config e.g. new { height = 500 }</param>
        /// <returns></returns>
        public static MvcHtmlString CkeditorFor<TModel, TProperty>(this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression, object config = null)
        {
            return htmlHelper.EditorFor(expression, "Ckeditor", new { Config = config });
        }

        #endregion Ckeditor

        #region Style/Script Tag Helper

        public static MvcHtmlString Script(this System.Web.Mvc.HtmlHelper htmlHelper, string path, bool isAsync = false)
        {
            return MvcHtmlString.Create(string.Format("<script src=\"{0}\"{1}></script>", ReCreatePath(path, true), isAsync ? " async" : string.Empty));
        }

        public static MvcHtmlString Style(this System.Web.Mvc.HtmlHelper htmlHelper, string path)
        {
            return MvcHtmlString.Create(string.Format("<link rel=\"stylesheet\" href=\"{0}\" />", ReCreatePath(path, true)));
        }

        public static MvcHtmlString Favicon(this System.Web.Mvc.HtmlHelper htmlHelper, string path)
        {
            return MvcHtmlString.Create(string.Format("<link rel=\"shortcut icon\" href=\"{0}\" />", ReCreatePath(path)));
        }

        public static MvcHtmlString Picture(this System.Web.Mvc.HtmlHelper htmlHelper, string path, string alt = "")
        {
            return MvcHtmlString.Create(string.Format("<img src=\"{0}\" alt=\"{1}\" />", ReCreatePath(path), alt));
        }

        private static string ReCreatePath(string path, bool versioning = false)
        {
            string newPath = path.Replace("~", string.Empty);

            if (path.StartsWith("https:", StringComparison.CurrentCultureIgnoreCase))
                path = path.Replace("https:", string.Empty);

            if (path.StartsWith("http:", StringComparison.CurrentCultureIgnoreCase))
                path = path.Replace("http:", string.Empty);

            if (!newPath.StartsWith("/", StringComparison.CurrentCultureIgnoreCase) &&
                !newPath.StartsWith("//", StringComparison.CurrentCultureIgnoreCase))
                newPath = string.Concat("/", versioning ? GetVersioningPath(newPath) : newPath);

            if (newPath.Contains("\\"))
                newPath = newPath.Replace("\\", "//");

            return newPath;
        }

        private static string GetVersioningPath(string path)
        {
            var cacheManager = Engine.Resolve<ICacheManager>();

            return cacheManager.Get(string.Format(CacheConstant.STATIC_FILE, path), () =>
            {
                var fileVersion = new FileInfo(HttpContext.Current.Server.MapPath(path)).LastWriteTime.Ticks;
                return string.Format("{0}?v={1}", path, fileVersion);
            });
        }

        #endregion Style/Script Tag Helper
    }
}