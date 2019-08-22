namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Posts : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Comment", "PostId", "dbo.Post");
            DropIndex("dbo.Comment", new[] { "PostId" });
            AddColumn("dbo.Post", "PostType", c => c.String(maxLength: 50));
            AlterColumn("dbo.Post", "PicturePath", c => c.String(maxLength: 500));
            AlterColumn("dbo.Post", "Title", c => c.String(maxLength: 400));
            DropColumn("dbo.Post", "Description");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Post", "Description", c => c.String(maxLength: 200));
            AlterColumn("dbo.Post", "Title", c => c.String(maxLength: 200));
            AlterColumn("dbo.Post", "PicturePath", c => c.String(maxLength: 250));
            DropColumn("dbo.Post", "PostType");
            CreateIndex("dbo.Comment", "PostId");
            AddForeignKey("dbo.Comment", "PostId", "dbo.Post", "Id");
        }
    }
}
