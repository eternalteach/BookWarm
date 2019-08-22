using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Vertex.Core.Entities;

namespace Vertex.Web.Models
{
    public class JobModel
    {
        public JobModel()
        {
        }

        public int Id { get; set; }

        [MaxLength(200)]
        [Display(Name = "Title")]
        public string Title { get; set; }

        [Display(Name = "Description")]
        public string Description { get; set; }

        public string Location { get; set; }

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

        public int ViewCount { get; set; }

        public decimal? SallaryMin { get; set; }
        public decimal? SallaryMax { get; set; }

        public string WorkType { get; set; }
        [Display(Name = "Work Type")]
        public List<string> AvailableWorkTypes
        {
            get
            {
                return new List<string>() { "Full Time", "Part Time", "Contractor", "Intern" };
            }
        }

        [Display(Name = "Category")]
        public string CategoryName { get; set; }
        public IEnumerable<JobCategory> Categories { get; set; }
        public List<ApplyJobModel> ApplyJobs { get; set; }

        [Display(Name = "Apply Jobs")]
        public int ApplyJobCount
        {
            get
            {
                return ApplyJobs == null ? 0 : ApplyJobs.Count;
            }
        }
        public string Url { get; internal set; }
    }

    public class JobDetailModel
    {
        public JobDetailModel()
        {
            this.RelatedJobs = new List<JobModel>();
            this.ApplyJob = new ApplyJobModel();
        }

        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Url { get; set; }
        public string CategoryName { get; set; }
        public int ViewCount { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime? UpdateDate { get; set; }

        public IEnumerable<JobModel> RelatedJobs { get; set; }
        public decimal? SallaryMax { get; internal set; }
        public decimal? SallaryMin { get; internal set; }
        public string Location { get; internal set; }
        public string WorkType { get; internal set; }

        public ApplyJobModel ApplyJob { get; set; }
    }

    public class ApplyJobModel
    {
        public int Id { get; set; }

        public int JobId { get; set; }
        public string JobName { get; set; }

        [Display(Name = "Full Name")]
        public string FullName { get; set; } 
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Message { get; set; }

        [Display(Name = "Website, Blog or Portfolio")]
        public string Website { get; set; }

        public bool IsActive { get; set; }
        public DateTime ApplyDate { get; set; }

        public bool IsRead { get; set; }
    }
}