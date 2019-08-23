namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class PostTag : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.PostTagMapping",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        PostId = c.Int(nullable: false),
                        TagId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.PostTag", "Name", c => c.String());
            DropColumn("dbo.PostTag", "PostId");
            DropColumn("dbo.PostTag", "TagId");
            DropTable("dbo.Tag");
        }
        
        public override void Down()
        {
            CreateTable(
                "dbo.Tag",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TagName = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.PostTag", "TagId", c => c.Int(nullable: false));
            AddColumn("dbo.PostTag", "PostId", c => c.Int(nullable: false));
            DropColumn("dbo.PostTag", "Name");
            DropTable("dbo.PostTagMapping");
        }
    }
}
