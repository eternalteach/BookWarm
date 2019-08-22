using System.Collections.Generic;

namespace Vertex.Web.Framework.UI
{
    public class SocialIcon : ViewComponentBase
    {
        public SocialIcon()
        {
            this.Size = SocialIconSize.Default;
            this.SocialIconType = SocialIconType.HoverPrimary;
        }

        /// <summary>
        /// Social network name
        /// </summary> 
        public string Name { get; set; }
        public int Id { get; set; }
        public string Url { get; set; }
        public string Icon { get; set; }
        public bool Vertical { get; set; }
        public SocialIconSize Size { get; set; }
        public SocialIconType SocialIconType { get; set; }

        public override void GenerateHtmlAtributes()
        {
            if (this.Vertical)
                this.AppendCssClass("social-vertical align-items-center");

            switch (this.SocialIconType)
            {
                case SocialIconType.Brand:
                    this.AppendCssClass("social-brand");
                    break;

                case SocialIconType.Gray:
                    this.AppendCssClass("social-gray");
                    break;

                case SocialIconType.Light:
                    this.AppendCssClass("social-light");
                    break;

                case SocialIconType.Bordered:
                    this.AppendCssClass("social-bordered");
                    break;

                case SocialIconType.Rounded:
                    this.AppendCssClass("social-rounded");
                    break;

                case SocialIconType.HoverBgBrand:
                    this.AppendCssClass("social-hover-bg-brand");
                    break;

                case SocialIconType.BgBrand:
                    this.AppendCssClass("social-bg-brand");
                    break;

                case SocialIconType.BgPaleBrand:
                    this.AppendCssClass("social-bg-pale-brand");
                    break;

                case SocialIconType.BgGray:
                    this.AppendCssClass("social-bg-gray");
                    break;

                case SocialIconType.BgLight:
                    this.AppendCssClass("social-bg-light");
                    break;

                case SocialIconType.BgDark:
                    this.AppendCssClass("social-bg-dark");
                    break;

                case SocialIconType.Cycling:
                    this.AppendCssClass("social-cycling");
                    break;
            }
        }
    }

    public enum SocialIconSize
    {
        Small,
        Default,
        Large
    }

    public enum SocialIconType
    {
        HoverPrimary,
        Brand,
        Gray,
        Light,
        Bordered,
        Rounded,
        HoverBgBrand,
        BgBrand,
        BgPaleBrand,
        BgGray,
        BgLight,
        BgDark,
        Cycling
    }

    public class AvailableSocialNetwork
    {
        public static Dictionary<string, SocialIcon> Icons
        {
            get
            {
                var m = new Dictionary<string, SocialIcon>();
                m.Add(AvailableSocialNetwork.Facebook.Name, AvailableSocialNetwork.Facebook);
                m.Add(AvailableSocialNetwork.Twitter.Name, AvailableSocialNetwork.Twitter);
                m.Add(AvailableSocialNetwork.Instagram.Name, AvailableSocialNetwork.Instagram);
                m.Add(AvailableSocialNetwork.Gplus.Name, AvailableSocialNetwork.Gplus);
                m.Add(AvailableSocialNetwork.Linkedin.Name, AvailableSocialNetwork.Linkedin);
                m.Add(AvailableSocialNetwork.Git.Name, AvailableSocialNetwork.Git);
                m.Add(AvailableSocialNetwork.Tumblr.Name, AvailableSocialNetwork.Tumblr);
                m.Add(AvailableSocialNetwork.Vimeo.Name, AvailableSocialNetwork.Vimeo);
                m.Add(AvailableSocialNetwork.Youtube.Name, AvailableSocialNetwork.Youtube);
                m.Add(AvailableSocialNetwork.Flickr.Name, AvailableSocialNetwork.Flickr);
                m.Add(AvailableSocialNetwork.Reddit.Name, AvailableSocialNetwork.Reddit);
                m.Add(AvailableSocialNetwork.Dribbble.Name, AvailableSocialNetwork.Dribbble);
                m.Add(AvailableSocialNetwork.Skype.Name, AvailableSocialNetwork.Skype);
                m.Add(AvailableSocialNetwork.Behance.Name, AvailableSocialNetwork.Behance);
                m.Add(AvailableSocialNetwork.Rss.Name, AvailableSocialNetwork.Rss);
                return m;
            }
        }

        public static SocialIcon Facebook = new SocialIcon()
        {
            Name = "Facebook",
            Icon = "fab fa-facebook",
            Url = "https://www.facebook.com/"
        };

        public static SocialIcon Twitter = new SocialIcon()
        {
            Name = "Twitter",
            Icon = "fab fa-twitter",
            Url = "https://www.twitter.com/"
        };

        public static SocialIcon Instagram = new SocialIcon()
        {
            Name = "Instagram",
            Icon = "fab fa-instagram",
            Url = "https://www.instagram.com/"
        };

        public static SocialIcon Gplus = new SocialIcon()
        {
            Name = "Gplus",
            Icon = "fab fa-google-plus",
            Url = "https://www.gmail.com/"
        };

        public static SocialIcon Linkedin = new SocialIcon()
        {
            Name = "Linkedin",
            Icon = "fab fa-linkedin",
            Url = "https://www.linkedin.com/"
        };

        public static SocialIcon Git = new SocialIcon()
        {
            Name = "Git",
            Icon = "fab fa-git",
            Url = "https://www.git.com/"
        };

        public static SocialIcon Tumblr = new SocialIcon()
        {
            Name = "Tumblr",
            Icon = "fab fa-tumblr",
            Url = "https://www.tumblr.com/"
        };

        public static SocialIcon Vimeo = new SocialIcon()
        {
            Name = "Vimeo",
            Icon = "fab fa-vimeo",
            Url = "https://www.vimeo.com/"
        };

        public static SocialIcon Youtube = new SocialIcon()
        {
            Name = "Youtube",
            Icon = "fab fa-youtube",
            Url = "https://www.youtube.com/"
        };

        public static SocialIcon Flickr = new SocialIcon()
        {
            Name = "Flickr",
            Icon = "fab fa-flickr",
            Url = "https://www.flickr.com/"
        };

        public static SocialIcon Reddit = new SocialIcon()
        {
            Name = "Reddit",
            Icon = "fab fa-reddit",
            Url = "https://www.reddit.com/"
        };

        public static SocialIcon Dribbble = new SocialIcon()
        {
            Name = "Dribbble",
            Icon = "fab fa-dribbble",
            Url = "https://www.dribbble.com/"
        };

        public static SocialIcon Skype = new SocialIcon()
        {
            Name = "Skype",
            Icon = "fab fa-skype",
            Url = "https://www.skype.com/"
        };

        public static SocialIcon Behance = new SocialIcon()
        {
            Name = "Behance",
            Icon = "fab fa-behance",
            Url = "https://www.behance.com/"
        };

        public static SocialIcon Rss = new SocialIcon()
        {
            Name = "Rss",
            Icon = "fab fa-rss",
            Url = "https://www.rss.com/"
        };
    }
}