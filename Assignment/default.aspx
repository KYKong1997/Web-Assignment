<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Assignment._default" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style>
       .image {
           padding:10px;
       }
   </style>
    <div style="margin-left:180px">
        
           <asp:DataList runat="server" ID="datalist" RepeatDirection="Horizontal" RepeatColumns="3"    DataKeyField="Productid" DataSourceID="SqlDataSource1" ><ItemTemplate>
              <asp:ImageButton  CssClass="image"  runat="server" ID="image1" ImageUrl='<%#Eval("Productimage")%>' Height="450px" Width="300px"     OnCommand="datalist_SelectedIndexChanged" CommandArgument='<%# Eval("productid") %>'   /> 
         
             <p style="text-align:center;font-family:KaiTi;font-size:x-large">
                 <asp:Label ID="Label2" runat="server" Text='<%# Eval("Productname") %>'></asp:Label><br /><asp:Label ID="Label1" runat="server" Text='<%# Eval("price") %>'></asp:Label></p>
                                         </ItemTemplate></asp:DataList>
                                         
                           
      
        
    </div>
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Productid,ProductImage, CAST(ProductPrice AS DECIMAL(10,2)) AS PRICE, ProductName FROM Product"></asp:SqlDataSource>
   
    </asp:Content>