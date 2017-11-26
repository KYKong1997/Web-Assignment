using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Assignment
{
    public partial class CreateUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                string[] gv = Roles.GetAllRoles();

                if (!Roles.RoleExists("Customer"))
                {
                    Roles.CreateRole("Customer");
                }
            }
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatedUser1(object sender, EventArgs e)
        {
            WebDatabaseEntities1 db = new WebDatabaseEntities1();
            Assignment.User user = new Assignment.User();
            user.Email = CreateUserWizard1.Email;
            user.Password = CreateUserWizard1.Password;
            user.username = CreateUserWizard1.UserName;
            string test = ((createUserWizardStep.ContentTemplateContainer.FindControl("roleDropDown")) as DropDownList).SelectedValue.ToString();
            user.RoleID = ((createUserWizardStep.ContentTemplateContainer.FindControl("roleDropDown")) as DropDownList).SelectedValue.ToString();
            user.Address = (createUserWizardStep.ContentTemplateContainer.FindControl("address") as TextBox).Text;
           
            //user.Country = (createUserWizardStep.ContentTemplateContainer.FindControl("selectCountry") as DropDownList).SelectedValue.ToString();
            //user.State = (createUserWizardStep.ContentTemplateContainer.FindControl("selectState") as DropDownList).SelectedValue.ToString();

            string a = Request.Form["selectCountry"];
            user.Postal_Code = Int32.Parse((createUserWizardStep.ContentTemplateContainer.FindControl("postalCode") as TextBox).Text);
            
            user.phoneNumber = (createUserWizardStep.ContentTemplateContainer.FindControl("phoneNumber") as TextBox).Text;

            if (user.RoleID.Equals("C"))
            {
                Customer cust = new Customer
                {
                    email = user.Email
                };
                db.Customers.Add(cust);
            }
            else
            {
                Seller s = new Seller
                {
                    email = user.Email
                };
                db.Sellers.Add(s);
            }
            db.Users.Add(user);

            db.SaveChanges();

            
            if (user.RoleID.Equals("S"))
            {
                Roles.AddUserToRole(user.username, "Seller");
            }
            else
            {
                Roles.AddUserToRole(user.username, "Customer");
            }
            Response.Redirect("default.aspx");
        }

        protected void CreateUserWizard1_CreateUserError(object sender, CreateUserErrorEventArgs e)
        {
            Response.Write("<script>alert('Error')</script>");
        }
    }
}