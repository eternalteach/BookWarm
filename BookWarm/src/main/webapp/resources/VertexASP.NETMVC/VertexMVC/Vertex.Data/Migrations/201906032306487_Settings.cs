namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Settings : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Setting", "DataType", c => c.String(maxLength: 50));
            AddColumn("dbo.Setting", "EntityName", c => c.String(maxLength: 50));
            AlterColumn("dbo.Setting", "Description", c => c.String(maxLength: 500));
            AlterColumn("dbo.Setting", "Value", c => c.String());
            DropColumn("dbo.Setting", "SelectedValue");
            DropColumn("dbo.Setting", "Type");
            DropColumn("dbo.Setting", "InputType");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Setting", "InputType", c => c.Int(nullable: false));
            AddColumn("dbo.Setting", "Type", c => c.Int(nullable: false));
            AddColumn("dbo.Setting", "SelectedValue", c => c.String(maxLength: 500));
            AlterColumn("dbo.Setting", "Value", c => c.String(maxLength: 500));
            AlterColumn("dbo.Setting", "Description", c => c.String(maxLength: 250));
            DropColumn("dbo.Setting", "EntityName");
            DropColumn("dbo.Setting", "DataType");
        }
    }
}
