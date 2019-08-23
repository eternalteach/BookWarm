using Vertex.Core.Entities; 

namespace Vertex.Service
{
    public interface IUrlService
    {
        UrlRecord GetById(int Id);
        UrlRecord GetByUrl(string url);
        UrlRecord GetByUrl(string url, string entityName);
        UrlRecord GetByEntity(int entityId, string entityName);
        string GetUrl(int entityId, string entityName);
        bool Save(UrlRecord urlRecord);
    }
}