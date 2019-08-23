using System.Web.Mvc; 

namespace Vertex.Web.Framework.UI
{
    public class FooterBuilder : ViewComponentBuilderBase<Footer, FooterBuilder>
    {
        public FooterBuilder(HtmlHelper htmlHelper, Footer model) : base(htmlHelper, model)
        {
            this.Component.ViewName = string.Format("{0}/Footer", this.Component.GetViewName());
        }

        public FooterBuilder ViewName(string viewName)
        {
            this.Component.ViewName = string.Empty;
            this.Component.ViewName = string.Format("{0}/{1}", this.Component.GetViewName(), viewName);
            return this;
        }
    }
}