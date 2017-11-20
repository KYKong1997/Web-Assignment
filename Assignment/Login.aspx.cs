using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {

        }

        protected void Login1_Authenticate1(object sender, AuthenticateEventArgs e)
        {
            FormsAuthentication.SetAuthCookie(Login1.UserName, false);
            if (Roles.IsUserInRole(Login1.UserName, "Seller"))
            {
                Response.Redirect("/Artist/ArtistMgtForm.aspx");
            }
            else
            {
                Response.Redirect("default.aspx");
            }

        }

        protected void password_TextChanged(object sender, EventArgs e)
        {

        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
           
        }

        protected void registrationBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("/CreateUser.aspx");
        }
    }
}