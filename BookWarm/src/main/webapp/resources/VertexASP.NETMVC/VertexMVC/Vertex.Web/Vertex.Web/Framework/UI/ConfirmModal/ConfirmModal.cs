namespace Vertex.Web.Framework.UI
{
    public class ConfirmModal: ViewComponentBase
    {
        public string Title { get; set; }
        public string Content { get; set; }
         
        public string ActionName { get; set; }
        public string ControlerName { get; set; }
        public object RouteValues { get; set; }

        public string HtmlString { get; set; }

        public override void GenerateHtmlAtributes()
        { 
        }
    }
}
