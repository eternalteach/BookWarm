using Vertex.Core.Entities;
using System.Collections.Generic;

namespace Vertex.Service
{
    public interface IPortfolioService
    {
        IEnumerable<Portfolio> GetPortfolios();
        Portfolio GetById(int Id);
        IEnumerable<Portfolio> GetActives();
        IEnumerable<Portfolio> GetActives(int categoryId);
        IEnumerable<Portfolio> GetActives(string userId);
        IEnumerable<Portfolio> GetLatestPortfolios();
        IEnumerable<Portfolio> GetPopularPortfolios();
        IEnumerable<Portfolio> GetRelatedPortfolios(int categoryId, int portfolioId);
        IEnumerable<Portfolio> SearchPortfolios(string term);
        int GetCount(int categoryId);
        bool Update(Portfolio portfolio);
        bool Insert(Portfolio portfolio);
        bool Delete(Portfolio portfolio);
    }
}