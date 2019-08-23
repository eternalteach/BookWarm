namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Portfolio : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Portfolio",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Title = c.String(maxLength: 500),
                        Description = c.String(),
                        Content = c.String(),
                        ViewName = c.String(maxLength: 150),
                        CategoryId = c.Int(nullable: false),
                        ViewCount = c.Int(nullable: false),
                        IsActive = c.Boolean(nullable: false),
                        IsDelete = c.Boolean(nullable: false),
                        CreateDate = c.DateTime(nullable: false),
                        UpdateDate = c.DateTime(nullable: false),
                        UserId = c.String(),
                        PortfolioFormat = c.String(maxLength: 50),
                        PortfolioFormatValue = c.String(),
                        PictureId = c.Int(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.PortfolioCategory",
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
            DropTable("dbo.PortfolioCategory");
            DropTable("dbo.Portfolio");
        }
    }
}
