using Microsoft.AspNet.Identity;
using Vertex.Core.Entities;

namespace Vertex.Service
{
    public class ApplicationRoleService : RoleManager<ApplicationRole>
    {
        #region Ctor

        public ApplicationRoleService(IRoleStore<ApplicationRole> store)
            : base(store)
        {
        }

        #endregion Ctor
    }
}