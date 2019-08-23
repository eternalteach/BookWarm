using System;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace Vertex.Core.Entities
{
    [DataContract]
    public class Subscriber: BaseEntity
    {
        [DataMember]
        public string FullName { get; set; }

        [DataMember]
        [Required]
        public string Email { get; set; }

        [DataMember]
        [Required]
        public DateTime SubscribeDateUtc { get; set; }

        [DataMember]
        public DateTime? UnSubscribeDateUtc { get; set; }

        [DataMember]
        public bool IsActive { get; set; }
    }
}
