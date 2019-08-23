using System.Collections.Generic;
using System.Linq;
using Vertex.Core;
using Vertex.Core.Cache;
using Vertex.Core.Entities;
using Vertex.Core.Extensions;
using Vertex.Data;

namespace Vertex.Service
{
    public class PostService : IPostService
    {
        #region Fields

        private readonly IRepository<Post> postRepository;
        private readonly IRepository<Comment> commentRepository;
        private readonly ICacheManager cacheManager;
        private readonly ICategoryService categoryService;
        private readonly IPostTagService tagService;
        private readonly IUrlService urlService;
        private readonly ApplicationUserService userService;
        private readonly IMediaStorageService mediaStorageService;

        #endregion Fields

        #region Ctor

        public PostService(IRepository<Post> _postRepository,
            IRepository<Comment> _commentRepository,
            ICacheManager _cacheManager,
            IMediaStorageService _mediaStorageService,
            ICategoryService _categoryService,
            IPostTagService _tagService,
            IUrlService _urlService,
            ApplicationUserService _userService)
        {
            postRepository = _postRepository;
            commentRepository = _commentRepository;
            cacheManager = _cacheManager;
            mediaStorageService = _mediaStorageService;
            categoryService = _categoryService;
            tagService = _tagService;
            urlService = _urlService;
            userService = _userService;
        }

        #endregion Ctor

        #region Methods

        public IEnumerable<Post> GetPosts()
        {
            var posts = (from p in postRepository.TableNoTracking
                         where !p.IsDelete
                         orderby p.CreateDateUtc descending
                         select p).ToList();

            foreach (var post in posts)
                this.SetPost(post);

            return posts;
        }

        public Post GetById(int id)
        {
            var p = postRepository.Find(x => x.Id == id);
            this.SetPost(p);
            return p;
        }

        public IEnumerable<Post> GetActives()
        {
            var posts = this.GetPosts();
            return (from p in posts
                    where p.IsActive && !p.IsDelete
                    orderby p.CreateDateUtc descending
                    select p);
        }

        public IEnumerable<Post> GetActives(int categoryId)
        {
            var posts = this.GetPosts();
            return (from p in posts
                    where p.CategoryId == categoryId &&
                    p.IsActive && !p.IsDelete
                    orderby p.CreateDateUtc descending
                    select p).ToList();
        }

        public IEnumerable<Post> GetActives(string userId)
        {
            var posts = this.GetPosts();
            return (from p in posts
                    where p.UserId == userId &&
                    p.IsActive && !p.IsDelete
                    orderby p.CreateDateUtc descending
                    select p).ToList();
        }

        public IEnumerable<Post> GetLatestPosts()
        {
            var posts = this.GetActives();
            return (from p in posts
                    orderby p.CreateDateUtc descending
                    select p).Take(10).ToList();
        }

        public IEnumerable<Post> GetPopularPosts()
        {
            var posts = this.GetPosts();
            return (from p in posts
                    where p.IsActive && !p.IsDelete
                    orderby p.ViewCount descending
                    select p).Take(10).ToList();
        }

        public IEnumerable<Post> GetRelatedPosts(int categoryId, int postId)
        {
            var posts = this.GetPosts();
            return (from p in posts
                    where p.CategoryId == categoryId && p.Id != postId &&
                    p.IsActive && !p.IsDelete
                    orderby p.ViewCount descending
                    select p).Take(10).ToList();
        }

        public IEnumerable<Comment> GetComments(int postId, bool? approved)
        {
            if (approved.HasValue)
            {
                return (from p in commentRepository.TableNoTracking
                        where p.PostId == postId && (p.ParentId == 0 || p.ParentId == null) && p.Approved == approved.Value
                        orderby p.CommentDateUtc ascending
                        select p).ToList();
            }
            return (from p in commentRepository.TableNoTracking
                    where p.PostId == postId && (p.ParentId == 0 || p.ParentId == null)
                    orderby p.CommentDateUtc ascending
                    select p).ToList();
        }

        public IEnumerable<Comment> GetWaitingForApproveComments()
        {
            return (from p in commentRepository.TableNoTracking
                    where p.Approved == false
                    orderby p.CommentDateUtc ascending
                    select p).ToList();
        }

        public IEnumerable<Comment> GetChildComments(int postId, int parentId, bool? approved)
        {
            if (approved.HasValue)
            {
                return (from p in commentRepository.TableNoTracking
                        where p.PostId == postId && p.ParentId == parentId && p.Approved == approved.Value
                        orderby p.CommentDateUtc ascending
                        select p).ToList();
            }
            return (from p in commentRepository.TableNoTracking
                    where p.PostId == postId && p.ParentId == parentId
                    orderby p.CommentDateUtc ascending
                    select p).ToList();
        }

        public int GetCommentCount(int postId, bool? approved)
        {
            if (approved.HasValue)
                return commentRepository.TableNoTracking.Count(x => x.PostId == postId && x.Approved == approved);

            return commentRepository.TableNoTracking.Count(x => x.PostId == postId);
        }

        public IEnumerable<Comment> GetLatestComments()
        {
            return commentRepository.TableNoTracking
                .OrderByDescending(x => x.CommentDateUtc)
                .Where(s => s.Approved)
                .GroupBy(x => x.PostId)
                .Select(x => x.FirstOrDefault()).ToList();
        }

        public Comment GetCommentById(int commentId)
        {
            return commentRepository.TableNoTracking.Where(s => s.Id == commentId).FirstOrDefault();
        }

        public int GetCount(int categoryId)
        {
            return (from p in postRepository.TableNoTracking
                    where p.CategoryId == categoryId &&
                    p.IsActive && !p.IsDelete
                    orderby p.CreateDateUtc descending
                    select p).Count();
        }

        public IEnumerable<Post> SearchPosts(string term)
        {
            return (from p in postRepository.TableNoTracking
                    where (p.IsActive && !p.IsDelete) &&
                    (p.Title.Contains(term) || p.Description.Contains(term))
                    orderby p.CreateDateUtc descending
                    select p).ToList();
        }

        public bool Update(Post post)
        {
            var result = postRepository.Update(post);

            if (result)
                this.ClearCache(post);
            return result;
        }

        public bool Insert(Post post)
        {
            var result = postRepository.Insert(post);
            if (result)
                this.ClearCache(post);
            return result;
        }

        public bool Delete(Post post)
        {
            var pictureId = post.PictureId.HasValue ? post.PictureId.Value : 0;

            var deleted = postRepository.Delete(post);
            if (deleted)
            {
                mediaStorageService.Delete(pictureId);
            }

            return deleted;
        }

        public bool SaveComment(Comment comment)
        {
            if (comment == null || comment.PostId <= 0)
                return false;

            if (comment.Id > 0)
                return commentRepository.Update(comment);

            return commentRepository.Insert(comment);
        }

        public bool DeleteComment(Comment comment)
        {
            var com = commentRepository.Find(s => s.Id == comment.Id);
            if (com != null)
            {
                var result = commentRepository.Delete(com);
                return result;
            }
            return true;
        }

        #endregion Methods

        #region Helper Methods

        private void SetPost(Post post)
        {
            if (post == null)
                return;

            post.Url = cacheManager.Get(CacheConstant.POST_URL_ITEM.FormatInvariant(post.Id), () =>
            {
                return urlService.GetUrl(post.Id, nameof(Post));
            });
            post.Picture = cacheManager.Get(CacheConstant.MEDIA_STORAGE_ITEM.FormatInvariant(post.PictureId), () =>
            {
                return mediaStorageService.GetById(post.PictureId);
            });
            post.Category = cacheManager.Get(CacheConstant.CATEGORY_ITEM.FormatInvariant(post.CategoryId), () =>
            {
                return categoryService.GetById(post.CategoryId);
            });
            post.PostTags = cacheManager.Get(CacheConstant.POST_TAG_ITEM.FormatInvariant(post.Id), () =>
            {
                return tagService.GetTagsByPostId(post.Id).ToList();
            });
            post.User = cacheManager.Get(CacheConstant.USER_ID.FormatInvariant(post.UserId), () =>
            {
                return userService.GetById(post.UserId);
            });

            if (post.User != null)
                post.UserName = post.User.UserName;

            post.Comments = new List<Comment>();
        }

        private void ClearCache(Post post)
        {
            cacheManager.Remove(CacheConstant.POST_URL_ITEM.FormatInvariant(post.Id));
            cacheManager.Remove(CacheConstant.MEDIA_STORAGE_ITEM.FormatInvariant(post.PictureId));
            cacheManager.Remove(CacheConstant.CATEGORY_ITEM.FormatInvariant(post.CategoryId));
            cacheManager.Remove(CacheConstant.POST_TAG_ITEM.FormatInvariant(post.Id));
            cacheManager.Remove(CacheConstant.USER_ID.FormatInvariant(post.UserId));
            if (post.User != null)
            {
                cacheManager.Remove(CacheConstant.MEDIA_STORAGE_ITEM.FormatInvariant(post.User.PictureId));
                cacheManager.Remove(CacheConstant.SOCIAL_NETWORK_ITEM.FormatInvariant(post.User.Id));
            }
        }

        #endregion Helper Methods
    }
}