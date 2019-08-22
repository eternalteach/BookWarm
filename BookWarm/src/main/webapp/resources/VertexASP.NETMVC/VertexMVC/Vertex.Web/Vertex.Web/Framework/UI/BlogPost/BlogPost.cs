using System.Collections.Generic;
using Vertex.Core.Entities;

namespace Vertex.Web.Framework.UI
{
    public class BlogPost : ViewComponentBase
    {
        public BlogPost()
        {
            this.Items = new List<Post>();
        }

        public List<Post> Items { get; set; }
        public SliderBuilder Slider { get; set; }
        public string Pager { get; set; }

        public override void GenerateHtmlAtributes()
        {
        }
    }

    public enum BlogPostViewName
    {
        Grid,
        ListRightText,
        ListBottomText,
        Card2D,
        Card,
        PostOnImage,
        PostOnImage2
    }
}