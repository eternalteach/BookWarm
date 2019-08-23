using System;
using System.Linq;
using System.Web.Mvc;
using Vertex.Core.Infrastructure;
using Vertex.Service;

namespace Vertex.Web.Framework.UI
{
    public class TestimonialsBuilder : ViewComponentBuilderBase<ClientTestimonials, TestimonialsBuilder>
    {
        #region Fields

        private readonly IClietTestimonialsService testimonialsService;
        private readonly IMediaStorageService mediaStorageService;
        private int? _displayCount;

        #endregion Fields

        #region Ctor

        public TestimonialsBuilder(HtmlHelper htmlHelper, ClientTestimonials model)
            : base(htmlHelper, model)
        {
            testimonialsService = Engine.Resolve<IClietTestimonialsService>();
            mediaStorageService = Engine.Resolve<IMediaStorageService>();
        }

        #endregion Ctor

        public override string ToHtmlString()
        {
            var testimonials = testimonialsService.GetActiveTestimonials();

            if (this._displayCount.HasValue && _displayCount.Value > 0)
                testimonials = testimonials.Take(this._displayCount.Value);

            foreach (var item in testimonials)
            {
                this.Component.Items.Add(new ClientTestimonialsItem()
                {
                    ClientLogoUrl = mediaStorageService.GetPictureUrl(item.ClientLogoId),
                    PersonPictureUrl = mediaStorageService.GetPictureUrl(item.PersonPictureId),
                    ClientName = item.ClientName,
                    WhatSayAboutUs = item.WhatSayAboutUs,
                    PersonName = item.PersonName,
                    PersonPosition = item.PersonPosition,
                    WebsiteUrl = item.Website,
                    Star = item.Star
                });
            }

            return base.ToHtmlString();
        }

        public TestimonialsBuilder ToSlider(Action<SliderBuilder> action)
        {
            var sliderBuilder = new SliderBuilder(this.HtmlHelper, new Slider());
            action.Invoke(sliderBuilder);
            this.Component.Slider = sliderBuilder;
            return this;
        }

        public TestimonialsBuilder DisplayCount(int count)
        {
            this._displayCount = count;
            return this;
        }
    }
}