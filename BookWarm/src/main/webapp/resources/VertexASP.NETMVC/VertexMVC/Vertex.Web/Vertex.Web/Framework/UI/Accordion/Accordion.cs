using System.Collections.Generic;

namespace Vertex.Web.Framework.UI
{
    public class Accordion : ViewComponentBase
    { 
        public Accordion()
        {
            this.Items = new List<AccordionItem>();
        }

        public List<AccordionItem> Items { get; set; } 

        public override void GenerateHtmlAtributes()
        {
        }
    }

    public class AccordionItem : ViewComponentBase
    {
        public string Title { get; set; }
        public string TitleIcon { get; set; }
        public string Content { get; set; }
        public bool Expanded { get; set; }

        public override void GenerateHtmlAtributes()
        {
        }
    }
}