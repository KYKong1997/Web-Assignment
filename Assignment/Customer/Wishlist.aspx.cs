using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Wishlist1 : System.Web.UI.Page
    {
        int customer = 0;
        WebDatabaseEntities1 db;
        protected void Page_Load(object sender, EventArgs e)
        {

            db = new WebDatabaseEntities1();
            string a = (HttpContext.Current.User.Identity.Name);
            var email = db.Users.Where(x => x.username.Equals(a)).FirstOrDefault().Email;
            customer = db.Customers.Where(x => x.email.Equals(email)).FirstOrDefault().CustomerID;
            lblcustid.Text = customer.ToString();
        }
    }
    
}