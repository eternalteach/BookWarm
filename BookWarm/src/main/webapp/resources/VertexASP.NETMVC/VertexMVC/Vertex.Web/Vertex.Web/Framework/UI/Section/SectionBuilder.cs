using System;
using System.Web.Mvc;
using System.Web.WebPages;
using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class SectionBuilder : ViewComponentBuilderBase<Section, SectionBuilder>
    {
        public SectionBuilder(HtmlHelper htmlHelper, Section model)
            : base(htmlHelper, model)
        {
        }

        public SectionBuilder ContentTemplate(Func<dynamic, HelperResult> template)
        {
            Component.Content = template(null).ToHtmlString();
            return this;
        }

        public SectionBuilder Src(string src)
        {
            this.Component.Src = src;
            return this;
        }

        public SectionBuilder VerticalCenter()
        {
            this.Component.VerticalCenter = true;
            this.Component.AppendCssClass("vertical-center");
            return this;
        }

        public SectionBuilder BgColor(BootstrapColor BgColor)
        {
            this.Component.BgColor = BgColor;
            this.Component.SectionType = Vertex.Web.Framework.UI.SectionType.Colored;
            return this;
        }

        public SectionBuilder SectionType(SectionType type)
        {
            this.Component.SectionType = type;
            return this;
        }

        public SectionBuilder Size(SectionSize size)
        {
            this.Component.Size = size;
            return this;
        }

        public SectionBuilder Overlay(short opacity)
        {
            this.Component.Overlay = new Overlay(OverlayColor.Dark, OverlayPosition.On, opacity);
            return this;
        }

        public SectionBuilder Overlay(OverlayColor color, OverlayPosition position, short opacity)
        {
            this.Component.Overlay = new Overlay(color, position, opacity);
            return this;
        }
    }
}