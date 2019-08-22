using System;
using System.Linq;
using System.Web.Mvc;
using Telerik.Web.Mvc;
using Vertex.Core;
using Vertex.Core.Cache;
using Vertex.Core.Entities;
using Vertex.Service;
using Vertex.Web.Framework.Attributes;
using Vertex.Web.Framework.Controllers;
using Vertex.Web.Areas.Manage.Models;

namespace Vertex.Web.Areas.Manage.Controllers
{
    [Authorize]
    public partial class SettingController : BaseController
    {
        #region Fields

        private readonly ISettingService settingService;
        private readonly ICacheManager cacheManager;

        #endregion Fields

        #region Ctor

        public SettingController(ISettingService _settingService,
            ICacheManager _cacheManager)
        {
            settingService = _settingService;
            cacheManager = _cacheManager;
        }

        #endregion Ctor

        public ActionResult Create()
        {
            var model = new SettingModel();
            return View(model);
        }

        /// <summary>
        /// Create a setting
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Create")]
        public ActionResult Create(SettingModel model)
        {
            if (ModelState.IsValid)
            {
                var setting = new Setting
                {
                    Name = model.Name,
                    DataType = model.DataType,
                    Description = model.Description,
                    Value = this.GetValue(model, model.DataType)
                };

                var result = settingService.Save(setting);
                if (result)
                    this.NotifySuccess("Successfully saved.");
                else
                    this.NotifyError("Item can not saved!");

                return RedirectToAction("Edit", new { Id = setting.Id });
            }

            return View(model);
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Edit(int? id)
        {
            if (!id.HasValue)
                return RedirectToAction("List");

            var setting = settingService.GetById(id.Value);
            if (setting == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            var model = new SettingModel
            {
                Id = setting.Id,
                Name = setting.Name,
                DataType = setting.DataType,
                Description = setting.Description
            };
            this.SetSettingModelValue(setting, model);

            return View(model);
        }

        /// <summary>
        /// Edit a setting
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButtonAction(Name = "action", Argument = "Edit")]
        public ActionResult Edit(SettingModel model)
        {
            if (ModelState.IsValid)
            {
                var setting = settingService.GetById(model.Id);
                if (setting == null)
                {
                    this.NotifyError("Item not found.");
                    return RedirectToAction("List");
                }

                setting.Name = model.Name;
                setting.Description = model.Description;
                setting.DataType = model.DataType;
                setting.Value = this.GetValue(model, model.DataType);

                var result = settingService.Save(setting);
                if (result)
                    this.NotifySuccess("Successfully saved.");
                else
                    this.NotifyError("Item can not saved!");

                return RedirectToAction("Edit", new { id = model.Id });
            }

            return View(model);
        }

        /// <summary>
        /// Delete a setting
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [DemoAuthorize(SystemRoles.Admin)]
        [HttpPost]
        [MultipleButtonAction(Name = "action", Argument = "Delete")]
        public ActionResult Delete(string name)
        {
            var setting = settingService.GetByName(name);
            if (setting == null)
            {
                this.NotifyError("Item not found.");
                return RedirectToAction("List");
            }

            var result = settingService.Delete(setting);
            if (result)
                this.NotifySuccess("Successfully deleted.");
            else
                this.NotifyError("Item can not deleted!");

            return RedirectToAction("List");
        }

        public ActionResult List()
        {
            var model = settingService.GetAllSettings().Select(x => new SettingModel
            {
                Id = x.Id,
                Name = x.Name,
                DataType = x.DataType,
                Description = x.Description
            }).ToList();

            return View(new GridModel<SettingModel>
            {
                Data = model,
                Total = model.Count()
            });
        }

        private string GetValue(SettingModel model, string dataType)
        {
            SettingDataType type = (SettingDataType)Enum.Parse(typeof(SettingDataType), dataType, true);
            switch (type)
            {
                case SettingDataType.String:
                    return model.StringValue;

                case SettingDataType.Number:
                    return Convert.ToString(model.NumberValue);

                case SettingDataType.Boolean:
                    return Convert.ToString(model.BooleanValue);

                case SettingDataType.Date:
                    return Convert.ToString(model.DateValue);

                case SettingDataType.Picture:
                    return Convert.ToString(model.PictureValue);
            }
            return null;
        }

        private void SetSettingModelValue(Setting setting, SettingModel model)
        {
            SettingDataType type = (SettingDataType)Enum.Parse(typeof(SettingDataType), setting.DataType, true);
            switch (type)
            {
                case SettingDataType.String:
                    model.StringValue = Convert.ToString(setting.Value);
                    break;

                case SettingDataType.Number:
                    model.NumberValue = Convert.ToInt32(setting.Value);
                    break;

                case SettingDataType.Boolean:
                    model.BooleanValue = Convert.ToBoolean(setting.Value);
                    break;

                case SettingDataType.Date:
                    model.DateValue = Convert.ToDateTime(setting.Value);
                    break;

                case SettingDataType.Picture:
                    model.PictureValue = Convert.ToInt32(setting.Value);
                    break;

                default:
                    break;
            }
        }
    }
}