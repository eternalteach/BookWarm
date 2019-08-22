using System.Collections.Generic;
using Vertex.Core.Entities;

namespace Vertex.Service
{
    public interface ITeamMemberService
    {
        IEnumerable<TeamMember> GetTeamMembers();
        TeamMember GetById(int id);
        bool Delete(TeamMember team);
        bool Insert(TeamMember team);
        bool Update(TeamMember team);
    }
}