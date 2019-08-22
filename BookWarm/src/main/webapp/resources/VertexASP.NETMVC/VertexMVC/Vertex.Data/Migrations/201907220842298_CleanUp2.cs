namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CleanUp2 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.AspNetUsers", "Name", c => c.String(maxLength: 128));
            AlterColumn("dbo.AspNetUsers", "Surname", c => c.String(maxLength: 128));
            AlterColumn("dbo.AspNetUsers", "Location", c => c.String(maxLength: 128));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.AspNetUsers", "Location", c => c.String());
            AlterColumn("dbo.AspNetUsers", "Surname", c => c.String());
            AlterColumn("dbo.AspNetUsers", "Name", c => c.String());
        }
    }
}
