using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
namespace Assignment
{
    public partial class EditProduct : System.Web.UI.Page
    {
        WebDatabaseEntities1 db;
        FileUpload fileUpload;
        ImageButton imageButton;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                db = new WebDatabaseEntities1();
               
                int id = Int32.Parse(Request.QueryString["Id"]);
                Product[] product = db.Products.Where(x => x.ProductID.Equals(id)).ToArray();
                formViewEdit.DataSource = product;
                formViewEdit.DataBind();

               



            }
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            db = new WebDatabaseEntities1();
            TextBox prodNameTxt = formViewEdit.FindControl("productNameTxt") as TextBox;
            TextBox prodPriceTxt = formViewEdit.FindControl("productPriceTxt") as TextBox;
            TextBox prodQtyTxt = formViewEdit.FindControl("productQtyTxt") as TextBox;
            TextBox prodDescriptionTxt = formViewEdit.FindControl("productDescriptionTxt") as TextBox;
            Label prodIDLabel = formViewEdit.FindControl("lblProductID") as Label;
            HttpPostedFile imgFile = Request.Files["ctl00$ContentPlaceHolder2$formViewEdit$ImageUpload"];
           
            
            try
            {

               

                string prodNameText = prodNameTxt.Text;
                decimal prodPrice = decimal.Parse(prodPriceTxt.Text);
                int prodQty = Int32.Parse(prodQtyTxt.Text);
                string prodDescription = prodDescriptionTxt.Text;
                string prodLabelID = prodIDLabel.Text;
                int id =Int32.Parse(new String(prodLabelID.Where(Char.IsDigit).ToArray()));
                Product product = db.Products.Where(x => x.ProductID.Equals(id)).FirstOrDefault();
                product.ProductDescription = prodDescription;
                product.ProductName = prodNameText;
                product.ProductQty = prodQty;
                product.ProductPrice = prodPrice;
                product.ProductUpdateDate = DateTime.Now;
                string imgPath = Path.GetFullPath(imgFile.FileName);

                string rootPath = Server.MapPath("../Images/");
                string newName = prodIDLabel.Text + ".jpg";
                imgFile.SaveAs(rootPath + id + ".jpg");

                db.SaveChanges();

                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch(FormatException ex)
            {
                Response.Write("<script>alert('Enter number only to price');</script>");
            }catch(ArgumentException argE)
            {
                db.SaveChanges();
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            
            
                
        }

        protected void formViewEdit_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}