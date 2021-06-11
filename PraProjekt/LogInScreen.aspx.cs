using PraProjekt.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PraProjekt
{
    public partial class LogInScreen : System.Web.UI.Page
    {
        private bool exists;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //pitaj hrvoja
        protected void tbEmail_TextChanged(object sender, EventArgs e)
                    => checkUser();

        private void checkUser()
        {
            var user = Repository.LoginUser(tbEmail.Text.ToString(), tbPass.Text.ToString());

            if (user != 0)
            {
                exists = true;
                return;
            }
            exists = false;
        }

        protected void btnPrijava_Click(object sender, EventArgs e)
        {
            checkUser();

            if (exists == false)
            {
                spanCheckUser.Visible = true;
                lblCheckUser.Text = "Pogrešno unesen Email ili šifra";
            }
            else
            {
                Response.Redirect("CreateQuiz.aspx");
            }
        }

    }
}