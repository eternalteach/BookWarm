namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class jobSallary : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Job", "WorkType", c => c.String(maxLength:128));
            AddColumn("dbo.Job", "SallaryMin", c => c.Decimal(precision: 18, scale: 2));
            AddColumn("dbo.Job", "SallaryMax", c => c.Decimal(precision: 18, scale: 2));
            DropColumn("dbo.Job", "WorkDuration");
            DropColumn("dbo.Job", "Sallary");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Job", "Sallary", c => c.Decimal(precision: 18, scale: 2));
            AddColumn("dbo.Job", "WorkDuration", c => c.String());
            DropColumn("dbo.Job", "SallaryMax");
            DropColumn("dbo.Job", "SallaryMin");
            DropColumn("dbo.Job", "WorkType");
        }
    }
}
