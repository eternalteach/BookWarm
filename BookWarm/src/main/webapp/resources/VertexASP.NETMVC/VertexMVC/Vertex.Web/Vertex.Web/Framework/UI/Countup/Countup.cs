namespace Vertex.Web.Framework.UI
{
    public class Countup : ViewComponentBase
    {
        public Countup()
        {
            this.From = 0;
            this.To = 0;
        } 

        public decimal From { get; set; }
        public decimal To { get; set; }
        public string Prefix { get; set; }
        public string Suffix { get; set; }
        public int? Duration { get; set; }
 
        public override void GenerateHtmlAtributes()
        {
            if (this.From >= 0)
            {
                this.AppendHtmlAtribute("data-from", this.From.ToString());
            }

            if (this.To >= 0)
            {
                this.AppendHtmlAtribute("data-to", this.To.ToString());
            }

            if (this.Duration.HasValue && this.Duration.Value > 0)
            {
                this.AppendHtmlAtribute("data-duration", this.Duration.Value.ToString());
            }

            if (!string.IsNullOrEmpty(this.Prefix))
            {
                this.AppendHtmlAtribute("data-prefix", this.Prefix);
            }

            if (!string.IsNullOrEmpty(this.Suffix))
            {
                this.AppendHtmlAtribute("data-suffix", this.Suffix);
            }
        }
    }
}