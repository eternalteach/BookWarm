using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Vertex.Core.Entities;
using Vertex.Core.Infrastructure;
using Vertex.Service;

namespace Vertex.Web.Framework.UI
{
    public class TeamMemberViewBuilder : ViewComponentBuilderBase<TeamMemberView, TeamMemberViewBuilder>
    {
        #region Fields

        private readonly ITeamMemberService teamMemberService;
        private readonly IMediaStorageService mediaStorageService;
        private readonly ISocialNetworkService socialNetworkService;

        private Func<TeamMember, bool> predicate;
        private int? _displayCount { get; set; }
        private int? _pageSize { get; set; }

        #endregion Fields

        #region Ctor

        public TeamMemberViewBuilder(HtmlHelper htmlHelper, TeamMemberView model)
            : base(htmlHelper, model)
        {
            teamMemberService = Engine.Resolve<ITeamMemberService>();
            mediaStorageService = Engine.Resolve<IMediaStorageService>();
            socialNetworkService = Engine.Resolve<ISocialNetworkService>();
        }

        #endregion Ctor

        public override string ToHtmlString()
        {
            var teamMembers = predicate == null ? teamMemberService.GetTeamMembers()
                : teamMemberService.GetTeamMembers().Where(this.predicate);

            if (this._displayCount.HasValue && this._displayCount.Value > 0)
                teamMembers = teamMembers.Take(this._displayCount.Value);

            foreach (var item in teamMembers)
            {
                var teamMemberItem = new TeamMemberItem();
                teamMemberItem.Name = item.FullName;
                teamMemberItem.Position = item.Position;
                teamMemberItem.Image = mediaStorageService.GetPictureUrl(item.PictureId);
                teamMemberItem.SocialNetworks = socialNetworkService.GetByEntity(item.Id, nameof(TeamMember)).ToList();
                if (teamMemberItem.SocialNetworks == null)
                    teamMemberItem.SocialNetworks = new List<SocialNetwork>();
                this.Component.Items.Add(teamMemberItem);
            }

            return base.ToHtmlString();
        }

        public TeamMemberViewBuilder ToSlider(Action<SliderBuilder> action)
        {
            var sliderBuilder = new SliderBuilder(this.HtmlHelper, new Slider());
            action.Invoke(sliderBuilder);
            this.Component.Slider = sliderBuilder;
            return this;
        }

        public TeamMemberViewBuilder DisplayCount(int count)
        {
            this._displayCount = count;
            return this;
        }

        public TeamMemberViewBuilder Variation(TeamMemberVariation variation)
        {
            this.Component.Variation = variation;
            return this;
        }

        public TeamMemberViewBuilder Where(Func<TeamMember, bool> predicate)
        {
            this.predicate = predicate;
            return this;
        }

        //public TeamMemberBuilder Pageable(int pageSize)
        //{
        //    this._pageSize = pageSize;
        //    return this;
        //}
    }
}