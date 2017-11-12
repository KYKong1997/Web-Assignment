using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Assignment
{
    public partial class AddNewProduct : System.Web.UI.Page
    {
        WebDatabaseEntities1 db;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void formViewEdit_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        public void formViewEdit_InsertItem()
        {
            var item = new Assignment.Product();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here
               
            }
        }

        protected void formViewEdit_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {

        }

        protected void submitASPbtn_Click(object sender, EventArgs e)
        {
            db = new WebDatabaseEntities1();
            HttpPostedFile imgFile = Request.Files["ctl00$ContentPlaceHolder2$ImageUpload"];
       
            
            Assignment.Product product = new Product();
            product.ProductDescription = productDescriptionTxt.Text;
            product.ProductName = productNameTxt.Text;
            product.ProductPrice = decimal.Parse(productPriceTxt.Text);
            product.ProductUpdateDate = DateTime.Now;
            product.ProductQty = Int32.Parse(productQtyTxt.Text);
            string imgPath = Path.GetFullPath(imgFile.FileName);
            product.SellerID = 1000;//hardcore
            string rootPath = Server.MapPath("Images/");
           
            db.Products.Add(product);
            db.SaveChanges();
            Product lastProd = (from x in db.Products orderby x.ProductID descending select x).FirstOrDefault();
            int newID = lastProd.ProductID;
            product.ProductImage = "/Images/" + newID + ".jpg";
            imgFile.SaveAs(rootPath + newID + ".jpg");
            lastProd.ProductImage = "/Images/" + newID + ".jpg";
            db.SaveChanges();
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {

        }
    }
}