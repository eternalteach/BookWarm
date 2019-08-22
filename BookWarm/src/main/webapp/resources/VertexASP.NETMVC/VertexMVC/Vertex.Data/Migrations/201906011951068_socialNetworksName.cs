namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class socialNetworksName : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.SocialNetwork", "Name", c => c.String(maxLength:128));
        }
        
        public override void Down()
        {
            DropColumn("dbo.SocialNetwork", "Name");
        }
    }
}
