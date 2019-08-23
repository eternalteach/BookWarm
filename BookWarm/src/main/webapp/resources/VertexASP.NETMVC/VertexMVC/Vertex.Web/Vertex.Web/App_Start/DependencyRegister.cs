using Autofac;
using Autofac.Integration.Mvc;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System.Web.Mvc;
using Vertex.Core.Entities;
using Vertex.Core.Infrastructure;
using Vertex.Data;
using Vertex.Service;

namespace Vertex.Web
{
    public class DependencyRegister
    {
        public static void Register()
        {
            var builder = new ContainerBuilder();
            builder.RegisterControllers(typeof(MvcApplication).Assembly);
            builder.RegisterModule(new AutofacWebTypesModule());

            //Service Library Register
            Service.DependencyRegister.Register(builder);
            builder.RegisterType<CategoryService>().As<ICategoryService>().InstancePerLifetimeScope();
            builder.RegisterType<PostService>().As<IPostService>().InstancePerLifetimeScope();
            builder.RegisterType<LogService>().As<ILogService>().InstancePerLifetimeScope();
            builder.RegisterType<SettingService>().As<ISettingService>().InstancePerLifetimeScope();
            builder.RegisterType<PostTagService>().As<IPostTagService>().InstancePerLifetimeScope();
            builder.RegisterType<UrlService>().As<IUrlService>().InstancePerLifetimeScope();
            builder.RegisterType<TeamMemberService>().As<ITeamMemberService>().InstancePerLifetimeScope();
            builder.RegisterType<ClientTestimonialsService>().As<IClietTestimonialsService>().InstancePerLifetimeScope();
            builder.RegisterType<SocialNetworkService>().As<ISocialNetworkService>().InstancePerLifetimeScope();
            builder.RegisterType<MediaStorageService>().As<IMediaStorageService>().InstancePerLifetimeScope();
            builder.RegisterType<ContactService>().As<IContactService>().InstancePerLifetimeScope();
            builder.RegisterType<SubscriberService>().As<ISubscriberService>().InstancePerLifetimeScope();
            builder.RegisterType<PortfolioService>().As<IPortfolioService>().InstancePerLifetimeScope();
            builder.RegisterType<PortfolioCategoryService>().As<IPortfolioCategoryService>().InstancePerLifetimeScope();

            builder.RegisterType<JobService>().As<IJobService>().InstancePerLifetimeScope();
            builder.RegisterType<JobCategoryService>().As<IJobCategoryService>().InstancePerLifetimeScope();
            builder.RegisterType<ApplyJobService>().As<IApplyJobService>().InstancePerLifetimeScope();

            var x = new DataContext();
            builder.Register<DataContext>(c => x);
            builder.Register<UserStore<ApplicationUser>>(c => new UserStore<ApplicationUser>(x)).AsImplementedInterfaces();
            builder.Register<IdentityFactoryOptions<ApplicationUserService>>(c => new IdentityFactoryOptions<ApplicationUserService>()
            {
                DataProtectionProvider = new Microsoft.Owin.Security.DataProtection.DpapiDataProtectionProvider("ApplicationName")
            });
            builder.RegisterType<ApplicationUserService>();
                       

            var container = builder.Build();
            DependencyResolver.SetResolver(new AutofacDependencyResolver(container));
            Engine.SetContainer(container);
        }
    }
}