using System.Collections.Generic;

namespace Vertex.Web.Framework.UI
{
    public class Pagination : ViewComponentBase
    {
        public Pagination()
        {
            this.Items = new List<PaginationItemModel>();
            this.Size = PaginationSize.Default;
            this.Alignment = PaginationAlignment.Left;
        }

        public List<PaginationItemModel> Items { get; set; }
        public PaginationSize Size { get; set; }
        public PaginationAlignment Alignment { get; set; }

        public override void GenerateHtmlAtributes()
        {
        }
    }

    public class PaginationItemModel
    {
        public int Number { get; set; }
    }

    public enum PaginationSize
    {
        Small, Default, Lerge
    }

    public enum PaginationAlignment
    {
        Left, Center, Right
    }
}