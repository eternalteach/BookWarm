using System;
using System.Runtime.Serialization;

namespace Vertex.Core.Entities
{
    [DataContract]
    public class SystemError : BaseEntity
    {
        [DataMember]
        public string ShortMessage { get; set; }

        [DataMember]
        public string FullMessage { get; set; }

        [DataMember]
        public string IpAddress{ get; set; }

        [DataMember]
        public string PageUrl { get; set; }

        [DataMember]
        public string ReferrerUrl { get; set; }

        [DataMember]
        public DateTime ErrorDate { get; set; }
    }
}