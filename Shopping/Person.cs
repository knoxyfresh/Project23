using System;

namespace Shopping
{
    public class Person
    {
        public string firstname { get; set; }
        public string lastname { get; set; }
        public string id { get; set; }
        public string campus { get; set; }
        public string phone { get; set; }
        public string address { get; set; }

        public Person(string fname, string lname, string ID, string camps, string phonenum, string addr)
        {
            firstname = fname;
            lastname = lname;
            id = ID;
            phone = phonenum;
            campus = camps;
            address = addr;
        }
        public override string ToString()
        {
            return firstname + " " + lastname + " from " + campus;
        }




    }
}
