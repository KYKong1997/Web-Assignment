<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shopping.aspx.cs" Inherits="Assignment.Shopping" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   <style>
       .image {
           padding:10px;
       }
   </style>
    <div style="margin-left:180px">
        <h1 style="margin-left:370px; font-family:KaiTi">Products</h1>
         <asp:DataList runat="server" ID="datalist" RepeatDirection="Horizontal" RepeatColumns="3"  DataSourceID="SqlDataSource1"  DataKeyField="Productid"><ItemTemplate>
              <asp:ImageButton  CssClass="image"  runat="server" ID="image1" ImageUrl='<%#Eval("Productimage")%>' Height="450px" Width="300px"     OnCommand="Unnamed1_SelectedIndexChanged1" CommandArgument='<%# Eval("productid") %>'   /> 
         
             <p style="text-align:center;font-family:KaiTi;font-size:x-large">
                 <asp:Label ID="Label2" runat="server" Text='<%# Eval("Productname") %>'></asp:Label><br /><asp:Label ID="Label1" runat="server" Text='<%# Eval("price") %>'></asp:Label></p>
                                         </ItemTemplate></asp:DataList>
      
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Productid,ProductImage, CAST(ProductPrice AS DECIMAL(10,2)) AS PRICE, ProductName FROM Product"></asp:SqlDataSource>
    </div>
    
</asp:Content>



