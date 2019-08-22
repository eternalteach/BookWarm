namespace Vertex.Web.Framework.UI
{
    public class Typing : ViewComponentBase
    {
        public Typing()
        { 
            this.Loop = true;
        }

        public string Text { get; set; }
        public int Speed { get; set; }
        public int BackSpeed { get; set; }
        public bool Loop { get; set; }
        public int Delay { get; set; }

        public override void GenerateHtmlAtributes()
        {
            this.AppendHtmlAtribute("data-loop", this.Loop.ToString().ToLower());
            this.AppendHtmlAtribute("data-typing", this.Text);
            if (this.BackSpeed > 0)
            {
                this.AppendHtmlAtribute("data-back-speed", this.Speed.ToString());
            }
            else
            {
                if (this.Speed > 0)
                {
                    this.AppendHtmlAtribute("data-speed", this.Speed.ToString());
                }
            }
            if (this.Loop == false)
            {
                this.AppendHtmlAtribute("data-loop", "false"); 
            }

            if (this.Delay > 0)
            {
                this.AppendHtmlAtribute("data-back-delay", this.Delay.ToString());
            }
        }
    }
}