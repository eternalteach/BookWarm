using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class Alert : ViewComponentBase
    {
        public Alert()
        {
            this.Color = BootstrapColor.Primary;
            this.Dismissible = true;
        }

        public string Text { get; set; }
        public bool Dismissible { get; set; }
        public BootstrapColor Color { get; set; }

        public override void GenerateHtmlAtributes()
        {
            this.AppendCssClass("alert");
            this.AppendCssClass(string.Format("alert-{0}", this.Color.ToCssClass()));

            if (this.Dismissible)
                this.AppendCssClass("alert-dismissible fade show");
        }
    }

    public enum AlertSize
    {
        Small,
        Default,
        Large
    }
}