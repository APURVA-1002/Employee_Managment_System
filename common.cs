using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeManagment
{
    public static class common
    {
        public static int cInt(string input)
        {
            int x = 0;
            int.TryParse(input, out x);
            return x;
        }
        public static double cDouble(string input)
        {
            double x = 0;
            double.TryParse(input, out x);
            return x;
        }
        public static decimal cDecimal(string input)
        {
            decimal x = 0;
            decimal.TryParse(input, out x);
            return x;
        }
        public static float cFloat(string input)
        {
            float x = 0;
            float.TryParse(input, out x);
            return x;
        }
        public static DateTime cDateTime(string input)
        {
            DateTime dt = new DateTime();
            DateTime.TryParse(input, out dt);
            return dt;
        }
    }
}