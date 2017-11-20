<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Location.aspx.cs" Inherits="Assignment.Artist.Location"  MasterPageFile="~/Site3.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
 <style>
    .conContent{
        padding-top:30px;
        align-self:center;
        font-family:Corbel;
        margin: auto;
        width: 50%;
        height:50%;
    }
</style>
   <div class="conContent" style="margin-left:270px">
       
       <table>
           <tr><td>
               <asp:Image ID="Image1" runat="server"  ImageUrl="~/image1.jpg" Height="300px" Width="300px"/></td>
               <td>
                   <asp:Image ID="Image2" runat="server"  ImageUrl="~/image2.jpg" Height="300px" Width="300px"/></td>
           </tr>
           <tr><td>2 Jalan Temerloh, Off Jalan Tun Razak 53200 Kuala Lumpur, Titiwangsa, 53200 Kuala Lumpur, Federal Territory of Kuala Lumpur</td>
               <td>Lot No. 341-43, Level 3, Suria KLCC, Persiaran Petronas, Kuala Lumpur City Centre, 50088 Kuala Lumpur, Federal Territory of Kuala Lumpur</td>
           </tr>
           <tr><td colspan="2"><p style="text-align:center"><br />Operation Hours:<br />
               Tuesday - Saturday: 11.00am -7.00pm<br />
Sunday: 11.00am - 5.00pm<br />
Closed on Mondays & Public Holidays<br /></p>
               </td></tr>
       </table>
   </div>
</asp:Content>