using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Runtime.Serialization;

namespace Vertex.Core.Entities
{
    [DataContract]
    public class Comment : BaseEntity
    {
        [MaxLength(128)]
        [DataMember]
        public string FullName { get; set; }

        [MaxLength(128)]
        [DataMember]
        public string Email { get; set; }

        [MaxLength(512)]
        [DataMember]
        public string Commentary { get; set; }

        [DataMember]
        public DateTime CommentDateUtc { get; set; }

        [DataMember]
        public int? ParentId { get; set; }

        [DataMember]
        public bool Approved { get; set; }

        [DataMember]
        public int PostId { get; set; }

        [MaxLength(128)]
        [DataMember]
        public string UserId { get; set; }

        [DataMember]
        public bool IsRead { get; set; }

        [NotMapped]
        public virtual Post Post { get; set; }

        [NotMapped]
        public virtual ApplicationUser User { get; set; }
    }
}