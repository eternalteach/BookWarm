using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Vertex.Core.Infrastructure;
using Vertex.Service;
using Vertex.Web.Framework.Paging;

namespace Vertex.Web.Framework.UI
{
    public class BlogPostBuilder : ViewComponentBuilderBase<BlogPost, BlogPostBuilder>
    {
        #region Fields

        private readonly IPostService postService;

        private IEnumerable<int> _customPostIds { get; set; }
        private int? _displayCount { get; set; }
        private int? _pageSize { get; set; }
        private string _pageQueryName = "page";
        private int? _categoryId { get; set; }
        private string _searchTerm { get; set; }

        private string _userId { get; set; }
        private string _userName { get; set; }

        #endregion Fields

        public BlogPostBuilder(HtmlHelper htmlHelper, BlogPost component)
            : base(htmlHelper, component)
        {
            postService = Engine.Resolve<IPostService>();
        }

        public override string ToHtmlString()
        {
            var allPosts = _categoryId.HasValue ? postService.GetActives(_categoryId.Value) : postService.GetActives();

            if (this._customPostIds != null)
                allPosts = allPosts.Where(s => _customPostIds.Contains(s.Id));

            if (!string.IsNullOrEmpty(_searchTerm))
                allPosts = allPosts.Where(s => s.Title.Contains(_searchTerm));

            if (!string.IsNullOrEmpty(_userId))
                allPosts = allPosts.Where(s => s.UserId.Contains(_userId));

            if (!string.IsNullOrEmpty(_userName))
                allPosts = allPosts.Where(s => s.UserName.Contains(_userName));

            if (_displayCount.HasValue && _displayCount.Value > 0)
                allPosts = allPosts.Take(_displayCount.Value);

            if (this._pageSize.HasValue)
            {
                var pageIndex = this.GetPageIndex();
                this.Component.Pager = new Pager(this.HtmlHelper, this._pageSize.Value, pageIndex, allPosts.Count(), this._pageQueryName).ToHtmlString();
                allPosts = allPosts.ToPagedList(pageIndex - 1, this._pageSize.Value);
            }

            this.Component.Items.AddRange(allPosts);
            return base.ToHtmlString();
        }

        public BlogPostBuilder ToSlider(Action<SliderBuilder> action)
        {
            var sliderBuilder = new SliderBuilder(this.HtmlHelper, new Slider());
            action.Invoke(sliderBuilder);
            this.Component.Slider = sliderBuilder;
            return this;
        }

        public BlogPostBuilder DisplayCount(int count)
        {
            this._displayCount = count;
            return this;
        }

        public BlogPostBuilder Pageable(int pageSize)
        {
            this._pageSize = pageSize;
            return this;
        }

        public BlogPostBuilder Pageable(string pageQueryName, int pageSize)
        {
            this._pageQueryName = pageQueryName;
            this._pageSize = pageSize;
            return this;
        }

        public BlogPostBuilder FilterByCategoryId(int categoryId)
        {
            this._categoryId = categoryId;
            return this;
        }

        public BlogPostBuilder FilterByTerm(string term)
        {
            this._searchTerm = term;
            return this;
        }

        public BlogPostBuilder FilterByUserIds(params string[] userId)
        {
            this._userId = userId.FirstOrDefault();
            return this;
        }

        public BlogPostBuilder FilterByUserNames(params string[] userNames)
        {
            this._userName = userNames.FirstOrDefault();
            return this;
        }

        public BlogPostBuilder CustomPosts(IEnumerable<int> postIds)
        {
            this._customPostIds = postIds;
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