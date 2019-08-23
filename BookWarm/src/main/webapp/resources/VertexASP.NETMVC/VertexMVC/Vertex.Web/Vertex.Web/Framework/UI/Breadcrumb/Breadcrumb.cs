using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Vertex.Web.Framework.Utilities;

namespace Vertex.Web.Framework.UI
{
    public class Breadcrumb : ViewComponentBase
    {
        public override void GenerateHtmlAtributes()
        { 
        }
    }

    public enum BreadcrumbAlign
    {
        Left,
        Center,
        Right
    }
}