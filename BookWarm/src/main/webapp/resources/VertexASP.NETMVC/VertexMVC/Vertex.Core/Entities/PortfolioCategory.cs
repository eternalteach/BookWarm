using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Runtime.Serialization;

namespace Vertex.Core.Entities
{
    [DataContract]
    public class PortfolioCategory : BaseEntity
    {
        [MaxLength(128)]
        [DataMember]
        public string Name { get; set; }

        [DataMember]
        public bool IsActive { get; set; }

        [DataMember]
        public bool IsDelete { get; set; }

        [NotMapped]
        public virtual ICollection<Portfolio> Portfolios { get; set; }

        [NotMapped]
        public virtual string Url { get; set; }
    }
}