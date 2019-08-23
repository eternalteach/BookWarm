namespace Vertex.Core.Cache
{
    public interface ICacheManager
    {
        /// <summary>
        /// Get cache data by key
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="key"></param>
        /// <returns></returns>
        T Get<T>(string key);

        /// <summary>
        /// Set cache data
        /// </summary>
        /// <param name="key"></param>
        /// <param name="data"></param>
        /// <param name="cacheTime"></param>
        void Set(string key, object data, int cacheTime = 60);

        /// <summary>
        /// If is exist cache data return true
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        bool IsSet(string key);

        /// <summary>
        /// Remove cache data by key
        /// </summary>
        /// <param name="key"></param>
        void Remove(string key);

        /// <summary>
        /// Remove cache data by pattern. E.g product.categories-
        /// </summary>
        /// <param name="pattern"></param>
        void RemoveByPattern(string pattern);

        /// <summary>
        /// Clear all cache data
        /// </summary>
        void Clear();
    }
}