namespace Vertex.Web.Framework.UI
{
    public class Overlay
    {
        public Overlay()
        {
            this.Color = OverlayColor.Dark;
            this.Position = OverlayPosition.On;
        }

        public Overlay(OverlayColor color, OverlayPosition position, short opacity)
        {
            this.Color = color;
            this.Position = position;
            this.Opacity = opacity;
        }

        /// <summary>
        /// Value must be between 0 to 9
        /// </summary>
        public short Opacity{ get; set; }

        public OverlayColor Color { get; set; }
        public OverlayPosition Position { get; set; }

        #region GetHtmlAtributes

        public HtmlAtributeContainer GetHtmlAtributes()
        {
            HtmlAtributeContainer element = new HtmlAtributeContainer();
        
            string returnValue = string.Empty;
            string color = string.Empty;

            switch (this.Color)
            {
                case OverlayColor.Light:
                    color = "-" + OverlayColor.Light.ToString().ToLower(); // -light
                    break;
                case OverlayColor.Dark:
                    color = string.Empty;
                    break;
                default:
                    break;
            }

            switch (this.Position)
            {
                case OverlayPosition.On:
                    element.AppendHtmlAtribute("data-overlay" + color, this.Opacity.ToString());
                    break;
                case OverlayPosition.Top:
                    element.AppendHtmlAtribute("data-scrim-top" + color, this.Opacity.ToString());
                    break;
                case OverlayPosition.Bottom:
                    element.AppendHtmlAtribute("data-scrim-bottom" + color, this.Opacity.ToString());
                    break;
                default:
                    break;
            }
        
            return element;
        }

        #endregion GetHtmlAtributes
    }

    public enum OverlayPosition
    {
        On,
        Top,
        Bottom
    }

    public enum OverlayColor
    {
        Light,
        Dark
    }
}