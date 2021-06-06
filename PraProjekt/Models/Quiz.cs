using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PraProjekt.Models
{
    public class Quiz
    {
        public int IDQuiz { get; set; }
        public string Title { get; set; }
        public int IsActive { get; set; }
        public int UserAccID { get; set; }

        public override string ToString() => Title.ToString();
    }
}