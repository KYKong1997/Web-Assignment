using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class EditProduct : System.Web.UI.Page
    {
        WebDatabaseEntities1 db;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new WebDatabaseEntities1();
           
            int id = Int32.Parse(Request.QueryString["Id"]);
            Product[] product = db.Products.Where(x => x.ProductID.Equals(id)).ToArray();
            formViewEdit.DataSource = product;
            formViewEdit.DataBind();
        }
    }
}