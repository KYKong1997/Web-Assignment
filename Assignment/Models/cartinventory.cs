using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment.Models
{
    [Serializable]
    public class CartInventory
    {
        public int ProductID { get; set; }
        public String ProductName { get; set; }
        public double ProductPrice { get; set; }
        public int ProductQuantity { get; set; }
     /*   public String DisplayString()
        {
            String msg = "";
            msg=msg+ "<br/>Product ID: " + ProductID + "<br/>Product Name: " + ProductName + " <br/>Quantity Available: " +
                            ProductQuantity + "<br/>Unit Price: " + ProductPrice + "<br/>";
            return msg;
        }*/
    }
}