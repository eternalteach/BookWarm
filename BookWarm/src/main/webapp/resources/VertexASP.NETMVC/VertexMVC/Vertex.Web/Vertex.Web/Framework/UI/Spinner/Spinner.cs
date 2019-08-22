using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class Spinner : ViewComponentBase
    {
        public Spinner()
        { 
            this.BSColor = BootstrapColor.Dark;
            this.Size = SpinnerSize.Default;
        }

        public string Text { get; set; }
        public bool Growing { get; set; }
        public SpinnerSize Size { get; set; }
        public BootstrapColor BSColor { get; set; }

        public override void GenerateHtmlAtributes()
        {
            if (this.Growing)
                this.AppendCssClass("spinner-grow");
            else
                this.AppendCssClass("spinner-border"); 

            switch (this.Size)
            {
                case SpinnerSize.Small:
                    if (this.Growing)
                        this.AppendCssClass("spinner-grow-sm");
                    else
                        this.AppendCssClass("spinner-border-sm");
                    break;

                case SpinnerSize.Large:
                    if (this.Growing)
                        this.AppendCssClass("spinner-grow-lg");
                    else
                        this.AppendCssClass("spinner-border-lg");
                    break;

                default:
                    break;
            }

            this.AppendCssClass(string.Format("text-{0}", this.BSColor.ToCssClass()));
            this.AppendHtmlAtribute("aria-hidden", "true");
            this.AppendHtmlAtribute("role", "status");
        }
    }

    public enum SpinnerSize
    {
        Small,
        Default,
        Large
    }
}