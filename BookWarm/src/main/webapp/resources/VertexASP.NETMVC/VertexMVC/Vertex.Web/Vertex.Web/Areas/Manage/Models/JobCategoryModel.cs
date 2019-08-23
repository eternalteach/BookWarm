using System.ComponentModel.DataAnnotations;

namespace Vertex.Web.Areas.Manage.Models
{
    public class JobCategoryModel
    {
        public int Id { get; set; }

        [Display(Name = "Name")]
        [Required(ErrorMessage = "Please enter the name.")]
        public string Name { get; set; }

        [Display(Name = "Job Count")]
        public int JobCount { get; set; }

        [Display(Name = "Active")]
        public bool IsActive { get; set; }
    } 
}