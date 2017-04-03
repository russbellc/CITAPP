using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CITAPPdb.Startup))]
namespace CITAPPdb
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
