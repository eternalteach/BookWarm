namespace Vertex.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class MediaStorageFilePath : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.MediaStorage", "FilePath", c => c.String(maxLength:600));
        }
        
        public override void Down()
        {
            DropColumn("dbo.MediaStorage", "FilePath");
        }
    }
}
