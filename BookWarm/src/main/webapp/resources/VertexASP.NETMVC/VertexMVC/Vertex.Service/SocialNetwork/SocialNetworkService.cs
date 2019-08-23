using System.Collections.Generic;
using Vertex.Core.Entities;
using Vertex.Data;
using System.Linq;
using System;

namespace Vertex.Service
{
    public class SocialNetworkService : ISocialNetworkService
    {
        #region Fields

        private readonly IRepository<SocialNetwork> socialNetworkRepository;

        #endregion Fields

        #region Ctor

        public SocialNetworkService(IRepository<SocialNetwork> _socialNetworkRepository)
        {
            socialNetworkRepository = _socialNetworkRepository;
        }

        #endregion Ctor

        #region Methods

        public SocialNetwork GetById(int id)
        {
            return socialNetworkRepository.Find(x => x.Id == id);
        }

        public bool Delete(SocialNetwork socialNetwork)
        {
            return socialNetworkRepository.Delete(socialNetwork);
        }

        public IEnumerable<SocialNetwork> GetByEntity(int entityId, string entityName)
        {
            return (from p in socialNetworkRepository.Table
                    where p.EntityId == entityId.ToString() && p.EntityName == entityName
                    orderby p.OrderNo ascending
                    select p).ToList();
        }

        public IEnumerable<SocialNetwork> GetByEntity(string entityId, string entityName)
        {
            return (from p in socialNetworkRepository.Table
                    where p.EntityId == entityId && p.EntityName == entityName
                    orderby p.OrderNo ascending
                    select p).ToList();
        }

        public bool Update(SocialNetwork socialNetwork)
        {
            return socialNetworkRepository.Update(socialNetwork);
        }

        public bool Insert(SocialNetwork socialNetwork)
        {
            return socialNetworkRepository.Insert(socialNetwork);
        }

        public bool Save(SocialNetwork socialNetwork)
        {
            var sc = socialNetworkRepository.Find(x => x.EntityId == socialNetwork.EntityId && x.EntityName == socialNetwork.EntityName && x.Name == socialNetwork.Name);
            if (sc == null)
            {
                return socialNetworkRepository.Insert(socialNetwork);
            }
            else
            {
                sc.WebAddress = socialNetwork.WebAddress;
                sc.OrderNo = socialNetwork.OrderNo;
                return socialNetworkRepository.Update(sc);
            } 
        }

        #endregion Methods
    }
}