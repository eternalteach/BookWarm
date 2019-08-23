using System;
using System.ComponentModel.DataAnnotations;

namespace Vertex.Web.Areas.Manage.Models
{
    public class SubscriberModel
    {
        public int Id { get; set; }

        [Display(Name = "Full Name")]
        public string FullName { get; set; }

        [Required]
        public string Email { get; set; }
        public bool IsActive { get; set; }

        [Required]
        [Display(Name = "Subscribe Date")]
        public DateTime SubscribeDate { get; set; }

        [Display(Name = "Unsubscribe Date")]
        public DateTime? UnsubscribeDate { get; set; }
    }
}