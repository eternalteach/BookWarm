using System.Web.Mvc; 

namespace Vertex.Web.Framework.UI
{
    public class SocialIconBuilder : ViewComponentBuilderBase<SocialIcon, SocialIconBuilder>
    {
        public SocialIconBuilder(HtmlHelper htmlHelper, SocialIcon model) : base(htmlHelper, model)
        { 
        }

        public SocialIconBuilder Icon(string icon)
        {
            this.Component.Icon = icon;
            return this;
        }

        public SocialIconBuilder Name(string name)
        {
            this.Component.Name = name;
            return this;
        }

        public SocialIconBuilder Url(string url)
        {
            this.Component.Url = url;
            return this;
        }

        public SocialIconBuilder Vertical(bool vertical)
        {
            this.Component.Vertical = vertical;
            return this;
        }
    }
}