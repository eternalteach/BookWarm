namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class MediaStorage : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.MediaStorage", "FileName", c => c.String());
            AddColumn("dbo.TeamMember", "PictureId", c => c.Int(nullable: false));
            AddColumn("dbo.Testimonials", "CompanyLogoId", c => c.Int(nullable: false));
            AddColumn("dbo.Testimonials", "EmployePictureId", c => c.Int(nullable: false));
            DropColumn("dbo.MediaStorage", "EntityId");
            DropColumn("dbo.MediaStorage", "Data");
        }
        
        public override void Down()
        {
            AddColumn("dbo.MediaStorage", "Data", c => c.Binary());
            AddColumn("dbo.MediaStorage", "EntityId", c => c.Int(nullable: false));
            DropColumn("dbo.Testimonials", "EmployePictureId");
            DropColumn("dbo.Testimonials", "CompanyLogoId");
            DropColumn("dbo.TeamMember", "PictureId");
            DropColumn("dbo.MediaStorage", "FileName");
        }
    }
}
