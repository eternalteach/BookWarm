using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using Vertex.Core.Entities;

namespace Vertex.Web.Areas.Manage.Models
{
    public class TestimonialsModel
    {
        [Display(Name = "Type")]
        public string TypeName { get; set; }
        public List<string> AvailableTypeNames
        {
            get
            {
                return Enum.GetNames(typeof(ClientTestimonialsType)).ToList();
            }
        }

        public int Id { get; set; }

        [Display(Name = "Client Name")]
        public string ClientName { get; set; }

        public int ClientLogoId { get; set; }

        [Display(Name = "What Say About Us")]
        public string WhatSayAboutUs { get; set; }

        public string Website { get; set; }

        [Display(Name = "Person Name")]
        public string PersonName { get; set; }

        [Display(Name = "Position")]
        public string PersonPosition { get; set; }

        public int PersonPictureId { get; set; }

        public short? Star { get; set; }

        [Display(Name = "Active")]
        public bool IsActive { get; set; }

        [Display(Name = "Order No")]
        public int OrderNo { get; set; }
    }
}