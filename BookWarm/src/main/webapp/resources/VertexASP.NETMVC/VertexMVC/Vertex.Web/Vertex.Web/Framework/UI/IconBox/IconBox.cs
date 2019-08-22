using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class IconBox : ViewComponentBase
    {
        public IconBox()
        {
            this.IconColor = BootstrapColor.Primary;
            this.IconPosition = IconBoxIconPosition.Top;
        }

        public string Title { get; set; }
        public string SubTitle { get; set; }
        public string Content { get; set; }
        public string Icon { get; set; }
        public string ActionLink { get; set; }

        public bool ShapeIcon { get; set; }
        public bool Bordered { get; set; }

        public IconBoxIconPosition IconPosition { get; set; }

        public BootstrapColor IconColor { get; set; }
        public BootstrapColor? BgColor { get; set; }
        public BootstrapColor? TitleColor { get; set; }
        public BootstrapColor? ContentColor { get; set; }
        public OvalDividerType? OvalDividerType { get; set; }

        #region ActionLink

        public string LinkText { get; internal set; }
        public string ActionName { get; internal set; }
        public string ControllerName { get; internal set; }

        #endregion

        public override void GenerateHtmlAtributes()
        { 
            if(this.Bordered)
                this.AppendCssClass("border rounded px-6 py-7");

            if (this.BgColor.HasValue)
                this.AppendCssClass(string.Format("bg-{0}", this.BgColor.Value.ToCssClass()));

            if (this.OvalDividerType.HasValue)
                this.AppendCssClass("pb-11");
        }
    }

    public enum IconBoxIconPosition
    {
        Top, 
        Left,
        Right
    }

    public enum IconBoxAlign
    {
        Left,
        Center,
        Right
    }
}