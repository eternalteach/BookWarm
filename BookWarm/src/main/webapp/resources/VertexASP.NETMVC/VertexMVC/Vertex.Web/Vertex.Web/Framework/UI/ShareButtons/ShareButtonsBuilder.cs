using System;
using System.Web.Mvc;
using System.Web.WebPages; 
using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class ShareButtonsBuilder : ViewComponentBuilderBase<ShareButtons, ShareButtonsBuilder>
    {
        public ShareButtonsBuilder(HtmlHelper htmlHelper, ShareButtons model) : base(htmlHelper, model)
        { 
        }

        public ShareButtonsBuilder Text(string text)
        {
            this.Component.Text = text;
            return this;
        }

        public ShareButtonsBuilder TextTemplate(Func<dynamic, HelperResult> template)
        {
            this.Component.Text = template(null).ToHtmlString();
            return this;
        }

        public ShareButtonsBuilder Color(BootstrapColor color)
        {
            this.Component.Color = color;
            return this;
        }

        public ShareButtonsBuilder Dismissible(bool dismissible)
        {
            this.Component.Dismissible = dismissible;
            return this;
        }

        public ShareButtonsBuilder Size(ShareButtonsSize size)
        { 
            switch (size)
            {
                case ShareButtonsSize.Small:
                    this.Component.AppendCssClass("ShareButtons-sm");
                    break;
                case ShareButtonsSize.Large:
                    this.Component.AppendCssClass("ShareButtons-lg");
                    break;
            }
            return this;
        }
    }
}