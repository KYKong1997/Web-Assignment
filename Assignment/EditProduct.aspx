<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="Assignment.EditProduct"  MasterPageFile="~/Site1.Master"%>

<asp:Content ID="content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <br />
    <br />
    <br />

    <div class="container">
       
     <asp:FormView ID="formViewEdit" runat="server" OnPageIndexChanging="formViewEdit_PageIndexChanging">
         <ItemTemplate>
               <table class="EditForm">

                   <tr>
                        <td rowspan="7"><img id="prodImg" src='<%#Eval("ProductImage") + "?" + (DateTime.Now.ToString()) %>' height="420" width="320" /></td>
                       <input runat="server" type="file" name="ImageUpload" id="ImageUpload" onchange="onFileSelected(event)"/>  
              
                    </tr>
           <tr>
               <td>
                   <asp:Label BorderStyle="Groove" ID="lblproductName" Text="Product Name:" runat="server" ForeColor="#294057" Font-Size="26px"></asp:Label>
                   <br />
                   <asp:Textbox ID="productNameTxt" Text='<%#Eval("ProductName") %>' runat="server" ForeColor="#294057" Font-Size="26px"></asp:Textbox>
               </td>
           </tr>
           <tr>
               <td>
                   <asp:Label ID="lblProductID" Text='<%#"Product ID:"+Eval("ProductID") %>' runat="server"></asp:Label>
               </td>
           </tr>
                   <tr>
                       <td>
                       <asp:Label ID="lblProductPrice" Text="Product Price:" runat="server"></asp:Label>
                       <br />
                       <asp:Textbox ID="productPriceTxt" Text='<%#float.Parse(Eval("ProductPrice").ToString())%>' runat="server" TextMode="Number"></asp:Textbox>
                   </td>
                   </tr>
                   
           <tr>
               <td>
                   <asp:Label ID="lblproductDescription" Text="Product Description" runat="server"></asp:Label>
                   <br />
                   <asp:Textbox ID="productDescriptionTxt" Text='<%#Eval("ProductDescription") %>' runat="server" TextMode="MultiLine"></asp:Textbox>
               </td>
           </tr>
                   <tr>
                      <td>
                          <asp:Label ID="lblqty" Text="Product Quantity" runat="server"></asp:Label>
                          <br />
                          <asp:TextBox ID="productQtyTxt" Text='<%#Eval("ProductQty") %>' runat="server"></asp:TextBox>
                      </td>
                       
                   </tr>
                   <tr>
                       <td>
                            <button id="modalBtn" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Save</button>
                           
                       </td>
                       
                      
                   </tr>
                   
       </table>
         </ItemTemplate>
     </asp:FormView>
     
        <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Save</h4>
        </div>
        <div class="modal-body">
          <p>You want to save the changes?</p>
        </div>
        <div class="modal-footer">
         <asp:Button ID="submitASPbtn" runat="server" OnClick="submitBtn_Click" Text="Save" CssClass="btn btn-primary"/>
            <asp:Button ID="cancelBtn" runat="server" OnClick="cancelBtn_Click" Text="Cancel" CssClass="btn btn-danger" />
        </div>
      </div>
      
    </div>
  </div>
  
    </div>
   <script>
       function onFileSelected(event) {
           var selectedFile = event.target.files[0];
           var reader = new FileReader();

           var imgtag = document.getElementById("prodImg");
           imgtag.title = selectedFile.name;

           reader.onload = function (event) {
               imgtag.src = event.target.result;

           };
           reader.readAsDataURL(selectedFile);
       }
       function ShowPopup(message) {
           $("#myModal").modal('show');
       };
   </script>
    
</asp:Content>
