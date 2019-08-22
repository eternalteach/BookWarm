using System.Web.Mvc; 

namespace Vertex.Web.Framework.UI
{
    public class HeaderBuilder : ViewComponentBuilderBase<Header, HeaderBuilder>
    {
        public HeaderBuilder(HtmlHelper htmlHelper, Header model)
            : base(htmlHelper, model)
        {
            this.Component.ViewName = string.Format("{0}/Header", this.Component.GetViewName());
        }

        public HeaderBuilder Transparency(HeaderTransparency transparency)
        {
            Component.Transparency = transparency;
            return this;
        }

        //public NavBuilder Nav()
        //{
        //    return new NavBuilder(this.HtmlHelper, this.Component.Nav);
        //}

        //public TopbarBuilder Topbar()
        //{
        //    return new TopbarBuilder(this.HtmlHelper, this.Component.Topbar);
        //}

        //public LogoBuilder Logo()
        //{
        //    return new LogoBuilder(this.HtmlHelper, this.Component.Logo);
        //}
    }
}