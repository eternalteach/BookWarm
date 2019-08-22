namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Comment : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Comment", "CommentDate", c => c.DateTime(nullable: false));
            AddColumn("dbo.Comment", "UserId", c => c.String());
            AlterColumn("dbo.Comment", "ParentId", c => c.Int());
            DropColumn("dbo.Comment", "CreateDate");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Comment", "CreateDate", c => c.DateTime(nullable: false));
            AlterColumn("dbo.Comment", "ParentId", c => c.Int(nullable: false));
            DropColumn("dbo.Comment", "UserId");
            DropColumn("dbo.Comment", "CommentDate");
        }
    }
}
