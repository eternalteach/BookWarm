namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ContactToDeleted : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Contact", "IsDeleted", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Contact", "IsDeleted");
        }
    }
}
