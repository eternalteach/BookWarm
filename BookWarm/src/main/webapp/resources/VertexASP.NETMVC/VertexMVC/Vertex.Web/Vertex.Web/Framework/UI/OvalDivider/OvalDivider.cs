namespace Vertex.Web.Framework.UI
{
    public class OvalDivider : ViewComponentBase
    {
        public OvalDivider()
        {
            this.OvalDividerType = OvalDividerType.Divider1;
            this.Position = OvalDividerPosition.Bottom;
        }

        public OvalDividerType OvalDividerType { get; set; }
        public OvalDividerPosition Position { get; set; }

        public override void GenerateHtmlAtributes()
        {
            switch (this.Position)
            {
                case OvalDividerPosition.Top:
                    this.AppendCssClass("oval-divider--top");
                    break;
                case OvalDividerPosition.Bottom:
                    this.AppendCssClass("oval-divider--bottom");
                    break;
                default:
                    break;
            }

            this.AppendCssClass(string.Format("oval-divider--{0}", this.OvalDividerType.ToString().Replace("Divider", ""))); //get the divider number
        }
    }

    public enum OvalDividerPosition
    {
        Top,
        Bottom
    }

    public enum OvalDividerType
    {
        Divider1,
        Divider2,
        Divider3,
        Divider4,
        Divider5,
        Divider6,
        Divider7,
        Divider8,
        Divider9,
        Divider10,
        Divider11,
        Divider12,
        Divider13,
        Divider14
    }
}