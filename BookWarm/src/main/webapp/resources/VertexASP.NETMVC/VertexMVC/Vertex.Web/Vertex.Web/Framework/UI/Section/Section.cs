using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class Section : ViewComponentBase
    {
        public Section()
        {
            this.SectionType = SectionType.Colored;
            this.Size = SectionSize.Default;
        }

        public string Content { get; set; }

        /// <summary>
        /// Source of background. it can be image, video etc.
        /// </summary>
        public string Src { get; set; }

        /// <summary>
        /// If null = white
        /// </summary>
        public BootstrapColor? BgColor { get; set; }

        public SectionType SectionType { get; set; }
        public SectionSize Size { get; set; }
        public Overlay Overlay { get; set; }
        public bool VerticalCenter { get; set; }

        public override void GenerateHtmlAtributes()
        {
            if (this.Overlay != null)
                this.Append(this.Overlay.GetHtmlAtributes());

            switch (this.Size)
            {
                case SectionSize.Smalest:
                    this.AppendCssClass("m-gab-1");
                    break;

                case SectionSize.Small:
                    this.AppendCssClass("m-gab-2");
                    break;

                case SectionSize.Default:
                    if (!this.VerticalCenter)
                        this.AppendCssClass("section");
                    break;

                case SectionSize.Large:
                    this.AppendCssClass("m-gab-4");
                    break;

                case SectionSize.Largest:
                    this.AppendCssClass("m-gab-5");
                    break;
            }

            switch (this.SectionType)
            {
                case SectionType.Colored:
                    if (this.BgColor.HasValue)
                        this.AppendCssClass("bg-" + this.BgColor.Value.ToCssClass());
                    break;

                case SectionType.BackgroundImage:
                    this.AppendStyle("background-image", string.Format("url({0});", this.Src));
                    break;

                case SectionType.FixedBackgroundImage:
                    this.AppendCssClass("bg-fixed");
                    this.AppendStyle("background-image", string.Format("url({0});", this.Src));
                    break;

                case SectionType.GradientOverlay:
                    break;

                case SectionType.GradientBackground:
                    break;

                case SectionType.ParallaxImage:
                    this.AppendHtmlAtribute("data-parallax", this.Src);
                    break;

                case SectionType.ParallaxVideo:
                    this.AppendHtmlAtribute("data-video", this.Src);
                    break;
            }
        }
    }

    public enum SectionType
    {
        Colored,
        BackgroundImage,
        FixedBackgroundImage,
        GradientOverlay,
        GradientBackground,
        ParallaxImage,
        ParallaxVideo
    }

    /// <summary>
    /// Section padding
    /// </summary>
    public enum SectionSize
    {
        None,
        Smalest,
        Small,
        Default,
        Large,
        Largest
    }
}