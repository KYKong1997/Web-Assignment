using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void datalist_SelectedIndexChanged(object sender, CommandEventArgs e)
        {
            Session["hmproductid"] = e.CommandArgument.ToString();
            Response.Redirect("/Customer/Cart.aspx");
        }
    }
}