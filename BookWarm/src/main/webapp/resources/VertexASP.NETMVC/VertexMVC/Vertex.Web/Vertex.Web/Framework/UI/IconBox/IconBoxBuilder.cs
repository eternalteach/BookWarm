using System;
using System.Web.Mvc;
using System.Web.WebPages;
using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class IconBoxBuilder : ViewComponentBuilderBase<IconBox, IconBoxBuilder>
    {
        public IconBoxBuilder(HtmlHelper htmlHelper, IconBox model) : base(htmlHelper, model)
        { 
        }

        public IconBoxBuilder Title(string title)
        {
            this.Component.Title = title;
            return this;
        }

        public IconBoxBuilder TitleTemplate(Func<dynamic, HelperResult> titleTemplate)
        {
            Component.Title = titleTemplate(null).ToHtmlString();
            return this;
        }

        public IconBoxBuilder TitleColor(BootstrapColor titleColor)
        {
            this.Component.TitleColor = titleColor;
            return this;
        }

        public IconBoxBuilder Content(string content)
        {
            this.Component.Content = content;
            return this;
        }

        public IconBoxBuilder ContentTemplate(Func<dynamic, HelperResult> contentTemplate)
        {
            Component.Content = contentTemplate(null).ToHtmlString();
            return this;
        }

        public IconBoxBuilder ContentColor(BootstrapColor contentColor)
        {
            this.Component.ContentColor = contentColor;
            return this;
        }

        public IconBoxBuilder SubTitle(string title)
        {
            this.Component.SubTitle = title;
            return this;
        }

        public IconBoxBuilder Icon(string icon)
        {
            this.Component.Icon = icon; 
            return this;
        }

        public IconBoxBuilder IconColor(BootstrapColor iconColor)
        {
            this.Component.IconColor = iconColor;
            return this;
        }

        public IconBoxBuilder IconPosition(IconBoxIconPosition iconPosition)
        { 
            this.Component.IconPosition = iconPosition;
            return this;
        }

        public IconBoxBuilder ShapeIcon()
        {
            this.Component.ShapeIcon = true;
            return this;
        }

        public IconBoxBuilder Align(IconBoxAlign align)
        {
            switch (align)
            {
                case IconBoxAlign.Center:
                    this.Component.AppendCssClass("text-center");
                    break;
                case IconBoxAlign.Right:
                    this.Component.AppendCssClass("text-right");
                    break;
            }
            return this;
        }

        public IconBoxBuilder Bordered()
        {
            this.Component.Bordered = true;
            return this;
        }

        public IconBoxBuilder Bordered(BootstrapColor bgColor)
        {
            this.Component.Bordered = true;
            this.Component.BgColor = bgColor;
            return this;
        }

        public IconBoxBuilder Bordered(BootstrapColor bgColor, OvalDividerType ovalDividerType)
        {
            this.Component.Bordered = true;
            this.Component.BgColor = bgColor;
            this.Component.OvalDividerType = ovalDividerType;
            return this;
        }

        public IconBoxBuilder TransitionHover()
        {
            this.Component.AppendCssClass("transition-hover");
            return this;
        }

        public IconBoxBuilder Shadow()
        {
            this.Component.AppendCssClass("shadow-4");
            return this;
        }

        public IconBoxBuilder HoverShadow()
        {
            this.Component.AppendCssClass("hover-shadow-4");
            return this;
        }

        public IconBoxBuilder ActionLink(string linkText, string actionName, string controllerName)
        {
            this.Component.LinkText = linkText;
            this.Component.ActionName = actionName;
            this.Component.ControllerName = controllerName;
            return this;
        }
    }
}