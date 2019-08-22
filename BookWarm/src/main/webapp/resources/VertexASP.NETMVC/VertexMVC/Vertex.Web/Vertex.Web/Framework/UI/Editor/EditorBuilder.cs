using System.Web.Mvc;

namespace Vertex.Web.Framework.UI
{
    public class EditorBuilder : ViewComponentBuilderBase<Editor, EditorBuilder>
    {
        public EditorBuilder(HtmlHelper htmlHelper, Editor model) : base(htmlHelper, model)
        { 
        }

        public EditorBuilder Name(string name)
        {
            this.Component.Name = name;
            return this;
        }

        public EditorBuilder EditorType(EditorType _type)
        {
            this.Component.EditorType = _type;
            return this;
        }

        public EditorBuilder Toolbar(params string[] toolbar)
        {
            foreach (var item in toolbar)
                this.Component.Toolbar.Add(item);
            return this;
        }

        public EditorBuilder Content(string content)
        {
            this.Component.Content = content;
            return this;
        }
    }
}