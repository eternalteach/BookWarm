using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Security.Claims;
using System.Threading.Tasks;

namespace Vertex.Core.Entities
{
    public class ApplicationUser : IdentityUser
    {
        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser> manager)
        {
            var userIdentity = await manager.CreateIdentityAsync(this, DefaultAuthenticationTypes.ApplicationCookie);
            return userIdentity;
        }

        public string Description { get; set; }

        /// <summary>
        /// MediaStorageId
        /// </summary> 
        public int? PictureId { get; set; }

        public bool IsActive { get; set; }

        [MaxLength(128)]
        public string Name { get; set; }

        [MaxLength(128)]
        public string Surname { get; set; }

        [MaxLength(128)]
        public string Location { get; set; }

        [NotMapped]
        public virtual MediaStorage Avatar { get; set; }

        [NotMapped]
        public virtual ICollection<SocialNetwork> SocialNetworks { get; set; }
    }
}