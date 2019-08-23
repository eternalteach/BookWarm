namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class PostTag2 : DbMigration
    {
        public override void Up()
        {
            CreateIndex("dbo.PostTagMapping", "PostId");
            CreateIndex("dbo.PostTagMapping", "TagId");
            AddForeignKey("dbo.PostTagMapping", "PostId", "dbo.Post", "Id");
            AddForeignKey("dbo.PostTagMapping", "TagId", "dbo.PostTag", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.PostTagMapping", "TagId", "dbo.PostTag");
            DropForeignKey("dbo.PostTagMapping", "PostId", "dbo.Post");
            DropIndex("dbo.PostTagMapping", new[] { "TagId" });
            DropIndex("dbo.PostTagMapping", new[] { "PostId" });
        }
    }
}
