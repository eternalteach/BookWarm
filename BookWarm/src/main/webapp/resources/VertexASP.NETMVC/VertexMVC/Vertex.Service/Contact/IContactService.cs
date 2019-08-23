using System.Collections.Generic;
using Vertex.Core.Entities;

namespace Vertex.Service
{
    public interface IContactService
    {
        Contact GetById(int Id);
        IEnumerable<Contact> GetContacts();
        IEnumerable<Contact> GetDeletedContacts();

        bool Save(Contact contact);
    }
}