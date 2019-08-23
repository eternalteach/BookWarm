using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Runtime.Serialization;

namespace Vertex.Core.Entities
{
    [DataContract]
    public class Category : BaseEntity
    {
        [MaxLength(128)]
        [DataMember]
        public string Name { get; set; }

        [DataMember]
        public bool IsDelete { get; set; }

        [DataMember]
        public bool IsActive { get; set; }

        [NotMapped]
        public virtual ICollection<Post> Posts { get; set; }

        [NotMapped]
        public virtual string Url { get; set; }
    }
}
