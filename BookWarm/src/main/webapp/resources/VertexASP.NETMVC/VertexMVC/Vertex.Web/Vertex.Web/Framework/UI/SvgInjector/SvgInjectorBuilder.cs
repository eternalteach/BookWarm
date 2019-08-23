using System.Web.Mvc; 
using Vertex.Web.Framework.UI;

namespace Vertex.Web.Framework.UI
{
    public class SvgInjectorBuilder : ViewComponentBuilderBase<SvgInjector, SvgInjectorBuilder>
    {
        public SvgInjectorBuilder(HtmlHelper htmlHelper, SvgInjector model) : base(htmlHelper, model)
        { 
        }

        public SvgInjectorBuilder SvgSrc(string src)
        {
            this.Component.SvgSrc = src;
            return this;
        }

        /// <summary>
        /// New image source
        /// </summary>
        /// <param name="src"></param>
        /// <returns></returns>
        public SvgInjectorBuilder NewSrc(string src)
        {
            this.Component.NewSrc = src;
            return this;
        }
    }
}