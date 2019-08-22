namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class SocialNetworkEntityId : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.SocialNetwork", "EntityId", c => c.String(maxLength:128));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.SocialNetwork", "EntityId", c => c.Int(nullable: false));
        }
    }
}
