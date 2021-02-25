using System;
using System.Collections;
using BookLibrary;

namespace CartLibrary
{
    public class Cart : ArrayList
    {
        public override int Add(object value)
        {
            if (value.GetType.ToString() == "Book")
                return base.Add(value);
        }
    }
}
