namespace Vertex.Web.Framework.UI
{
    public class SvgInjector : ViewComponentBase
    { 
        public string SvgSrc { get; set; }
        public string NewSrc { get; set; }

        public override void GenerateHtmlAtributes()
        {
            // write your custom atrubes here
        }
    }
}