namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class TestiTypeName : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.ClientTestimonials", "TypeName", c => c.String(nullable: false, maxLength: 128));
            DropColumn("dbo.ClientTestimonials", "HaveReviews");
        }
        
        public override void Down()
        {
            AddColumn("dbo.ClientTestimonials", "HaveReviews", c => c.Boolean(nullable: false));
            DropColumn("dbo.ClientTestimonials", "TypeName");
        }
    }
}
