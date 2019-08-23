namespace Vertex.Web.Framework.UI
{
    public class Rating : ViewComponentBase
    {
        public Rating()
        {
            this.ViewName = "Builder/Components/Rating";
        }

        public RatingRate Rate { get; set; }

        public override void GenerateHtmlAtributes()
        {
        }
    }

    public enum RatingRate
    {
        One,
        Two,
        Three,
        Four,
        Five
    }
}