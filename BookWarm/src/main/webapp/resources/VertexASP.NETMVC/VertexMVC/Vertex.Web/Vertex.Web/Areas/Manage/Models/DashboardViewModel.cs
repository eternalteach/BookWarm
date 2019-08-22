using System.Collections.Generic;

namespace Vertex.Web.Areas.Manage.Models
{
    public class DashboardViewModel
    {
        public DashboardViewModel()
        {
            this.Contacts = new List<ContactManageModel>();
            this.Comments = new List<CommentListModel>();
            this.ApplyJobs = new List<ApplyJobModel>();
            this.LatestUsers = new List<ApplicationUserModel>();
        }

        public List<ContactManageModel> Contacts { get; set; }
        public List<CommentListModel> Comments { get; set; }
        public List<ApplyJobModel> ApplyJobs { get; set; }
        public List<ApplicationUserModel> LatestUsers { get; set; }
    }
}