namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class PostFormat : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Post", "PostFormat", c => c.String(maxLength: 50));
            DropColumn("dbo.Post", "PostType");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Post", "PostType", c => c.String(maxLength: 50));
            DropColumn("dbo.Post", "PostFormat");
        }
    }
}
