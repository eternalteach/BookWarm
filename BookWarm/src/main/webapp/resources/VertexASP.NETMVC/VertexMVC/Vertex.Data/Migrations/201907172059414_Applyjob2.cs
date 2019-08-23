namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Applyjob2 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.ApplyJob", "Address", c => c.String(maxLength: 500));
            AlterColumn("dbo.ApplyJob", "Website", c => c.String(maxLength: 500));
            AlterColumn("dbo.ApplyJob", "LinkedInProfileURL", c => c.String(maxLength: 500));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.ApplyJob", "LinkedInProfileURL", c => c.String());
            AlterColumn("dbo.ApplyJob", "Website", c => c.String());
            AlterColumn("dbo.ApplyJob", "Address", c => c.String());
        }
    }
}
