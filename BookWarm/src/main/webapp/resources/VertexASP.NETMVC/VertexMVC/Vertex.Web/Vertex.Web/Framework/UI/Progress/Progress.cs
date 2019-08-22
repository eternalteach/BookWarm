using System;
using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class Progress : ViewComponentBase
    {
        public Progress()
        {
            this.Color = BootstrapColor.Primary;
        }

        public string Label { get; set; }
        public Int16 Value { get; set; }
        public bool Striped { get; set; }
        public bool AnimatedStripes { get; set; }
        public string Height { get; set; }
        public BootstrapColor Color { get; set; }

        public override void GenerateHtmlAtributes()
        {
            if (this.Value > 0)
            {
                this.AppendStyle("width", string.Format("{0}%", this.Value.ToString()));
                this.AppendHtmlAtribute("aria-valuenow", this.Value.ToString());
            }

            if (!string.IsNullOrEmpty(this.Height))
            {
                this.AppendStyle("height", this.Height);
            }

            if (this.Striped)
            {
                this.AppendCssClass("progress-bar-striped");

                if (this.AnimatedStripes)
                    this.AppendCssClass("progress-bar-animated");
            }

            if (this.Color != BootstrapColor.Primary)
            {
                this.AppendCssClass(string.Format("bg-{0}", this.Color.ToCssClass()));
            }
        }
    }
}