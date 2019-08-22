namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class PostMappingId : DbMigration
    {
        public override void Up()
        {
            DropPrimaryKey("dbo.PostTagMapping");
            AlterColumn("dbo.PostTagMapping", "Id", c => c.Int(nullable: false, identity: true));
            AddPrimaryKey("dbo.PostTagMapping", "Id");
        }
        
        public override void Down()
        {
            DropPrimaryKey("dbo.PostTagMapping");
            AlterColumn("dbo.PostTagMapping", "Id", c => c.Int(nullable: false));
            AddPrimaryKey("dbo.PostTagMapping", new[] { "Id", "TagId", "PostId" });
        }
    }
}
