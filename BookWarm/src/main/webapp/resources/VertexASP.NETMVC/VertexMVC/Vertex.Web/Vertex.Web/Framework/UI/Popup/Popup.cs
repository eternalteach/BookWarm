using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class Popup : ViewComponentBase
    {
        public Popup()
        {
            this.BgColor = BootstrapColor.Primary; 
        }
        
        public string Title { get; set; }
        public string Message { get; set; }

        public bool AutoShow { get; set; }

        public BootstrapColor BgColor { get; set; }
        public string HtmlString { get; internal set; }

        public override void GenerateHtmlAtributes()
        {
            this.AppendCssClass(string.Format("bg-{0}", BgColor.ToCssClass()));
            if (this.AutoShow)
            {
                this.AppendHtmlAtribute("data-autoshow", 400.ToString());
                this.AppendHtmlAtribute("data-autohide", 5000.ToString());
                this.AppendHtmlAtribute("data-animation", "slide-up");
            }
        }
    }

    public enum PopupPosition
    {
        TopLeft,
        TopCenter,
        TopRight,
        BottomLeft,
        BottomCenter,
        BottomRight
    }

    public enum PopupSlide
    {
        Up,
        Down,
        Left,
        Right
    }
}