<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="Assignment.Wishlist1" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style>
        .outer{
            font-family:Corbel;

        }
        .griddesign{
            text-align:center;
        }
        .griddesign th{
           text-align:center;
           padding:6px 2px;
           background-color:black;
           color:floralwhite;
           border-color:white;
       }
     
    </style>
        <div class="outer" style="margin-left:270px">
            <asp:GridView ID="GridView1" runat="server" CssClass="griddesign" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID"   HeaderStyle-Width="100px" >
<HeaderStyle Width="100px"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" HeaderStyle-Width="100px">
<HeaderStyle Width="100px"></HeaderStyle>
                    </asp:BoundField>
                    <asp:ImageField DataImageUrlField="ProductImage" HeaderText="ProductImage" SortExpression="ProductImage">
                        <ControlStyle Height="300px" Width="300px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="True" SortExpression="Price" />
                    <asp:BoundField DataField="DateAdded" HeaderText="Date Added" ReadOnly="True" SortExpression="DateAdded" DataFormatString="{0:dd/MM/yyyy}" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT P.ProductID, P.ProductName, P.ProductImage,CAST(P.ProductPrice AS DECIMAL(16,2)) AS Price,W.DateAdded  FROM Wishlist AS W INNER JOIN Customer AS C ON W.CustomerID = C.CustomerID INNER JOIN Product AS P ON W.ProductID = P.ProductID and C.CustomerID=@customer">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblcustid" Name="customer" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Label ID="lblcustid" runat="server" Text="" Visible="false"></asp:Label>
        </div>
</asp:Content>