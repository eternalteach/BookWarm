using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Vertex.Core.Entities
{
    public class Setting : BaseEntity
    {
        [MaxLength(128)]
        [Required]
        public string Name { get; set; }

        [MaxLength(512)]
        public string Description { get; set; }

        [Required]
        public string Value { get; set; }

        [MaxLength(50)]
        [Required]
        public string DataType { get; set; }



        [NotMapped]
        public bool HasValue { get { return !string.IsNullOrEmpty(Value); } }

        [NotMapped]
        public SettingDataType GetDataType
        {
            get
            {
                if (!string.IsNullOrEmpty(this.DataType))
                    return (SettingDataType)Enum.Parse(typeof(SettingDataType), this.DataType, true);

                return SettingDataType.String;
            }
        }

        [NotMapped]
        public Int64 NumberValue
        {
            get
            {
                if (this.HasValue && this.GetDataType == SettingDataType.Number)
                    return Convert.ToInt64(this.Value);
                return 0;
            }
        }

        [NotMapped]
        public bool BoolValue
        {
            get
            {
                if (this.HasValue && this.GetDataType == SettingDataType.Boolean)
                    return Convert.ToBoolean(this.Value);
                return false;
            }
        }

        [NotMapped]
        public DateTime? DateTimeValue
        {
            get
            {
                if (this.HasValue && this.GetDataType == SettingDataType.Date)
                    return Convert.ToDateTime(this.Value);
                return null;
            }
        }

        [NotMapped]
        public Int32 PictureValue
        {
            get
            {
                if (this.HasValue && this.GetDataType == SettingDataType.Picture)
                    return Convert.ToInt32(this.Value);
                return 0;
            }
        }

        [NotMapped]
        public string PictureUrl { get; set; }
    }

    public enum SettingDataType
    {
        String,
        Number,
        Boolean,
        Date,
        Picture
    }
}