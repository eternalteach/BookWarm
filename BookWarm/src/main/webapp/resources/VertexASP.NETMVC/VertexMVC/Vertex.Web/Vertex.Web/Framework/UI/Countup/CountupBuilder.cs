using System.Web.Mvc;
using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class CountupBuilder : ViewComponentBuilderBase<Countup, CountupBuilder>
    {
        public CountupBuilder(HtmlHelper htmlHelper, Countup model) : base(htmlHelper, model)
        { 
        }

        public CountupBuilder FromTo(decimal from, decimal to)
        {
            this.Component.From = from;
            this.Component.To = to;
            return this;
        }

        public CountupBuilder Prefix(string prefix)
        {
            this.Component.Prefix = prefix;
            return this;
        }

        public CountupBuilder Suffix(string suffix)
        {
            this.Component.Suffix = suffix;
            return this;
        }

        public CountupBuilder Duration(int duration)
        {
            this.Component.Duration = duration;
            return this;
        }

        public CountupBuilder Color(BootstrapColor color)
        {
            this.Component.AppendCssClass(string.Format("text-{0}", color.ToCssClass())); 
            return this;
        }
    }
}