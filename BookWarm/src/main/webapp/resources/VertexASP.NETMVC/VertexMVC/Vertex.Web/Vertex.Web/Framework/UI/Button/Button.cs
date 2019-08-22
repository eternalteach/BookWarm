using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class Button : ViewComponentBase
    {
        public Button()
        {
            this.BSColor = BootstrapColor.Primary;
            this.ButtonTag = ButtonTag.Link;
            this.Size = ButtonSize.Default;
            this.Corner = ButtonCorner.Default;
            this.IconPosition = ButtonIconPosition.Left;
            this.ActionLink = "#";
        }

        public string Text { get; set; }
        public string ActionLink { get; set; }
        public bool IsActive { get; set; }
        public bool Disabled { get; set; }
        public ButtonTag ButtonTag { get; set; }
        public ButtonCorner Corner { get; set; }
        public ButtonSize Size { get; set; }
        public ButtonIconPosition IconPosition { get; set; }
        public bool Sleek { get; set; }
        public bool Outline { get; set; }
        public bool Block { get; set; }
        public bool TransitionHover { get; set; }
        public BootstrapColor BSColor { get; set; }
        public string Icon { get; internal set; } 

        public override void GenerateHtmlAtributes()
        {
            if (this.TransitionHover)
                this.AppendCssClass("transition-hover");

            if (Outline)
            {
                this.AppendCssClass(string.Format("btn-outline-{0}", this.BSColor.ToCssClass()));
                this.Sleek = false;
            }

            if (this.Sleek)
                this.AppendCssClass(string.Format("btn-sleek-{0}", this.BSColor.ToCssClass()));
            else
                this.AppendCssClass(string.Format("btn-{0}", this.BSColor.ToCssClass()));

            if (this.Disabled)
                this.AppendHtmlAtribute("disabled", string.Empty);

            if (this.Block)
                this.AppendCssClass("btn-block");

            if (this.IsActive)
            {
                this.AppendCssClass("active");
                this.AppendHtmlAtribute("aria-pressed", "true");
            }

            switch (this.Size)
            {
                case ButtonSize.Small:
                    this.AppendCssClass("btn-sm");
                    break;

                case ButtonSize.Large:
                    this.AppendCssClass("btn-lg");
                    break;
            }

            switch (this.Corner)
            {
                case ButtonCorner.Rounded0:
                    this.AppendCssClass("rounded-0");
                    break;

                case ButtonCorner.Pill:
                    this.AppendCssClass("btn-pill");
                    break;

                case ButtonCorner.RoundedCircle:
                    this.AppendCssClass("rounded-circle");
                    break;
            }

            switch (this.ButtonTag)
            {
                case ButtonTag.Link:
                    this.AppendHtmlAtribute("role", "button");
                    break;

                case ButtonTag.Button:
                    this.AppendHtmlAtribute("type", "button");
                    break;

                case ButtonTag.Input:
                    this.AppendHtmlAtribute("type", "button");
                    break;

                case ButtonTag.Submit:
                    this.AppendHtmlAtribute("type", "submit");
                    break;

                case ButtonTag.Reset:
                    this.AppendHtmlAtribute("type", "reset");
                    break;
            }
        }
    }

    public enum ButtonTag
    {
        Button,
        Link,
        Input,
        Submit,
        Reset
    }

    public enum ButtonCorner
    {
        Rounded0,
        Default,
        Pill,
        RoundedCircle
    }

    public enum ButtonSize
    {
        Small,
        Default,
        Large
    }

    public enum ButtonIconPosition
    {
        Left,
        Right
    }
}