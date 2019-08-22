using Vertex.Core.Entities;
using Vertex.Data;
using System.Linq;
using System.Collections.Generic;

namespace Vertex.Service
{
    public class TeamMemberService : ITeamMemberService
    {
        private readonly IRepository<TeamMember> teamMemberRepository;
        private readonly IMediaStorageService mediaStorageService;

        public TeamMemberService(IRepository<TeamMember> _teamMemberRepository,
            IMediaStorageService _mediaStorageService)
        {
            teamMemberRepository = _teamMemberRepository;
            mediaStorageService = _mediaStorageService;
        }

        public virtual TeamMember GetById(int id)
        {
            if (id == 0)
                return null;
            var media = teamMemberRepository.Find(x => x.Id == id);
            return media;
        }

        public bool Insert(TeamMember team)
        {
            return teamMemberRepository.Insert(team);
        }

        public bool Update(TeamMember team)
        {
            return teamMemberRepository.Update(team);
        }

        public bool Delete(TeamMember team)
        {
            var pictureId = team.PictureId;
            var deleted = teamMemberRepository.Delete(team);
            if (deleted)
            {
                mediaStorageService.Delete(pictureId);
            }
            return deleted;
        }

        public IEnumerable<TeamMember> GetTeamMembers()
        {
            return (from p in teamMemberRepository.Table
                    orderby p.OrderNo ascending
                    select p).ToList();
        }
    }
}