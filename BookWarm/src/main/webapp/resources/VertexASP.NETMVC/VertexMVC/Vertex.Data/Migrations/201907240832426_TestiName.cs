namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class TestiName : DbMigration
    {
        public override void Up()
        {
            RenameTable(name: "dbo.Testimonials", newName: "ClientTestimonials");
            AddColumn("dbo.ClientTestimonials", "ClientName", c => c.String(maxLength: 256));
            AddColumn("dbo.ClientTestimonials", "ClientLogoId", c => c.Int(nullable: false));
            DropColumn("dbo.ClientTestimonials", "CompanyName");
            DropColumn("dbo.ClientTestimonials", "CompanyLogoId");
        }
        
        public override void Down()
        {
            AddColumn("dbo.ClientTestimonials", "CompanyLogoId", c => c.Int(nullable: false));
            AddColumn("dbo.ClientTestimonials", "CompanyName", c => c.String(maxLength: 256));
            DropColumn("dbo.ClientTestimonials", "ClientLogoId");
            DropColumn("dbo.ClientTestimonials", "ClientName");
            RenameTable(name: "dbo.ClientTestimonials", newName: "Testimonials");
        }
    }
}
