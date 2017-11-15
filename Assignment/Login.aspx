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
        .center-block{
            display:inline-block;
            margin-left:auto;
            margin-right:auto;
           
            margin: auto;
           position: absolute;
            top: 0; left: 0; bottom: 0; right: 0;
           
        }
      
    </style>
</head>
    
<body>
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#loginModal" hidden="hidden"></button>
    <form runat="server">
       <div class="modal fade" id="loginModal" role="dialog">
           <div class="modal-dialog">
               <div class="modal-content">
                    <div class="container" style="width: auto; margin: 0 10%;">
            <div class="center-block">
                    <div class="row">
            <div class="col-md-6">
                <div class="panel">
                    <div class="panel-heading">
                        <strong>CH Artwork Login Page</strong>
                    </div>

                    <div class="panel-body">
                        <div class="tab-content">
                           <asp:Login ID="Login1" runat="server">
                               <LayoutTemplate>
                                   <div class="tab-pane fade in active register">
                                       <div class="container-fluid">
                                           <div class="row">
                                               <div class="col-xs-12 col-sm-12 col-md-12">
                                                   <div class="form-group">
                                                       <div class="input-group">
                                                           <div class="input-group-addon">
                                                               <span class="glyphicon glyphicon-user"></span>
                                                           </div>
                                                           <asp:TextBox ID="username" runat="server" placeholder="Username....." CssClass="form-control"></asp:TextBox>
                                                       </div>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="row">
                                               <div class="col-xs-12 col-sm-12 col-md-12">
                                                   <div class="form-group">
                                                       <div class="input-group">
                                                           <div class="input-group-addon">
                                                               <span class="glyphicon glyphicon-lock"></span>
                                                           </div>
                                                           <asp:TextBox ID="password" runat="server" placeholder="Password....." TextMode="Password" OnTextChanged="password_TextChanged" CssClass="form-control"></asp:TextBox>
                                                       </div>
                                                   </div>
                                               </div>
                                           </div>
                                           <div class="row">
                                               <div class="col-xs-12 col-sm-12 col-md-12">
                                                   <asp:Button ID="submitBtn" runat="server" CommandName="Login" CssClass="btn btn-success btn-block btn-lg" Text="Login" OnClick="submitBtn_Click"/>
                                               </div>
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
        </div>
               </div>
           </div>
       </div>
    
    </form>
    
</body>
   
</html>
