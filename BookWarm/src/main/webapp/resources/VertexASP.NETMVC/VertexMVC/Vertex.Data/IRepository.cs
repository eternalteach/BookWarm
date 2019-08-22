using Vertex.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Vertex.Data
{
    public interface IRepository<T> where T : BaseEntity
    {
        bool Insert(T Entity);
        bool Insert(IEnumerable<T> Entities);
        bool InsertToMapping(T entity);
        Task<bool> InsertAsync(T Entity);
        Task<bool> InsertAsync(IEnumerable<T> Entities);
        bool Update(T Entity);
        bool Update(IEnumerable<T> entites);
        Task<bool> UpdateAsync(T Entity);
        Task<bool> UpdateAsync(IEnumerable<T> entites);
        bool InsertOrUpdate(T entity);
        bool InsertOrUpdate(IEnumerable<T> entites);
        Task<bool> InsertOrUpdateAsync(T entity);
        Task<bool> InsertOrUpdateAsync(IEnumerable<T> entites);
        bool Delete(T Entity);
        bool Delete(IEnumerable<T> Entities);
        bool Delete(object Id);
        Task<bool> DeleteAsync(T Entity);
        Task<bool> DeleteAsync(IEnumerable<T> Entities);
        Task<bool> DeleteAsync(object Id);
        T Find(int Id);
        T Find(Expression<Func<T, bool>> filter);
        Task<T> FindAsync(object Id);
        Task<T> FindAsync(Expression<Func<T, bool>> filter);
        IEnumerable<T> Get(Expression<Func<T, bool>> filter);
        Task<IEnumerable<T>> GetAsync(Expression<Func<T, bool>> filter);
        IQueryable<T> Table { get; }
        IQueryable<T> TableNoTracking { get; }
    }
}