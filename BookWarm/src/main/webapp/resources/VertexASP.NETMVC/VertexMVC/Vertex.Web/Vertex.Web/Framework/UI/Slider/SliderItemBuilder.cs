using System;
using System.Web.Mvc;
using System.Web.WebPages;

namespace Vertex.Web.Framework.UI
{
    public class SliderItemBuilder : ViewComponentBuilderBase<SliderItem, SliderItemBuilder>
    {
        public SliderItemBuilder(HtmlHelper htmlHelper, SliderItem model)
            : base(htmlHelper, model) { }

        public SliderItemBuilder Image(string src)
        {
            this.Component.Src = src;
            return this;
        }

        public SliderItemBuilder Content(string content)
        {
            this.Component.Content = content;
            return this;
        }

        public SliderItemBuilder ContentTemplate(Func<dynamic, HelperResult> template)
        {
            this.Component.Content = template(null).ToHtmlString();
            return this;
        }
    }
}