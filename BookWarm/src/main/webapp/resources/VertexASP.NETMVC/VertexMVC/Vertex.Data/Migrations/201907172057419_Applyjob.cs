namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Applyjob : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.ApplyJob",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        JobId = c.Int(nullable: false),
                        Name = c.String(maxLength: 128),
                        SurName = c.String(maxLength: 128),
                        Email = c.String(maxLength: 128),
                        Phone = c.String(maxLength: 64),
                        Message = c.String(),
                        Address = c.String(maxLength: 500),
                        Website = c.String(maxLength: 500),
                        LinkedInProfileURL = c.String(maxLength: 500),
                        ApplyDate = c.DateTime(nullable: false),
                        IsActive = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            AlterColumn("dbo.Job", "WorkType", c => c.String(maxLength: 128));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Job", "WorkType", c => c.String());
            DropTable("dbo.ApplyJob");
        }
    }
}
