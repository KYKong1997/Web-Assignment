using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Wishlist : System.Web.UI.Page
    {
        WebDatabaseEntities1 db;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new WebDatabaseEntities1();

            if (!IsPostBack)
            {
               


            }
        }
    }
}