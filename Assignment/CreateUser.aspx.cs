using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class CreateUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text= HttpContext.Current.User.Identity.Name;
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
            user.State = ((createUserWizardStep.ContentTemplateContainer.FindControl("stateDropDown")) as DropDownList).SelectedValue.ToString();
            user.Postal_Code = Int32.Parse((createUserWizardStep.ContentTemplateContainer.FindControl("postalCode") as TextBox).Text);
            user.Country = ((createUserWizardStep.ContentTemplateContainer.FindControl("countryDropDown")) as DropDownList).SelectedValue.ToString();
            user.phoneNumber = (createUserWizardStep.ContentTemplateContainer.FindControl("phoneNumber") as TextBox).Text;

            if (user.RoleID.Equals('C'))
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
        }

        protected void CreateUserWizard1_CreateUserError(object sender, CreateUserErrorEventArgs e)
        {
            Response.Write("<script>alert('Error')</script>");
        }
    }
}