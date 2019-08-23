using System;
using System.Web.Mvc;
using System.Web.WebPages;
using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class PopupBuilder : ViewComponentBuilderBase<Popup, PopupBuilder>
    {
        public PopupBuilder(HtmlHelper htmlHelper, Popup model)
            : base(htmlHelper, model) { }

        public PopupBuilder Title(string title)
        {
            this.Component.Title = title;
            return this;
        }

        public PopupBuilder Message(string message)
        {
            this.Component.Message = message;
            return this;
        }

        public PopupBuilder MessageTemplate(Func<dynamic, HelperResult> template)
        {
            this.Component.Message = template(null).ToHtmlString();
            return this;
        }

        public PopupBuilder BgColor(BootstrapColor color)
        {
            this.Component.BgColor = color;
            return this;
        }

        /// <summary>
        /// The default animation of the popup component is fade.
        /// </summary>
        /// <param name="slide"></param>
        /// <returns></returns>
        public PopupBuilder Slide(PopupSlide slide)
        {
            this.Component.AppendHtmlAtribute("data-animation", string.Format("slide-{0}", slide.ToString().ToLower()));
            return this;
        }

        public PopupBuilder Position(PopupPosition position)
        {
            switch (position)
            {
                case PopupPosition.TopLeft:
                    this.Component.AppendHtmlAtribute("data-position", "top-left");
                    break;

                case PopupPosition.TopCenter:
                    this.Component.AppendHtmlAtribute("data-position", "top-center");
                    break;

                case PopupPosition.TopRight:
                    this.Component.AppendHtmlAtribute("data-position", "top-right");
                    break;

                case PopupPosition.BottomLeft:
                    this.Component.AppendHtmlAtribute("data-position", "bottom-left");
                    break;

                case PopupPosition.BottomCenter:
                    this.Component.AppendHtmlAtribute("data-position", "bottom-center");
                    break;

                case PopupPosition.BottomRight:
                    this.Component.AppendHtmlAtribute("data-position", "bottom-right");
                    break;
            }
            return this;
        }

        /// <summary>
        /// You can set a deadline for appearance of your popup
        /// </summary>
        /// <param name="second"></param>
        /// <returns></returns>
        public PopupBuilder Autohide(int second)
        {
            this.Component.AppendHtmlAtribute("data-autohide", second.ToString());
            return this;
        }

        /// <summary>
        /// An once popup is a popup that displays only one time to a user per browser. We use localStorage to store the data. 
        /// So when a user see this kind of popup, he won't see it again unless he uses another browser or clear his localStorage.
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public PopupBuilder Once(string key)
        {
            this.Component.AppendHtmlAtribute("data-once", key);
            this.Component.AppendHtmlAtribute("data-once-button", true.ToString());
            return this;
        }

        public PopupBuilder AutoShow()
        {
            this.Component.AutoShow = true; 
            return this;
        }

        /// <summary>
        /// Popup for html string
        /// </summary>
        /// <param name="htmlString"></param>
        /// <returns></returns>
        public PopupBuilder For(string htmlString)
        {
            this.Component.HtmlString = htmlString;
            return this;
        }

        /// <summary>
        /// Popup for html template
        /// </summary>
        /// <param name="htmlTemplate"></param>
        /// <returns></returns>
        public PopupBuilder For(Func<dynamic, HelperResult> htmlTemplate)
        {
            Component.HtmlString = htmlTemplate(null).ToHtmlString();
            return this;
        }

        /// <summary>
        /// Popup for Vertex UI component
        /// </summary>
        /// <typeparam name="TModel"></typeparam>
        /// <typeparam name="TBuilder"></typeparam>
        /// <param name="builder"></param>
        /// <returns></returns>
        public PopupBuilder For<TModel, TBuilder>(ViewComponentBuilderBase<TModel, TBuilder> builder)
            where TModel : ViewComponentBase
            where TBuilder : ViewComponentBuilderBase<TModel, TBuilder>
        {
            this.Component.HtmlString = builder.ToHtmlString();
            return this;
        }
    }
}