using System;
using System.Web.Mvc;
using System.Web.WebPages; 
using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class AlertBuilder : ViewComponentBuilderBase<Alert, AlertBuilder>
    {
        public AlertBuilder(HtmlHelper htmlHelper, Alert model) : base(htmlHelper, model)
        { 
        }

        public AlertBuilder Text(string text)
        {
            this.Component.Text = text;
            return this;
        }

        public AlertBuilder TextTemplate(Func<dynamic, HelperResult> template)
        {
            this.Component.Text = template(null).ToHtmlString();
            return this;
        }

        public AlertBuilder Color(BootstrapColor color)
        {
            this.Component.Color = color;
            return this;
        }

        public AlertBuilder Dismissible(bool dismissible)
        {
            this.Component.Dismissible = dismissible;
            return this;
        }

        public AlertBuilder Size(AlertSize size)
        { 
            switch (size)
            {
                case AlertSize.Small:
                    this.Component.AppendCssClass("alert-sm");
                    break;
                case AlertSize.Large:
                    this.Component.AppendCssClass("alert-lg");
                    break;
            }
            return this;
        }
    }
}