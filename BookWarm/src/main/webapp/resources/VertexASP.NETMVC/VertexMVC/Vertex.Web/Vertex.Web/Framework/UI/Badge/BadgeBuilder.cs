using System.Web.Mvc;
using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class BadgeBuilder : ViewComponentBuilderBase<Badge, BadgeBuilder>
    {
        public BadgeBuilder(HtmlHelper htmlHelper, Badge model) : base(htmlHelper, model)
        { 
        }

        public BadgeBuilder Text(string text)
        {
            this.Component.Text = text;
            return this;
        }

        public BadgeBuilder Color(BootstrapColor color)
        {
            this.Component.BSColor = color;
            return this;
        }
    }
}