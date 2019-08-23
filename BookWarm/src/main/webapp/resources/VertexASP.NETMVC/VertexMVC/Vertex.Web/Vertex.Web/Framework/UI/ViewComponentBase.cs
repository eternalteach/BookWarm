using System.ComponentModel.DataAnnotations.Schema;

namespace Vertex.Web.Framework.UI
{
    public abstract class ViewComponentBase : HtmlAtributeContainer
    {
        /// <summary>
        /// Create your custom partials
        /// </summary>
        [NotMapped]
        public string ViewName { get; set; } 

        /// <summary>
        /// Generate the atributes for cshtml partials
        /// </summary>
        /// <returns></returns>
        public abstract void GenerateHtmlAtributes();

        /// <summary>
        /// Get the view/partial name.
        /// </summary>
        /// <returns></returns>
        public string GetViewName()
        {
            string viewName = this.ViewName;
            if (string.IsNullOrEmpty(this.ViewName))
            {
                string name = this.GetType().Name;
                viewName = this.GetType().Namespace.Replace("Vertex.Web.Framework.", string.Empty).Replace(".", "/");
                viewName = string.Format("{0}/{1}", viewName, name);
            }
            return viewName;
        }
    }
}