using System.Web.Mvc;
using Vertex.Web.Framework.UI;

namespace Vertex.Web.Framework.UI
{
    public class SpinnerBuilder : ViewComponentBuilderBase<Spinner, SpinnerBuilder>
    {
        public SpinnerBuilder(HtmlHelper htmlHelper, Spinner model) : base(htmlHelper, model)
        { 
        }
    }
}