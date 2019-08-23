using System.Web.Mvc;
using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class ProgressBuilder : ViewComponentBuilderBase<Progress, ProgressBuilder>
    {
        public ProgressBuilder(HtmlHelper htmlHelper, Progress model) : base(htmlHelper, model)
        { 
        }

        /// <summary>
        /// Value can be min: 0, max: 100
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public ProgressBuilder Value(short value)
        {
            this.Component.Value = value;
            return this;
        }

        public ProgressBuilder Color(BootstrapColor color)
        {
            this.Component.Color = color;
            return this;
        }

        public ProgressBuilder Striped(bool animatedStripes = false)
        {
            this.Component.Striped = true;
            this.Component.AnimatedStripes = animatedStripes;
            return this;
        }

        public ProgressBuilder Height(string height)
        {
            this.Component.Height = height;
            return this;
        }

        public ProgressBuilder Label(string label)
        {
            this.Component.Label = label;
            return this;
        }
    }
}