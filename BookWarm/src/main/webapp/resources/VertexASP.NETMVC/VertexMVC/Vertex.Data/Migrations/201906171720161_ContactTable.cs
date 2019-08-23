namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ContactTable : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Contact",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength:128),
                        Email = c.String(nullable: false, maxLength:128),
                        Subject = c.String(nullable: false, maxLength:128),
                        Message = c.String(nullable: false),
                        Date = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            DropTable("dbo.LocalString");
        }
        
        public override void Down()
        {
            CreateTable(
                "dbo.LocalString",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        Value = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            DropTable("dbo.Contact");
        }
    }
}
