using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Assignment
{
    public partial class ArtistMgtForm : System.Web.UI.Page
    {
        WebDatabaseEntities1 db;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new WebDatabaseEntities1();
            
            if (!IsPostBack)
            {
                Assignment.User user = db.Users.Where(x => x.username.Equals(User.Identity.Name)).FirstOrDefault();
                Seller seller = db.Sellers.Where(x => x.email.Equals(user.Email)).FirstOrDefault();
                Product[] prods = db.Products.Where(x => x.SellerID.Equals(seller.SellerID)).ToArray();

                imgGridView.DataSource = prods;
                imgGridView.DataBind();


            }
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void imgGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void imgGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void imgGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void img_Click(object sender, ImageClickEventArgs e)
        {
            int id = Int32.Parse((sender as ImageButton).CommandArgument);
            Response.Redirect("EditProduct.aspx?Id=" + id);
        }

        protected void imgGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}