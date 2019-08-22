using System.Web.Mvc;
using Vertex.Core.Extensions;

namespace Vertex.Web.Framework.UI
{
    public class FileUploaderBuilder : ViewComponentBuilderBase<FileUploader, FileUploaderBuilder>
    {
        public FileUploaderBuilder(HtmlHelper htmlHelper, FileUploader model) : base(htmlHelper, model)
        { 
        }

        public FileUploaderBuilder UploadUrl(string value)
        {
            base.Component.UploadUrl = value;
            return this;
        }

        public FileUploaderBuilder ShowRemoveButton(bool value)
        {
            base.Component.ShowRemoveButton = value;
            return this;
        }

        public FileUploaderBuilder ShowRemoveButtonAfterUpload(bool value)
        {
            base.Component.AppendHtmlAtribute("data-show-remove-after-upload", value.ToString().ToLower());
            return this;
        }

        public FileUploaderBuilder AcceptedFileTypes(string value)
        {
            if (value.IsEmpty())
            {
                if (base.Component.HtmlAttributes.ContainsKey("data-accept"))
                    base.Component.HtmlAttributes.Remove("data-accept");
            }
            else
            {
                base.Component.HtmlAttributes["data-accept"] = value;
            }

            return this;
        }

        public FileUploaderBuilder CancelText(string value)
        {
            base.Component.CancelText = value;
            return this;
        }

        public FileUploaderBuilder RemoveText(string value)
        {
            base.Component.RemoveText = value;
            return this;
        }

        public FileUploaderBuilder UploadText(string value)
        {
            base.Component.UploadText = value;
            return this;
        }

        public FileUploaderBuilder OnUploadingHandlerName(string handlerName)
        {
            base.Component.OnUploadingHandlerName = handlerName;
            return this;
        }

        public FileUploaderBuilder OnUploadCompletedHandlerName(string handlerName)
        {
            base.Component.OnUploadCompletedHandlerName = handlerName;
            return this;
        }

        public FileUploaderBuilder OnErrorHandlerName(string handlerName)
        {
            base.Component.OnErrorHandlerName = handlerName;
            return this;
        }

        public FileUploaderBuilder OnFileRemoveHandlerName(string handlerName)
        {
            base.Component.OnFileRemoveHandlerName = handlerName;
            return this;
        }

        public FileUploaderBuilder OnAbortedHandlerName(string handlerName)
        {
            base.Component.OnAbortedHandlerName = handlerName;
            return this;
        }

        public FileUploaderBuilder OnCompletedHandlerName(string handlerName)
        {
            base.Component.OnCompletedHandlerName = handlerName;
            return this;
        }
    }
}