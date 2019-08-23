namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class job : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Job",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Title = c.String(maxLength: 500),
                        Description = c.String(),
                        Location = c.String(maxLength: 500),
                        WorkDuration = c.String(maxLength: 128),
                        Sallary = c.Decimal(precision: 18, scale: 2),
                        CategoryId = c.Int(nullable: false),
                        ViewCount = c.Int(nullable: false),
                        IsActive = c.Boolean(nullable: false),
                        IsDelete = c.Boolean(nullable: false),
                        CreateDate = c.DateTime(nullable: false),
                        UpdateDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.JobCategory",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 200),
                        IsActive = c.Boolean(nullable: false),
                        IsDelete = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.JobCategory");
            DropTable("dbo.Job");
        }
    }
}
