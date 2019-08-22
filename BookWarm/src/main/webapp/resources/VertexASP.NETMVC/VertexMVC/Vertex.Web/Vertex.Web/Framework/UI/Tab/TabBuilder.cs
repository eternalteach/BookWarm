using System.Web.Mvc;

namespace Vertex.Web.Framework.UI
{
    public class TabBuilder : ViewComponentBuilderBase<Tab, TabBuilder>
    {
        public TabBuilder(HtmlHelper htmlHelper, Tab model) : base(htmlHelper, model)
        { 
        }

        public TabItemBuilder Add()
        { 
            var tabItemBuilder = new TabItemBuilder(this.HtmlHelper, new TabItem());
            this.Component.Items.Add(tabItemBuilder.Component);
            return tabItemBuilder;
        }

        public TabBuilder HorizontalAlignment(TabHorizontalAlignment horizontalAlignment)
        {
            switch (horizontalAlignment)
            {
                case TabHorizontalAlignment.Center:
                    this.Component.AppendCssClass("justify-content-center");
                    break;
                case TabHorizontalAlignment.Right:
                    this.Component.AppendCssClass("justify-content-end");
                    break; 
            }
            return this;
        }

        public TabBuilder VerticalNav()
        {
            this.Component.AppendCssClass("flex-column");
            return this;
        }

        public TabBuilder PillsNav()
        {
            this.Component.PillsNav = true;
            return this;
        }

        public TabBuilder FillNav()
        {
            this.Component.AppendCssClass("nav-fill");
            return this;
        }

        public TabBuilder BorderedNav()
        {
            this.Component.AppendCssClass("nav-bordered");
            return this;
        } 
    }
}