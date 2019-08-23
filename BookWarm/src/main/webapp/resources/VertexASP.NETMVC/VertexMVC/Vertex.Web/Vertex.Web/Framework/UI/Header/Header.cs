namespace Vertex.Web.Framework.UI
{
    public class Header : ViewComponentBase
    {
        public Header()
        {
            this.Nav = new Nav();
            this.Topbar = new Topbar();
            this.Logo = new Logo();
            this.Transparency = HeaderTransparency.None;
            this.StickyType = HeaderStickyType.Reveal;
            this.BorderBottom = HeaderBorderBottom.None;

            this.ShowLogo = true;
            this.ShowTopbar = true;
            this.IsStickyEnabled = true;
            this.IsStickyEnableOnBoxed = true;
            this.IsStickyEnableOnMobile = true;
            this.IsFullWidth = false;
        }

        public Nav Nav { get; set; }
        public Topbar Topbar { get; set; }
        public Logo Logo { get; set; }

        public bool IsStickyEnabled { get; set; }
        public bool IsStickyEnableOnBoxed { get; set; }
        public bool IsStickyEnableOnMobile { get; set; }
        public bool ShowTopbar { get; set; }
        public bool ShowLogo { get; set; }
        public bool IsFullWidth { get; set; }
        public bool ShowSearchIcon { get; set; }

        public HeaderStickyType StickyType { get; set; }
        public HeaderTransparency Transparency { get; set; }
        public HeaderBorderBottom BorderBottom { get; set; }

        public override void GenerateHtmlAtributes()
        {
            this.AppendHtmlAtribute("stickyEnabled", this.IsStickyEnabled.ToString().ToLower());
            this.AppendHtmlAtribute("stickyEnableOnBoxed", this.IsStickyEnableOnBoxed.ToString().ToLower());
            this.AppendHtmlAtribute("stickyEnableOnMobile", this.IsStickyEnableOnMobile.ToString().ToLower());

            this.AppendHtmlAtribute("stickyChangeLogo", "true");

            if (this.ShowTopbar)
            {
                this.AppendHtmlAtribute("stickyStartAt", "200");
                this.AppendHtmlAtribute("stickySetTop", "-38px");
            }
            else
            {
                this.AppendHtmlAtribute("stickyStartAt", "30");
                this.Logo.StickyTop = 0;
            }

            switch (this.StickyType)
            {
                case HeaderStickyType.Reveal:
                    this.AppendCssClass("header-effect-reveal");
                    this.AppendHtmlAtribute("stickyEffect", "reveal");
                    break;

                case HeaderStickyType.Shrink:
                    this.AppendCssClass("header-effect-shrink");
                    this.AppendHtmlAtribute("stickyEffect", "shrink");
                    break;
            }

            switch (this.Transparency)
            {
                case HeaderTransparency.Transparent:
                    this.AppendCssClass("header-transparent");
                    break;

                case HeaderTransparency.SemiTransparentDark:
                    this.AppendCssClass("header-semi-transparent");
                    break;

                case HeaderTransparency.SemiTransparentLight:
                    this.AppendCssClass("header-semi-transparent");
                    break;
            }

            switch (this.BorderBottom)
            {
                case HeaderBorderBottom.Light:
                    this.AppendCssClass("header-transparent-light-bottom-border header-transparent-light-bottom-border-1");
                    break;
                case HeaderBorderBottom.Dark:
                    this.AppendCssClass("header-semi-transparent");
                    break;
            }

            //if (this.IsFullWidth)
            //    this.AddParameter("FullWidthClass", "-fluid"); // container-fluid
        }
    }

    public enum HeaderBorderBottom
    {
        None,
        Light,
        Dark
    }

    public enum HeaderStickyType
    {
        Reveal,
        Shrink
    }

    public enum HeaderTransparency
    {
        None,
        Transparent,
        SemiTransparentDark,
        SemiTransparentLight
    }
}