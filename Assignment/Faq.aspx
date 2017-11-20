<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Faq.aspx.cs" Inherits="Assignment.Faq" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style>
    .outer{
        
        font-family:Corbel;
        font-size:13pt;
        padding-left:150px;
        
    }
    .left{
        float:left;
        padding-right:300px
    }
    
    section{
        display:none
    }
    a:hover+section{
        display:block
    }
    .inner{
        padding-top:30px
    }
    
</style>
<div class="outer">
    <h2>Frequently Asked Question</h2><br />
    <span class="left">
        <br />
     If you have any question or doubt, feel free to consult our list of frequently asked question
        below. For further enquiries, please contact 03-11882525(Monday-Friday) avaiable
        from 9am to 6pm. <br />
        We appreciate your business and can't wait to serve you!
    
    </span>
    <div class="inner">
        
        <a>>> How do I view my cart ?</a>
        <section>To view your cart inventory, you have to click the cart icon on top right corner
            of our webpage. Once you clicked it, all the items that you<br />
            previously added to the cart 
            and subtotal would be displayed accordingly. 

        </section><br /><br />
        <a>>> Is there a minimum order value or amount ?</a>
        <section>No. There is no minimum order value or amount required to make an order.</section>
        <br /><br />

        <a>>> What are the recommended browser for this site ?</a>
        <section>
            This site is optimized for Explorer version 7.0 or higher, Mozilla Firefox version 2.0 or
            higher, Opera 9.0 or higher and Google Chrome.
        </section><br /><br />
        <a>>> Is my personal information secured ?</a>
        <section>
            The confidentality and safety of your infromation is guaranteed. At no point we would
            never share,reveal or sell your information without your consent.
        </section><br /><br />
        <a>>> Is it safe to use credit card on your website ?</a>
        <section>
            Yes.Our website is secured and we ensure a safe payment procedure by using secure
            Internet gateway.
        </section><br /><br />

    </div>
</div>

</asp:Content>