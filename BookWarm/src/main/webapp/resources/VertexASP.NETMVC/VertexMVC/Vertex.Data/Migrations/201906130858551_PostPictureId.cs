namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class PostPictureId : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Post", "PictureId", c => c.Int());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Post", "PictureId");
        }
    }
}
