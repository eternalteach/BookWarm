namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UserSocialNetworks : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.AspNetUsers", "SocialNetworks");
        }
        
        public override void Down()
        {
            AddColumn("dbo.AspNetUsers", "SocialNetworks", c => c.String());
        }
    }
}
