namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class PostTag3 : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.PostTagMapping", "PostId", "dbo.Post");
            DropForeignKey("dbo.PostTagMapping", "TagId", "dbo.PostTag");
            DropIndex("dbo.PostTagMapping", new[] { "PostId" });
            DropIndex("dbo.PostTagMapping", new[] { "TagId" });
            DropPrimaryKey("dbo.PostTagMapping");
            AlterColumn("dbo.PostTagMapping", "Id", c => c.Int(nullable: false));
            AddPrimaryKey("dbo.PostTagMapping", new[] { "Id", "TagId", "PostId" });
        }
        
        public override void Down()
        {
            DropPrimaryKey("dbo.PostTagMapping");
            AlterColumn("dbo.PostTagMapping", "Id", c => c.Int(nullable: false, identity: true));
            AddPrimaryKey("dbo.PostTagMapping", "Id");
            CreateIndex("dbo.PostTagMapping", "TagId");
            CreateIndex("dbo.PostTagMapping", "PostId");
            AddForeignKey("dbo.PostTagMapping", "TagId", "dbo.PostTag", "Id");
            AddForeignKey("dbo.PostTagMapping", "PostId", "dbo.Post", "Id");
        }
    }
}
