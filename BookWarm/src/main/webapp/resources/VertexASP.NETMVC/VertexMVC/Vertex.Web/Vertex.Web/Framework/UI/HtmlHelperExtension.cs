using System;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc.Html;

namespace Vertex.Web.Framework.UI
{
    public static class HtmlHelperExtension
    {
        public static EditorBuilder Editor(this VertexHelper helper, string name)
        {
            var editor = new Editor();
            editor.Name = name;
            return new EditorBuilder(helper.HtmlHelper, editor);
        }

        public static ConfirmModalBuilder ConfirmModal(this VertexHelper helper, string actionName, string controlerName, object routeValues)
        {
            var model = new ConfirmModal();
            model.ActionName = actionName;
            model.ControlerName = controlerName;
            model.RouteValues = routeValues;
            return new ConfirmModalBuilder(helper.HtmlHelper, model);
        }

        public static PopupBuilder Popup(this VertexHelper helper)
        {
            var model = new Popup();
            return new PopupBuilder(helper.HtmlHelper, model);
        }

        public static IHtmlString NotifyPopup(this VertexHelper helper)
        {
            var tempData = helper.HtmlHelper.ViewContext.TempData;

            var message = tempData["NotifySuccess"];
            message = message == null ? tempData["NotifyError"] : message;
            message = message == null ? tempData["NotifyInfo"] : message;
            message = message == null ? tempData["NotifyWarning"] : message;

            if (message != null)
            {
                return helper.HtmlHelper.Raw(message.ToString());
            }
            return null;
        }

        public static ShareButtonsBuilder ShareButtons(this VertexHelper helper)
        {
            var model = new ShareButtons();
            return new ShareButtonsBuilder(helper.HtmlHelper, model);
        }

        public static ConfirmModalBuilder ConfirmModal(this VertexHelper helper, Action<ConfirmModal> action)
        {
            var model = new ConfirmModal();
            action.Invoke(model);
            return new ConfirmModalBuilder(helper.HtmlHelper, model);
        }

        public static BlogPostBuilder BlogPosts(this VertexHelper helper, BlogPostViewName viewName)
        {
            var model = new BlogPost();
            model.ViewName = String.Format("UI/BlogPost/{0}", viewName.ToString());
            return new BlogPostBuilder(helper.HtmlHelper, model);
        }

        public static UserShortInfoBuilder UserShortInfo(this VertexHelper helper)
        {
            var model = new UserShortInfo();
            return new UserShortInfoBuilder(helper.HtmlHelper, model);
        }


        public static PortfolioViewBuilder Portfolio(this VertexHelper helper, PortfolioViewName viewName)
        {
            var model = new PortfolioView();
            model.ViewName = String.Format("UI/Portfolio/{0}", viewName.ToString());
            return new PortfolioViewBuilder(helper.HtmlHelper, model);
        }

        public static JobViewBuilder Jobs(this VertexHelper helper)
        {
            var model = new JobView();
            return new JobViewBuilder(helper.HtmlHelper, model);
        }


        public static OvalDividerBuilder OvalDivider(this VertexHelper helper, OvalDividerType type)
        {
            var model = new OvalDivider();
            model.OvalDividerType = type;
            return new OvalDividerBuilder(helper.HtmlHelper, model);
        }

        public static BreadcrumbBuilder Breadcrumb(this VertexHelper helper)
        {
            return new BreadcrumbBuilder(helper.HtmlHelper, new Breadcrumb());
        }

        public static TeamMemberViewBuilder TeamMember(this VertexHelper helper)
        {
            return new TeamMemberViewBuilder(helper.HtmlHelper, new TeamMemberView());
        }

        public static ClientBuilder Client(this VertexHelper helper)
        {
            var model = new ClientTestimonials();
            model.ViewName = String.Format("UI/ClientTestimonials/{0}", "Client");
            return new ClientBuilder(helper.HtmlHelper, model);
        }

        public static TestimonialsBuilder Testimonials(this VertexHelper helper)
        {
            var model = new ClientTestimonials();
            model.ViewName = String.Format("UI/ClientTestimonials/{0}", "Testimonials");
            return new TestimonialsBuilder(helper.HtmlHelper, model);
        }

        public static SocialIconBuilder SocialIcon(this VertexHelper helper)
        {
            return new SocialIconBuilder(helper.HtmlHelper, new SocialIcon());
        }

        public static SocialIconBuilder SocialIcon(this VertexHelper helper, SocialIcon model)
        {
            return new SocialIconBuilder(helper.HtmlHelper, model);
        }

        public static SocialIconBuilder SocialIcon(this VertexHelper helper, Action<SocialIcon> action)
        {
            var model = new SocialIcon();
            action.Invoke(model);
            return new SocialIconBuilder(helper.HtmlHelper, model);
        }

        public static IconBoxBuilder IconBox(this VertexHelper helper)
        {
            var model = new IconBox();
            return new IconBoxBuilder(helper.HtmlHelper, model);
        }

        public static AccordionBuilder Accordion(this VertexHelper helper, Action<AccordionBuilder> action)
        {
            var model = new AccordionBuilder(helper.HtmlHelper, new Accordion());
            action.Invoke(model);
            return new AccordionBuilder(helper.HtmlHelper, model.Component);
        }

        public static TabBuilder Tab(this VertexHelper helper, Action<TabBuilder> action)
        {
            var model = new TabBuilder(helper.HtmlHelper, new Tab());
            action.Invoke(model);
            return new TabBuilder(helper.HtmlHelper, model.Component);
        }

        public static SliderBuilder Slider(this VertexHelper helper, Action<SliderBuilder> action)
        {
            var model = new SliderBuilder(helper.HtmlHelper, new Slider());
            action.Invoke(model);
            return new SliderBuilder(helper.HtmlHelper, model.Component);
        }

        public static AlertBuilder Alert(this VertexHelper helper)
        {
            return new AlertBuilder(helper.HtmlHelper, new Alert());
        }

        public static SpinnerBuilder Spinner(this VertexHelper helper)
        {
            return new SpinnerBuilder(helper.HtmlHelper, new Spinner());
        }

        public static SpinnerBuilder Spinner(this VertexHelper helper, Action<Spinner> action)
        {
            var model = new Spinner();
            action.Invoke(model);
            return new SpinnerBuilder(helper.HtmlHelper, model);
        }

        public static TooltipBuilder Tooltip(this VertexHelper helper)
        {
            return new TooltipBuilder(helper.HtmlHelper, new Tooltip());
        }

        public static PopoverBuilder Popover(this VertexHelper helper)
        {
            return new PopoverBuilder(helper.HtmlHelper, new Popover());
        }

        public static FooterBuilder Footer(this VertexHelper helper)
        {
            return new FooterBuilder(helper.HtmlHelper, new Footer());
        }

        public static GalleryBuilder Gallery(this VertexHelper helper)
        {
            return new GalleryBuilder(helper.HtmlHelper, new Gallery());
        }

        public static ProgressBuilder Progress(this VertexHelper helper)
        {
            return new ProgressBuilder(helper.HtmlHelper, new Progress());
        }

        public static ProgressBuilder Progress(this VertexHelper helper, Action<Progress> action)
        {
            var model = new Progress();
            action.Invoke(model);
            return new ProgressBuilder(helper.HtmlHelper, model);
        }

        public static RatingBuilder Rating(this VertexHelper helper, RatingRate rating)
        {
            var model = new Rating();
            model.Rate = rating;
            return new RatingBuilder(helper.HtmlHelper, model);
        }

        public static ButtonBuilder Button(this VertexHelper helper)
        {
            return new ButtonBuilder(helper.HtmlHelper, new Button());
        }

        public static ButtonBuilder Button(this VertexHelper helper, string text)
        {
            var model = new Button();
            model.Text = text;
            return new ButtonBuilder(helper.HtmlHelper, model);
        }

        public static ButtonBuilder Button(this VertexHelper helper, Action<Button> action)
        {
            var model = new Button();
            action.Invoke(model);
            return new ButtonBuilder(helper.HtmlHelper, model);
        }

        public static CountupBuilder Countup(this VertexHelper helper)
        {
            return new CountupBuilder(helper.HtmlHelper, new Countup());
        }

        public static CountupBuilder Countup(this VertexHelper helper, Action<Countup> action)
        {
            var model = new Countup();
            action.Invoke(model);
            return new CountupBuilder(helper.HtmlHelper, model);
        }

        public static SvgInjectorBuilder SvgInjector(this VertexHelper helper)
        {
            return new SvgInjectorBuilder(helper.HtmlHelper, new SvgInjector());
        }

        public static SvgInjectorBuilder SvgInjector(this VertexHelper helper, Action<SvgInjector> action)
        {
            var model = new SvgInjector();
            action.Invoke(model);
            return new SvgInjectorBuilder(helper.HtmlHelper, model);
        }

        public static BadgeBuilder Badge(this VertexHelper helper)
        {
            return new BadgeBuilder(helper.HtmlHelper, new Badge());
        }

        public static BadgeBuilder Badge(this VertexHelper helper, string text)
        {
            var model = new Badge();
            model.Text = text;
            return new BadgeBuilder(helper.HtmlHelper, model);
        }

        public static TypingBuilder Typing(this VertexHelper helper)
        {
            return new TypingBuilder(helper.HtmlHelper, new Typing());
        }

        public static TypingBuilder Typing(this VertexHelper helper, Action<Typing> action)
        {
            var model = new Typing();
            action.Invoke(model);
            return new TypingBuilder(helper.HtmlHelper, model);
        }

        public static SectionBuilder Section(this VertexHelper helper)
        {
            return new SectionBuilder(helper.HtmlHelper, new Section());
        }

        public static SectionBuilder Section(this VertexHelper helper, Action<Section> action)
        {
            var model = new Section();
            action.Invoke(model);
            return new SectionBuilder(helper.HtmlHelper, model);
        }

        public static PageBuilder Page(this VertexHelper helper)
        {
            return new PageBuilder(helper.HtmlHelper, new Page());
        }

        public static HeaderBuilder Header(this VertexHelper helper)
        {
            return new HeaderBuilder(helper.HtmlHelper, new Header());
        }

        public static HeaderBuilder Header(this VertexHelper helper, Action<Header> action)
        {
            var model = new Header();
            action.Invoke(model);
            return new HeaderBuilder(helper.HtmlHelper, model);
        }

        public static WidgetBuilder Widget(this VertexHelper helper, string widgetName)
        {
            var model = new SvgInjector() as ViewComponentBase; // fake instance
            model.ViewName = String.Format("UI/Widgets/{0}", widgetName);
            return new WidgetBuilder(helper.HtmlHelper, model);
        }

        public static WidgetBuilder Widget(this VertexHelper helper, string widgetName, ViewComponentBase model)
        {
            model.ViewName = String.Format("UI/Widgets/{0}", widgetName);
            return new WidgetBuilder(helper.HtmlHelper, model);
        }

        public static FileUploaderBuilder FileUploader(this VertexHelper helper)
        {
            return new FileUploaderBuilder(helper.HtmlHelper, new FileUploader());
        }

        public static PictureUploaderBuilder PictureUploader(this VertexHelper helper, string name)
        {
            var hidden = string.Format("<input type=\"hidden\" name=\"{0}\" class=\"hidden\" />", name);
            return new PictureUploaderBuilder(helper.HtmlHelper, new PictureUploader() { HiddenFor = hidden });
        }

        public static PictureUploaderBuilder PictureUploaderFor<TModel, TValue>(this VertexHelper<TModel> helper, Expression<Func<TModel, TValue>> expression)
        {
            var hidden = helper.HtmlHelper.HiddenFor(expression, new { @class = "hidden" }).ToHtmlString();
            Func<TModel, TValue> method = expression.Compile();
            int? pictureId = method(helper.HtmlHelper.ViewData.Model) as int?;

            return new PictureUploaderBuilder(helper.HtmlHelper, new PictureUploader() { HiddenFor = hidden, PictureId = pictureId });
        }

        public static HtmlEditorBuilder HtmlEditorFor<TModel, TValue>(this VertexHelper<TModel> helper, Expression<Func<TModel, TValue>> expression)
        {
            Func<TModel, TValue> method = expression.Compile();
            string html = method(helper.HtmlHelper.ViewData.Model) as string;
            string name = ((MemberExpression)expression.Body).Member.Name;

            return new HtmlEditorBuilder(helper.HtmlHelper, new HtmlEditor() { Name = name, Html = html });
        }

        public static HtmlEditorBuilder HtmlEditor(this VertexHelper helper, string name)
        {
            return new HtmlEditorBuilder(helper.HtmlHelper, new HtmlEditor() { Name = name });
        }
    }
}