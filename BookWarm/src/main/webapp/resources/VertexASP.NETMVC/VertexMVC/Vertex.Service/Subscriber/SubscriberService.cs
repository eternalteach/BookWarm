using System.Collections.Generic;
using System.Linq;
using Vertex.Core.Entities;
using Vertex.Data;

namespace Vertex.Service
{
    public class SubscriberService : ISubscriberService
    {
        #region Fields

        private readonly IRepository<Subscriber> subscriberRepository;

        #endregion Fields

        #region Ctor

        public SubscriberService(IRepository<Subscriber> _subscriberRepository)
        {
            subscriberRepository = _subscriberRepository;
        }

        #endregion Ctor

        #region Methods

        public Subscriber GetById(int id)
        {
            return subscriberRepository.Find(x => x.Id == id);
        }

        public bool Delete(Subscriber subscriber)
        {
            return subscriberRepository.Delete(subscriber);
        }

        public IEnumerable<Subscriber> GetSubscribers()
        {
            return (from p in subscriberRepository.Table
                    orderby p.SubscribeDateUtc descending
                    select p).ToList();
        }

        public Subscriber GetByEmail(string email)
        {
            return (from p in subscriberRepository.Table
                    where p.Email.Equals(email, System.StringComparison.CurrentCultureIgnoreCase)
                    orderby p.SubscribeDateUtc descending
                    select p).FirstOrDefault();
        }

        public bool Save(Subscriber subscriber)
        { 
            if (subscriber.Id <= 0)
            {
                return subscriberRepository.Insert(subscriber);
            }
            else
            {
                return subscriberRepository.Update(subscriber);
            } 
        }

        #endregion Methods
    }
}