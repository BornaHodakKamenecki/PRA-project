using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PraProjekt.Models
{
    public class Answer
    {
        public int IDAnswer { get; set; }
        public string AnswerText { get; set; }
        public int RightAnswer { get; set; }
        public int IsActive { get; set; } // možda prominiti u bool (i u bazi isto)?
        public int QuestionID { get; set; }

        public override string ToString() => AnswerText.ToString();
    }
}