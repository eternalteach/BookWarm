using System;
using System.Web.Mvc;
using System.Web.WebPages;

namespace Vertex.Web.Framework.UI
{
    public class TabItemBuilder : ViewComponentBuilderBase<TabItem, TabItemBuilder>
    {
        public TabItemBuilder(HtmlHelper htmlHelper, TabItem component)
            : base(htmlHelper, component)
        {
        }

        public TabItemBuilder Title(string title)
        {
            this.Component.Title = title;
            return this;
        }

        public TabItemBuilder TitleTemplate(Func<dynamic, HelperResult> titleTemplate)
        {
            this.Component.Title = titleTemplate(null).ToHtmlString();
            return this;
        }

        public TabItemBuilder Content(string content)
        {
            this.Component.Content = content;
            return this;
        }

        public TabItemBuilder Content<TModel, TBuilder>(ViewComponentBuilderBase<TModel, TBuilder> builder)
            where TModel : ViewComponentBase
            where TBuilder : ViewComponentBuilderBase<TModel, TBuilder>
        {
            this.Component.Content = builder.ToHtmlString();
            return this;
        }

        public TabItemBuilder ContentTemplate(Func<dynamic, HelperResult> contentTemplate)
        {
            this.Component.Content = contentTemplate(null).ToHtmlString();
            return this;
        }

        public TabItemBuilder Active()
        {
            this.Component.Active = true;
            return this;
        }

        public TabItemBuilder Disabled()
        {
            this.Component.Disabled = true;
            return this;
        }
    }
}