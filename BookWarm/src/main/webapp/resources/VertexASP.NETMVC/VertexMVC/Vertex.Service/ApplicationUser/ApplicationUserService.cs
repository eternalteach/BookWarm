using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin; 
using System;
using System.Linq;
using Vertex.Core;
using Vertex.Core.Cache;
using Vertex.Core.Entities;
using Vertex.Core.Extensions;
using Vertex.Data;

namespace Vertex.Service
{
    public class ApplicationUserService : UserManager<ApplicationUser>
    {
        private readonly IUserStore<ApplicationUser> userService;
        private readonly IMediaStorageService mediaStorageService;
        private readonly ISocialNetworkService socialNetworkService;
        private readonly ICacheManager cacheManager;

        public ApplicationUserService(IUserStore<ApplicationUser> store) : base(store)
        {
        }

        public ApplicationUserService(IUserStore<ApplicationUser> store,
            ICacheManager _cacheManager,
            IMediaStorageService _mediaStorageService,
            ISocialNetworkService _socialNetworkService)
            : base(store)
        {
            userService = store;
            cacheManager = _cacheManager;
            mediaStorageService = _mediaStorageService;
            socialNetworkService = _socialNetworkService;
        }

        public ApplicationUser GetById(string userId)
        {
            var user = userService.FindByIdAsync(userId).Result;

            if (user != null)
            {
                user.Avatar = cacheManager.Get(CacheConstant.MEDIA_STORAGE_ITEM.FormatInvariant(user.PictureId), () =>
                {
                    return mediaStorageService.GetById(user.PictureId);
                });
                user.SocialNetworks = cacheManager.Get(CacheConstant.SOCIAL_NETWORK_ITEM.FormatInvariant(user.Id), () =>
                {
                    return socialNetworkService.GetByEntity(user.Id, nameof(ApplicationUser)).ToList();
                });
            }

            return user;
        }

        public ApplicationUser GetByUserName(string userName)
        {
            var user = userService.FindByNameAsync(userName).Result;

            if (user != null)
            {
                user.Avatar = cacheManager.Get(CacheConstant.MEDIA_STORAGE_ITEM.FormatInvariant(user.PictureId), () =>
                {
                    return mediaStorageService.GetById(user.PictureId);
                });
                user.SocialNetworks = cacheManager.Get(CacheConstant.SOCIAL_NETWORK_ITEM.FormatInvariant(user.Id), () =>
                {
                    return socialNetworkService.GetByEntity(user.Id, nameof(ApplicationUser)).ToList();
                });
            }

            return user;
        }

        public static ApplicationUserService Create(IdentityFactoryOptions<ApplicationUserService> options, IOwinContext context)
        {
            var manager = new ApplicationUserService(new UserStore<ApplicationUser>(context.Get<DataContext>()));
            // Configure validation logic for usernames
            manager.UserValidator = new UserValidator<ApplicationUser>(manager)
            {
                AllowOnlyAlphanumericUserNames = false,
                RequireUniqueEmail = true
            };

            // Configure validation logic for passwords
            manager.PasswordValidator = new PasswordValidator
            {
                RequiredLength = 6,
                RequireNonLetterOrDigit = true,
                RequireDigit = true,
                RequireLowercase = true,
                RequireUppercase = true,
            };

            // Configure user lockout defaults
            manager.UserLockoutEnabledByDefault = true;
            manager.DefaultAccountLockoutTimeSpan = TimeSpan.FromMinutes(5);
            manager.MaxFailedAccessAttemptsBeforeLockout = 5;

            // Register two factor authentication providers. This application uses Phone and Emails as a step of receiving a code for verifying the user
            // You can write your own provider and plug it in here.
            manager.RegisterTwoFactorProvider("Phone Code", new PhoneNumberTokenProvider<ApplicationUser>
            {
                MessageFormat = "Your security code is {0}"
            });
            manager.RegisterTwoFactorProvider("Email Code", new EmailTokenProvider<ApplicationUser>
            {
                Subject = "Security Code",
                BodyFormat = "Your security code is {0}"
            });
            //manager.EmailService = new EmailService();
            //manager.SmsService = new SmsService();
            var dataProtectionProvider = options.DataProtectionProvider;
            if (dataProtectionProvider != null)
            {
                manager.UserTokenProvider =
                    new DataProtectorTokenProvider<ApplicationUser>(dataProtectionProvider.Create("ASP.NET Identity"));
            }
            return manager;
        }
    }
}