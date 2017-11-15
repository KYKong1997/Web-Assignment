<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="Assignment.CreateUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser1" OnCreateUserError="CreateUserWizard1_CreateUserError" style="height: 386px">
            <WizardSteps>
                <asp:CreateUserWizardStep runat="server" ID="createUserWizardStep">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <th>User Information</th>
                            </tr>
                            <tr>
                                <td>Username:</td>
                                <td>
                                    <asp:TextBox ID="username" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="userNameValidator" ControlToValidate="username" ErrorMessage="Username is required"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td>
                                    <asp:TextBox ID="email" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="emailValidator" ControlToValidate="email" ErrorMessage="Email is required"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Password:</td>
                                <td>
                                    <asp:TextBox ID="password" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="passwordValidator" ControlToValidate="password" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
                                </td>

                            </tr>
                            <tr>
                                <td>Confirm Password:</td>
                                <td>
                                    <asp:TextBox ID="confirmPassword" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="confirmPasswordValidator" ControlToValidate="confirmPassword" ErrorMessage="Confirm Password is required"></asp:RequiredFieldValidator>
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
                                <td>Address:</td>
                                <td>
                                    <asp:TextBox ID="address" runat="server"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="addressValidator" runat="server" ControlToValidate="address" ErrorMessage="Address is required"></asp:RequiredFieldValidator> 

                                </td>
                            </tr>
                            <tr>
                                <td>State:</td>
                                <td>
                                    <asp:DropDownList ID="stateDropDown" runat="server">
                                        <asp:ListItem>Kuala Lumpur</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Postal Code:</td>
                                <td>
                                    
                                        <asp:TextBox ID="postalCode" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="postalCodeTxtRequired" runat="server" ControlToValidate="postalCode" ErrorMessage="Postal Code is required"></asp:RequiredFieldValidator>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>Country:</td>
                                <td>
                                    <asp:DropDownList ID="countryDropDown" runat="server" Width="87px">
                                        <asp:ListItem>Malaysia</asp:ListItem>
                                    </asp:DropDownList>
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
                <asp:CompleteWizardStep ID="MessageStep" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>Your account has been successfully created</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button runat="server" ID="continueBtn" ValidationGroup="createUserWizard"
                                        commandname="Continue" CausesValidation="false" Text="Continue" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CompleteWizardStep>

               
            </WizardSteps>
        </asp:CreateUserWizard>

        <p>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </p>

    </form>
</body>
</html>
