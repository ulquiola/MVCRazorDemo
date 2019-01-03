using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MVCRazorDemo.Startup))]
namespace MVCRazorDemo
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
