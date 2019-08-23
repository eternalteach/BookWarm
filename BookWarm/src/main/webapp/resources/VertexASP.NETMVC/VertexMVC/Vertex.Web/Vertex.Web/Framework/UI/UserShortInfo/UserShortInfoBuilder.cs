using System.Web.Mvc;
using Vertex.Core.Entities;
using Vertex.Core.Infrastructure;
using Vertex.Service;

namespace Vertex.Web.Framework.UI
{
    public class UserShortInfoBuilder : ViewComponentBuilderBase<UserShortInfo, UserShortInfoBuilder>
    {
        private readonly ApplicationUserService userService;

        public UserShortInfoBuilder(HtmlHelper htmlHelper, UserShortInfo model)
            : base(htmlHelper, model)
        {
            userService = Engine.Resolve<ApplicationUserService>();
        }

        public override string ToHtmlString()
        {

            return base.ToHtmlString();
        }

        public UserShortInfoBuilder User(ApplicationUser user)
        {
            this.Component.User = user;
            return this;
        }

        public UserShortInfoBuilder User(string userName)
        {
            var user = userService.GetByUserName(userName);
            this.Component.User = user;
            return this;
        }
    }
}