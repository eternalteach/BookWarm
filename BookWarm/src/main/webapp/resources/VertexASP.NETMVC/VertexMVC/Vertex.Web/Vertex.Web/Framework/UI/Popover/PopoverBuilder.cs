using System;
using System.Web.Mvc;
using System.Web.WebPages;

namespace Vertex.Web.Framework.UI
{
    public class PopoverBuilder : ViewComponentBuilderBase<Popover, PopoverBuilder>
    {
        public PopoverBuilder(HtmlHelper htmlHelper, Popover model) : base(htmlHelper, model)
        { 
        }

        /// <summary>
        /// Tooltip for html string
        /// </summary>
        /// <param name="htmlString"></param>
        /// <returns></returns>
        public PopoverBuilder For(string htmlString)
        {
            this.Component.HtmlString = htmlString;
            return this;
        }

        /// <summary>
        /// Tooltip for html template
        /// </summary>
        /// <param name="htmlTemplate"></param>
        /// <returns></returns>
        public PopoverBuilder For(Func<dynamic, HelperResult> htmlTemplate)
        {
            Component.HtmlString = htmlTemplate(null).ToHtmlString();
            return this;
        }

        /// <summary>
        /// Tooltip for Vertex UI component
        /// </summary>
        /// <typeparam name="TModel"></typeparam>
        /// <typeparam name="TBuilder"></typeparam>
        /// <param name="builder"></param>
        /// <returns></returns>
        public PopoverBuilder For<TModel, TBuilder>(ViewComponentBuilderBase<TModel, TBuilder> builder)
            where TModel : ViewComponentBase
            where TBuilder : ViewComponentBuilderBase<TModel, TBuilder>
        {
            this.Component.HtmlString = builder.ToHtmlString();
            return this;
        }

        public PopoverBuilder Title(string title)
        {
            this.Component.Title = title;
            return this;
        }

        public PopoverBuilder Content(string content)
        {
            this.Component.Content = content;
            return this;
        }

        public PopoverBuilder ContentTemplate(Func<dynamic, HelperResult> contentTemplate)
        {
            this.Component.Content = contentTemplate(null).ToHtmlString();
            return this;
        }

        public PopoverBuilder Direction(PopoverDirection direction)
        {
            this.Component.Direction = direction;
            return this;
        }

        /// <summary>
        /// Dismiss popovers on the user’s next click of a different element than the toggle element.
        /// </summary>
        /// <param name="dismissOnNextClick"></param>
        /// <returns></returns>
        public PopoverBuilder DismissOnNextClick(bool dismissOnNextClick)
        {
            this.Component.DismissOnNextClick = dismissOnNextClick;
            return this;
        }
    }
}