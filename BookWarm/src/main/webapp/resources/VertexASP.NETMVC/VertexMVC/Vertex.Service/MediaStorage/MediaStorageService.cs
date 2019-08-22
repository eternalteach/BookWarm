using Vertex.Core.Entities;
using Vertex.Data;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System;

namespace Vertex.Service
{
    public class MediaStorageService : IMediaStorageService
    {
        private readonly IRepository<MediaStorage> mediaRepository;

        public MediaStorageService(IRepository<MediaStorage> _mediaRepository)
        {
            mediaRepository = _mediaRepository;
        }

        public virtual MediaStorage GetById(int? id)
        {
            string noPicture = "/Content/img/nophoto.jpg";
            if (id.HasValue == false || id <= 0)
                return new MediaStorage() { FilePath = noPicture, FileName = "NoName" };

            var media = mediaRepository.Find(x => x.Id == id);
            return media;
        }

        public string GetPictureUrl(int? id)
        {
            string noPicture = "/Content/img/nophoto.jpg";
            if (id.HasValue == false || id <= 0)
                return noPicture;

            var media = mediaRepository.Find(x => x.Id == id);
            if (media == null || string.IsNullOrEmpty(media.FilePath))
            {
                return noPicture;
            }
            return media.FilePath;
        }

        public IEnumerable<MediaStorage> GetByEntity(string entityId, string entityName)
        {
            return (from p in mediaRepository.Table
                    where p.EntityId == entityId && p.EntityName == entityName
                    orderby p.OrderNo ascending
                    select p).ToList();
        }

        public bool Save(MediaStorage media)
        {
            if (media.Id > 0)
            {
                return mediaRepository.Update(media);
            }
            else
            {
                return mediaRepository.Insert(media);
            }
        }

        public bool Delete(int id)
        {
            if (id <= 0)
                return true;

            var media = mediaRepository.Find(x => x.Id == id);
            if (media != null)
            {
                string path = System.Web.Hosting.HostingEnvironment.MapPath("~" + media.FilePath);
                if (File.Exists(path))
                {
                    try
                    {
                        File.Delete(path);
                        return mediaRepository.Delete(media);
                    }
                    catch (Exception)
                    {
                        return false;
                    }
                }
            }
            return true;
        }
    }
}