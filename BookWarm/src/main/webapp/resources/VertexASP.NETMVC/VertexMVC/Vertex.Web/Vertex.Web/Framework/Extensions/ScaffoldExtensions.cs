using System;
using System.Web.Mvc;
using System.Web.WebPages;
using Vertex.Core.Extensions;

namespace Vertex.Web.Framework.Extensions
{
    public static class ScaffoldExtensions
    {
        public static string SymbolForBool<T>(this HtmlHelper<T> helper, string boolFieldName)
        {
            return "<i class='fa fa-fw v-icon-active-<#= {0} #>'></i>".FormatInvariant(boolFieldName);
        }

        public static HelperResult SymbolForBool<T>(this HtmlHelper<T> helper, bool value)
        {
            return new HelperResult(writer => writer.Write("<i class='fa fa-fw v-icon-active-{0}'></i>".FormatInvariant(value.ToString().ToLower())));
        }

        [Obsolete]
        public static string RichEditorFlavor(this HtmlHelper helper)
        {
            return "Html";
        }
    }
}