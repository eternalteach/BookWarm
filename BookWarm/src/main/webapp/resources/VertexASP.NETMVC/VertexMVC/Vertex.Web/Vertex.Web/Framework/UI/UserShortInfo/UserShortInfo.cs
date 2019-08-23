using Vertex.Core.Entities;

namespace Vertex.Web.Framework.UI
{
    public class UserShortInfo : ViewComponentBase
    {
        public UserShortInfo()
        {

        }

        public ApplicationUser User { get; set; }

        public override void GenerateHtmlAtributes()
        { 
        }
    }
}