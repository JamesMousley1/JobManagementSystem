using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(JobManagementSystem.Startup))]
namespace JobManagementSystem
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
