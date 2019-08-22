namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class testimationsIsActive : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Testimonials", "IsActive", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Testimonials", "IsActive");
        }
    }
}
