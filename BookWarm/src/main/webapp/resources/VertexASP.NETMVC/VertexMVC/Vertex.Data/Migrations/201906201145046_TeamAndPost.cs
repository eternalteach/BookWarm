namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class TeamAndPost : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Post", "Content", c => c.String());
            AddColumn("dbo.Post", "TemplateName", c => c.String(maxLength: 50));
            AddColumn("dbo.TeamMember", "Description", c => c.String());
            DropColumn("dbo.Post", "FullContent");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Post", "FullContent", c => c.String());
            DropColumn("dbo.TeamMember", "Description");
            DropColumn("dbo.Post", "TemplateName");
            DropColumn("dbo.Post", "Content");
        }
    }
}
