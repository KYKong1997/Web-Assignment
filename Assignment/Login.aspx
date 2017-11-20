<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment.Login" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
      <script src="Scripts/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
   
    <script src="Scripts/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
           
            $("#loginModal").modal('show');
        });

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
    <form runat="server">
       <div class="modal fade col-lg-12" id="loginModal" role="dialog" data-keyboard="false" data-backdrop="static">
           <div class="modal-dialog">
               <div class="modal-content">
                    <div class="container" style="width: auto; margin: 0 10%;">
           
                    
           
                <div class="panel"  style="width:100%">
                    <div class="panel-heading" style="width:100%">
                        <strong>CH Artwork Login Page</strong>
                    </div>

                    <div class="panel-body" style="width:100%">
                       
                           <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate1">
                               <LayoutTemplate>
                                  
                                      
                                           <div>
                                               
                                                   <div class="form-group">
                                                       <div class="input-group">
                                                           <div class="input-group-addon">
                                                               <span class="glyphicon glyphicon-user"></span>
                                                           </div>
                                                           <asp:TextBox ID="username" runat="server" placeholder="Username....." CssClass="form-control"></asp:TextBox>
                                                       </div>
                                                   </div>
                                               </div>
                                          
                                           <div>
                                              
                                                   <div class="form-group" style="min-width:100%">
                                                       <div class="input-group">
                                                           <div class="input-group-addon">
                                                               <span class="glyphicon glyphicon-lock"></span>
                                                           </div>
                                                           <asp:TextBox ID="password" runat="server" placeholder="Password....." TextMode="Password" OnTextChanged="password_TextChanged" CssClass="form-control"></asp:TextBox>
                                                       </div>
                                                   </div>
                                               </div>
                                           
                                           <div>
                                              
                                                   <asp:Button ID="submitBtn" runat="server" CommandName="Login" CssClass="btn btn-success btn-block btn-lg" Text="Login" OnClick="submitBtn_Click"/>
                                               <asp:Button ID="registrationBtn" runat="server" CommandName="Registration" CssClass="btn btn-success btn-block btn-lg" Text="Register Account" OnClick="registrationBtn_Click" />
                                             
                                           </div>
                                       </div>
                                   </div>
                               </LayoutTemplate>
                           </asp:Login>
                        </div>
                   
                
            </div>
       
            
        </div>
               </div>
           </div>
       </div>
    
    </form>
    
</body>
   
</html>
