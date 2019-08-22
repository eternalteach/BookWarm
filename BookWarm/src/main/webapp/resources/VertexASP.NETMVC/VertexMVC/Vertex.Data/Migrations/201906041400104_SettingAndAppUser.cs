namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class SettingAndAppUser : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "IsActive", c => c.Boolean(nullable: false));
            DropColumn("dbo.Setting", "EntityName");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Setting", "EntityName", c => c.String(maxLength: 50));
            DropColumn("dbo.AspNetUsers", "IsActive");
        }
    }
}
