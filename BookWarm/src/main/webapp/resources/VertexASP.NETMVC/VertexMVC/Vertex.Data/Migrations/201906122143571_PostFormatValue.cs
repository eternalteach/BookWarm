namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class PostFormatValue : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Post", "PostFormatValue", c => c.String());
            DropColumn("dbo.Post", "PicturePath");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Post", "PicturePath", c => c.String(maxLength: 500));
            DropColumn("dbo.Post", "PostFormatValue");
        }
    }
}
