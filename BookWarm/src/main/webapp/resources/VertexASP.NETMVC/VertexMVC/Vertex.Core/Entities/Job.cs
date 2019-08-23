using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Runtime.Serialization;

namespace Vertex.Core.Entities
{
    [DataContract]
    public class Job : BaseEntity
    {
        [MaxLength(512)]
        [DataMember]
        [Required]
        public string Title { get; set; }

        [DataMember]
        [Required]
        public string Description { get; set; }

        [DataMember]
        [Required]
        public int CategoryId { get; set; }

        [MaxLength(128)]
        [DataMember]
        [Required]
        public string Location { get; set; }

        [MaxLength(128)]
        [DataMember]
        [Required]
        public string JobType { get; set; }

        [DataMember]
        public decimal? SallaryMin { get; set; }

        [DataMember]
        public decimal? SallaryMax { get; set; }

        [DataMember]
        public int ViewCount { get; set; }

        [DataMember]
        public bool IsActive { get; set; }

        [DataMember]
        public bool IsDelete { get; set; }

        [DataMember]
        [Required]
        public DateTime CreateDateUtc { get; set; }

        [DataMember]
        public DateTime? UpdateDateUtc { get; set; }

        [NotMapped]
        public virtual JobCategory Category { get; set; }

        [NotMapped]
        public virtual string Url { get; set; }

        [NotMapped]
        public virtual ICollection<ApplyJob> ApplyJobs { get; set; }
    }
}