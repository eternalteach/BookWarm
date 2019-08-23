using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace Vertex.Core.Entities
{
    /// <summary>
    /// Represents an URL record
    /// </summary>
    [DataContract]
    public class UrlRecord : BaseEntity
    {
        /// <summary>
        /// Gets or sets the entity identifier
        /// </summary>
		[DataMember]
        [Required]
        public int EntityId { get; set; }

        /// <summary>
        /// Gets or sets the entity name
        /// </summary>
		[DataMember]
        [Required]
        [MaxLength(128)]
        public string EntityName { get; set; }

        /// <summary>
        /// Gets or sets the slug
        /// </summary>
		[DataMember]
        [Required]
        public string Slug { get; set; }

        /// <summary>
	    /// Gets or sets the value indicating whether the record is active
	    /// </summary>
		[DataMember]
        public bool IsActive { get; set; }

        /// <summary>
        /// Gets or sets the language identifier
        /// </summary>
		[DataMember]
        public int LanguageId { get; set; }
    }
}