using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Vertex.Web.Startup))]
namespace Vertex.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }        
    }
}