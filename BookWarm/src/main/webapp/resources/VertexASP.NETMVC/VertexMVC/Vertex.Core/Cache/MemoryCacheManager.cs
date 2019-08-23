using System;
using System.Runtime.Caching;
using System.Text.RegularExpressions;

namespace Vertex.Core.Cache
{
    public class MemoryCacheManager : ICacheManager
    {
        /// <summary>
        /// Get default cache engine
        /// </summary>
        protected ObjectCache Cache
        {
            get
            {
                return MemoryCache.Default;
            }
        }

        /// <summary>
        /// Get cache data by key
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="key"></param>
        /// <returns></returns>
        public T Get<T>(string key)
        {
            return (T)Cache[key];
        }

        /// <summary>
        /// Set cache data
        /// </summary>
        /// <param name="key"></param>
        /// <param name="data"></param>
        /// <param name="cacheMinutes"></param>
        public void Set(string key, object data, int cacheMinutes = 60)
        {
            if (data == null)
                return;

            var policy = new CacheItemPolicy();
            policy.AbsoluteExpiration = DateTime.Now + TimeSpan.FromMinutes(cacheMinutes);
            Cache.Add(new CacheItem(key, data), policy);
        }

        /// <summary>
        /// If is exist cache data return true
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public bool IsSet(string key)
        {
            return (Cache.Contains(key));
        }

        /// <summary>
        /// Remove cache data by key
        /// </summary>
        /// <param name="key"></param>
        public void Remove(string key)
        {
            Cache.Remove(key);
        }

        /// <summary>
        /// Remove cache data by pattern. E.g product.categories-
        /// </summary>
        /// <param name="pattern"></param>
        public void RemoveByPattern(string pattern)
        {
            var regex = new Regex(pattern, RegexOptions.Singleline | RegexOptions.Compiled | RegexOptions.IgnoreCase);

            foreach (var item in Cache)
                if (regex.IsMatch(item.Key))
                    Remove(item.Key);
        }

        /// <summary>
        /// Clear all cache data
        /// </summary>
        public void Clear()
        {
            foreach (var item in Cache)
                Remove(item.Key);
        }
    }
}
