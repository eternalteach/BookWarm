using System;
using System.Collections.Generic;
using Vertex.Core.Entities;

namespace Vertex.Web.Framework.UI
{
    public class PortfolioView : ViewComponentBase
    {
        public PortfolioView()
        {
            this.Items = new List<Portfolio>();
            this.PortfolioViewName = PortfolioViewName.Agency;
        }

        public List<Portfolio> Items { get; set; }
        public List<PortfolioCategory> AllCategories { get; set; }

        public bool ShowCategoryFilter { get; set; }
        public bool ShowSorter { get; set; }
        public PortfolioViewName PortfolioViewName { get; set; }

        public SliderBuilder Slider { get; set; }
        public string Pager { get; set; }

        public override void GenerateHtmlAtributes()
        {

        }
    }

    public enum PortfolioViewName
    {
        Agency,
        AwesomeWork,
        Masonry,
        Slide3D
    }
}