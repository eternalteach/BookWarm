namespace Vertex.Web.Framework.UI
{
    public class Popover : ViewComponentBase
    {
        public Popover()
        {
            this.Direction = PopoverDirection.Top;
            this.DismissOnNextClick = true;
        }

        public string Title { get; set; }
        public string Content { get; set; }
        public PopoverDirection Direction { get; set; }
        public string HtmlString { get; internal set; }
        public bool DismissOnNextClick { get; set; }

        public override void GenerateHtmlAtributes()
        { 
            this.AppendHtmlAtribute("data-placement", this.Direction.ToString().ToLower());
            if (this.DismissOnNextClick)
            {
                this.AppendHtmlAtribute("data-trigger", "focus");
            }
        }
    }

    public enum PopoverDirection
    {
        Top,
        Right,
        Bottom,
        Left
    }
}