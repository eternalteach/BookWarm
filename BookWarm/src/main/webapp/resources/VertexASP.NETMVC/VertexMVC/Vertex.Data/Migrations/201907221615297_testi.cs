namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class testi : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Testimonials", "PersonName", c => c.String(maxLength: 128));
            AddColumn("dbo.Testimonials", "PersonPosition", c => c.String(maxLength: 128));
            AddColumn("dbo.Testimonials", "PersonPictureId", c => c.Int(nullable: false));
            AddColumn("dbo.Testimonials", "WhatSayAboutUs", c => c.String());
            AddColumn("dbo.Testimonials", "Website", c => c.String(maxLength: 512));
            AddColumn("dbo.Testimonials", "OrderNo", c => c.Int(nullable: false));
            DropColumn("dbo.Testimonials", "Description");
            DropColumn("dbo.Testimonials", "WebSiteUrl");
            DropColumn("dbo.Testimonials", "EmployeName");
            DropColumn("dbo.Testimonials", "EmployePosition");
            DropColumn("dbo.Testimonials", "EmployePictureId");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Testimonials", "EmployePictureId", c => c.Int(nullable: false));
            AddColumn("dbo.Testimonials", "EmployePosition", c => c.String());
            AddColumn("dbo.Testimonials", "EmployeName", c => c.String(maxLength: 128));
            AddColumn("dbo.Testimonials", "WebSiteUrl", c => c.String(maxLength: 512));
            AddColumn("dbo.Testimonials", "Description", c => c.String());
            DropColumn("dbo.Testimonials", "OrderNo");
            DropColumn("dbo.Testimonials", "Website");
            DropColumn("dbo.Testimonials", "WhatSayAboutUs");
            DropColumn("dbo.Testimonials", "PersonPictureId");
            DropColumn("dbo.Testimonials", "PersonPosition");
            DropColumn("dbo.Testimonials", "PersonName");
        }
    }
}
