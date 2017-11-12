<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="Assignment.Wishlist" %>


   <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server"> 
       <div style="margin-left:250px">
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="SqlDataSource1">
               <Columns>
                   <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                   <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                   <asp:ImageField HeaderText="ProductImage" DataImageUrlField="ProductImage" ControlStyle-Width="300" ControlStyle-Height="300">
                   </asp:ImageField>
               </Columns>
           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT P.ProductID, P.ProductName, P.ProductImage FROM Wishlist AS W INNER JOIN Customer AS C ON W.CustomerID = C.CustomerID INNER JOIN Product AS P ON W.ProductID = P.ProductID and C.CustomerID=1004"></asp:SqlDataSource>
       </div>
   </asp:Content>    
