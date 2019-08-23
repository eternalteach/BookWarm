using System.Collections.Generic;

namespace Vertex.Web.Framework.UI
{
    public class Slider : ViewComponentBase
    {
        public Slider()
        {
            this.Items = new List<SliderItem>();
        }

        public List<SliderItem> Items { get; set; }

        public bool Autoplay { get; set; }
        public int AutoplaySpeed { get; set; }
        public int TransitionSpeed { get; set; }

        public bool Arrows { get; set; }
        public bool Dots { get; set; }
        public bool DotsInside { get; set; }
        public bool Fade { get; set; }

        public bool CenterMode { get; set; }

        /// <summary>
        /// Display count
        /// </summary>
        public int? SlidesToShow { get; set; }
        public int? SlidesToScroll { get; set; }

        /// <summary>
        /// if Arrows is true
        /// </summary>
        public SliderArrowsType? ArrowsType { get; set; }

        /// <summary>
        /// if Dots is true
        /// </summary>
        public SliderDotsType? DotsType { get; set; }

        public override void GenerateHtmlAtributes()
        {
            this.AppendHtmlAtribute("data-provide", "slider");

            if (this.Autoplay)
                this.AppendHtmlAtribute("data-autoplay", "true");

            if (this.AutoplaySpeed > 0)
                this.AppendHtmlAtribute("data-autoplay-speed", this.AutoplaySpeed.ToString());

            if (this.TransitionSpeed > 0)
                this.AppendHtmlAtribute("data-speed", this.TransitionSpeed.ToString());

            if (this.Arrows)
            {
                this.AppendHtmlAtribute("data-arrows", "true");
                if (this.ArrowsType.HasValue)
                {
                    switch (this.ArrowsType.Value)
                    {
                        case SliderArrowsType.CircleLight:
                            this.AppendCssClass("slider-arrows-circle-light");
                            break;

                        case SliderArrowsType.CircleDark:
                            this.AppendCssClass("slider-arrows-circle-dark");
                            break;

                        case SliderArrowsType.FlashLight:
                            this.AppendCssClass("slider-arrows-flash-light");
                            break;

                        case SliderArrowsType.FlashDark:
                            this.AppendCssClass("slider-arrows-flash-dark");
                            break;
                    }
                }
            }

            if (this.Dots)
            {
                this.AppendHtmlAtribute("data-dots", "true");

                if (this.DotsType.HasValue)
                {
                    switch (this.DotsType.Value)
                    {
                        case SliderDotsType.Fill:
                            this.AppendCssClass("slider-dots-fill");
                            break;

                        case SliderDotsType.FillPrimary:
                            this.AppendCssClass("slider-dots-fill-primary");
                            break;

                        case SliderDotsType.Line:
                            this.AppendCssClass("slider-dots-line");
                            break;

                        case SliderDotsType.LineWhite:
                            this.AppendCssClass("slider-dots-line slider-dots-white");
                            break;
                    }
                }

                if (this.DotsInside)
                    this.AppendCssClass("slider-dots-inside");
            }

            if (this.SlidesToShow.HasValue && this.SlidesToShow.Value > 0)
            {
                this.AppendHtmlAtribute("data-slides-to-show", this.SlidesToShow.Value.ToString());

                if (this.SlidesToScroll.HasValue && this.SlidesToScroll.Value > 0)
                    this.AppendHtmlAtribute("data-slides-to-scroll", this.SlidesToScroll.Value.ToString());
                else
                    this.AppendHtmlAtribute("data-slides-to-scroll", this.SlidesToShow.Value.ToString());

                if (this.CenterMode)
                    this.AppendCssClass("slider-center-focused");
            }

            if (this.Fade)
                this.AppendHtmlAtribute("data-fade", "true");
        }
    }

    public class SliderItem : ViewComponentBase
    {
        public string Src { get; set; }
        public string Content { get; set; }

        public override void GenerateHtmlAtributes()
        {
        }
    }

    public enum SliderArrowsType
    {
        CircleLight,
        CircleDark,
        FlashLight,
        FlashDark
    }

    public enum SliderDotsType
    {
        Fill,
        FillPrimary,
        Line,
        LineWhite
    }
}