using System.Web.Mvc;
using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class BreadcrumbBuilder : ViewComponentBuilderBase<Breadcrumb, BreadcrumbBuilder>
    {
        public BreadcrumbBuilder(HtmlHelper htmlHelper, Breadcrumb model)
            : base(htmlHelper, model) { }

        public BreadcrumbBuilder TextColor(BootstrapColor textColor)
        {
            this.Component.AppendCssClass(string.Format("text-{0}", textColor.ToCssClass()));
            return this;
        }

        public BreadcrumbBuilder Align(BreadcrumbAlign breadcrumbAlign)
        {
            switch (breadcrumbAlign)
            {
                case BreadcrumbAlign.Left:
                    this.Component.AppendCssClass("justify-content-start");
                    break;

                case BreadcrumbAlign.Center:
                    this.Component.AppendCssClass("justify-content-center");
                    break;

                case BreadcrumbAlign.Right:
                    this.Component.AppendCssClass("justify-content-end");
                    break;
            }
            return this;
        }

        public BreadcrumbBuilder Transparent()
        {
            this.Component.AppendCssClass("bg-transparent pr-0 pl-0");
            return this;
        }
    }
}