using System.Collections.Generic;
using Vertex.Core.Entities; 

namespace Vertex.Service
{
    public interface ISubscriberService
    {
        Subscriber GetById(int id);
        IEnumerable<Subscriber> GetSubscribers(); 
        bool Save(Subscriber socialNetwork);
        bool Delete(Subscriber subscriber);
        Subscriber GetByEmail(string email);
    }
}