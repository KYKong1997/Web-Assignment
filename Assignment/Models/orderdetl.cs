using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment.Models
{
    [Serializable]
    public class orderdetl
    {
        public double Price { get; set; }
        public int InputQty { get; set; }
        public int ProdID { get; set; }
        public double DetailPrice { get; set; }
    }
}