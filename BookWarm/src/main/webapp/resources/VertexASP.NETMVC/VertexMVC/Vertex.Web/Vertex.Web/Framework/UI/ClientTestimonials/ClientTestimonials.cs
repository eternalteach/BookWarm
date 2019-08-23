using System.Collections.Generic;

namespace Vertex.Web.Framework.UI
{
    public class ClientTestimonials : ViewComponentBase
    {
        public ClientTestimonials()
        {
            this.ShowDescription = true;
            this.Items = new List<ClientTestimonialsItem>(); 
        }

        public bool ShowDescription { get; set; }
        public bool ShowCompanyLogo { get; set; }
        public bool ShowEmployePicture { get; set; }
        public bool ShowEmployeName { get; set; }
        public bool ShowStar { get; set; }

        public List<ClientTestimonialsItem> Items { get; set; }
        public SliderBuilder Slider { get; set; } 

        public override void GenerateHtmlAtributes()
        {
        }
    }

    public class ClientTestimonialsItem
    {
        public string ClientName { get; set; }
        public string ClientLogoUrl { get; set; }
        public string WebsiteUrl { get; set; }

        public string PersonName { get; set; }
        public string PersonPosition { get; set; }
        public string PersonPictureUrl { get; set; }
        public string WhatSayAboutUs { get; set; }

        public short? Star { get; set; } 
    } 
}