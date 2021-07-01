using PraProjekt.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PraProjekt
{
    public partial class NewUser : System.Web.UI.Page
    {
        private bool alreadyExist;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // provjera postoji li Email u bazi
        protected void tbEmail_TextChanged(object sender, EventArgs e)
            => checkEmail();

        private void checkEmail()
        {
            var emails = Repository.GetEmail(tbEmail.Text.ToString());

            if (emails != 0)
            {
                spanCheckEmail.Visible = true;
                lblCheckEmail.Text = "Već postoji korisnik sa unesenim e-mailom!";
                alreadyExist = true;
                return;
            }
            spanCheckEmail.Visible = false;
            lblCheckEmail.Text = "";
            alreadyExist = false;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // prije upisa u bazu svejedno prvo opet provjeravamo postoji li već taj email u bazi
            checkEmail();

            if (!alreadyExist)
            {
                Repository.CreateUserAcc(new UserAcc()
                {
                    Email = tbEmail.Text,
                    Pass = tbPass.Text,
                    Username = tbUserName.Text,
                    IsActive = 1
                });

                Response.Redirect("CreateQuiz.aspx");
            }
        }

    }
}