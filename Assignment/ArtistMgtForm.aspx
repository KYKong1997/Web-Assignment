<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArtistMgtForm.aspx.cs" Inherits="Assignment.ArtistMgtForm" MasterPageFile="~/Site1.Master"%>


<asp:Content ID="ContentPlaceHolder" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
           <asp:GridView runat="server" ID="imgGridView" AutoGenerateColumns="false" AllowPaging="true" OnRowCancelingEdit="imgGridView_RowCancelingEdit" DataKeyNames="ProductID" CellPadding="4" 
      OnRowEditing="imgGridView_RowEditing" OnRowUpdating="imgGridView_RowUpdating" HeaderStyle-BackColor="Wheat" OnSelectedIndexChanged="imgGridView_SelectedIndexChanged">
       <Columns>
           <asp:TemplateField HeaderText="Product Name" HeaderStyle-Width="200px">
               <ItemTemplate>
                   <asp:Label ID="lblName" runat="server" Text='<%#Eval("ProductName") %>'></asp:Label>
               </ItemTemplate>

           </asp:TemplateField>
           <asp:TemplateField HeaderText="Description" HeaderStyle-Width="200px">
               <ItemTemplate>
                   <asp:Label ID="lblDescription" runat="server" Text='<%#Eval("ProductDescription") %>'></asp:Label>
               </ItemTemplate>

           </asp:TemplateField>
           <asp:TemplateField HeaderText="Image" HeaderStyle-Width="200px">
               <ItemTemplate>
                   <asp:ImageButton ID="img" ImageUrl='<%#Eval("ProductImage")+"?"+(DateTime.Now.ToString()) %>'  runat="server" Height="200px" Width="200px"
                       CommandArgument='<%#Eval("ProductID") %>' OnClick="img_Click"/>
               </ItemTemplate>
           </asp:TemplateField>

       </Columns>

   </asp:GridView>
    </div>
</asp:Content>

