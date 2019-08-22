namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Subscriber : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Subscriber",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        FullName = c.String(maxLength:128),
                        Email = c.String(maxLength:256),
                        IsActive = c.Boolean(nullable: false),
                        SubscribeDate = c.DateTime(nullable: false),
                        UnsubscribeDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Subscriber");
        }
    }
}
