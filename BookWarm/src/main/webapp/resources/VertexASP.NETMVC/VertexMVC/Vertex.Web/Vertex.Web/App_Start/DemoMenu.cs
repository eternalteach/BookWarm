using System.Web;
using System.Web.Mvc;
using Vertex.Web.Framework.UI;

namespace Vertex.Web
{
    public partial class DemoMenu
    {
        public static Nav GetDemoMenu()
        {
            var nav = new Nav();
            var url = new UrlHelper(HttpContext.Current.Request.RequestContext);

            var homes = new Dropdown("Home")
            {
                Dropdowns = {
                   new Dropdown("Home - Variation 1", url.Action("Index", "Home", new { Area = "" })),
                   new Dropdown("Home - Variation 2", url.Action("Index2", "Home", new { Area = "" })),
                   new Dropdown("Home - Variation 3", url.Action("Index3", "Home", new { Area = "" })),
                   new Dropdown("Home - Variation 4", url.Action("Index4", "Home", new { Area = "" })),
                   new Dropdown("Home - Variation 5", url.Action("Index5", "Home", new { Area = "" }))
                }
            };
            var pages = new Dropdown("Pages")
            {
                Dropdowns = {
                   //new Dropdown("Features"),
                   //new Dropdown(DropdownType.Divider),
                   new Dropdown("About Us", url.Action("About", "Page", new { Area = "" })),
                   new Dropdown("Contact Us", url.Action("Contact", "Page", new { Area = "" })),
                   new Dropdown("Team", url.Action("Team", "Page", new { Area = "" })),
                   new Dropdown("Jobs", url.Action("Jobs", "Page", new { Area = "" })), 
                   new Dropdown("Page 404", url.Action("Category", "Blog", new { Area = "" })),
                   //new Dropdown("Team", ""),
                   //new Dropdown("Services", ""),
                   //new Dropdown("Careers", ""),
                   //new Dropdown("Job Page", ""),
                   //new Dropdown("Account", "") {
                   //    DropdownList = {
                   //       new Dropdown("Login", ""),
                   //       new Dropdown("Register", ""),
                   //       new Dropdown("Recovery", "")
                   //    }
                   //},
                   //new Dropdown("Help Page", ""),
                   //new Dropdown("Pricing Page", ""),
                   //new Dropdown(DropdownType.Divider),
                   //new Dropdown("Extra") {
                   //    DropdownList = {
                   //       new Dropdown("FAQ", ""),
                   //       new Dropdown("404 Error", "")
                   //    }
                   //},
                }
            };
            var blog = new Dropdown("Blog")
            {
                Dropdowns = {
                   new Dropdown("Card") {
                       Dropdowns = {
                          new Dropdown("Left Sidebar", url.Action("CardLeftSidebar", "Blog", new { Area = "" })),
                          new Dropdown("Right Sidebar", url.Action("CardRightSidebar", "Blog", new { Area = "" })),
                          new Dropdown("Full Width", url.Action("CardFullWidth", "Blog", new { Area = "" }))
                       }
                   },
                   new Dropdown("Grid") {
                       Dropdowns = {
                          new Dropdown("Left Sidebar", url.Action("GridLeftSidebar", "Blog", new { Area = "" })),
                          new Dropdown("Right Sidebar", url.Action("GridRightSidebar", "Blog", new { Area = "" })),
                          new Dropdown("Full Width", url.Action("GridFullWidth", "Blog", new { Area = "" }))
                       }
                   },
                   new Dropdown("List") {
                       Dropdowns = {
                          new Dropdown("Left Sidebar", url.Action("ListLeftSidebar", "Blog", new { Area = "" })),
                          new Dropdown("Right Sidebar", url.Action("ListRightSidebar", "Blog", new { Area = "" })),
                          new Dropdown("Full Width", url.Action("ListFullWidth", "Blog", new { Area = "" }))
                       }
                   },
                   new Dropdown("Single") {
                       Dropdowns = {
                          new Dropdown("Video", "/this-is-vide-post-example-with-default-view"),
                          new Dropdown("Audio", "/audio-post-example-with-default-view"),
                          new Dropdown("Quote", "/this-is-quote-post-with-center-view"),
                          new Dropdown("Center View", "/mobile-friendly-design"),
                          new Dropdown("Standard View", "/new-es2019-features-every-javascript-developer-should-know"),
                          new Dropdown("Fullwidth View", "/whats-new-in-life"),
                          new Dropdown("Fullwidth No Sidebar", "/10-best-games-for-console-2019")
                       }
                   }
                }
            };
            var portfolio = new Dropdown("Portfolio")
            {
                Dropdowns = {
                   //new Dropdown("Features"),
                   //new Dropdown(DropdownType.Divider),
                   new Dropdown("Agency", url.Action("Agency", "Portfolio", new { Area = "" })),
                   new Dropdown("Awesome Work", url.Action("AwesomeWork", "Portfolio", new { Area = "" })),
                   new Dropdown("Masonry", url.Action("Masonry", "Portfolio", new { Area = "" })),
                   //new Dropdown(DropdownType.Divider),
                   //new Dropdown("Single") {
                   //    DropdownList = {
                   //       new Dropdown("Default", "")
                   //    }
                   //},
                }
            };
            var uikits = new Dropdown("UI Kit")
            {
                Dropdowns = {
                   new Dropdown("Bootstrap") {
                       Dropdowns = {
                           new Dropdown("Accordion", url.Action("Accordion", "UIKit", new { Area = "" })),
                           new Dropdown("Alert", url.Action("Alert", "UIKit", new { Area = "" })),
                           new Dropdown("Button", url.Action("Button", "UIKit", new { Area = "" })),
                           new Dropdown("Popover", url.Action("Popover", "UIKit", new { Area = "" })),
                           new Dropdown("Progress", url.Action("Progress", "UIKit", new { Area = "" })),
                           new Dropdown("Tab", url.Action("Tab", "UIKit", new { Area = "" })),
                           new Dropdown("Tooltip", url.Action("Tooltip", "UIKit", new { Area = "" })),
                       }
                   },
                   new Dropdown(DropdownType.Divider),
                   new Dropdown("IconBox", url.Action("IconBox", "UIKit", new { Area = "" })),
                   new Dropdown("Popup", url.Action("Popup", "UIKit", new { Area = "" })),
                   new Dropdown("Countup", url.Action("Countup", "UIKit", new { Area = "" })),
                   new Dropdown("Oval Divider", url.Action("OvalDivider", "UIKit", new { Area = "" })),
                   // new Dropdown("Form", url.Action("Form", "UIKit", new { Area = "" })),
                   new Dropdown("Slider", url.Action("Slider", "UIKit", new { Area = "" })),
                   new Dropdown("Typing", url.Action("Typing", "UIKit", new { Area = "" }))
                }
            };
            var features = new Dropdown("Features", url.Action("Index", "Features", new { Area = "" }))
            {
                Dropdowns = {
                    new Dropdown("<strong>Features</strong>", url.Action("Index", "Features", new { Area = "" })),
                    new Dropdown(DropdownType.Divider),
                    new Dropdown("Manage") {
                       Dropdowns = {
                           new Dropdown("Blog Post", url.Action("BlogPost", "Features", new { Area = "" })),
                           new Dropdown("Portfolio", url.Action("Portfolio", "Features", new { Area = "" })),
                           new Dropdown("Team Member", url.Action("TeamMember", "Features", new { Area = "" })),
                           new Dropdown("Clients", url.Action("Clients", "Features", new { Area = "" })),
                           new Dropdown("Testimonials", url.Action("Testimonials", "Features", new { Area = "" })),
                           new Dropdown("Jobs", url.Action("Jobs", "Features", new { Area = "" })),
                       }
                   }, 
                    new Dropdown("Picture Uploader", url.Action("PictureUploader", "Features", new { Area = "" })),
                    // new Dropdown("File Uploader", url.Action("FileUploader", "Features", new { Area = "" })),
                    new Dropdown("Html & Code Editor", url.Action("HtmlEditor", "Features", new { Area = "" })),
                }
            };

            nav.Dropdowns.Add(homes);
            nav.Dropdowns.Add(pages);
            nav.Dropdowns.Add(blog);
            nav.Dropdowns.Add(portfolio);
            nav.Dropdowns.Add(uikits);
            nav.Dropdowns.Add(features);

            return nav;
        }


        public static Nav GetManagePanelMenu()
        {
            var url = new UrlHelper(HttpContext.Current.Request.RequestContext);

            var nav = new Nav();

            var items = new Dropdown("Menu")
            {
                Dropdowns = {
                    new Dropdown("Dashboard", url.Action("Index", "Dashboard", new { Area = "Manage" })),
                    new Dropdown("Profile", url.Action("Index", "User", new { Area = "Manage" })),
                    new Dropdown("Content") {
                       Dropdowns = {
                           new Dropdown("Posts", url.Action("List", "Post", new { Area = "Manage" })),
                           new Dropdown("Categories", url.Action("List", "Category", new { Area = "Manage" })),
                           new Dropdown(DropdownType.Divider),
                           new Dropdown("Portfolios", url.Action("List", "Portfolio", new { Area = "Manage" })),
                           new Dropdown("Portfolio Categories", url.Action("List", "PortfolioCategory", new { Area = "Manage" })),
                           new Dropdown(DropdownType.Divider),
                           new Dropdown("Client & Testimonials", url.Action("List", "ClientTestimonials", new { Area = "Manage" })),
                           new Dropdown("Team Members", url.Action("List", "TeamMember", new { Area = "Manage" })),
                           new Dropdown("Contacts", url.Action("List", "Contact", new { Area = "Manage" })),
                           new Dropdown(DropdownType.Divider),
                           new Dropdown("Jobs", url.Action("List", "Job", new { Area = "Manage" })),
                           new Dropdown("Job Categories", url.Action("List", "JobCategory", new { Area = "Manage" })),
                           new Dropdown("Apply Jobs", url.Action("List", "ApplyJob", new { Area = "Manage" })),
                           new Dropdown(DropdownType.Divider),
                           new Dropdown("Subscribers", url.Action("List", "Subscriber", new { Area = "Manage" })),
                       }
                    }, 
                    new Dropdown("User") {
                        Dropdowns = {
                            new Dropdown("Users", url.Action("List", "User", new { Area = "Manage" })),
                            new Dropdown("Roles", url.Action("List", "Role", new { Area = "Manage" })),
                            // new Dropdown("Change Password", url.Action("ChangePassword", "User", new { Area = "Manage" }))
                        }
                    },
                    new Dropdown(DropdownType.Divider),
                    new Dropdown("Settings", url.Action("List", "Setting", new { Area = "Manage" })),
                    new Dropdown("Sign Out", url.Action("LogOff", "Account", new { Area = "" }))
                }
            };

            nav.Dropdowns.Add(items);
            return nav;
        }
    }
}