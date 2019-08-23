namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Applyjob3 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.ApplyJob", "FullName", c => c.String(maxLength: 128));
            DropColumn("dbo.ApplyJob", "Name");
            DropColumn("dbo.ApplyJob", "SurName");
        }
        
        public override void Down()
        {
            AddColumn("dbo.ApplyJob", "SurName", c => c.String(maxLength: 128));
            AddColumn("dbo.ApplyJob", "Name", c => c.String(maxLength: 128));
            DropColumn("dbo.ApplyJob", "FullName");
        }
    }
}
