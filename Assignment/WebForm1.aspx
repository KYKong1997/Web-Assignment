<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Assignment.WebForm1" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <div>
        <strong><span><h1>Welcome</h1><asp:Label ID="label1" runat="server" Text="Test"></asp:Label></span></strong>
        
    </div>
      <div class="modal fade" id="loginModal" tabindex="-1"
            role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true" style="display:none">
            <div class="modal-dialog" id="loginModalDialog">
                <div class="loginModalContainer">
                     <h1>Log In to Your Account</h1>
                        <asp:DropDownList ID="roleDropDown" runat="server" CssClass="selectpicker">
                            <asp:ListItem>Role</asp:ListItem>
                            <asp:ListItem Value="S">Seller</asp:ListItem>
                            <asp:ListItem Value="C">Customer</asp:ListItem>
                    </asp:DropDownList>
                        <input type="text" name="userEmail" id="userEmail" placeholder="Email" />
                        <br />
                        <input type="password" name="passwordTxt" id="passwordTxt" placeholder="Password" />
                        <br />
                        <asp:Button ID="submitBtn" CssClass="loginModalContainerSubmit"  runat="server" Text="Login" PostBackUrl="~/WebForm1.aspx?login=1"/>

                   
                    <div class="login-help">
                        <a href="CreateUser.aspx">Register</a>
                        -<a href="#">Forget Password</a>
                    </div>
                   
                </div>

            </div>
        </div>
    
<script type="text/javascript">

    $(document).ready(function openModal() {
        $("#loginModal").modal('show');
    });
</script>
 
</asp:Content>



