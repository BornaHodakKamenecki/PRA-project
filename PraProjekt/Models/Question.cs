using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PraProjekt.Models
{
    public class Question
    {
        public int IDQuestion { get; set; }
        public string QuestionText { get; set; }
        public int Duration { get; set; }
        public int IsActive { get; set; }
        public int QuizID { get; set; }

        public override string ToString() => QuestionText.ToString();
    }
}