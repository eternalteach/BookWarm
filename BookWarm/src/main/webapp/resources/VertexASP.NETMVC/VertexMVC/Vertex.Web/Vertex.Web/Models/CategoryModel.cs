using System.ComponentModel.DataAnnotations;

namespace Vertex.Web.Models
{
    public class CategoryModel
    {
        public int Id { get; set; }

        [Display(Name = "Name")]
        [Required(ErrorMessage = "Please enter the name.")]
        public string Name { get; set; }

        public string Url { get; set; }

        [Display(Name = "Post Count")]
        public int PostCount { get; set; }

        [Display(Name = "Active")]
        public bool IsActive { get; set; }
    }

    public class CategoryDetailModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
}