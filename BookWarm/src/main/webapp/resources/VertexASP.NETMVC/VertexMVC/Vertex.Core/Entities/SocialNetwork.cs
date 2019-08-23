using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace Vertex.Core.Entities
{
    [DataContract]
    public class SocialNetwork : BaseEntity
    {
        /// <summary>
        /// Gets or sets the entity identifier
        /// </summary>
		[DataMember]
        public string EntityId { get; set; }

        /// <summary>
        /// Gets or sets the entity name
        /// </summary>
		[DataMember]
        [MaxLength(128)]
        public string EntityName { get; set; }

        /// <summary>
        /// Gets or sets the Name
        /// </summary>
        [DataMember]
        public string Name { get; set; }

        /// <summary>
        /// Gets or sets the Web Address
        /// </summary>
		[DataMember]
        [Required]
        [MaxLength(512)]
        public string WebAddress { get; set; }

        /// <summary>
	    /// Gets or sets the value indicating whether the record is active
	    /// </summary>
		[DataMember]
        public bool IsActive { get; set; }

        /// <summary>
        /// Gets or sets the OrderNo
        /// </summary>
        [DataMember]
        public int OrderNo { get; set; }
    }
}