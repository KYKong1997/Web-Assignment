using Assignment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        WebDatabaseEntities db;

        string id = "";
        int inputquantity = 0, existingqty = 0;
        double price=0.00,totalprice = 0.00;
        
        protected void Page_Load(object sender, EventArgs e)
        {

         
           
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


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            db = new WebDatabaseEntities();
            
            
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            id = GridView1.DataKeys[rowIndex].Values[0].ToString();
            existingqty = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values[1].ToString());
            price = Convert.ToDouble(GridView1.DataKeys[rowIndex].Values[2].ToString());
            TextBox tb = (TextBox)GridView1.Rows[rowIndex].FindControl("TextBox1");
            inputquantity = Convert.ToInt32(tb.Text);
            Label1.Text = Convert.ToString(existingqty);

            if (inputquantity > existingqty)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid.Input quantity more than existing quantity.')", true);
            }
            else
            {
                TextBox ab = (TextBox)GridView1.Rows[rowIndex].FindControl("TextBox1");
                inputquantity = Convert.ToInt32(ab.Text);
                totalprice = inputquantity * price;

                FromData.Add(new orderdetl()
                {
                    Price = price,
                    InputQty = inputquantity,
                    ProdID = Convert.ToInt32(id),
                    DetailPrice = totalprice

                });
            }


        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            db = new WebDatabaseEntities();
            Order ord = new Order
            {
                OrderDate = DateTime.Now,
                ShippedDate = DateTime.Now.AddDays(30),
                Status = "pending",
                comments = "",
                customerID = 1000
            };

            db.Orders.Add(ord);
            db.SaveChanges();
           

            var maxQuery = (from ordno in db.Orders
                            select ordno.OrderNumber).Max();

            db.Dispose();
            db = new WebDatabaseEntities();
            
            foreach (var item in FromData)
            {
                
                OrderDetail ordt = new OrderDetail
                {
                    orderNumber = maxQuery,
                    ProductID=item.ProdID,
                    qtyOrdered=item.InputQty,
                    detailPrice = (Decimal)item.DetailPrice,


                };
                db.OrderDetails.Add(ordt);
                db.SaveChanges();
                db.Dispose();
                
          
            }
            


            
        }
    }
}