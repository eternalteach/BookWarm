using System;
using System.Web.Mvc;
using System.Web.WebPages; 

namespace Vertex.Web.Framework.UI
{
    public class WidgetBuilder : ViewComponentBuilderBase<ViewComponentBase, WidgetBuilder>
    {
        public WidgetBuilder(HtmlHelper htmlHelper, ViewComponentBase model) : base(htmlHelper, model)
        { 
        }

        //public WidgetBuilder<TModel> Parameter(string paramName, object paramValue)
        //{
        //    Model.Parameters.Add(paramName, paramValue);
        //    return this;
        //}
    }
}