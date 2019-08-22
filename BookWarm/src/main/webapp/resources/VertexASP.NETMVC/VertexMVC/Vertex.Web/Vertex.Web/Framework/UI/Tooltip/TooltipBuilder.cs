using System;
using System.Web.Mvc;
using System.Web.WebPages;

namespace Vertex.Web.Framework.UI
{
    public class TooltipBuilder : ViewComponentBuilderBase<Tooltip, TooltipBuilder>
    {
        public TooltipBuilder(HtmlHelper htmlHelper, Tooltip model) : base(htmlHelper, model)
        { 
        }

        /// <summary>
        /// Tooltip for html string
        /// </summary>
        /// <param name="htmlString"></param>
        /// <returns></returns>
        public TooltipBuilder For(string htmlString)
        {
            this.Component.HtmlString = htmlString;
            return this;
        }

        /// <summary>
        /// Tooltip for html template
        /// </summary>
        /// <param name="htmlTemplate"></param>
        /// <returns></returns>
        public TooltipBuilder For(Func<dynamic, HelperResult> htmlTemplate)
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
        public TooltipBuilder For<TModel, TBuilder>(ViewComponentBuilderBase<TModel, TBuilder> builder)
            where TModel : ViewComponentBase
            where TBuilder : ViewComponentBuilderBase<TModel, TBuilder>
        {
            this.Component.HtmlString = builder.ToHtmlString();
            return this;
        }

        public TooltipBuilder Text(string text)
        {
            this.Component.Text = text;
            return this;
        }

        public TooltipBuilder TextTemplate(Func<dynamic, HelperResult> template)
        {
            this.Component.Text = template(null).ToHtmlString();
            this.Component.AppendHtmlAtribute("data-template", Component.Text);
            return this;
        }

        public TooltipBuilder Direction(TooltipDirection direction)
        {
            this.Component.Direction = direction;
            return this;
        }
    }
}