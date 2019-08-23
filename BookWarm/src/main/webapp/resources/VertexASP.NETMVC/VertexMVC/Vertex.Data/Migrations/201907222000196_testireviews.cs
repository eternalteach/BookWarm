namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class testireviews : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Testimonials", "HaveReviews", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Testimonials", "HaveReviews");
        }
    }
}
