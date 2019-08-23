using System;
using System.Web.Mvc;
using System.Web.WebPages;

namespace Vertex.Web.Framework.UI
{
    public class AccordionItemBuilder : ViewComponentBuilderBase<AccordionItem, AccordionItemBuilder>
    {
        public AccordionItemBuilder(HtmlHelper htmlHelper, AccordionItem component) : base(htmlHelper, component)
        { 
        }

        public AccordionItemBuilder Title(string title)
        {
            this.Component.Title = title;
            return this;
        }

        public AccordionItemBuilder TitleTemplate(Func<dynamic, HelperResult> titleTemplate)
        {
            this.Component.Title = titleTemplate(null).ToHtmlString();
            return this;
        }

        public AccordionItemBuilder Content(string content)
        {
            this.Component.Content = content;
            return this;
        }

        public AccordionItemBuilder ContentTemplate(Func<dynamic, HelperResult> contentTemplate)
        {
            this.Component.Content = contentTemplate(null).ToHtmlString();
            return this;
        }

        public AccordionItemBuilder Expanded()
        {
            this.Component.Expanded = true;
            return this;
        }

        public AccordionItemBuilder Icon(string icon)
        {
            this.Component.TitleIcon = icon;
            return this;
        }
    }
}