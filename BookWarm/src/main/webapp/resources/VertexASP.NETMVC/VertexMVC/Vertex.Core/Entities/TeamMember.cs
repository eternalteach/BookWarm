using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Runtime.Serialization;

namespace Vertex.Core.Entities
{
    [DataContract]
    public partial class TeamMember : BaseEntity
    {
        [DataMember]
        [Required]
        [MaxLength(128)]
        public string FullName { get; set; }

        [DataMember]
        [MaxLength(128)]
        public string Position { get; set; }

        [DataMember]
        public string Description { get; set; }

        [DataMember]
        public bool IsActive { get; set; }

        [DataMember]
        public int OrderNo { get; set; }

        [DataMember]
        [Required]
        public DateTime CreateDateUtc { get; set; }

        [DataMember]
        public DateTime? UpdateDateUtc { get; set; }

        [DataMember]
        public int PictureId { get; set; }

        [NotMapped]
        public virtual MediaStorage Picture { get; set; }

        [NotMapped]
        public virtual ICollection<SocialNetwork> SocialNetworks { get; set; } 
    }
}