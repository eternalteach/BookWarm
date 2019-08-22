namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class IsRead : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.ApplyJob", "IsRead", c => c.Boolean(nullable: false));
            AddColumn("dbo.Comment", "IsRead", c => c.Boolean(nullable: false));
            AddColumn("dbo.Contact", "IsRead", c => c.Boolean(nullable: false));
            AlterColumn("dbo.Comment", "Commentary", c => c.String(maxLength: 512));
            AlterColumn("dbo.Comment", "UserId", c => c.String(maxLength: 128));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Comment", "UserId", c => c.String());
            AlterColumn("dbo.Comment", "Commentary", c => c.String(maxLength: 500));
            DropColumn("dbo.Contact", "IsRead");
            DropColumn("dbo.Comment", "IsRead");
            DropColumn("dbo.ApplyJob", "IsRead");
        }
    }
}
