using System;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using System.Web.Routing;

namespace Vertex.Web.Framework.Paging
{
    public class Pager : IHtmlString
    {
        private readonly HtmlHelper htmlHelper;
        private readonly int pageSize;
        private readonly int currentPage;
        private int totalItemCount;
        protected readonly PagerOptions pagerOptions;
        private string pageQueryName = "page";

        public Pager(HtmlHelper htmlHelper, int pageSize, int currentPage, int totalItemCount, string pageQueryName = "page")
        {
            this.htmlHelper = htmlHelper;
            this.pageSize = pageSize;
            this.currentPage = currentPage;
            this.totalItemCount = totalItemCount;
            this.pageQueryName = pageQueryName;
            this.pagerOptions = new PagerOptions(pageQueryName);
        }

        public Pager Options(Action<PagerOptionsBuilder> buildOptions)
        {
            buildOptions(new PagerOptionsBuilder(this.pagerOptions));
            return this;
        }

        public virtual PaginationModel BuildPaginationModel(Func<int, string> generateUrl)
        {
            int pageCount;
            if (this.pagerOptions.UseItemCountAsPageCount)
            {
                // Set page count directly from total item count instead of calculating. Then calculate totalItemCount based on pageCount and pageSize;
                pageCount = this.totalItemCount;
                this.totalItemCount = pageCount * this.pageSize;
            }
            else
            {
                pageCount = (int)Math.Ceiling(totalItemCount / (double)pageSize);
            }

            var model = new PaginationModel { PageSize = this.pageSize, CurrentPage = this.currentPage, TotalItemCount = this.totalItemCount, PageCount = pageCount };

            // First page
            if (this.pagerOptions.DisplayFirstPage)
            {
                model.PaginationLinks.Add(new PaginationLink { Active = (currentPage > 1 ? true : false), DisplayText = this.pagerOptions.FirstPageText, DisplayTitle = this.pagerOptions.FirstPageTitle, PageIndex = 1, Url = generateUrl(1) });
            }

            // Previous page
            if (!this.pagerOptions.HidePreviousAndNextPage)
            {
                var previousPageText = this.pagerOptions.PreviousPageText;
                model.PaginationLinks.Add(currentPage > 1 ? new PaginationLink { Active = true, DisplayText = previousPageText, DisplayTitle = this.pagerOptions.PreviousPageTitle, PageIndex = currentPage - 1, Url = generateUrl(currentPage - 1) } : new PaginationLink { Active = false, DisplayText = previousPageText });
            }

            var start = 1;
            var end = pageCount;
            var nrOfPagesToDisplay = this.pagerOptions.MaxNrOfPages;

            if (pageCount > nrOfPagesToDisplay)
            {
                var middle = (int)Math.Ceiling(nrOfPagesToDisplay / 2d) - 1;
                var below = (currentPage - middle);
                var above = (currentPage + middle);

                if (below < 2)
                {
                    above = nrOfPagesToDisplay;
                    below = 1;
                }
                else if (above > (pageCount - 2))
                {
                    above = pageCount;
                    below = (pageCount - nrOfPagesToDisplay + 1);
                }

                start = below;
                end = above;
            }

            if (start > 1)
            {
                model.PaginationLinks.Add(new PaginationLink { Active = true, PageIndex = 1, DisplayText = "1", Url = generateUrl(1) });
                if (start > 3)
                {
                    model.PaginationLinks.Add(new PaginationLink { Active = true, PageIndex = 2, DisplayText = "2", Url = generateUrl(2) });
                }
                if (start > 2)
                {
                    model.PaginationLinks.Add(new PaginationLink { Active = false, DisplayText = "...", IsSpacer = true });
                }
            }

            for (var i = start; i <= end; i++)
            {
                if (i == currentPage || (currentPage <= 0 && i == 1))
                {
                    model.PaginationLinks.Add(new PaginationLink { Active = true, PageIndex = i, IsCurrent = true, DisplayText = i.ToString() });
                }
                else
                {
                    model.PaginationLinks.Add(new PaginationLink { Active = true, PageIndex = i, DisplayText = i.ToString(), Url = generateUrl(i) });
                }
            }

            if (end < pageCount)
            {
                if (end < pageCount - 1)
                {
                    model.PaginationLinks.Add(new PaginationLink { Active = false, DisplayText = "...", IsSpacer = true });
                }
                if (end < pageCount - 2)
                {
                    model.PaginationLinks.Add(new PaginationLink { Active = true, PageIndex = pageCount, DisplayText = (pageCount).ToString(), Url = generateUrl(pageCount) });
                }
            }

            // Next page
            if (!this.pagerOptions.HidePreviousAndNextPage)
            {
                var nextPageText = this.pagerOptions.NextPageText;
                model.PaginationLinks.Add(currentPage < pageCount ? new PaginationLink { Active = true, PageIndex = currentPage + 1, DisplayText = nextPageText, DisplayTitle = this.pagerOptions.NextPageTitle, Url = generateUrl(currentPage + 1) } : new PaginationLink { Active = false, DisplayText = nextPageText });
            }

            // Last page
            if (this.pagerOptions.DisplayLastPage)
            {
                model.PaginationLinks.Add(new PaginationLink { Active = (currentPage < pageCount ? true : false), DisplayText = this.pagerOptions.LastPageText, DisplayTitle = this.pagerOptions.LastPageTitle, PageIndex = pageCount, Url = generateUrl(pageCount) });
            }

            // AjaxOptions
            if (pagerOptions.AjaxOptions != null)
            {
                model.AjaxOptions = pagerOptions.AjaxOptions;
            }

            model.Options = pagerOptions;
            return model;
        }

        public virtual string ToHtmlString()
        {
            var model = BuildPaginationModel(GeneratePageUrl);

            if (!string.IsNullOrEmpty(this.pagerOptions.DisplayTemplate))
            {
                var templatePath = string.Format("DisplayTemplates/{0}", this.pagerOptions.DisplayTemplate);
                return htmlHelper.Partial(templatePath, model).ToHtmlString();
            }
            else
            {
                var sb = new StringBuilder();
                sb.Append("<nav>");
                sb.Append("<ul class=\"pagination\">");

                foreach (var paginationLink in model.PaginationLinks)
                {
                    if (paginationLink.Active)
                    {
                        if (paginationLink.IsCurrent)
                        {
                            sb.Append("<li class=\"page-item active\" aria-current=\"page\">");
                            sb.AppendFormat("<a class=\"page-link\">{0}</a>", paginationLink.DisplayText);
                            sb.Append("</li>");
                        }
                        else if (!paginationLink.PageIndex.HasValue)
                        {
                            sb.AppendFormat(paginationLink.DisplayText);
                        }
                        else
                        {
                            var linkBuilder = new StringBuilder("<a");

                            if (pagerOptions.AjaxOptions != null)
                                foreach (var ajaxOption in pagerOptions.AjaxOptions.ToUnobtrusiveHtmlAttributes())
                                    linkBuilder.AppendFormat(" {0}=\"{1}\"", ajaxOption.Key, ajaxOption.Value);

                            linkBuilder.AppendFormat(" class=\"page-link\" href=\"{0}\" title=\"{1}\">{2}</a>", paginationLink.Url, paginationLink.DisplayTitle, paginationLink.DisplayText);

                            sb.Append("<li class=\"page-item\">");
                            sb.Append(linkBuilder.ToString());
                            sb.Append("</li>");
                        }
                    }
                    else
                    {
                        if (!paginationLink.IsSpacer)
                        {
                            sb.Append("<li class=\"page-item disabled\" tabindex=\"-1\" aria-disabled=\"true\">");
                            sb.AppendFormat("<a class=\"page-link\">{0}</a>", paginationLink.DisplayText);
                            sb.Append("</li>");
                        }
                        else
                        {
                            sb.Append("<li class=\"page-item active\" aria-current=\"page\">");
                            sb.AppendFormat("<a class=\"spacer page-link\">{0}</a>", paginationLink.DisplayText);
                            sb.Append("</li>");
                        }
                    }
                }
                sb.Append("</ul>");
                sb.Append("</nav>");
                return sb.ToString();
            }
        }

        protected virtual string GeneratePageUrl(int pageNumber)
        {
            var viewContext = this.htmlHelper.ViewContext;
            var routeDataValues = viewContext.RequestContext.RouteData.Values;
            var routeValues = new RouteValueDictionary();

            if (pageNumber > 1)
            {
                routeValues[pageQueryName] = pageNumber;
            }
            else
            {
                //SEO. we do not render pageindex query string parameter for the first page
                if (routeValues.ContainsKey(pageQueryName))
                {
                    routeValues.Remove(pageQueryName);
                }
            }

            var url = UrlHelper.GenerateUrl(null, null, null, routeValues, RouteTable.Routes, viewContext.RequestContext, true);

            url = Helpers.WebHelper.RemoveQueryString(HttpContext.Current.Request.Url.AbsoluteUri, pageQueryName);

            if (url.Contains("?"))
                url += string.Format("&{0}={1}", pageQueryName, pageNumber);
            else
                url += string.Format("?{0}={1}", pageQueryName, pageNumber);

            return url;
        }
    }

    public class Pager<TModel> : Pager
    {
        private HtmlHelper<TModel> htmlHelper;

        public Pager(HtmlHelper<TModel> htmlHelper, int pageSize, int currentPage, int totalItemCount)
            : base(htmlHelper, pageSize, currentPage, totalItemCount)
        {
            this.htmlHelper = htmlHelper;
        }

        public Pager<TModel> Options(Action<PagerOptionsBuilder<TModel>> buildOptions)
        {
            buildOptions(new PagerOptionsBuilder<TModel>(this.pagerOptions, htmlHelper));
            return this;
        }
    }
}