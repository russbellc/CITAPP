using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CITAPP.Startup))]
namespace CITAPP
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
