using System;
using System.Web.Mvc;
using System.Web.WebPages;
using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class PageBuilder : ViewComponentBuilderBase<Page, PageBuilder>
    {
        public PageBuilder(HtmlHelper htmlHelper, Page model) 
            : base(htmlHelper, model) { }

        public PageBuilder Header(Action<Header> action)
        {
            var model = new Header();
            action.Invoke(model);
            var headerBuilder = new HeaderBuilder(this.HtmlHelper, model).ToHtmlString(); 
            return this;
        }

        public PageBuilder Footer()
        { 
            var headerBuilder = new FooterBuilder(this.HtmlHelper, new UI.Footer()).ToHtmlString();
            return this;
        }

        public PageBuilder Footer(Action<Footer> action)
        {
            var model = new Footer();
            action.Invoke(model);
            var headerBuilder = new FooterBuilder(this.HtmlHelper, model).ToHtmlString();
            return this;
        }

        public PageBuilder BgColor(BootstrapColor color)
        {
            this.Component.BgColor = color;
            return this;
        }

        public PageBuilder Title(string title)
        {
            this.Component.Title = title;
            return this;
        }

        public PageBuilder Css(Func<dynamic, HelperResult> template)
        {
            this.Component.Css = template(null).ToHtmlString();
            return this;
        }

        public PageBuilder Script(Func<dynamic, HelperResult> template)
        {
            this.Component.Script = template(null).ToHtmlString();
            return this;
        }
    }
}