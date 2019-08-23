using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Runtime.Serialization;

namespace Vertex.Core.Entities
{
    [DataContract]
    public class Portfolio : BaseEntity
    {
        [MaxLength(512)]
        [DataMember]
        [Required]
        public string Title { get; set; }
        
        [DataMember]
        [Required]
        public string Description { get; set; }

        [MaxLength(128)]
        [DataMember]
        [Required]
        public string ViewName { get; set; }

        [DataMember]
        [Required]
        public int CategoryId { get; set; }

        [DataMember]
        [Required]
        public DateTime CreateDateUtc { get; set; }

        [DataMember]
        public DateTime? UpdateDateUtc { get; set; }

        [DataMember]
        [Required]
        public string UserId { get; set; }

        [MaxLength(32)]
        [DataMember]
        public string Format { get; set; }

        [DataMember]
        public string FormatValue { get; set; }

        [DataMember]
        public int? PictureId { get; set; }

        [DataMember]
        public int ViewCount { get; set; }

        [DataMember]
        public bool IsActive { get; set; }

        [DataMember]
        public bool IsDelete { get; set; }


        [NotMapped]
        public virtual MediaStorage Picture { get; set; }

        [NotMapped]
        public virtual string Url { get; set; }

        [NotMapped]
        public virtual PortfolioCategory Category { get; set; }

        [NotMapped]
        public virtual ApplicationUser User { get; set; }

        [NotMapped]
        public virtual List<MediaStorage> Pictures { get; set; }
    }

    public enum PortfolioFormat
    {
        Standard,
        //Gallery, // later
        Quote,
        Video,
        Audio
    }
}