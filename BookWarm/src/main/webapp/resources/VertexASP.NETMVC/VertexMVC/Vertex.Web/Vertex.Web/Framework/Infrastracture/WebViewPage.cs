using Vertex.Core;
using Vertex.Core.Cache;
using Vertex.Core.Entities;
using Vertex.Core.Infrastructure;
using Vertex.Service;

namespace Vertex.Web.Framework.Infrastructure
{
    public abstract class WebViewPage<TModel> : System.Web.Mvc.WebViewPage<TModel>
    {
        private ISettingService settingService;
        private IMediaStorageService mediaStorageService;
        private ICacheManager cacheManager;

        public override void InitHelpers()
        {
            settingService = Engine.Resolve<ISettingService>();
            cacheManager = Engine.Resolve<ICacheManager>();
            mediaStorageService = Engine.Resolve<IMediaStorageService>();
            base.InitHelpers();
        }

        public delegate Setting Settings(string name);
        private Settings _setting;

        public Settings Setting
        {
            get
            {
                if (_setting == null)
                {
                    _setting = (name) =>
                    {
                        return cacheManager.Get(string.Format(CacheConstant.SETTING_ITEM, name), () =>
                        {
                            var result = settingService.GetByName(name);
                            if (result == null)
                                return new Setting() { Value = string.Format("{0} not found!", name) };

                            if (result.PictureValue > 0)
                                result.PictureUrl = mediaStorageService.GetPictureUrl(result.PictureValue);

                            return result;
                        });
                    };
                }
                return _setting;
            }
        }
    }
}