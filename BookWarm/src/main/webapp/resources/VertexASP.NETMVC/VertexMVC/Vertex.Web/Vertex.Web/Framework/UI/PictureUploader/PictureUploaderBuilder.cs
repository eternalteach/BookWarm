using System;
using System.Linq.Expressions;
using System.Web.Mvc;

namespace Vertex.Web.Framework.UI
{
    public class PictureUploaderBuilder : ViewComponentBuilderBase<PictureUploader, PictureUploaderBuilder>
    {
        public PictureUploaderBuilder(HtmlHelper htmlHelper, PictureUploader model)
            : base(htmlHelper, model) { }

        public PictureUploaderBuilder UploadUrl(string url)
        {
            base.Component.UploadUrl = url;
            return this;
        }

        public PictureUploaderBuilder PictureId(int? id)
        {
            base.Component.PictureId = id;
            return this;
        }

        /// <summary>
        /// This is for the upload image file name. if you give entity name, file name start with the entity name.
        /// </summary>
        /// <param name="entityId"></param>
        /// <param name="entityName"></param>
        /// <returns></returns>
        public PictureUploaderBuilder EntityName(string entityName)
        {
            base.Component.EntityName = entityName;
            return this;
        }
        
        public PictureUploaderBuilder Width(string width)
        {
            base.Component.Width = width;
            return this;
        }

        public PictureUploaderBuilder Height(string height)
        {
            base.Component.Height = height;
            return this;
        }

        public PictureUploaderBuilder Circle(bool circle)
        {
            base.Component.Circle = circle;
            return this;
        }

        public PictureUploaderBuilder DefaultPictureUrl(string url)
        {
            base.Component.DefaultPictureUrl = url;
            return this;
        }
    }
}