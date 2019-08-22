using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Runtime.Serialization;

namespace Vertex.Core.Entities
{
    [DataContract]
    [Table(name: "ApplyJob")]
    public class ApplyJob : BaseEntity
    {
        [DataMember]
        public int JobId { get; set; }

        [MaxLength(128)]
        [DataMember]
        public string FullName { get; set; }

        [MaxLength(128)]
        [DataMember]
        public string Email { get; set; }

        [MaxLength(64)]
        [DataMember]
        public string Phone { get; set; }

        [DataMember]
        public string Message { get; set; }

        [MaxLength(500)]
        [DataMember]
        public string Address { get; set; }

        /// <summary>
        /// Website, Blog, or Portfolio
        /// </summary>
        [MaxLength(500)]
        [DataMember]
        public string Website { get; set; }

        [MaxLength(500)]
        [DataMember]
        public string LinkedInProfileURL { get; set; }

        [DataMember]
        public DateTime ApplyDateUtc { get; set; }

        [DataMember]
        public bool IsActive { get; set; }

        [DataMember]
        public bool IsRead { get; set; }

        [NotMapped]
        public virtual Job Job { get; set; }
    }
}