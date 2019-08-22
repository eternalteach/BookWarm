namespace Vertex.Web.Framework.UI
{
    public class Logo
    {
        public Logo()
        {
            Width = 140;
            Height = 35;
            StickyWidth = 100;
            StickyHeight = 25;
            StickyTop = 23;
            AltText = "Vertex"; // your theme name
            LogoSrc = "/Content/img/logo.png";
            WhiteLogoSrc = "/Content/img/logo-white.png";
        }

        public int Width { get; set; }
        public int Height { get; set; }
        public int StickyWidth { get; set; }
        public int StickyHeight { get; set; }
        public int StickyTop { get; set; }
        public string AltText { get; set; }

        public bool WhiteLogoOnSticky { get; set; }

        /// <summary>
        /// Logo source
        /// </summary>
        public string LogoSrc { get; set; }

        public string WhiteLogoSrc { get; set; }
    }
}