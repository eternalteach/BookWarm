using System;
using System.Web.Mvc;
using System.Web.WebPages;

namespace Vertex.Web.Framework.UI
{
    public class ConfirmModalBuilder : ViewComponentBuilderBase<ConfirmModal, ConfirmModalBuilder>
    {
        public ConfirmModalBuilder(HtmlHelper htmlHelper, ConfirmModal model) : base(htmlHelper, model)
        { 
        }

        public ConfirmModalBuilder ContentTemplate(Func<dynamic, HelperResult> template)
        {
            Component.Content = template(null).ToHtmlString();
            return this;
        }

        public ConfirmModalBuilder Content(string content)
        {
            Component.Content = content;
            return this;
        }

        public ConfirmModalBuilder Title(string title)
        {
            Component.Title = title;
            return this;
        }

        /// <summary>
        /// Popup for html string
        /// </summary>
        /// <param name="htmlString"></param>
        /// <returns></returns>
        public ConfirmModalBuilder For(string htmlString)
        {
            this.Component.HtmlString = htmlString;
            return this;
        }

        /// <summary>
        /// Popup for html template
        /// </summary>
        /// <param name="htmlTemplate"></param>
        /// <returns></returns>
        public ConfirmModalBuilder For(Func<dynamic, HelperResult> htmlTemplate)
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
        public ConfirmModalBuilder For<TModel, TBuilder>(ViewComponentBuilderBase<TModel, TBuilder> builder)
            where TModel : ViewComponentBase
            where TBuilder : ViewComponentBuilderBase<TModel, TBuilder>
        {
            this.Component.HtmlString = builder.ToHtmlString();
            return this;
        }
    }
}