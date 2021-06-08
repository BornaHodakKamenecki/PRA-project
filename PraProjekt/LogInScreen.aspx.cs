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
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
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