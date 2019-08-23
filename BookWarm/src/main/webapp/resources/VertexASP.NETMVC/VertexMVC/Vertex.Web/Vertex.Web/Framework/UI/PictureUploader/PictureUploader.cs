namespace Vertex.Web.Framework.UI
{
    public class PictureUploader : ViewComponentBase
    {
        public PictureUploader()
        {
            this.Circle = true;
        }

        public string HiddenFor { get; set; }
        public int? PictureId { get; set; }
        public string UploadUrl { get; set; }

        /// <summary>
        /// Gets or sets the entity identifier
        /// </summary> 
        public string EntityId { get; set; }

        /// <summary>
        /// Gets or sets the entity name
        /// </summary> 
        public string EntityName { get; set; }


        public string Width { get; set; }
        public string Height { get; set; }
        public bool Circle { get; set; }
        public string DefaultPictureUrl { get; set; }

        public override void GenerateHtmlAtributes()
        {
        }
    }
}