using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Vertex.Core;

namespace Vertex.Data
{
    public class Repository<T> : IRepository<T> where T : BaseEntity
    {
        #region Fields
        private IDbSet<T> _entity;
        private readonly IDataContext context;

        private IDbSet<T> Entity
        {
            get
            {
                if (_entity == null)
                    _entity = context.Set<T>();

                return _entity;
            }
        }
        #endregion

        #region Ctore
        public Repository(IDataContext _context)
        {
            context = _context;
            context.ProxyCreationEnabled = false;
            context.LazyLoadingEnabled = false;
            //context.AutoDetectChangesEnabled = false;
            //context.ValidateOnSaveEnabled = false;
        }
        #endregion

        #region Insert
        public bool Insert(T entity)
        {
            try
            {
                if (entity == null)
                    throw new NullReferenceException(nameof(entity));

                Entity.Add(entity);
                return Save();
            }
            catch (DbEntityValidationException dbEx)
            {
                throw new Exception(GetFullErrorText(dbEx), dbEx);
            }
        }

        public bool InsertToMapping(T entity)
        {
            try
            {
                if (entity == null)
                    throw new NullReferenceException(nameof(entity));

                Entity.Add(entity);
                context.Entry(entity).State = EntityState.Added;
                return Save();
            }
            catch (DbEntityValidationException dbEx)
            {
                throw new Exception(GetFullErrorText(dbEx), dbEx);
            }
        }

        public bool Insert(IEnumerable<T> entities)
        {
            try
            {
                if (entities == null)
                    throw new NullReferenceException(nameof(entities));

                foreach (var entity in entities)
                {
                    Entity.Add(entity);
                }

                return Save();
            }
            catch (DbEntityValidationException dbEx)
            {
                throw new Exception(GetFullErrorText(dbEx), dbEx);
            }
        }
        #endregion

        #region Insert Async
        public async Task<bool> InsertAsync(T entity)
        {
            try
            {
                if (entity == null)
                    throw new NullReferenceException(nameof(entity));

                Entity.Add(entity);
                return await SaveAsync();
            }
            catch (DbEntityValidationException dbEx)
            {
                throw new Exception(GetFullErrorText(dbEx), dbEx);
            }
        }

        public async Task<bool> InsertAsync(IEnumerable<T> entities)
        {
            try
            {
                if (entities == null)
                    throw new NullReferenceException(nameof(entities));

                foreach (var entity in entities)
                {
                    Entity.Add(entity);
                }

                return await SaveAsync();
            }
            catch (DbEntityValidationException dbEx)
            {
                throw new Exception(GetFullErrorText(dbEx), dbEx);
            }
        }
        #endregion

        #region Update
        public bool Update(T entity)
        {
            try
            {
                if (entity == null)
                    throw new NullReferenceException(nameof(entity));

                context.Entry(entity).State = EntityState.Modified;
                return Save();
            }
            catch (DbEntityValidationException dbEx)
            {
                throw new Exception(GetFullErrorText(dbEx), dbEx);
            }
        }

        public bool Update(IEnumerable<T> Entites)
        {
            try
            {
                if (Entites == null && Entites.Count() <= 0)
                    throw new NullReferenceException(nameof(Entites));

                foreach (var entity in Entites)
                {
                    context.Entry(entity).State = EntityState.Modified;
                }
                return Save();
            }
            catch (DbEntityValidationException dbEx)
            {
                throw new Exception(GetFullErrorText(dbEx), dbEx);
            }
        }
        #endregion

        #region Update Async
        public async Task<bool> UpdateAsync(T entity)
        {
            try
            {
                if (entity == null)
                    throw new NullReferenceException(nameof(entity));

                context.Entry(entity).State = EntityState.Modified;
                return await SaveAsync();
            }
            catch (DbEntityValidationException dbEx)
            {
                throw new Exception(GetFullErrorText(dbEx), dbEx);
            }
        }
        public async Task<bool> UpdateAsync(IEnumerable<T> entites)
        {
            try
            {
                if (entites == null && entites.Count() <= 0)
                    throw new NullReferenceException(nameof(entites));

                foreach (var entity in entites)
                {
                    context.Entry(entity).State = EntityState.Modified;
                }
                return await SaveAsync();
            }
            catch (DbEntityValidationException dbEx)
            {
                throw new Exception(GetFullErrorText(dbEx), dbEx);
            }
        }
        #endregion

        #region InsertOrUpdate
        public bool InsertOrUpdate(T entity)
        {
            if (_entity.Any(x => x.Id == entity.Id))
                return Update(entity);
            else
                return Insert(entity);
        }

        public bool InsertOrUpdate(IEnumerable<T> entities)
        {
            int rowCount = 0;
            foreach (var item in entities)
            {
                if (InsertOrUpdate(item))
                    rowCount++;
            }
            return rowCount > 0;
        }
        #endregion

        #region InsertOrUpdate Async
        public async Task<bool> InsertOrUpdateAsync(T entity)
        {
            if (_entity.Any(x => x.Id == entity.Id))
                return await UpdateAsync(entity);
            else
                return await InsertAsync(entity);
        }

        public async Task<bool> InsertOrUpdateAsync(IEnumerable<T> entities)
        {
            int rowCount = 0;
            foreach (var item in entities)
            {
                if (InsertOrUpdate(item))
                    rowCount++;
            }
            return await Task.FromResult(rowCount > 0);
        }
        #endregion

        #region Delete
        public bool Delete(T entity)
        {
            try
            {
                if (entity == null)
                    throw new NullReferenceException(nameof(entity));

                Entity.Remove(entity);
                return Save();
            }
            catch (DbEntityValidationException dbEx)
            {
                throw new Exception(GetFullErrorText(dbEx), dbEx);
            }
        }

        //public bool DeleteFromMapping(T entity)
        //{
        //    try
        //    {
        //        if (entity == null)
        //            throw new NullReferenceException(nameof(entity));

        //        context.Entry(entity).State = EntityState.Deleted;
        //        Entity.Remove(entity); 
        //        return Save();
        //    }
        //    catch (DbEntityValidationException dbEx)
        //    {
        //        throw new Exception(GetFullErrorText(dbEx), dbEx);
        //    }
        //}

        public bool Delete(IEnumerable<T> entities)
        {
            try
            {
                if (entities == null)
                    throw new NullReferenceException(nameof(entities));

                foreach (var entity in entities)
                    Entity.Remove(entity);

                return Save();
            }
            catch (DbEntityValidationException dbEx)
            {
                throw new Exception(GetFullErrorText(dbEx), dbEx);
            }
        }

        public bool Delete(object Id)
        {
            try
            {
                if (Id == null)
                    throw new NullReferenceException(nameof(Id));

                T entity = Entity.Find(Id);

                if (entity == null)
                    throw new NullReferenceException(nameof(entity));

                return Delete(entity);
            }
            catch (DbEntityValidationException dbEx)
            {
                throw new Exception(GetFullErrorText(dbEx), dbEx);
            }
        }
        #endregion

        #region Delete Async
        public async Task<bool> DeleteAsync(T entity)
        {
            try
            {
                if (entity == null)
                    throw new NullReferenceException(nameof(entity));

                Entity.Remove(entity);
                return await SaveAsync();
            }
            catch (DbEntityValidationException dbEx)
            {
                throw new Exception(GetFullErrorText(dbEx), dbEx);
            }
        }

        public async Task<bool> DeleteAsync(IEnumerable<T> entities)
        {
            try
            {
                if (entities == null)
                    throw new NullReferenceException(nameof(entities));

                foreach (var entity in entities)
                    Entity.Remove(entity);

                return await SaveAsync();
            }
            catch (DbEntityValidationException dbEx)
            {
                throw new Exception(GetFullErrorText(dbEx), dbEx);
            }
        }

        public async Task<bool> DeleteAsync(object Id)
        {
            try
            {
                if (Id == null)
                    throw new NullReferenceException(nameof(Id));

                T entity = Entity.Find(Id);

                if (entity == null)
                    throw new NullReferenceException(nameof(entity));

                return await DeleteAsync(entity);
            }
            catch (DbEntityValidationException dbEx)
            {
                throw new Exception(GetFullErrorText(dbEx), dbEx);
            }
        }
        #endregion

        #region Query
        public T Find(int Id)
        {
            bool oldState = context.AutoDetectChangesEnabled;

            context.AutoDetectChangesEnabled = false;
            var result = Entity.Where(x => x.Id == Id).FirstOrDefault();
            context.AutoDetectChangesEnabled = oldState;

            return result;
        }

        public T Find(Expression<Func<T, bool>> filter)
        {
            bool oldState = context.AutoDetectChangesEnabled;

            context.AutoDetectChangesEnabled = false;
            var result = Entity.Where(filter).FirstOrDefault();
            context.AutoDetectChangesEnabled = oldState;

            return result;
        }

        public IEnumerable<T> Get(Expression<Func<T, bool>> filter)
        {
            bool oldState = context.AutoDetectChangesEnabled;

            context.AutoDetectChangesEnabled = false;
            var result = Entity.Where(filter);
            context.AutoDetectChangesEnabled = oldState;

            return result;
        }
        #endregion

        #region Query Async
        public async Task<T> FindAsync(object Id)
        {
            bool oldState = context.AutoDetectChangesEnabled;

            context.AutoDetectChangesEnabled = false;
            var result = Entity.Find(Id);
            context.AutoDetectChangesEnabled = oldState;

            return await Task.FromResult(result);
        }

        public async Task<T> FindAsync(Expression<Func<T, bool>> filter)
        {
            bool oldState = context.AutoDetectChangesEnabled;

            context.AutoDetectChangesEnabled = false;
            var result = Entity.Where(filter).FirstOrDefault();
            context.AutoDetectChangesEnabled = oldState;

            return await Task.FromResult(result);
        }

        public async Task<IEnumerable<T>> GetAsync(Expression<Func<T, bool>> filter)
        {
            bool oldState = context.AutoDetectChangesEnabled;

            context.AutoDetectChangesEnabled = false;
            var result = Entity.Where(filter);
            context.AutoDetectChangesEnabled = oldState;

            return await Task.FromResult(result);
        }
        #endregion

        #region Properties
        public IQueryable<T> Table
        {
            get
            {
                return Entity;
            }
        }

        public IQueryable<T> TableNoTracking
        {
            get
            {
                return Entity.AsNoTracking();
            }
        }
        public int Count
        {
            get
            {
                return _entity.Count();
            }
        }
        #endregion

        #region Other
        protected bool Save()
        {
            if (context != null)
                return context.SaveChanges() > 0;

            return false;
        }

        protected Task<bool> SaveAsync()
        {
            if (context != null)
                return Task.FromResult(context.SaveChangesAsync().Result > 0);

            return Task.FromResult(false);
        }

        protected string GetFullErrorText(DbEntityValidationException exc)
        {
            var errorMessage = string.Empty;
            foreach (var validationErrors in exc.EntityValidationErrors)
                foreach (var error in validationErrors.ValidationErrors)
                    errorMessage += string.Format("Property: {0} Error: {1}", error.PropertyName, error.ErrorMessage) + Environment.NewLine;
            return errorMessage;
        }
        #endregion
    }
}