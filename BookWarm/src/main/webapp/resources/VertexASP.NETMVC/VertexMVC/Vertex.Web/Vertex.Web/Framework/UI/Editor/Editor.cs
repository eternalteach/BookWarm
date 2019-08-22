using System.Collections.Generic;

namespace Vertex.Web.Framework.UI
{
    public class Editor : ViewComponentBase
    {
        public Editor()
        {
            this.EditorType = EditorType.Classic;
            this.Toolbar = new List<string>();
        }

        public string Name { get; set; }
        public string Content { get; set; }
        public EditorType EditorType { get; set; }
        public List<string> Toolbar { get; set; }

        public override void GenerateHtmlAtributes()
        {
        }
    }

    public enum EditorType
    {
        Classic,
        Inline
    }
}