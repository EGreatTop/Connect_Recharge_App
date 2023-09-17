using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ConnectRechargeWebsite.Startup))]
namespace ConnectRechargeWebsite
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
