using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Vertex.Web.Areas.Manage.Models
{
    public class ApplicationUserModel
    {
        public string Id { get; set; }

        [Display(Name = "User Name")]
        public string UserName { get; set; }

        public string Email { get; set; }

        [Display(Name = "Email Confirmed")]
        public bool EmailConfirmed { get; set; }

        [Display(Name = "Active")]
        public bool IsActive { get; set; }

        public int? AvatarId { get; set; }

        [Display(Name = "Avatar")]
        public string AvatarUrl { get; set; }

        [Display(Name = "About")]
        public string Description { get; set; }

        [Display(Name = "Name")]
        [MaxLength(128)]
        public string Name { get; set; }

        [Display(Name = "Surname")]
        [MaxLength(128)]
        public string Surname { get; set; }

        [Display(Name = "Location")]
        [MaxLength(128)]
        public string Location { get; set; }

        public string[] SelectedRoleNames { get; set; }
        public List<ApplicationRoleModel> Roles { get; set; }
        public List<SocialNetworkModel> SocialNetworks { get; set; }
        public List<PostModel> Posts { get; set; }

        public bool IsAdmin { get; set; }
        public bool IsOwnAccount { get; internal set; }
    }

    public class ApplicationRoleModel
    {
        public string Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Display(Name = "User Count")]
        public int UserCount { get; set; }
    }
}