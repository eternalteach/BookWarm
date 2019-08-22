using System.Collections.Generic;

namespace Vertex.Web.Framework.UI
{
    public class Nav
    {
        public Nav()
        {
            this.Dropdowns = new List<Dropdown>();
        }

        public bool IsLightText { get; set; }
        public List<Dropdown> Dropdowns { get; set; }
    }

    public class Dropdown
    { 
        public string LinkText { get; set; }
        public string Action { get; set; }
        
        public bool IsActive { get { return false; } }
        public bool HasSubMenu { get { return Dropdowns != null && Dropdowns.Count > 0; } }

        public List<Dropdown> Dropdowns { get; set; }
        public DropdownType DropdownType { get; set; }


        public Dropdown(DropdownType dropdownType)
        {
            this.DropdownType = dropdownType;
            this.Dropdowns = new List<Dropdown>();
        }

        public Dropdown(string linkText, string action = "")
        {
            this.LinkText = linkText;
            this.Action = action;

            this.Dropdowns = new List<Dropdown>();
            this.DropdownType = DropdownType.Link;
        } 
    }

    public enum DropdownType
    {
        Link,
        Divider
    }
}