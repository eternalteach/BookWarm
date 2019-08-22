using System.Collections.Generic;

namespace Vertex.Web.Framework.UI
{
    public class HtmlAtributeContainer
    {
        protected List<string> CssClass { get; set; }
        protected Dictionary<string, string> Style { get; set; }
        public Dictionary<string, string> HtmlAttributes { get; set; }

        public void AppendCssClass(string className)
        {
            if (this.CssClass == null)
                this.CssClass = new List<string>();

            this.CssClass.Add(className);
        }

        public void AppendStyle(string name, string value)
        {
            if (this.Style == null)
                this.Style = new Dictionary<string, string>();

            this.Style.Add(name, value);
        }

        public void AppendHtmlAtribute(string name, string value)
        {
            if (this.HtmlAttributes == null)
                this.HtmlAttributes = new Dictionary<string, string>();

            if (!this.HtmlAttributes.ContainsKey(name))
            {
                this.HtmlAttributes.Add(name, value);
            } 
        }

        public string GetCssClass()
        {
            if (this.CssClass == null)
                return string.Empty;
            return string.Join(" ", this.CssClass.ToArray());

            // return string.Format("class={0}", string.Join(" ", this.CssClass.ToArray()));
        }

        /// <summary>
        /// GetAtributes
        /// </summary>
        /// <returns></returns>
        public string GetStyle()
        {
            if (this.Style == null)
                return string.Empty;

            string returnValue = string.Empty;
            foreach (var item in this.Style)
                returnValue += string.Format("{0}:{1};", item.Key, item.Value);

            return string.Format("style={0}", returnValue);
        }

        /// <summary>
        /// GetAtributes
        /// </summary>
        /// <returns></returns>
        public string GetHtmlAtributes(bool isOptionAtributes = false)
        {
            if (this.HtmlAttributes == null)
                return string.Empty;

            string returnValue = string.Empty;
            foreach (var item in this.HtmlAttributes)
            {
                if (isOptionAtributes)
                    returnValue += string.Format("'{0}': '{1}', ", item.Key, item.Value);
                else
                    returnValue += string.Format("{0}={1} ", item.Key, item.Value);
            }

            return returnValue.TrimEnd().TrimEnd(',');
        }

        /// <summary>
        /// Append HtmlAtributeModel
        /// </summary>
        /// <param name="atr"></param>
        public void Append(HtmlAtributeContainer atr)
        {
            if (atr != null)
            {
                if (atr.CssClass != null)
                {
                    foreach (var item in atr.CssClass)
                        this.AppendCssClass(item);
                }
                if (atr.Style != null)
                {
                    foreach (var item in atr.Style)
                        this.AppendStyle(item.Key, item.Value);
                }
                if (atr.HtmlAttributes != null)
                {
                    foreach (var item in atr.HtmlAttributes)
                        this.AppendHtmlAtribute(item.Key, item.Value);
                }
            }
        }
    }
}