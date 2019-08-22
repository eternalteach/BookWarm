using System;
using System.ComponentModel.DataAnnotations;

namespace Vertex.Web.Areas.Manage.Models
{
    public class ContactManageModel
    {
        public int Id { get; set; }

        [Display(Name = "Name")]
        [Required]
        public string FullName { get; set; }

        [Required]
        [MaxLength(128)]
        public string Email { get; set; }

        [Required]
        public string Subject { get; set; }

        [Required]
        public string Message { get; set; }

        public DateTime Date { get; set; }
        public bool IsRead { get; set; }
    }
}