using Vertex.Core.Entities;
using Vertex.Data;
using System.Collections.Generic;
using System.Linq;
using System;

namespace Vertex.Service
{
    public class PostTagService : IPostTagService
    {
        #region Fields
        private readonly IRepository<PostTag> tagRepository;
        private readonly IRepository<PostTagMapping> tagMappingRepository;
        #endregion

        #region Ctor
        public PostTagService(IRepository<PostTag> _postTagRepository,
            IRepository<PostTagMapping> _postTagMappingRepository)
        {
            tagRepository = _postTagRepository;
            tagMappingRepository = _postTagMappingRepository;
        }
        #endregion

        #region Methods

        public IEnumerable<PostTag> GetAllTags()
        {
            return tagRepository.Table.ToList();
        }

        public IEnumerable<PostTag> GetTagsByPostId(int postId)
        {
            return (from t in tagRepository.Table
                    join tp in tagMappingRepository.Table on t.Id equals tp.TagId
                    where tp.PostId == postId
                    select t).ToList();
        }

        public PostTag GetByName(string tagName)
        {
            return tagRepository.Find(s => s.Name.Equals(tagName, StringComparison.CurrentCultureIgnoreCase));
        }

        public bool Save(int postId, string tagName)
        {
            var tag = this.GetByName(tagName);
            if (tag != null)
            {
                if (tagMappingRepository.Find(s => s.TagId == tag.Id && s.PostId == postId) == null)
                {
                    var result = tagMappingRepository.Insert(new PostTagMapping()
                    {
                        PostId = postId,
                        TagId = tag.Id
                    });
                    return result;
                }
            }
            return true;
        }

        public bool Delete(int postId, string tagName)
        {
            var tag = this.GetByName(tagName);
            if (tag != null)
            {
                var tagMapping = tagMappingRepository.Find(s => s.PostId == postId && s.TagId == tag.Id);
                if (tagMapping != null)
                {
                    var result = tagMappingRepository.Delete(tagMapping);
                    return result;
                }
            }
            return true;
        }

        public bool Save(string tagName)
        {
            var tag = this.GetByName(tagName);
            if (tag == null)
            {
                var result = tagRepository.Insert(new PostTag() { Name = tagName });
                return result;
            }
            return true;
        }

        public bool Delete(string tagName)
        {
            var tag = this.GetByName(tagName);
            if (tag != null)
            {
                var tagMaps = tagMappingRepository.Get(s => s.TagId == tag.Id);
                tagMappingRepository.Delete(tagMaps);

                var result = tagRepository.Delete(tag);
                return result;
            }
            return true;
        }



        #endregion
    }
}