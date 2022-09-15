<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Seller - SignUp.aspx.cs" Inherits="WebApplication1.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
         <asp:Image ID="Image1" runat="server" ImageUrl="SignUp - Seller.png" Width="1330" Height="350" ImageAlign="Middle" BorderStyle="Dotted" BackColor="WhiteSmoke" />
        </center>   
        <br /><br />
    <div style="margin-left: -100px;">
        <div style="margin-left: 380px; margin-right: auto;">   
        <asp:Label ID="Label2" runat="server" Text="Company Name: " Font-Bold></asp:Label><asp:TextBox ID="CN" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Can't be blank" ControlToValidate="CN" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator> 
            &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
            <asp:Label ID="Label1" runat="server" Text="Seller Name: " Font-Bold></asp:Label><asp:TextBox ID="SN" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Can't be blank" ControlToValidate="SN" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator> 
            </div><br />

<div style="margin-left: 415px; margin-right: auto;">   
        <asp:Label ID="Label8" runat="server" Text="Seller Title: " Font-Bold></asp:Label><asp:TextBox ID="ST" runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Can't be blank" ControlToValidate="ST" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>        
    &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
        <asp:Label ID="Label9" runat="server" Text="Seller CNIC: " Font-Bold></asp:Label><asp:TextBox ID="SC" runat="server" Text="xxxxx-xxxxxxx-x"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Can't be blank" ControlToValidate="SC" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>         
           <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="SC" ErrorMessage="Invalid CNIC" ForeColor="Red" ValidationExpression="^[\s\S]{15,15}$" Font-Size="Small"></asp:RegularExpressionValidator>  
</div><br />

<div style="margin-left: 390px; margin-right: auto;">   
        <asp:Label ID="Label3" runat="server" Text="Email Address: " Font-Bold></asp:Label><asp:TextBox ID="EA" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Can't be blank" ControlToValidate="EA" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>         
    &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
        <asp:Label ID="Label4" runat="server" Text="Phone Number: " Font-Bold></asp:Label><asp:TextBox ID="PN" runat="server" Text="xxxx-xxxx-xxx"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Can't be blank" ControlToValidate="PN" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>                 
         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="PN" runat="server" ValidationExpression="^[\s\S]{13,13}$" ErrorMessage="Invalid Phone Number" Font-Size="X-Small" ForeColor="Red"></asp:RegularExpressionValidator>
</div><br />

<div style="margin-left: 430px; margin-right: auto;">   
        <asp:Label ID="Label5" runat="server" Text="Country: " Font-Bold></asp:Label><asp:TextBox ID="Co" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Can't be blank" ControlToValidate="Co" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>       
    &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
        <asp:Label ID="Label6" runat="server" Text="State: " Font-Bold></asp:Label><asp:TextBox ID="Stat" runat="server"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Can't be blank" ControlToValidate="Stat" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>       
    </div><br />

<div style="margin-left: 460px; margin-right: auto;">   
        <asp:Label ID="Label11" runat="server" Text="City: " Font-Bold></asp:Label><asp:TextBox ID="Ci" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Can't be blank" ControlToValidate="Ci" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>              
    &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
    <asp:Label ID="Label12" runat="server" Text="Postal Code: " Font-Bold></asp:Label><asp:TextBox ID="Pc" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Can't be blank" ControlToValidate="Pc" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>          
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Code" ValidationExpression="^\d+" ControlToValidate="Pc" ForeColor="Red" Font-Size="Small"></asp:RegularExpressionValidator>
    </div><br />

             <div style="margin-left: 420px; margin-right: auto;"><asp:Label ID="Label7" runat="server" Text="Password: " Font-Bold></asp:Label><asp:TextBox ID="Pass" TextMode="Password" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Can't be blank" ControlToValidate="Pass" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>       
             </div><br/>
       <div style="margin-left: 360px; margin-right: auto;"><asp:Label ID="Label16" runat="server" Text="Confirm Password: " Font-Bold></asp:Label><asp:TextBox ID="CPass" TextMode="Password" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Can't be blank" ControlToValidate="CPass" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>              
                   <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Pass" ControlToValidate="CPass" ErrorMessage="Password Mismatch" Font-Size="Small" ForeColor="Red"></asp:CompareValidator>
       </div><br />
        </div>
            <div style="margin-left: 685px; margin-right: auto;"> <asp:button ID="Button1" runat="server" text="Create Account" OnClick="Button1_Click"/> </div>
        <a href="homepage.aspx"> << Back to Home Page</a>
</asp:Content>
