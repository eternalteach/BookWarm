using Vertex.Core.Entities;
using System.Collections.Generic;

namespace Vertex.Service
{
    public interface ISettingService
    {
        Setting GetById(int id);
        Setting GetByName(string name);
        IEnumerable<Setting> GetAllSettings();
        bool Save(Setting setting);
        bool Delete(Setting setting);
    }
}
