using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Site3 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {

                signOutBtn.Text = "Sign Out";
                logInLabel.Text = HttpContext.Current.User.Identity.Name;
            }
        }
        protected void loginLinkBtn_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/default.aspx");
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}