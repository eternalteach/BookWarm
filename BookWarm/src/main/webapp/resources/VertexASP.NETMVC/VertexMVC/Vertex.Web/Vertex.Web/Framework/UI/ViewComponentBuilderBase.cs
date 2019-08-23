using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html; 

namespace Vertex.Web.Framework.UI
{
    public abstract class ViewComponentBuilderBase<TViewComponent, TBuilder> : IHtmlString
        where TViewComponent : ViewComponentBase
        where TBuilder : ViewComponentBuilderBase<TViewComponent, TBuilder>
    {
        internal HtmlHelper HtmlHelper { get; set; }
        internal TViewComponent Component { get; set; } 

        public ViewComponentBuilderBase(HtmlHelper htmlHelper, TViewComponent component)
        {
            this.HtmlHelper = htmlHelper;
            this.Component = component;
        }

        public virtual string ToHtmlString()
        {
            this.Component.GenerateHtmlAtributes();

            string viewName = this.Component.GetViewName();
            return PartialExtensions.Partial(this.HtmlHelper, viewName, Component).ToHtmlString();
        }

        public virtual TBuilder AppendCssClass(string cssClass)
        {
            this.Component.AppendCssClass(cssClass);
            return this as TBuilder;
        }

        public virtual TBuilder AppendHtmlAtribute(string name, string value)
        {
            this.Component.AppendHtmlAtribute(name, value);
            return this as TBuilder;
        }

        public virtual TBuilder AppendStyle(string name, string value)
        {
            this.Component.AppendStyle(name, value);
            return this as TBuilder;
        }

        public override string ToString()
        {
            return ToHtmlString();
        }
    }
}