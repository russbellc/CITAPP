using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CITAPP_B.Startup))]
namespace CITAPP_B
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
