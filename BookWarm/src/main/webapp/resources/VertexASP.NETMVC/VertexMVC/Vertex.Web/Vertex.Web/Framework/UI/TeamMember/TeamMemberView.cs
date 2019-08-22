using System.Collections.Generic;
using Vertex.Core.Entities;

namespace Vertex.Web.Framework.UI
{
    public class TeamMemberView : ViewComponentBase
    {
        public TeamMemberView()
        {
            this.Items = new List<TeamMemberItem>();
            this.Variation = TeamMemberVariation.Variation1;
        }

        public List<TeamMemberItem> Items { get; set; }
        public TeamMemberVariation Variation { get; set; }
        public SliderBuilder Slider { get; set; } 
        
        public override void GenerateHtmlAtributes()
        {
        }
    }

    public class TeamMemberItem
    {
        public string Name { get; set; }
        public string Position { get; set; }
        public string Image { get; set; }
        public List<SocialNetwork> SocialNetworks { get; set; }
    }

    public enum TeamMemberVariation
    {
        Variation1,
        Variation2,
        Variation3
    }
}