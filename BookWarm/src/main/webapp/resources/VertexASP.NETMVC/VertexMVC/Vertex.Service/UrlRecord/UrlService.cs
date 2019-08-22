using Vertex.Core.Entities; 
using Vertex.Data;
using System.Linq;
using System;

namespace Vertex.Service
{
    public class UrlService : IUrlService
    {
        #region Fields
        private readonly IRepository<UrlRecord> urlRepository;
        #endregion

        #region Ctor
        public UrlService(IRepository<UrlRecord> _urlRepository)
        {
            urlRepository = _urlRepository;
        }
        #endregion

        #region Methods
        public UrlRecord GetById(int Id)
        {
            return urlRepository.Find(x => x.Id == Id);
        }

        public UrlRecord GetByUrl(string url)
        {
            return urlRepository.Find(x => x.Slug == url);
        }

        public UrlRecord GetByUrl(string url, string entityName)
        {
            return urlRepository.Find(x => x.Slug == url && x.EntityName == entityName);
        }

        public UrlRecord GetByEntity(int entityId, string entityName)
        {
            return (from x in urlRepository.Table
                    where x.EntityId == entityId && x.EntityName == entityName
                    orderby x.Id descending
                    select x).FirstOrDefault();
        }

        public string GetUrl(int entityId, string entityName)
        {
            var urlRecord = (from x in urlRepository.Table
                             where x.EntityId == entityId && x.EntityName == entityName
                             orderby x.Id descending
                             select x).FirstOrDefault();

            if (urlRecord != null)
            {
                if (urlRecord.EntityName == nameof(Portfolio))
                    return string.Format("/portfolio-item/{0}", urlRecord.Slug);

                if (urlRecord.EntityName == nameof(PortfolioCategory))
                    return string.Format("/portfolio-category/{0}", urlRecord.Slug);

                if (urlRecord.EntityName == nameof(Job))
                    return string.Format("/job-detail/{0}", urlRecord.Slug);

                return urlRecord.Slug;
            }
                

            return string.Empty;
        }

        public bool Save(UrlRecord url)
        {
            if (url == null || string.IsNullOrEmpty(url.Slug))
                return false;

            var m = (from t in urlRepository.Table 
                     where t.Slug.Equals(url.Slug, StringComparison.InvariantCultureIgnoreCase) &&
                          t.EntityId == url.EntityId && t.EntityName == url.EntityName
                     select t).FirstOrDefault();
             
            if (m == null)
                return urlRepository.Insert(url);
            return true;
        }

        #endregion
    }
}