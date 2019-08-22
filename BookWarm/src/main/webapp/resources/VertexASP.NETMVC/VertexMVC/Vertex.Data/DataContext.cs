using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Threading.Tasks;
using Vertex.Core;
using Vertex.Core.Entities;

namespace Vertex.Data
{
    public class DataContext : IdentityDbContext<ApplicationUser>, IDataContext
    {
        public DataContext()
            : base("name=connectionString", throwIfV1Schema: false)
        {
            Database.SetInitializer<DataContext>(null);
        }

        public static DataContext Create()
        { 
            return new DataContext();
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            modelBuilder.Conventions.Remove<OneToManyCascadeDeleteConvention>();

            modelBuilder.Ignore<ApplicationRole>();
            modelBuilder.Ignore<ApplicationUserRole>();
        }

        ~DataContext()
        {
            Dispose(true);
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
            GC.SuppressFinalize(this);
        }

        #region Save Changes
        public override int SaveChanges()
        {
            int result = 0;
            using (DbContextTransaction transaction = Database.BeginTransaction())
            {
                try
                {
                    result = base.SaveChanges();
                    transaction.Commit();
                }
                catch (Exception)
                {
                    transaction.Rollback();
                    throw;
                }
            }
            return result;
        }

        public async override Task<int> SaveChangesAsync()
        {
            int result = 0;
            using (DbContextTransaction transaction = Database.BeginTransaction())
            {
                try
                {
                    result = await base.SaveChangesAsync();
                    transaction.Commit();
                }
                catch (Exception)
                {
                    transaction.Rollback();
                    throw;
                }
            }
            return await Task.FromResult(result);
        }
        #endregion

        #region Custom Command
        public IEnumerable<TEntity> ExecuteCommandList<TEntity>(string commandText, params object[] parameters)
        {
            var result = default(IEnumerable<TEntity>);

            bool autoDetect = AutoDetectChangesEnabled;
            try
            {
                AutoDetectChangesEnabled = false;
                result = Database.SqlQuery<TEntity>(commandText, parameters).ToList();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                //set prev setting value
                AutoDetectChangesEnabled = autoDetect;
            }

            return result;
        }

        public TEntity ExecuteCommandSingle<TEntity>(string commandText, params object[] parameters)
        {
            var result = default(TEntity);

            bool autoDetect = AutoDetectChangesEnabled;
            try
            {
                AutoDetectChangesEnabled = false;
                result = Database.SqlQuery<TEntity>(commandText, parameters).FirstOrDefault();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                //set prev setting value
                AutoDetectChangesEnabled = autoDetect;
            }

            return result;
        }

        public int ExecuteCommand(string commandText, params object[] parameters)
        {
            return Database.ExecuteSqlCommand(TransactionalBehavior.EnsureTransaction, commandText, parameters);
        }

        public void ChangeState<TEntity>(TEntity entity, System.Data.Entity.EntityState requestedState) where TEntity : BaseEntity
        {
            var entry = this.Entry(entity);

            if (entry.State != requestedState)
            {
                // Only change state when requested state differs,
                // because EF internally sets all properties to modified
                // if necessary, even when requested state equals current state.
                entry.State = requestedState;
            }
        }
        #endregion

        #region Others
        IDbSet<TEntity> IDataContext.Set<TEntity>()
        {
            return base.Set<TEntity>();
        }

        DbEntityEntry<TEntity> IDataContext.Entry<TEntity>(TEntity entity)
        {
            return base.Entry<TEntity>(entity);
        }

        public bool ProxyCreationEnabled
        {
            get
            {
                return Configuration.ProxyCreationEnabled;
            }
            set
            {
                Configuration.ProxyCreationEnabled = value;
            }
        }

        public bool AutoDetectChangesEnabled
        {
            get
            {
                return Configuration.AutoDetectChangesEnabled;
            }
            set
            {
                Configuration.AutoDetectChangesEnabled = value;
            }
        }

        public bool LazyLoadingEnabled
        {
            get
            {
                return Configuration.LazyLoadingEnabled;
            }
            set
            {
                Configuration.LazyLoadingEnabled = value;
            }
        }

        public bool ValidateOnSaveEnabled
        {
            get
            {
                return Configuration.ValidateOnSaveEnabled;
            }
            set
            {
                Configuration.ValidateOnSaveEnabled = value;
            }
        }
        #endregion

        #region DbSets

        public IDbSet<Category> Category { get; set; }
        public IDbSet<Comment> Comment { get; set; }
        public IDbSet<Post> Post { get; set; }
        public IDbSet<PostTag> PostTag { get; set; }
        public IDbSet<PostTagMapping> PostTagMapping { get; set; }
        public IDbSet<Setting> Setting { get; set; }
        public IDbSet<SystemError> SystemError { get; set; }
        public IDbSet<UrlRecord> UrlRecord { get; set; }
        public IDbSet<MediaStorage> MediaStorage { get; set; }
        public IDbSet<TeamMember> TeamMember { get; set; } 
        public IDbSet<ClientTestimonials> Testimonials { get; set; }
        public IDbSet<SocialNetwork> SocialNetwork { get; set; }
        public IDbSet<Contact> Contact { get; set; }
        public IDbSet<Subscriber> Subscriber { get; set; }
        public IDbSet<Portfolio> Portfolio { get; set; }
        public IDbSet<PortfolioCategory> PortfolioCategory { get; set; }

        public IDbSet<Job> Job { get; set; }
        public IDbSet<JobCategory> JobCategory { get; set; }
        public IDbSet<ApplyJob> ApplyJob { get; set; }

        #endregion
    }
}