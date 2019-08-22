using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace Vertex.Core.Entities
{
    [DataContract]
    public class PostTag : BaseEntity
    {
        [DataMember]
        [Required]
        [MaxLength(128)]
        public string Name { get; set; }
    }
}