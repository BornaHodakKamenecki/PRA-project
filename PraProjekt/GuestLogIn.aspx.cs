using PraProjekt.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PraProjekt
{
    public partial class GuestLogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPrijava_Click(object sender, EventArgs e)
        {
            Repository.CreateNewGuest(new Guest()
            {
                Nickname = tbNickname.Text
            });

            //rijesit u Repou
            Repository.DeleteFromGuest();

            Response.Redirect("JoinQuiz.aspx");
        }
    }
}