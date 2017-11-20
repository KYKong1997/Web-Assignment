<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addedcart.aspx.cs" Inherits="Assignment.addedcart"  MasterPageFile="~/Site1.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style>
        .PNAME{
            font-weight:bold;
            font-size:15pt
        }
    .img{
        height:70px;
        width:70px
    }
    .outer{
        margin-left:150px;
        font-family:Corbel;
    }
    h2{
        font-weight:bold
    }
    .chkbtn{
            background-color:black;
            color:floralwhite;
            border:2px solid black;
    }
   .chkbtn:hover{
           background-color:cadetblue;
   }
   .right{
       padding-top:60px;
       padding-left:350px;
       float:right;
       font-size:13pt
   }
   .left{
       float:left
   }
   .button{
       padding-left:485px;
       font-size:14pt;
       font-weight:bold;
       padding-bottom:10px

   }
   .subtotalcontainer{
       padding-left:468px;
       font-size:13pt

   }
   
</style>    
   <div class="outer">
       <h2><u>Your Cart</u></h2>

       <div class="inner">
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="orderDetailsNo"  OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
               <Columns>
                   <asp:BoundField DataField="orderDetailsNo" Visible="false" HeaderText="orderDetailsNo" SortExpression="orderDetailsNo" />
                   <asp:BoundField DataField="orderNumber" HeaderText="orderNumber" SortExpression="orderNumber" />
                   <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                   <asp:ImageField DataImageUrlField="ProductImage" HeaderText="Product Image">
                       <ControlStyle BorderColor="White" BorderWidth="10px" Height="70px" Width="70px" />
                   </asp:ImageField>
                   <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID" Visible="False" />
                   <asp:BoundField DataField="qtyOrdered" HeaderText="qtyOrdered" SortExpression="qtyOrdered" />
                   <asp:BoundField DataField="DetailPrice" HeaderText="DetailPrice" ReadOnly="True" SortExpression="DetailPrice" />
                   <asp:ButtonField ButtonType="Button" CommandName="btnDelete" HeaderText="Delete From Cart" Text="Delete" />
               </Columns>
           </asp:GridView>
           <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2">
               <EditItemTemplate>
                   SUBTOTAL:
                   <asp:TextBox ID="SUBTOTALTextBox" runat="server" Text='<%# Bind("SUBTOTAL") %>' />
                   <br />
                   <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                   &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
               </EditItemTemplate>
               <InsertItemTemplate>
                   SUBTOTAL:
                   <asp:TextBox ID="SUBTOTALTextBox" runat="server" Text='<%# Bind("SUBTOTAL") %>' />
                   <br />
                   <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                   &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
               </InsertItemTemplate>
               <ItemTemplate>
                   <span class="subtotalcontainer">
                       SUBTOTAL:
                   <asp:Label ID="SUBTOTALLabel" runat="server" Text='<%# Bind("SUBTOTAL") %>' />
                   <br />
                   </span>
                   

               </ItemTemplate>
           </asp:FormView><br />
           <span class="button">
               <asp:Button ID="checkoutbtn" class="chkbtn" runat="server" Text="Check Out" OnClick="Checkoutbtn_Click" />
           </span>
           
           
       </div>
   </div>
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT D.OrderDetailsNo,D.orderNumber,P.ProductName,P.ProductImage,D.ProductID, D.qtyOrdered,CAST(D.detailPrice AS DECIMAL(16,2)) AS DetailPrice FROM Product P,OrderDetails D, Orders O WHERE P.ProductID=D.ProductID and D.OrderNumber=O.OrderNumber AND O.Status='pending' 
"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT CAST(SUM(D.DETAILPRICE) AS DECIMAL(16,2)) AS SUBTOTAL FROM ORDERDETAILS D, ORDERS O WHERE O.ORDERNUMBER=D.ORDERNUMBER AND STATUS='pending' "></asp:SqlDataSource>
</asp:Content>





