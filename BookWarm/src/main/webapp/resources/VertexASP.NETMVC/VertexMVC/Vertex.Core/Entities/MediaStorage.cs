using System;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace Vertex.Core.Entities
{
    [DataContract]
    public partial class MediaStorage : BaseEntity
    {
        /// <summary>
        /// Gets or sets the entity identifier
        /// </summary>
		[DataMember]
        [MaxLength(128)]
        public string EntityId { get; set; }

        /// <summary>
        /// Gets or sets the entity name
        /// </summary>
		[DataMember]
        [MaxLength(128)]
        public string EntityName { get; set; }

        /// <summary>
        /// Gets or sets the file name
        /// </summary>
        [DataMember]
        [MaxLength(256)]
        public string FileName { get; set; }

        /// <summary>
        /// Gets or sets the file path
        /// </summary>
        [DataMember]
        [MaxLength(512)]
        public string FilePath { get; set; }

        /// <summary>
        /// Gets or sets the picture mime type
        /// </summary>
        [DataMember]
        [MaxLength(32)]
        public string MimeType { get; set; }

        /// <summary>
        /// Gets or sets the picture width
        /// </summary>
        [DataMember]
        public int? Width { get; set; }

        /// <summary>
        /// Gets or sets the picture height
        /// </summary>
        [DataMember]
        public int? Height { get; set; }

        /// <summary>
        /// Gets or sets the OrderNo
        /// </summary>
        [DataMember]
        public int OrderNo { get; set; }

        /// <summary>
        /// Gets or sets the date and time of instance create
        /// </summary>
        [DataMember]
        public DateTime CreateDateUtc { get; set; }

        /// <summary>
        /// Gets or sets the date and time of instance update
        /// </summary>
        [DataMember]
        public DateTime? UpdateDateUtc { get; set; }
    }
}