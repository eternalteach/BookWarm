using System;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace Vertex.Core.Entities
{
    [DataContract]
    public class Contact : BaseEntity
    {
        [MaxLength(128)]
        [DataMember]
        [Required]
        public string FullName { get; set; }

        [MaxLength(128)]
        [DataMember]
        [Required]
        public string Email { get; set; }

        [MaxLength(256)]
        [DataMember]
        [Required]
        public string Subject { get; set; }

        [MaxLength(512)]
        [DataMember]
        [Required]
        public string Message { get; set; }

        [MaxLength(16)]
        [DataMember]
        public string Phone { get; set; }

        [DataMember]
        public DateTime DateUtc { get; set; }

        [DataMember]
        public bool IsDeleted { get; set; }

        [DataMember]
        public bool IsRead { get; set; }
    }
}