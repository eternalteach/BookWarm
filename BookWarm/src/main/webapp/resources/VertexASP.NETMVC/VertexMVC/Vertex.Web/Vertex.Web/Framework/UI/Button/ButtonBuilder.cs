using System.Web;
using System.Web.Mvc;
using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class ButtonBuilder : ViewComponentBuilderBase<Button, ButtonBuilder>
    {
        public ButtonBuilder(HtmlHelper htmlHelper, Button model) : base(htmlHelper, model)
        { 
        }

        public ButtonBuilder Text(string text)
        {
            this.Component.Text = text;
            return this;
        }

        public ButtonBuilder Sleek()
        {
            this.Component.Sleek = true;
            return this;
        }

        public ButtonBuilder TransitionHover()
        {
            this.Component.TransitionHover = true;
            return this;
        }

        public ButtonBuilder Color(BootstrapColor color)
        {
            this.Component.BSColor = color;
            return this;
        }

        public ButtonBuilder Size(ButtonSize size)
        {
            this.Component.Size = size;
            return this;
        }

        public ButtonBuilder Outline()
        {
            this.Component.Outline = true;
            return this;
        }

        public ButtonBuilder Block()
        {
            this.Component.Block = true;
            return this;
        }

        public ButtonBuilder Icon(string icon)
        {
            this.Component.Icon = icon;
            return this;
        }

        public ButtonBuilder IconPosition(ButtonIconPosition iconPosition)
        {
            this.Component.IconPosition = iconPosition;
            return this;
        }

        public ButtonBuilder Corner(ButtonCorner corner)
        {
            this.Component.Corner = corner;
            return this;
        }

        public ButtonBuilder ActionLink(string url)
        {
            this.Component.ActionLink = url;
            return this;
        }

        public ButtonBuilder Wide()
        {
            this.Component.AppendCssClass("btn-wide");
            return this;
        }

        public ButtonBuilder ActionLink(string actionName, string controllerName)
        {
            var url = new UrlHelper(HttpContext.Current.Request.RequestContext);
            this.Component.ActionLink = url.Action(actionName, controllerName);
            return this;
        }

        public ButtonBuilder ActionLink(string actionName, string controllerName, object routeValues)
        {
            var url = new UrlHelper(HttpContext.Current.Request.RequestContext);
            this.Component.ActionLink = url.Action(actionName, controllerName, routeValues);
            return this;
        }
    }
}