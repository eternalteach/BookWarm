using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class ShareButtons : ViewComponentBase
    {
        public ShareButtons()
        {
            this.Color = BootstrapColor.Primary;
            this.Dismissible = true;
        }

        public string Text { get; set; }
        public bool Dismissible { get; set; }
        public BootstrapColor Color { get; set; }

        public override void GenerateHtmlAtributes()
        {
            this.AppendCssClass("ShareButtons");
            this.AppendCssClass(string.Format("ShareButtons-{0}", this.Color.ToCssClass()));

            if (this.Dismissible)
                this.AppendCssClass("ShareButtons-dismissible fade show");
        }
    }

    public enum ShareButtonsSize
    {
        Small,
        Default,
        Large
    }
}