using System.Web.Mvc;

namespace Vertex.Web.Framework.UI
{
    public class TypingBuilder : ViewComponentBuilderBase<Typing, TypingBuilder>
    {
        public TypingBuilder(HtmlHelper htmlHelper, Typing model) : base(htmlHelper, model)
        { 
        }

        public TypingBuilder Text(string text)
        {
            this.Component.Text = text;
            return this;
        }

        public TypingBuilder Speed(int speed)
        {
            this.Component.Speed = speed;
            return this;
        }

        public TypingBuilder BackSpeed(int backSpeed)
        {
            this.Component.BackSpeed = backSpeed;
            return this;
        }

        public TypingBuilder Loop(bool loop)
        {
            this.Component.Loop = loop;
            return this;
        }

        public TypingBuilder Delay(int delay)
        {
            this.Component.Delay = delay;
            return this;
        }
    }
}