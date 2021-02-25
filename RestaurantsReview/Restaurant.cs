using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RestaurantsReview
{
    public class Restaurant
    {
        public int id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }

        public Restaurant(int id, string name, string desc, string type)
        {
            this.id = id;
            this.Name = name;
            this.Description = desc;
            this.Type = type;
        }
    }
}
