using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PraProjekt.Models
{
    public class UserAcc
    {
        public int IDUserAcc { get; set; }
        public string Email { get; set; }
        public string Pass { get; set; }
        public string Username { get; set; }
        public int IsActive { get; set; }

        public override string ToString() => Username.ToString();
    }
}