<%@ Page Language="C#" UnobtrusiveValidationMode="None"  AutoEventWireup="true" CodeBehind="AddNewProduct.aspx.cs" Inherits="Assignment.AddNewProduct" MasterPageFile="~/Site1.Master"%>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder2" ID="content3" runat="server">
     <br />
    <br />
    <br />

    <div class="container">
      
           
              <table class="EditForm" border="1">
                    <tr>
                      <td rowspan="7">
                         
                          
                          <img id="imgProd" alt="click here to upload your product image" onclick="displayFolder()" height="400" width="300"/>
                          <input runat="server" type="file" name="ImageUpload" id="ImageUpload" onchange="onFileSelected(event)" />  
                      </td>
                            

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblproductName" Text="Product Name:" runat="server" ForeColor="#294057" Font-Size="26px"></asp:Label>
                            <br />
                            <asp:RequiredFieldValidator ID="NameRequiredValidator" runat="server" ErrorMessage="Please enter your product name" ControlToValidate="productNameTxt"></asp:RequiredFieldValidator>
                           <asp:Textbox ID="productNameTxt"  runat="server" ForeColor="#294057" Font-Size="26px"></asp:Textbox>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblProductPrice" Text="Product Price:" runat="server"></asp:Label>
                            <br />
                            <asp:Textbox ID="productPriceTxt" runat="server" TextMode="Number"></asp:Textbox>
                        </td>
                   </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblproductDescription" Text="Product Description" runat="server"></asp:Label>
                            <br />
                            <asp:RequiredFieldValidator ID="descriptionValidator" runat="server" ErrorMessage="Please enter your product description" ControlToValidate="productDescriptionTxt"></asp:RequiredFieldValidator>
                            <asp:Textbox ID="productDescriptionTxt" runat="server" TextMode="MultiLine"></asp:Textbox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <asp:Label ID="lblqty" Text="Product Quantity" runat="server"></asp:Label>
                             <br />
                            <asp:RequiredFieldValidator ID="qtyRequiredValidator" runat="server" ErrorMessage="Please enter your product quantity" ControlToValidate="productQtyTxt"></asp:RequiredFieldValidator>
                             <asp:TextBox runat="server" ID="productQtyTxt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button id="modalBtn" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add</button>
                        </td>
                    </tr>
                </table>
              
            

          <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add</h4>
        </div>
        <div class="modal-body">
          <p>You want to add new product?</p>
        </div>
        <div class="modal-footer">
         <asp:Button ID="submitASPbtn" runat="server" OnClick="submitASPbtn_Click" Text="Save" CommandName="Insert" CssClass="btn btn-primary"/>
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

            var imgtag = document.getElementById("imgProd");
            imgtag.title = selectedFile.name;

            reader.onload = function (event) {
                imgtag.src = event.target.result;

            };
            reader.readAsDataURL(selectedFile);
        }
        function displayFolder() {
            document.getElementById('ImageUpload').click();
        }
        function ShowPopup(message) {
            $("#myModal").modal('show');
        };
    </script>
</asp:Content>

