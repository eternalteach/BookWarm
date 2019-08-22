using System;
using System.IO;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Telerik.Web.Mvc.Extensions;
using Vertex.Core.Entities;
using Vertex.Service;
using Vertex.Web.Framework.Controllers;

namespace Vertex.Web.Areas.Manage.Controllers
{
    [Authorize]
    public class FileUploadController : BaseController
    {
        #region Fields

        private readonly IMediaStorageService mediaStorageService;

        #endregion Fields

        #region Ctor

        public FileUploadController(IMediaStorageService _mediaStorageService)
        {
            mediaStorageService = _mediaStorageService;
        }

        #endregion Ctor

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UploadFiles(string entityId, string entityName)
        {
            try
            {
                string uploadPath = Server.MapPath("~/Uploads/");
                foreach (string _file in Request.Files)
                {
                    var file = Request.Files[_file];
                    if (file != null && file.ContentLength > 0)
                    {
                        string guid = Guid.NewGuid().ToString();

                        entityId = entityId.HasValue() ? entityId : string.Empty;
                        entityName = entityName.HasValue() ? entityName : string.Empty;

                        string fileExtension = Path.GetExtension(file.FileName);
                        string fileName = string.Format("{0}-{1}_{2}{3}", entityName, entityId, guid, fileExtension);
                        var path = Path.Combine(uploadPath, fileName);
                        file.SaveAs(path);

                        string filePath = string.Concat("/Uploads/", fileName);
                        var media = new MediaStorage()
                        {
                            FilePath = filePath,
                            FileName = fileName,
                            MimeType = MimeMapping.GetMimeMapping(fileName),
                            EntityName = entityName,
                            CreateDateUtc = DateTime.UtcNow,
                            UpdateDateUtc = DateTime.UtcNow,
                        };

                        mediaStorageService.Save(media);

                        return Json(new { success = true, pictureId = media.Id, imageUrl = filePath });
                    }
                }
            }
            catch (Exception)
            {
                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return Json(new { success = false, message = "Upload failed" });
            }

            return Json(new { success = true, message = "File uploaded successfully" });
        }
    }
}