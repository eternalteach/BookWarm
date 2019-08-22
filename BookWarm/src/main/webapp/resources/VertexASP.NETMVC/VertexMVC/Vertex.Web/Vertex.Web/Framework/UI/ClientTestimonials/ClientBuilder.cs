using System;
using System.Collections.Generic;
using System.Web.Mvc;
using Vertex.Core.Infrastructure;
using Vertex.Service;
using System.Linq;

namespace Vertex.Web.Framework.UI
{
    public class ClientBuilder : ViewComponentBuilderBase<ClientTestimonials, ClientBuilder>
    {
        #region Fields

        private readonly IClietTestimonialsService clientService;
        private readonly IMediaStorageService mediaStorageService;
        private int? _displayCount;

        #endregion Fields

        #region Ctor

        public ClientBuilder(HtmlHelper htmlHelper, ClientTestimonials model)
            : base(htmlHelper, model)
        {
            clientService = Engine.Resolve<IClietTestimonialsService>();
            mediaStorageService = Engine.Resolve<IMediaStorageService>();
        }

        #endregion Ctor

        public override string ToHtmlString()
        {
            var clients = clientService.GetActiveClients();

            if (this._displayCount.HasValue && _displayCount.Value > 0)
                clients = clients.Take(this._displayCount.Value);

            foreach (var item in clients)
            {
                this.Component.Items.Add(
                    new ClientTestimonialsItem()
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

        public ClientBuilder ToSlider(Action<SliderBuilder> action)
        {
            var sliderBuilder = new SliderBuilder(this.HtmlHelper, new Slider());
            action.Invoke(sliderBuilder);
            this.Component.Slider = sliderBuilder;
            return this;
        }

        public ClientBuilder DisplayCount(int count)
        {
            this._displayCount = count;
            return this;
        }

        public ClientBuilder ShowStar(bool show)
        {
            this.Component.ShowStar = show;
            return this;
        }
    }
}