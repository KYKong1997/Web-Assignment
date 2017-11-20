using System;
using Assignment.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment
{
    public partial class addedcart : System.Web.UI.Page
    {
        WebDatabaseEntities1 db;
       
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        


        protected void Checkoutbtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            String updateQuery = "UPDATE Orders SET Status ='purchased' where status='pending'";
            SqlCommand cmd = new SqlCommand(updateQuery, con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("/Customer/addedcart.aspx");

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            db = new WebDatabaseEntities1();
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            int orderdetails=Convert.ToInt32(GridView1.DataKeys[rowIndex].Values[0].ToString());

            SqlConnection cont = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            cont.Open();
            int getprodID = db.OrderDetails.Where(x => x.OrderDetailsNo.Equals(orderdetails)).FirstOrDefault().ProductID;
            int InputQty = db.OrderDetails.Where(x => x.OrderDetailsNo.Equals(orderdetails)).FirstOrDefault().qtyOrdered;
                
            String deleteQuery = "DELETE FROM ORDERDETAILS WHERE ORDERDETAILSNO="+orderdetails;
            
            int currentquantity = db.Products.Where(x => x.ProductID.Equals(getprodID)).FirstOrDefault().ProductQty;

            String updateQuery = "update product set productqty="+(currentquantity+InputQty)+"where productID" +
                "="+getprodID;
            SqlCommand cmd = new SqlCommand(deleteQuery, cont);
            SqlCommand cmd2 = new SqlCommand(updateQuery, cont);
            cmd.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();

         
            cont.Close();
            Response.Redirect("/Customer/addedcart.aspx");
        }

    }
}