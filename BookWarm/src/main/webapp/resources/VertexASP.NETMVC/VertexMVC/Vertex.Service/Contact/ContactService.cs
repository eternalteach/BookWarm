using System.Collections.Generic;
using Vertex.Core.Entities;
using Vertex.Data;
using System.Linq;

namespace Vertex.Service
{
    public class ContactService : IContactService
    {
        #region Fields

        private readonly IRepository<Contact> contactRepository;

        #endregion Fields

        #region Ctor

        public ContactService(IRepository<Contact> _contactRepository)
        {
            contactRepository = _contactRepository;
        }

        #endregion Ctor

        #region Methods

        public Contact GetById(int Id)
        {
            return contactRepository.Find(x => x.Id == Id);
        }

        public IEnumerable<Contact> GetContacts()
        {
            return (from c in contactRepository.Table
                    where c.IsDeleted == false
                    orderby c.DateUtc descending
                    select c).ToList();
        }

        public IEnumerable<Contact> GetDeletedContacts()
        {
            return (from c in contactRepository.Table
                    where c.IsDeleted == true
                    orderby c.DateUtc descending
                    select c).ToList();
        }

        public bool Save(Contact contact)
        {
            if (contact == null)
                return false;

            if (contact.Id > 0)
                return contactRepository.Update(contact);
            else
                return contactRepository.Insert(contact);
        }

        #endregion Methods
    }
}