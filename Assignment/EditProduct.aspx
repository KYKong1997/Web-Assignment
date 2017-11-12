<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="Assignment.EditProduct"  MasterPageFile="~/Site1.Master"%>

<asp:Content ID="content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="col-lg-10 container">
        <asp:FormView ID="formViewEdit" AllowPaging="true" runat="server">
        <ItemTemplate>
            <table>
                <tr>
                    <td rowspan="5">
                        <asp:Image ID="editImage" runat="server"  ImageUrl='<%#Eval("ProductImage") %>' Height="200px" Width="200px"/>
                    </td>
                    <td><asp:Label ID="lblName" Text='<%#Eval("ProductName") %>' runat="server"></asp:Label></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    </div>
    

</asp:Content>