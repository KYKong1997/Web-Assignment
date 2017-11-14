<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="Assignment.Wishlist" %>


   <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server"> 
       <div class="container">
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
               <Columns>
                   <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" HeaderStyle-Width="100px"/>
                   <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" HeaderStyle-Width="100px"/>
                   <asp:ImageField DataImageUrlField="ProductImage" HeaderText="ProductImage" SortExpression="ProductImage">
                       <ControlStyle Height="300px" Width="300px" />
                   </asp:ImageField>
                  
               </Columns>
               <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
               <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
               <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
               <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
               <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
               <SortedAscendingCellStyle BackColor="#FFF1D4" />
               <SortedAscendingHeaderStyle BackColor="#B95C30" />
               <SortedDescendingCellStyle BackColor="#F1E5CE" />
               <SortedDescendingHeaderStyle BackColor="#93451F" />
           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT P.ProductID, P.ProductName, P.ProductImage,CAST(P.ProductPrice AS DECIMAL(16,2)) FROM Wishlist AS W INNER JOIN Customer AS C ON W.CustomerID = C.CustomerID INNER JOIN Product AS P ON W.ProductID = P.ProductID and C.CustomerID=1004;"></asp:SqlDataSource>
       </div>
   </asp:Content>    
