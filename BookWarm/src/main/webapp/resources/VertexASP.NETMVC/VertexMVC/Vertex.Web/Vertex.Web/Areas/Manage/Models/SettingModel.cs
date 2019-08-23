using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using Vertex.Core.Entities;

namespace Vertex.Web.Areas.Manage.Models
{
    public class SettingModel
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public string Description { get; set; }

        [Display(Name = "Value")]
        public string StringValue { get; set; }

        [Display(Name = "Value")]
        public int? PictureValue { get; set; }

        [Display(Name = "Value")]
        public DateTime? DateValue { get; set; }

        [Display(Name = "Value")]
        public Int32 NumberValue { get; set; }

        [Display(Name = "Value")]
        public Boolean BooleanValue { get; set; }

        [Required]
        [Display(Name = "Data Type")]
        public string DataType { get; set; }

        public List<string> DataTypes
        {
            get
            {
                return Enum.GetNames(typeof(SettingDataType)).ToList();
            }
        }
    }
}