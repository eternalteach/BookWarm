namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class MediaStorageEntityId : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.MediaStorage", "EntityId", c => c.String(maxLength: 128));
            AddColumn("dbo.MediaStorage", "OrderNo", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.MediaStorage", "OrderNo");
            DropColumn("dbo.MediaStorage", "EntityId");
        }
    }
}
