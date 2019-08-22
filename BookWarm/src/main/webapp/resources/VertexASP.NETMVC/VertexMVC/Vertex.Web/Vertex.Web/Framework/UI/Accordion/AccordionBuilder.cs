using System.Web.Mvc;

namespace Vertex.Web.Framework.UI
{
    public class AccordionBuilder : ViewComponentBuilderBase<Accordion, AccordionBuilder>
    {
        public AccordionBuilder(HtmlHelper htmlHelper, Accordion model) : base(htmlHelper, model)
        { 
        }

        public AccordionItemBuilder Add()
        {
            var tabItemBuilder = new AccordionItemBuilder(this.HtmlHelper, new AccordionItem());
            this.Component.Items.Add(tabItemBuilder.Component);
            return tabItemBuilder;
        }
    }
}