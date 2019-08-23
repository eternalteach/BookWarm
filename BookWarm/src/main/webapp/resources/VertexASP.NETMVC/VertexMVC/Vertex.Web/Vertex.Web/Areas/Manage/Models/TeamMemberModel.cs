using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Vertex.Web.Areas.Manage.Models
{
    public class TeamMemberModel
    {
        public TeamMemberModel()
        {
            this.SocialIcons = new List<SocialNetworkModel>();
        }

        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public string Position { get; set; }

        public int PictureId { get; set; }

        [Display(Name = "Picture")]
        public string PictureUrl { get; set; }

        public string Description { get; set; }

        [Display(Name = "Active")]
        public bool IsActive { get; set; }

        [Display(Name = "Display Order")]
        public int OrderNo { get; set; }

        public DateTime CreateDateUtc { get; set; }

        public List<SocialNetworkModel> SocialIcons { get; set; }
    }

    public class SocialNetworkModel
    {
        public string EntityId { get; set; }
        public int Id { get; set; }

        [Required]
        [UIHint("AvailableSocialNetwork")]
        public string Name { get; set; }

        [Required]
        public string WebAddress { get; set; }

        [Display(Name = "Display Order")]
        [Required]
        public int OrderNo { get; set; }

        public bool IsActive { get; set; }
    }
}