using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        WebDatabaseEntities1 db;
        protected void Page_Load(object sender, EventArgs e)
        {
            string login = Request.QueryString["login"];
            string name = HttpContext.Current.User.Identity.Name;
            try
            {
                if (login.Equals("1"))
                {
                    db = new WebDatabaseEntities1();
                    string email = Request.Form["userEmail"];
                    string password = Request.Form["passwordTxt"];
                    Assignment.User user = db.Users.Where(u => u.Email.Equals(email)).FirstOrDefault();
                    if (user != null)
                    {
                        if (user.Password.Equals(password))
                        {
                            Session["id"] = user.username;
                        }

                    }
                    else
                    {
                        Response.Write("<script>alert('No user found')</script>");
                    }


                }
                else if (login.Equals("0"))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
            }
            catch
            {

            }
            label1.Text = name;
           

        }
    }
}