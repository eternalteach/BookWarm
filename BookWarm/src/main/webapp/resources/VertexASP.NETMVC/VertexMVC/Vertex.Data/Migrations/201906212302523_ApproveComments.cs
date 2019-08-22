namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ApproveComments : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Post", "ApproveComment", c => c.Boolean(nullable: false));
            AddColumn("dbo.Comment", "Approved", c => c.Boolean(nullable: false));
            DropColumn("dbo.Comment", "IsAccept");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Comment", "IsAccept", c => c.Boolean(nullable: false));
            DropColumn("dbo.Comment", "Approved");
            DropColumn("dbo.Post", "ApproveComment");
        }
    }
}
