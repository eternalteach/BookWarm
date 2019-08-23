using System;

namespace Vertex.Service
{
    public interface ILogService
    {
        bool Error(string url, string urlReferrer, string ipAddress, string message, Exception exception = null);
    }
}
