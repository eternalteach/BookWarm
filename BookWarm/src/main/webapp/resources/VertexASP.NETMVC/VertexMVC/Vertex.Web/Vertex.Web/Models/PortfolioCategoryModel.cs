using System.ComponentModel.DataAnnotations;

namespace Vertex.Web.Models
{
    public class PortfolioCategoryModel
    {
        public int Id { get; set; }

        [Display(Name = "Name")]
        [Required(ErrorMessage = "Please enter the name.")]
        public string Name { get; set; }

        public string Url { get; set; }

        [Display(Name = "Portfolio Count")]
        public int PortfolioCount { get; set; }

        [Display(Name = "Active")]
        public bool IsActive { get; set; }
    }

    public class PortfolioCategoryDetailModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
}