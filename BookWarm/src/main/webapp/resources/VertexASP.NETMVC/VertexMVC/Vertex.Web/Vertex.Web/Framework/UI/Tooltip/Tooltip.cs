namespace Vertex.Web.Framework.UI
{
    public class Tooltip : ViewComponentBase
    {
        public Tooltip()
        { 
            this.Direction = TooltipDirection.Top;
        } 

        public string Text { get; set; }
        public TooltipDirection Direction { get; set; }

        public string HtmlString { get; set; }

        public override void GenerateHtmlAtributes()
        {
            this.AppendHtmlAtribute("data-placement", this.Direction.ToString().ToLower());
        }
    }

    public enum TooltipDirection
    {
        Top,
        Right,
        Bottom,
        Left
    }
}