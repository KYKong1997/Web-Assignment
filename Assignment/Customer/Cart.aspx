<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Assignment.Cart" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style>
        .qty{
            padding-top:20px
        }
        .prodname{
            font-weight:bold;
            font-size:20pt
        }
        .prodimage{
            width:400px;
            height:450px;
        }
        .prodDes{
            text-decoration:solid;
            font-weight:bold;
            font-size:15pt
        }
        
        .image{
            padding-left:50px;
            float:left;
            padding-right:50px
        }
        .rightside{
            text-align:center;
            float:right;
            padding-left:50px
        }
        .outercontainer{
            padding-top:50px;
            margin-left:150px;
            font-family:Corbel;
            font-size:13pt
        }
        .btnAddToCart{
            background-color:black;
            color:floralwhite;
            border:2px solid black;
        }
        .btnAddToCart:hover{
           background-color:cadetblue;
        }
        .btnWishlist{
            background-color:black;
            color:floralwhite;
            border:2px solid black;

        }
        .btnWishlist:hover{
            background-color:cadetblue;
        }
    </style>
   <div class="outercontainer">
       
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="Select ProductName , CAST(ProductPrice AS DECIMAL(10,2)) AS Price , ProductImage, ProductQty, ProductDescription,ProductID FROM Product where ProductID=@prod_id">
           <SelectParameters>
               <asp:ControlParameter ControlID="lblprodid" Name="prod_id" PropertyName="Text" />
           </SelectParameters>
       </asp:SqlDataSource>
       
       <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="ProductID" OnPageIndexChanging="FormView1_PageIndexChanging" >
           <EditItemTemplate>
               ProductName:
               <asp:TextBox ID="ProductNameTextBox" runat="server" Text='<%# Bind("ProductName") %>' />
               <br />
               Price:
               <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
               <br />
               ProductImage:
               <asp:TextBox ID="ProductImageTextBox" runat="server" Text='<%# Bind("ProductImage") %>' />
               <br />
               ProductQty:
               <asp:TextBox ID="ProductQtyTextBox" runat="server" Text='<%# Bind("ProductQty") %>' />
               <br />
               ProductDescription:
               <asp:TextBox ID="ProductDescriptionTextBox" runat="server" Text='<%# Bind("ProductDescription") %>' />
               <br />
               ProductID:
               <asp:Label ID="ProductIDLabel1" runat="server" Text='<%# Eval("ProductID") %>' />
               <br />
               <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
               &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
           </EditItemTemplate>
           <InsertItemTemplate>
               ProductName:
               <asp:TextBox ID="ProductNameTextBox" runat="server" Text='<%# Bind("ProductName") %>' />
               <br />
               Price:
               <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
               <br />
               ProductImage:
               <asp:TextBox ID="ProductImageTextBox" runat="server" Text='<%# Bind("ProductImage") %>' />
               <br />
               ProductQty:
               <asp:TextBox ID="ProductQtyTextBox" runat="server" Text='<%# Bind("ProductQty") %>' />
               <br />
               ProductDescription:
               <asp:TextBox ID="ProductDescriptionTextBox" runat="server" Text='<%# Bind("ProductDescription") %>' />
               <br />
               <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
               &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
           </InsertItemTemplate>
           <ItemTemplate>
                           <aside class="image">
              <asp:Image CssClass="prodimage" ID="ProdImage" runat="server" ImageUrl='<%# Eval("ProductImage") %>'/>

               </aside>
               <div class="rightside">
                   <asp:Label class="prodname" ID="ProductNameLabel" runat="server" Text='<%# Bind("ProductName") %>' />
               <br />
                   RM&nbsp
               <asp:Label ID="ProductPriceLabel" runat="server" Text='<%# Bind("Price") %>' />
               <br />
               <strong class="qty">Quantity Available:</strong> &nbsp&nbsp
               <asp:Label ID="ProductQtyLabel" runat="server" Text='<%# Bind("ProductQty") %>' /><br /><br />
               <u class="prodDes">Description</u><br />
               <asp:Label ID="ProductDescriptionLabel" runat="server" Text='<%# Bind("ProductDescription") %>' />
               <br /><br />
               <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' Visible="false"/>
               <br />
               <asp:TextBox ID="inqty" runat="server"></asp:TextBox>
                    <asp:Button class="btnAddToCart" ID="btnAdd" runat="server" Text="Add To Cart"     style="height: 33px" OnClick="BtnAdd_Click" />
                &nbsp&nbsp
       <asp:Button class="btnWishlist" ID="btnAddToWishlist" Text="Add To Wishlist" runat="server" style="height: 33px" OnClick="BtnAddToWishlist_Click" />
              </div>
           </ItemTemplate>

       </asp:FormView>
       
                
       <asp:Label ID="lblprodid" runat="server" Visible="false"></asp:Label>
      
   </div>
   
</asp:Content>

