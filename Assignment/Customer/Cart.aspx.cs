using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Assignment.Models;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment
{
    public partial class Cart : System.Web.UI.Page
    {
        WebDatabaseEntities1 db;

        
        String prodname = "";
        int existingqty = 0,prodid=0, inputquantity = 0,customer=0;
        double price = 0.00,totalprice=0.00;

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            WebDatabaseEntities1 db = new WebDatabaseEntities1();
            var email = db.Users.Where(x => x.username.Equals(HttpContext.Current.User.Identity.Name)).FirstOrDefault().Email;
            customer = db.Customers.Where(x => x.email.Equals(email)).FirstOrDefault().CustomerID;

            if (!IsPostBack)
            {
                lblprodid.Text = Session["hmproductid"].ToString();

            }
            
        }

        public List<orderdetl> FromData
        {
            get
            {
                if (ViewState["__FromData"] == null)
                    ViewState["__FromData"] = new List<orderdetl>();
                return (List<orderdetl>)ViewState["__FromData"];
            }
        }

        protected void BtnAddToWishlist_Click(object sender, EventArgs e)
        {
            db = new WebDatabaseEntities1();

            prodid = Convert.ToInt32(((Label)this.FormView1.FindControl("ProductIDLabel")).Text);
           var item= db.Wishlists.Where(x => x.ProductID.Equals(prodid)).FirstOrDefault();
            if (item == null)
            {
                Wishlist w = new Wishlist
                {
                    CustomerID =customer,
                    ProductID = prodid,
                    DateAdded = DateTime.Now
                };


                db.Wishlists.Add(w);
                db.SaveChanges();
            }
            else
            {

            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Item added to the wishlist.')", true);
            Response.Redirect("/Customer/Wishlist.aspx");
        }



        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            db = new WebDatabaseEntities1();
            TextBox tb = (TextBox)FormView1.FindControl("inqty");
            prodname = Convert.ToString(((Label)this.FormView1.FindControl("ProductNameLabel")).Text);
            price = Convert.ToDouble(((Label)this.FormView1.FindControl("ProductPriceLabel")).Text);
            existingqty = Convert.ToInt32(((Label)this.FormView1.FindControl("ProductQtyLabel")).Text);
            prodid = Convert.ToInt32(((Label)this.FormView1.FindControl("ProductIDLabel")).Text);
            inputquantity = Convert.ToInt32(tb.Text);



            if (inputquantity > existingqty)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid.Input quantity more than existing quantity.')", true);
            }
            else
            {



                if (Session["addedorder"]==null)
                {
                    Order ord = new Order
                    {
                        OrderDate = DateTime.Now,
                        ShippedDate = DateTime.Now.AddDays(30),
                        Status = "pending",
                        comments = "",
                        customerID = customer
                    };

                    db.Orders.Add(ord);
                    db.SaveChanges();
                    


                    Session["addedorder"] = true;
                    

                }

                var maxQuery = (from ordno in db.Orders
                                select ordno.OrderNumber).Max();

                TextBox ab = (TextBox)FormView1.FindControl("inqty");
                inputquantity = Convert.ToInt32(ab.Text);
                totalprice = inputquantity * price;

                FromData.Add(new orderdetl()
                {
                    Price = price,
                    InputQty = inputquantity,
                    ProdID = Convert.ToInt32(prodid),
                    DetailPrice = totalprice,

                });

                OrderDetail odtl = new OrderDetail
                {
                    orderNumber=maxQuery,
                    ProductID=prodid,
                    qtyOrdered=inputquantity,
                    detailPrice=(Decimal)totalprice
                };


                db.OrderDetails.Add(odtl);
                db.SaveChanges();

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();
                String updateQuery = "UPDATE Product SET ProductQty ="+(existingqty-inputquantity)+ " where ProductID="+prodid;
                SqlCommand cmd = new SqlCommand(updateQuery, con);
                cmd.ExecuteNonQuery();
                con.Close();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Item added to the cart.')", true);
                Response.Redirect("/Customer/addedcart.aspx");

            }
            
            
         
        }

       
    }
}