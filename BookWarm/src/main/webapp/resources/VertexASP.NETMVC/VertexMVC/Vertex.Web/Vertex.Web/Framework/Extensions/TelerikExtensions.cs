using Telerik.Web.Mvc.UI.Fluent;

namespace Vertex.Web.Framework.Extensions
{
    public static class TelerikExtensions
    {
        public static GridBoundColumnBuilder<T> Centered<T>(this GridBoundColumnBuilder<T> columnBuilder) where T : class
        {
            return columnBuilder.HtmlAttributes(new { align = "center" }).HeaderHtmlAttributes(new { style = "text-align:center;" });
        }

        public static GridBoundColumnBuilder<T> RoundedImage<T>(this GridBoundColumnBuilder<T> columnBuilder) where T : class
        {
            return columnBuilder.HtmlAttributes(new { @class = "rounded-image" });
        }

        public static GridTemplateColumnBuilder<T> Centered<T>(this GridTemplateColumnBuilder<T> columnBuilder) where T : class
        {
            return columnBuilder.HtmlAttributes(new { align = "center" }).HeaderHtmlAttributes(new { style = "text-align:center;" });
        }

        public static GridBoundColumnBuilder<T> RightAlign<T>(this GridBoundColumnBuilder<T> columnBuilder) where T : class
        {
            return columnBuilder.HtmlAttributes(new { style = "text-align:right;" }).HeaderHtmlAttributes(new { style = "text-align:right;" });
        }

        public static GridTemplateColumnBuilder<T> RightAlign<T>(this GridTemplateColumnBuilder<T> columnBuilder) where T : class
        {
            return columnBuilder.HtmlAttributes(new { style = "text-align:right;" }).HeaderHtmlAttributes(new { style = "text-align:right;" });
        }
    }
}