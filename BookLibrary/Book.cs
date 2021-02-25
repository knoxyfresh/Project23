using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookLibrary
{
    public class Book
    {
        public string Title { get; set; }
        public string Isbn { get; set; }
        public string Authors { get; set; }
        public string BookType { get; set; }
        public string RentedOrBought { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public decimal TotalCost { get; set; }

        public Book(string title, string isbn, string authors, string booktype, string rentbuy, int qty, decimal price)
        {
            Title = title;
            Isbn = isbn;
            Authors = authors;
            BookType = booktype;
            Quantity = qty;
            Price = price;
            TotalCost = qty * price;
            RentedOrBought = rentbuy;
        }
        public override string ToString()
        {
            return Title + " " + Isbn + " " + Authors + " " + BookType + " " + Price;
        }
    }
}
