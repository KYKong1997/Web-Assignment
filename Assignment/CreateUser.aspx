<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="Assignment.CreateUser" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <script src="Scripts/bootstrap.min.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             GetCountries();
             GetStates();
            $("#registerModal").modal('show');
        });

         function GetCountries() {
             $.ajax({
                 type: "GET",
                 url: "http://api.geonames.org/countryInfoJSON?formatted=true&lang=en&style=full&username=kuokyong",
                 contentType: "application/json; charset=utf-8",
                 dataType: "jsonp",
                 success: function (data) {
                     $(".ddlCustomerCountry").append($('<option />', { value: -1, text: 'Select Country' }));
                     $(data.geonames).each(function (index, item) {
                         $(".ddlCustomerCountry").append($('<option />', { value: item.geonameId, text: item.countryName }));
                     });
                 },
                 error: function (data) {
                     alert("Failed to get countries.");
                 }
             });
         }

         function GetStates() {
             $(".ddlCustomerCountry").change(function () {
                 GetChildren($(this).val(), "States", $(".txtCustomerState"));
             });
         }
         function GetChildren(geoNameId, childType, ddlSelector) {
             $.ajax({
                 type: "GET",
                 url: "http://api.geonames.org/childrenJSON?geonameId=" + geoNameId + "&username=kuokyong",
                 contentType: "application/json; charset=utf-8",
                 dataType: "jsonp",
                 success: function (data) {
                     $(ddlSelector).empty();
                     $(ddlSelector).append($('<option />', { value: -1, text: 'Select ' + childType }));
                     $(data.geonames).each(function (index, item) {
                         $(ddlSelector).append($('<option />', { value: item.geonameId, text: item.name }));
                     });
                 },
                 error: function (data) {
                     alert("failed to get data");
                 }
             });
         }
    </script>
    <style>
        html,body{
            background: url(background.jpg) no-repeat center center fixed;
             background-size: cover;
        }
        
       
      
    </style>
</head>
<body>
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#loginModal" hidden="hidden"></button>
    <form id="form1" runat="server">
        <div class="modal fade col-lg-12" id="registerModal" role="dialog" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="container" style="width:auto; margin:0 10%">
                        <div class="panel" style="width:100%">
                             <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser1" OnCreateUserError="CreateUserWizard1_CreateUserError" style="height: 386px">
            <WizardSteps>
                <asp:CreateUserWizardStep runat="server" ID="createUserWizardStep" EnableViewState="False">
                    <ContentTemplate>
                        <table border="1">
                            <tr>
                                <th>User Information</th>
                            </tr>
                            <tr>
                                <td>Username:</td>
                                <td>
                                    <asp:TextBox ID="username" runat="server"></asp:TextBox>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td>
                                    <asp:TextBox ID="email" runat="server"></asp:TextBox>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>Password:</td>
                                <td>
                                    <asp:TextBox ID="password" runat="server"></asp:TextBox>
                                    
                                </td>

                            </tr>
                            <tr>
                                <td>Confirm Password:</td>
                                <td>
                                    <asp:TextBox ID="confirmPassword" runat="server"></asp:TextBox>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>Role :</td>
                                <td>
                                    <asp:DropDownList ID="roleDropDown" runat="server">
                                        <asp:ListItem Value="S">Seller</asp:ListItem>
                                        <asp:ListItem Value="C">Customer</asp:ListItem>
                                    </asp:DropDownList>
                                </td>

                            </tr>
                                <tr>
                                <td>Country:</td>
                                <td>
                                    <asp:DropDownList ID="countryDropDown" runat="server" Width="87px" CssClass="ddlCustomerCountry">
                                       
                                    </asp:DropDownList>
                                </td>
                            </tr>
                             <tr>
                                <td>State:</td>
                                <td>
                                    <asp:DropDownList ID="stateDropDown" runat="server" CssClass="txtCustomerState">
                                      
                                    </asp:DropDownList>
                                </td>
                            </tr>
                             <tr>
                                <td>Postal Code:</td>
                                <td>
                                    
                                        <asp:TextBox ID="postalCode" runat="server"></asp:TextBox>
                                       
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>Address:</td>
                                <td>
                                    <asp:TextBox ID="address" runat="server"></asp:TextBox>
                                   

                                </td>
                            </tr>
                           
                           
                        
                            <tr>
                                <td>Phone Number:</td>
                                <td>
                                    <asp:TextBox ID="phoneNumber" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="phoneNumberTxtRequired" runat="server" ControlToValidate="phoneNumber" ErrorMessage="Phone number is required"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>

                    </ContentTemplate>
                </asp:CreateUserWizardStep>
              

               
            </WizardSteps>
        </asp:CreateUserWizard>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       

        

       

    </form>
</body>
</html>
