using System.Web.Mvc;

namespace Vertex.Web.Framework.UI
{
    public class SliderBuilder : ViewComponentBuilderBase<Slider, SliderBuilder>
    {
        public SliderBuilder(HtmlHelper htmlHelper, Slider model)
            : base(htmlHelper, model) { }

        public SliderItemBuilder Add()
        {
            var sliderItemBuilder = new SliderItemBuilder(this.HtmlHelper, new SliderItem());
            this.Component.Items.Add(sliderItemBuilder.Component);
            return sliderItemBuilder;
        }

        public SliderBuilder Arrows()
        {
            this.Component.Arrows = true;
            return this;
        }

        public SliderBuilder Arrows(SliderArrowsType arrowsType)
        {
            this.Component.Arrows = true;
            this.Component.ArrowsType = arrowsType;
            return this;
        }

        public SliderBuilder Dots()
        {
            this.Component.Dots = true;
            return this;
        }

        public SliderBuilder Dots(bool dotsInside)
        {
            this.Component.Dots = true;
            this.Component.DotsInside = dotsInside;
            return this;
        }

        public SliderBuilder Dots(SliderDotsType dotsType)
        {
            this.Component.Dots = true;
            this.Component.DotsType = dotsType;
            return this;
        }

        public SliderBuilder Dots(bool dotsInside, SliderDotsType dotsType)
        {
            this.Component.Dots = true;
            this.Component.DotsInside = dotsInside;
            this.Component.DotsType = dotsType;
            return this;
        }

        public SliderBuilder Fade()
        {
            this.Component.Fade = true;
            return this;
        }

        public SliderBuilder Autoplay()
        {
            this.Component.Autoplay = true;
            return this;
        }

        public SliderBuilder Autoplay(int autoplaySpeed)
        {
            this.Component.Autoplay = true;
            this.Component.AutoplaySpeed = autoplaySpeed;
            return this;
        }

        public SliderBuilder TransitionSpeed(int value)
        {
            this.Component.TransitionSpeed = value;
            return this;
        }

        public SliderBuilder SlidesToShow(int value)
        {
            this.Component.SlidesToShow = value;
            return this;
        }

        public SliderBuilder SlidesToScroll(int value)
        {
            this.Component.SlidesToScroll = value;
            return this;
        }
    }
}