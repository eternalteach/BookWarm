namespace Vertex.Web.Framework.Utilities
{
    /// <summary>
    /// Bootstrap colors
    /// </summary>
    public enum BootstrapColor
    {
        Primary,
        Secondary,
        Success,
        Danger,
        Warning,
        Info,
        Light,
        Dark,
        White
    }

    public static class BootstrapColorExtensions
    {
        public static string ToCssClass(this BootstrapColor color)
        {
            return color.ToString().ToLower();
        }
    }
}