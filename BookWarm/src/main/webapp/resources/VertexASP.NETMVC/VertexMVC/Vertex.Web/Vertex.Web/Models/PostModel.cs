using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web.Mvc;
using Vertex.Core.Entities;

namespace Vertex.Web.Models
{ 
    public class PostModel
    {
        public PostModel()
        {
            this.PostFormat = PostFormat.Standard;
        }

        public int Id { get; set; }
        public string Url { get; set; }
        public int? PictureId { get; set; }

        [Display(Name = "View Name")]
        public string ViewName { get; set; }

        [Display(Name = "Post Type")]
        public PostFormat PostFormat { get; set; }

        [Display(Name = "Value")]
        public string PostFormatValue { get; set; }        
        
        [MaxLength(200)]
        [Display(Name = "Title")]
        public string Title { get; set; }

        [Display(Name = "Full Content")]
        public string FullContent { get; set; }

        [Display(Name = "Category")]
        [Required(ErrorMessage = "Select Category")]
        public int CategoryId { get; set; }

        [Display(Name = "Active")]
        public bool IsActive { get; set; }

        [Display(Name = "Allow Comment")]
        public bool AllowComment { get; set; }

        [Display(Name = "Deleted")]
        public bool IsDelete { get; set; }

        [Display(Name = "Approve Comments")]
        public bool ApproveComment { get; set; }

        [Display(Name = "Create Date")]
        public DateTime CreateDate { get; set; }

        [Display(Name = "Update Date")]
        public DateTime? UpdateDate { get; set; }

        public string[] Tags { get; set; }
        public MultiSelectList AvailableTags { get; set; }


        public string UserId { get; set; }
        [Display(Name = "Author")]
        public string UserName { get; set; }
        public string UserUrl { get; set; }
        public int ViewCount { get; set; }

        [Display(Name = "Comments")]
        public int CommentCount { get; set; }
        public string CategoryName { get; set; }
        public string CategoryUrl { get; set; }

        [Display(Name = "Picture")]
        public string PicturePath { get; set; }

        public ApplicationUser User { get; set; }
        public MediaStorage UserAvatar { get; set; }
        public IEnumerable<Category> Categories { get; set; }

        public List<string> PostFormats
        {
            get
            {
                return Enum.GetNames(typeof(PostFormat)).ToList();
            }
        }

        [Display(Name = "View Name")]
        public List<string> AvailableViewNames { get; set; }

        public List<CommentListModel> Comments { get; set; }
    }

    public class PostDetailModel
    {
        public PostDetailModel()
        {
            Tags = new List<TagModel>();
            RelatedPosts = new List<PostModel>();
            Comments = new List<CommentListModel>();
        }

        public int Id { get; set; }
        public string PicturePath { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string Url { get; set; }
        public string CategoryName { get; set; }
        public string CategoryUrl { get; set; }
        public int ViewCount { get; set; }
        public int CommentCount { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime? UpdateDate { get; set; }
        public bool AllowComment { get; set; }
        public string PostFormat { get; set; }
        public string PostFormatValue { get; set; }
        public bool ApproveComment { get; set; }

        public ApplicationUser User { get; set; }
        public IEnumerable<TagModel> Tags { get; set; }
        public IEnumerable<PostModel> RelatedPosts { get; set; }
        public IEnumerable<CommentListModel> Comments { get; set; }
    }

    public class CommentModel
    {
        public string FullName { get; set; }
        public string PostName { get; set; }
        public string PostUrl { get; set; }
        public string Comment { get; set; }
    }

    public class CommentListModel
    {
        public int Id { get; set; }
        public int PostId { get; set; }
        public string UserId { get; set; }
        public string UserAvatarUrl { get; set; }
        public int? ParentId { get; set; }
        public string FullName { get; set; }
        public string Comment { get; set; }
        public string CreateDate { get; set; }
        public bool Approved { get; set; }
        public bool IsMember { get { return !string.IsNullOrEmpty(this.UserId); } }
        public IEnumerable<CommentListModel> ChildComments { get; set; }
    }

    public class TagModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public class PostSearchModel
    {
        public string Term { get; set; }
    }

    public class AddCommentModel
    { 
        public int PostId { get; set; }
        public int? ParentId { get; set; }
        public string UserId { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public bool ApproveComment { get; set; }

        [AllowHtml]
        public string Content { get; set; } 
    }
}