using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace Utilities
{
    public static class Validator
    {
        public static bool intInRange(int test, int min, int max)
        {
            if (test >= min && test <= max) return true;
            return false;
        }
        public static bool isValidEmail(string emailaddress)
        {
            return Regex.IsMatch(emailaddress, @"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
        }
        public static bool isValidTuid(string id)
        {

            return Regex.IsMatch(id, @"^tu[a-z]\d\d\d\d\d$");
        }
        public static bool isFromList(string test, string[] items)
        {
            bool flag = false;
            foreach (string solution in items)
            {
                if (test == solution) flag = true;
            }
            return flag;
        }
        public static bool NotEmpty(string item)
        {
            if (item == "" || item==null) return false;
            return true;
        }
        public static bool IsPhoneNumber(string number)
        {
            return Regex.Match(number, @"^(\+[0-9]{9})$").Success;
        }
    }
}