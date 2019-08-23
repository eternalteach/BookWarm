using System;
using System.Web.Mvc;
using System.Web.WebPages;

namespace Vertex.Web.Framework.UI
{
    public class HtmlEditorBuilder : ViewComponentBuilderBase<HtmlEditor, HtmlEditorBuilder>
    {
        public HtmlEditorBuilder(HtmlHelper htmlHelper, HtmlEditor model)
            : base(htmlHelper, model) { }

        public HtmlEditorBuilder Html(string htmlCode)
        {
            this.Component.Html = htmlCode;
            return this;
        }

        public HtmlEditorBuilder HtmlTemplate(Func<dynamic, HelperResult> htmlCodeTemplate)
        {
            this.Component.Html = htmlCodeTemplate(null).ToHtmlString();
            return this;
        }
    }
}