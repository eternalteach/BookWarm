namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class socialNetworks : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.SocialNetwork",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        EntityId = c.Int(nullable: false),
                        EntityName = c.String(maxLength: 100),
                        WebAddress = c.String(),
                        IsActive = c.Boolean(nullable: false),
                        OrderNo = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            DropColumn("dbo.TeamMember", "SocialNetworks");
        }
        
        public override void Down()
        {
            AddColumn("dbo.TeamMember", "SocialNetworks", c => c.String());
            DropTable("dbo.SocialNetwork");
        }
    }
}
