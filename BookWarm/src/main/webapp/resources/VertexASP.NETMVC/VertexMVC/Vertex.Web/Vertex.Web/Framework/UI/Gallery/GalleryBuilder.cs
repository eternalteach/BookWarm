using System.Web.Mvc;
using Vertex.Web.Framework.UI;

namespace Vertex.Web.Framework.UI
{
    public class GalleryBuilder : ViewComponentBuilderBase<Gallery, GalleryBuilder>
    {
        public GalleryBuilder(HtmlHelper htmlHelper, Gallery model) : base(htmlHelper, model)
        { 
        }
    }
}