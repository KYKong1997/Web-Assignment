<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="PurchaseHistory.aspx.cs" Inherits="Assignment.PurchaseHistory" %>


<asp:Content ID="ContentID" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" RowStyle-HorizontalAlign="center" RowStyle-VerticalAlign="middle" >
            <Columns>
                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" HeaderStyle-Width="100px" >
                <ControlStyle Font-Size="X-Large" />
<HeaderStyle Width="100px"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField  DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" HeaderStyle-Width="100px"  >
                
<HeaderStyle Width="100px"></HeaderStyle>
                
                </asp:BoundField>
                <asp:BoundField DataField="ProductPrice" HeaderText="ProductPrice" ReadOnly="True" SortExpression="ProductPrice" HeaderStyle-Width="100px"  >
<HeaderStyle Width="100px"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField DataField="qtyOrdered" HeaderText="qtyOrdered" SortExpression="qtyOrdered" HeaderStyle-Width="100px"  >
<HeaderStyle Width="100px"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" ReadOnly="True" SortExpression="TotalPrice" HeaderStyle-Width="100px"  >
<HeaderStyle Width="100px"></HeaderStyle>
                </asp:BoundField>
            </Columns>

<RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT o.OrderDate, p.ProductName, CAST(p.ProductPrice AS DECIMAL(16,2)) AS &quot;ProductPrice&quot;, d.qtyOrdered, CAST(d.detailPrice AS DECIMAL(16,2)) AS &quot;TotalPrice&quot; FROM Orders AS o INNER JOIN OrderDetails AS d ON o.OrderNumber = d.orderNumber INNER JOIN Product AS p ON d.ProductID = p.ProductID INNER JOIN Customer AS c ON o.customerID = c.CustomerID WHERE (c.CustomerID = 1000)"></asp:SqlDataSource>
    </div>

    

</asp:Content>