namespace Vertex.Web.Framework.UI
{
    public class FileUploader : ViewComponentBase
    {
        public FileUploader()
        {
            CancelText = "Cancel";
            RemoveText = "Remove";
            UploadText = "Upload";
        }

        public string Id { get; set; }
        public bool ShowRemoveButton { get; set; } 

        public string CancelText { get; set; }
        public string RemoveText { get; set; }
        public string UploadText { get; set; }

        public string OnUploadingHandlerName { get; set; }
        public string OnUploadCompletedHandlerName { get; set; }
        public string OnErrorHandlerName { get; set; }
        public string OnFileRemoveHandlerName { get; set; }
        public string OnAbortedHandlerName { get; set; }
        public string OnCompletedHandlerName { get; set; }

        public string UploadUrl
        {
            get { return this.HtmlAttributes["data-upload-url"] as string; }
            set { this.AppendHtmlAtribute("data-upload-url", value); }
        }

        public override void GenerateHtmlAtributes()
        {
            this.AppendCssClass("fileupload");
            this.AppendHtmlAtribute("data-accept", "gif|jpe?g|png");
            this.AppendHtmlAtribute("data-show-remove-after-upload", "false");
        }
    }
}