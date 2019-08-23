namespace Vertex.Web.Framework.UI
{
    public class HtmlEditor : ViewComponentBase
    {
        public string Html { get; set; }
        public string Name { get; internal set; }

        public override void GenerateHtmlAtributes()
        {
        }
    }
}