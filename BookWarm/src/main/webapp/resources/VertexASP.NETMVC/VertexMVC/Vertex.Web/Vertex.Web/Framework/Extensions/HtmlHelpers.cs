using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Vertex.Web.Framework.Extensions
{
    public static class HtmlHelpers
    {
        private class ContentBlock : IDisposable
        {
            private static string scriptsKey = "content";
            private WebViewPage webPageBase;

            public static List<string> PageContent(string key)
            {
                scriptsKey = key;
                if (HttpContext.Current.Items[key] == null)
                    HttpContext.Current.Items[key] = new List<string>();
                return (List<string>)HttpContext.Current.Items[key];
            }

            public ContentBlock(WebViewPage webPageBase, string key)
            {
                scriptsKey = key;
                this.webPageBase = webPageBase;
                this.webPageBase.OutputStack.Push(new StringWriter());
            }

            public void Dispose()
            {
                PageContent(scriptsKey).Add(((StringWriter)this.webPageBase.OutputStack.Pop()).ToString());
            }
        }

        public static IDisposable PageWrapContent(this HtmlHelper helper, string key)
        { 
            return new ContentBlock((WebViewPage)helper.ViewDataContainer, key);
        }

        public static MvcHtmlString RenderPageWrap(this HtmlHelper helper, string key)
        { 
            return MvcHtmlString.Create(string.Join(Environment.NewLine, ContentBlock.PageContent(key).Select(s => s.ToString())));
        }
    }
}