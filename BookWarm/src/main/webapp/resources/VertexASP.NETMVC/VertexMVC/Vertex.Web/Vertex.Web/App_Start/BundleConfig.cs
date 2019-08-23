using System.Web.Optimization;

namespace Vertex.Web
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            /* File Upload
			-----------------------------------------------------*/
            bundles.Add(new ScriptBundle("~/bundles/fileupload").Include(
                "~/Content/vendor/jquery-ui/widget.js",
                "~/Content/vendor/fileuploader/jquery.iframe-transport.js",
                "~/Content/vendor/fileuploader/jquery.fileupload.js",
                "~/Content/vendor/fileuploader/jquery.fileupload-single-ui.js"));

            /* Summernote
			-----------------------------------------------------*/
            bundles.Add(new ScriptBundle("~/bundles/summernote").Include(
                "~/Content/vendor/editors/summernote/summernote-bs4.min.js",
                "~/Content/vendor/editors/summernote/plugins/smartstore.image.js",
                "~/Content/vendor/editors/summernote/plugins/smartstore.link.js",
                "~/Content/vendor/editors/summernote/plugins/smartstore.tablestyles.js",
                "~/Content/vendor/editors/summernote/plugins/smartstore.cssclass.js",
                "~/Content/vendor/editors/summernote/globalinit.js"));

            /* CodeMirror (V 5.3.3)
			-----------------------------------------------------*/
            var cm = "~/Content/vendor/editors/CodeMirror/";
            bundles.Add(new ScriptBundle("~/bundles/codemirror").Include(
                cm + "codemirror.min.js",
                cm + "addon/fold/xml-fold.min.js",
                cm + "addon/hint/show-hint.min.js",
                cm + "addon/hint/xml-hint.min.js",
                cm + "addon/hint/html-hint.min.js",
                cm + "addon/hint/css-hint.min.js",
                cm + "addon/hint/javascript-hint.min.js",
                cm + "addon/edit/closetag.min.js",
                cm + "addon/edit/closebrackets.min.js",
                cm + "addon/edit/matchtags.min.js",
                cm + "addon/edit/matchbrackets.min.js",
                cm + "addon/mode/multiplex.min.js",
                cm + "addon/mode/overlay.min.js",
                cm + "addon/display/fullscreen.min.js",
                cm + "addon/selection/active-line.min.js",
                cm + "mode/xml/xml.min.js",
                cm + "mode/javascript/javascript.min.js",
                cm + "mode/css/css.min.js",
                cm + "mode/htmlmixed/htmlmixed.min.js",
                cm + "mode/liquid/liquid.js"));

            bundles.Add(new StyleBundle("~/css/codemirror").Include(
                cm + "codemirror.min.css",
                cm + "codemirror.custom.css",
                cm + "addon/hint/show-hint.min.css",
                cm + "addon/display/fullscreen.css",
                cm + "theme/eclipse.min.css",
                cm + "mode/liquid/liquid.css"));

            /* Roxy File Manager
			-----------------------------------------------------*/
            var roxy = "~/Administration/Content/filemanager/";
            var scriptBundle = new ScriptBundle("~/bundles/roxyfm").Include(
                roxy + "js/jquery-2.1.1.min.js",
                roxy + "js/jquery-ui-1.10.4.custom.min.js",
                roxy + "js/filetypes.js",
                roxy + "js/custom.js",
                roxy + "js/main.js",
                roxy + "js/utils.js",
                roxy + "js/file.js",
                roxy + "js/directory.js",
                roxy + "js/jquery-dateFormat.min.js");
            bundles.Add(scriptBundle);
        }
    }
}
