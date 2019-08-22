using System.Collections.Generic;

namespace Vertex.Web.Framework.UI
{
    public class Tab : ViewComponentBase
    { 
        public Tab()
        {
            this.Items = new List<TabItem>();
        }

        public List<TabItem> Items { get; set; }
        public bool PillsNav { get; set; }

        public override void GenerateHtmlAtributes()
        {
            if (this.PillsNav)
                this.AppendCssClass("nav-pills");
            //else
            //    this.AppendCssClass("nav-tabs");
        }
    }

    public class TabItem : ViewComponentBase
    {
        public string Title { get; set; }
        public string Content { get; set; }
        public bool Active { get; set; }
        public bool Disabled { get; set; }

        public override void GenerateHtmlAtributes()
        {
        }
    }

    public enum TabHorizontalAlignment
    {
        Left,
        Center,
        Right
    }
}