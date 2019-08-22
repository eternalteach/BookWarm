using System;
using System.Web.Mvc;

namespace Vertex.Web.Framework.UI
{
    public static class VertexExtensions
    {
        public static VertexHelper Vertex(this HtmlHelper htmlHelper)
        {
            var Vertex = new VertexHelper(htmlHelper);
            return Vertex;
        }

        public static VertexHelper<TModel> Vertex<TModel>(this HtmlHelper<TModel> htmlHelper)
        {
            var Vertex = new VertexHelper<TModel>(htmlHelper);
            return Vertex;
        }
    }

    public class VertexHelper
    {
        public VertexHelper(HtmlHelper htmlHelper)
        {
            HtmlHelper = htmlHelper;
        }

        public HtmlHelper HtmlHelper { get; set; }
    }

    public class VertexHelper<TModel> : VertexHelper
    {
        public VertexHelper(HtmlHelper<TModel> htmlHelper)
            : base(htmlHelper)
        {
            HtmlHelper = htmlHelper;
        }

        public new HtmlHelper<TModel> HtmlHelper { get; set; }
    }
}