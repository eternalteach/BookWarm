using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Vertex.Core.Entities;
using Vertex.Core.Infrastructure;
using Vertex.Service;

namespace Vertex.Web.Framework.UI
{
    public class JobViewBuilder : ViewComponentBuilderBase<JobView, JobViewBuilder>
    {
        #region Fields

        private readonly IJobService jobService;
        private readonly IJobCategoryService categoryService;

        private int? _displayCount { get; set; }
        private int? _categoryId { get; set; }
        private string _searchTerm { get; set; }

        #endregion Fields

        public JobViewBuilder(HtmlHelper htmlHelper, JobView model)
            : base(htmlHelper, model)
        {
            jobService = Engine.Resolve<IJobService>();
            categoryService = Engine.Resolve<IJobCategoryService>();
        }

        public override string ToHtmlString()
        {
            var allJobs = _categoryId.HasValue ? jobService.GetActives(_categoryId.Value) : jobService.GetActives();

            if (!string.IsNullOrEmpty(_searchTerm))
                allJobs = allJobs.Where(s => s.Title.Contains(_searchTerm));

            if (_displayCount.HasValue && _displayCount.Value > 0)
                allJobs = allJobs.Take(_displayCount.Value);

            this.Component.Items.AddRange(allJobs);
            this.Component.AllCategories = categoryService.GetActives().ToList();

            return base.ToHtmlString();
        }

        public JobViewBuilder ToSlider(Action<SliderBuilder> action)
        {
            var sliderBuilder = new SliderBuilder(this.HtmlHelper, new Slider());
            action.Invoke(sliderBuilder);
            this.Component.Slider = sliderBuilder;
            return this;
        }

        public JobViewBuilder DisplayCount(int count)
        {
            this._displayCount = count;
            return this;
        }

        public JobViewBuilder Variation(JobViewVariation variation)
        {
            this.Component.Variation = variation;
            return this;
        }

        public IEnumerable<Job> GetActiveJobs()
        {
            return jobService.GetActives();
        }
    }
}