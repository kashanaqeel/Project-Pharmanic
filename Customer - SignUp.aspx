<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Customer - SignUp.aspx.cs" Inherits="WebApplication1.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
         <asp:Image ID="Image1" runat="server" ImageUrl="SignUp - Customer.png" Width="1330" Height="350" ImageAlign="Middle" BorderStyle="Dotted" BackColor="WhiteSmoke"/>
        </center>  
        <br /><br />
        <div style="margin-left: 380px; margin-right: auto;">   
        <asp:Label ID="Label2" runat="server" Text="CNIC: " Font-Bold></asp:Label><asp:TextBox ID="cnic" runat="server" Text="xxxxx-xxxxxxx-x" OnTextChanged="cnic_TextChanged"></asp:TextBox>
          
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Can't be blank" ControlToValidate="cnic" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>  
           <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="cnic" ErrorMessage="Invalid CNIC" ForeColor="Red" ValidationExpression="^[\s\S]{15,15}$" Font-Size="Small"></asp:RegularExpressionValidator>  
            &nbsp  &nbsp  &nbsp  &nbsp  &nbsp   &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
        <asp:Label ID="Label1" runat="server" Text="Name: " Font-Bold></asp:Label><asp:TextBox ID="name" runat="server"></asp:TextBox>
        
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Can't be blank" ControlToValidate="name" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>  
        </div><br />
     <div style="margin-left: 355px; margin-right: auto;"> <asp:Label ID="Label5" runat="server" Text="Password: " Font-Bold></asp:Label><asp:TextBox ID="Pass" TextMode="Password" runat="server"></asp:TextBox>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="Pass" runat="server" ValidationExpression="^[\s\S]{8,}$" ErrorMessage="Atleast 8 characters" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Can't be blank" ControlToValidate="Pass" ForeColor="Red" Font-Size="XX-Small"></asp:RequiredFieldValidator>  
         &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
         <asp:Label ID="Label11" runat="server" Text="Phone Number: " Font-Bold></asp:Label><asp:TextBox ID="Phone" runat="server" Text="xxxx-xxxx-xxx"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Can't be blank" ControlToValidate="Phone" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator>  
         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="Phone" runat="server" ValidationExpression="^[\s\S]{13,13}$" ErrorMessage="Invalid Phone Number" Font-Size="X-Small" ForeColor="Red"></asp:RegularExpressionValidator>
         </div>
            <br />
        <div style="margin-left: 310px; margin-right: auto;"><asp:Label ID="Label16" runat="server" Text="Confirm Password: " Font-Bold></asp:Label><asp:TextBox ID="ConfirmPass" TextMode="Password" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Pass" ControlToValidate="ConfirmPass" ErrorMessage="Password Mismatch" Font-Size="Small" ForeColor="Red"></asp:CompareValidator>
            &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp
                <asp:Label ID="Label10" runat="server" Text="Email: " Font-Bold></asp:Label><asp:TextBox ID="email" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email cannot be blank" ControlToValidate="email" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>      
            <br /></div><br />
            <div style="margin-left: 380px; margin-right: auto;"> <asp:Label ID="Label6" runat="server" Text="Gender:" Font-Bold></asp:Label>&nbsp &nbsp<asp:Label ID="Label7" runat="server" Text="Male:" Font-Bold></asp:Label><asp:RadioButton ID="RadioButton1" GroupName="Gender" runat="server" /><asp:Label ID="Label8" runat="server" Text="Female:" Font-Bold></asp:Label><asp:RadioButton ID="RadioButton2" GroupName="Gender" runat="server" />
                   &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                <asp:Label ID="Label3" runat="server" Text="Age: " Font-Bold></asp:Label><asp:TextBox ID="age" runat="server" Width="30"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Invalid" ValidationExpression="^\d+" ControlToValidate="age" ForeColor="Red" Font-Size="Small"></asp:RegularExpressionValidator>
                &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
            <asp:Label ID="Label14" runat="server" Text="Are you a Doctor?" Font-Bold></asp:Label><asp:CheckBox ID="CheckBox1" runat="server" />
            </div><br />
        <div style="margin-left: 375px; margin-right: auto;"> <asp:label ID="Label9" runat="server" text="Country: " Font-Bold></asp:label><asp:DropDownList ID="ddlCountry" runat="server"> 
<asp:ListItem Text="Select" Value="0"></asp:ListItem> 
<asp:ListItem Text="Pakistan"  
Value="Pak"></asp:ListItem> 
<asp:ListItem Text="Malaysia"  
Value="Mal"></asp:ListItem> 
<asp:ListItem Text="Australia"  
Value="Aus"></asp:ListItem> 
<asp:ListItem Text="England"  
Value="Eng"></asp:ListItem>
</asp:DropDownList>
            &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
           <asp:Label ID="Label4" runat="server" Text="City: " Font-Bold></asp:Label><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
            <asp:Label ID="Label13" runat="server" Text="State: " Font-Bold></asp:Label><asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
        </div><br />
            <div style="margin-left: 380px; margin-right: auto;"> <asp:Label ID="Label12" runat="server" Text="Address: " Font-Bold></asp:Label> <asp:TextBox ID="address" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Can't be blank" ControlToValidate="address" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator>  
                &nbsp
                <asp:Label ID="Label15" runat="server" Text="PostalCode: " Font-Bold></asp:Label><asp:TextBox ID="code" runat="server" Width="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Can't be blank" ControlToValidate="code" ForeColor="Red" Font-Size="X-Small"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Code" ValidationExpression="^\d+" ControlToValidate="code" ForeColor="Red" Font-Size="Small"></asp:RegularExpressionValidator>
                <br /><br /></div>
            <div style="margin-left: 685px; margin-right: auto;"> <asp:button ID="Button1" runat="server" text="Create Account" OnClick="Button1_Click"/> </div>
          <a href="homepage.aspx"> << Back to Home Page</a>
</asp:Content>
