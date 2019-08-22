using Vertex.Core;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Threading.Tasks;

namespace Vertex.Data
{
    public interface IDataContext
    {
        IDbSet<TEntity> Set<TEntity>() where TEntity : BaseEntity;
        DbEntityEntry<TEntity> Entry<TEntity>(TEntity entity) where TEntity : BaseEntity;
        int SaveChanges();
        Task<int> SaveChangesAsync();
        IEnumerable<TEntity> ExecuteCommandList<TEntity>(string commandText, params object[] parameters);
        TEntity ExecuteCommandSingle<TEntity>(string commandText, params object[] parameters);
        int ExecuteCommand(string commandText, params object[] parameters);
        bool ProxyCreationEnabled { get; set; }
        bool AutoDetectChangesEnabled { get; set; }
        bool LazyLoadingEnabled { get; set; }
        bool ValidateOnSaveEnabled { get; set; }
        void ChangeState<TEntity>(TEntity entity, System.Data.Entity.EntityState requestedState) where TEntity : BaseEntity;
    }
}