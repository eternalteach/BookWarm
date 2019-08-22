using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Runtime.Serialization;

namespace Vertex.Core.Entities
{
    [DataContract]
    public partial class ClientTestimonials : BaseEntity
    {
        [DataMember]
        [MaxLength(128)]
        [Required]
        public string TypeName { get; set; }

        [DataMember]
        [MaxLength(256)]
        public string ClientName { get; set; }

        [DataMember]
        public int ClientLogoId { get; set; }

        [DataMember]
        [MaxLength(128)]
        public string PersonName { get; set; }

        [DataMember]
        [MaxLength(128)]
        public string PersonPosition { get; set; }

        [DataMember]
        public int PersonPictureId { get; set; }

        [DataMember]
        public string WhatSayAboutUs { get; set; }

        [DataMember]
        [MaxLength(512)]
        public string Website { get; set; }

        [DataMember]
        public int OrderNo { get; set; }

        [DataMember]
        public bool IsActive { get; set; }

        [DataMember]
        public short? Star { get; set; }

        [DataMember]
        public DateTime CreateDateUtc { get; set; }

        [DataMember]
        public DateTime? UpdateDateUtc { get; set; }

        [NotMapped]
        public virtual MediaStorage CompanyLogo { get; set; }

        [NotMapped]
        public virtual MediaStorage PersonPicture { get; set; }
    }

    public enum ClientTestimonialsType
    {
        OnlyClient,
        OnlyTestimonials,
        ClientAndTestimonials
    }
}