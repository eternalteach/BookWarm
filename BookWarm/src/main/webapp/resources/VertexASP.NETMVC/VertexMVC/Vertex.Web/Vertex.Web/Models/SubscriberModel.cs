using System;
using System.ComponentModel.DataAnnotations;
using Vertex.Web.Framework.UI;

namespace Vertex.Web.Models
{
    public class SubscriberModel: ViewComponentBase
    {
        public string FullName { get; set; }

        [Required]
        public string Email { get; set; }
        public bool IsActive { get; set; }
        public DateTime SubscribeDate { get; set; } 
        public DateTime? UnsubscribeDate { get; set; }

        public override void GenerateHtmlAtributes()
        { 
        }
    }
}