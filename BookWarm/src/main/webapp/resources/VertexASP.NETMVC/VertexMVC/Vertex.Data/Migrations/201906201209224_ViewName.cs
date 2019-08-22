namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ViewName : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Post", "ViewName", c => c.String(maxLength: 50));
            DropColumn("dbo.Post", "TemplateName");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Post", "TemplateName", c => c.String(maxLength: 50));
            DropColumn("dbo.Post", "ViewName");
        }
    }
}
