using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Vertex.Core.Infrastructure;
using Vertex.Service;
using Vertex.Web.Framework.Paging;

namespace Vertex.Web.Framework.UI
{
    public class PortfolioViewBuilder : ViewComponentBuilderBase<PortfolioView, PortfolioViewBuilder>
    {
        #region Fields

        private readonly IPortfolioService portfolioService;
        private readonly IPortfolioCategoryService categoryService;

        private IEnumerable<int> _customPortfolioIds { get; set; }
        private int? _displayCount { get; set; }
        private int? _pageSize { get; set; }
        private string _pageQueryName = "page";
        private int? _categoryId { get; set; }
        private string _searchTerm { get; set; }
        private string _userId { get; set; }

        #endregion Fields

        public PortfolioViewBuilder(HtmlHelper htmlHelper, PortfolioView model)
            : base(htmlHelper, model)
        {
            portfolioService = Engine.Resolve<IPortfolioService>();
            categoryService = Engine.Resolve<IPortfolioCategoryService>();
        }

        public override string ToHtmlString()
        {
            var allPortfolios = _categoryId.HasValue ? portfolioService.GetActives(_categoryId.Value) : portfolioService.GetActives();

            if (this._customPortfolioIds != null)
                allPortfolios = allPortfolios.Where(s => _customPortfolioIds.Contains(s.Id));

            if (!string.IsNullOrEmpty(_searchTerm))
                allPortfolios = allPortfolios.Where(s => s.Title.Contains(_searchTerm));

            if (!string.IsNullOrEmpty(_userId))
                allPortfolios = allPortfolios.Where(s => s.UserId.Contains(_userId));

            if (_displayCount.HasValue && _displayCount.Value > 0)
                allPortfolios = allPortfolios.Take(_displayCount.Value);

            if (this._pageSize.HasValue)
            {
                var pageIndex = this.GetPageIndex();
                this.Component.Pager = new Pager(this.HtmlHelper, this._pageSize.Value, pageIndex, allPortfolios.Count(), this._pageQueryName).ToHtmlString();
                allPortfolios = allPortfolios.ToPagedList(pageIndex - 1, this._pageSize.Value);
            }

            this.Component.Items.AddRange(allPortfolios);
            this.Component.AllCategories = categoryService.GetActives().ToList();

            return base.ToHtmlString();
        }

        public PortfolioViewBuilder ShowCategoryFilter()
        {
            this.Component.ShowCategoryFilter = true;
            return this;
        }

        public PortfolioViewBuilder ShowSorter()
        {
            this.Component.ShowSorter = true;
            return this;
        }

        public PortfolioViewBuilder ToSlider(Action<SliderBuilder> action)
        {
            var sliderBuilder = new SliderBuilder(this.HtmlHelper, new Slider());
            action.Invoke(sliderBuilder);
            this.Component.Slider = sliderBuilder;
            return this;
        }

        public PortfolioViewBuilder DisplayCount(int count)
        {
            this._displayCount = count;
            return this;
        }

        public PortfolioViewBuilder Pageable(int pageSize)
        {
            this._pageSize = pageSize;
            return this;
        }

        public PortfolioViewBuilder Pageable(string pageQueryName, int pageSize)
        {
            this._pageQueryName = pageQueryName;
            this._pageSize = pageSize;
            return this;
        }

        public PortfolioViewBuilder SearchFor(int categoryId)
        {
            this._categoryId = categoryId;
            return this;
        }

        public PortfolioViewBuilder SearchFor(string term)
        {
            this._searchTerm = term;
            return this;
        }

        public PortfolioViewBuilder SearchFor(params string[] userId)
        {
            this._userId = userId.FirstOrDefault();
            return this;
        }

        public PortfolioViewBuilder CustomPortfolios(IEnumerable<int> postIds)
        {
            this._customPortfolioIds = postIds;
            return this;
        }

        private int GetPageIndex()
        {
            var page = this.HtmlHelper.ViewContext.RequestContext.HttpContext.Request.QueryString[this._pageQueryName];
            int pageIndex = !string.IsNullOrEmpty(page) ? Convert.ToInt32(page) : 0;
            return pageIndex;
        }
    }
}