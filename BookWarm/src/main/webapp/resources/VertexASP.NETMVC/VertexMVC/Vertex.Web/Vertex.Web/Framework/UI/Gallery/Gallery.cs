using System.Collections.Generic;

namespace Vertex.Web.Framework.UI
{
    public class Gallery : ViewComponentBase
    {
        public Gallery()
        {
            this.Items = new List<GalleryItemModel>();
            this.GalleryType = GalleryType.Gallery3Type1;
        }
        
        public GalleryType GalleryType { get; set; }
        public IList<GalleryItemModel> Items { get; set; }

        public override void GenerateHtmlAtributes()
        { 
        }
    }

    public class GalleryItemModel : HtmlAtributeContainer
    {
        public string Src { get; set; }
    }

    public enum GalleryType
    {
        Gallery3Type1,
        Gallery3Type2,
        Gallery3Type3,
        Gallery3Type4,
        Gallery3Type5,
        Gallery4Type1,
        Gallery4Type2,
        Gallery4Type3,
        Gallery4Type4,
        Gallery4Type5
    }
}