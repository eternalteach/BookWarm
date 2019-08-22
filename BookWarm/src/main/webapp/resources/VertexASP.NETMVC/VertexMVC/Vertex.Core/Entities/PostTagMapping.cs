using System.ComponentModel.DataAnnotations.Schema;

namespace Vertex.Core.Entities
{
    public class PostTagMapping : BaseEntity
    {
        public int TagId { get; set; }
        public int PostId { get; set; }

        [NotMapped]
        public virtual Post Post { get; set; }

        [NotMapped]
        public virtual PostTag Tag { get; set; }
    }
}