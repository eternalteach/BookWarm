using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Runtime.Serialization;

namespace Vertex.Core.Entities
{
    [DataContract]
    public class JobCategory : BaseEntity
    {
        [MaxLength(128)]
        [DataMember]
        [Required]
        [Column(Order = 1)]
        public string Name { get; set; }

        [DataMember]
        [Column(Order = 2)]
        public bool IsActive { get; set; }

        [DataMember]
        [Column(Order = 3)]
        public bool IsDelete { get; set; }

        [NotMapped]
        public virtual ICollection<Portfolio> Portfolios { get; set; }
    }
}