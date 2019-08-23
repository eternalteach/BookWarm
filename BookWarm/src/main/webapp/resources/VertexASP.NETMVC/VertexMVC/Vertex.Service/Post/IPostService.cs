using Vertex.Core.Entities;
using System.Collections.Generic;

namespace Vertex.Service
{
    public interface IPostService
    {
        IEnumerable<Post> GetPosts();
        Post GetById(int Id);
        IEnumerable<Post> GetActives();
        IEnumerable<Post> GetActives(int categoryId);
        IEnumerable<Post> GetActives(string userId);
        IEnumerable<Post> GetLatestPosts();
        IEnumerable<Post> GetPopularPosts();
        IEnumerable<Post> GetRelatedPosts(int categoryId, int postId);
        IEnumerable<Comment> GetComments(int postId, bool? approved);
        IEnumerable<Comment> GetWaitingForApproveComments();
        Comment GetCommentById(int commentId);
        IEnumerable<Comment> GetChildComments(int postId, int parentId, bool? approved);
        int GetCommentCount(int postId, bool? approved);
        IEnumerable<Comment> GetLatestComments();
        int GetCount(int categoryId);
        IEnumerable<Post> SearchPosts(string term);
        bool Update(Post post);
        bool Insert(Post post);
        bool Delete(Post post);
        bool SaveComment(Comment comment);
        bool DeleteComment(Comment comment);
    }
}