using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using Vertex.Core.Entities;

namespace Vertex.Web.Areas.Manage.Models
{
    public class PortfolioModel
    {
        public PortfolioModel()
        {
            this.PortfolioFormat = PortfolioFormat.Standard;
            this.AddPictureModel = new PortfolioPictureModel();
            this.Pictures = new List<PortfolioPictureModel>();
        }

        public int Id { get; set; }
        public string Url { get; set; }
        public int? PictureId { get; set; }

        [Display(Name = "View Name")]
        [Required]
        public string ViewName { get; set; }

        [Display(Name = "Portfolio Type")]
        public PortfolioFormat PortfolioFormat { get; set; }

        [Display(Name = "Value")]
        public string PortfolioFormatValue { get; set; }

        [MaxLength(200)]
        [Display(Name = "Title")]
        [Required]
        public string Title { get; set; }

        [Display(Name = "Content")]
        [Required]
        public string Content { get; set; }

        [Display(Name = "Category")]
        [Required(ErrorMessage = "Select Category")]
        public int CategoryId { get; set; }

        [Display(Name = "Active")]
        public bool IsActive { get; set; }

        [Display(Name = "Deleted")]
        public bool IsDelete { get; set; }

        [Display(Name = "Create Date")]
        public DateTime CreateDate { get; set; }

        [Display(Name = "Update Date")]
        public DateTime? UpdateDate { get; set; }

        public string UserId { get; set; }

        [Display(Name = "Author")]
        public string UserName { get; set; }

        public string UserUrl { get; set; }
        public int ViewCount { get; set; }

        public string CategoryName { get; set; }
        public string CategoryUrl { get; set; }

        [Display(Name = "Picture")]
        public string PicturePath { get; set; }

        public ApplicationUser User { get; set; }
        public MediaStorage UserAvatar { get; set; }
        public IEnumerable<PortfolioCategory> Categories { get; set; }

        public List<string> PortfolioFormats
        {
            get
            {
                return Enum.GetNames(typeof(PortfolioFormat)).ToList();
            }
        }

        [Display(Name = "View Name")]
        public List<string> AvailableViewNames { get; set; }


        public PortfolioPictureModel AddPictureModel { get; set; }
        public List<PortfolioPictureModel> Pictures { get; set; }


        public class PortfolioPictureModel
        {
            public int PortfolioId { get; set; }
            public int PictureId { get; set; }

            [Display(Name = "Picture")]
            public string PictureUrl { get; set; }

            [Display(Name = "Display Order")]
            public int DisplayOrder { get; set; }
        }
    }

    public class PortfolioDetailModel
    {
        public PortfolioDetailModel()
        {
            RelatedPortfolios = new List<PortfolioModel>(); 
        }

        public int Id { get; set; }
        public string PicturePath { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string Url { get; set; }
        public string CategoryName { get; set; }
        public string CategoryUrl { get; set; }
        public int ViewCount { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime? UpdateDate { get; set; }
        public string PortfolioFormat { get; set; }
        public string PortfolioFormatValue { get; set; }

        public ApplicationUser User { get; set; }
        public virtual ICollection<MediaStorage> Pictures { get; set; } 
        public IEnumerable<PortfolioModel> RelatedPortfolios { get; set; }
    }

    public class PortfolioSearchModel
    {
        public string Term { get; set; }
    }
}