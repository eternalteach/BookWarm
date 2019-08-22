using System;
using System.ComponentModel.DataAnnotations;
using Vertex.Web.Framework.UI;

namespace Vertex.Web.Models
{
    public class ContactModel : ViewComponentBase
    {
        [Required]
        [MaxLength(128)]
        public string Name { get; set; }

        [Required]
        [MaxLength(128)]
        public string Email { get; set; }

        [Required]
        public string Subject { get; set; }

        [Required]
        public string Message { get; set; }

        public DateTime Date { get; set; }

        public string UserMessage { get; set; }

        public override void GenerateHtmlAtributes()
        {
        }
    }
}