<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Edit_Profile.aspx.cs" Inherits="WebApplication1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container-fluid">
            <div class="card">
               <div class="card-body">
                        <center>
                           <img width="100px" src="imgs/generaluser.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Edit Profile</h4>
                           </center>
                     </div>
                  </div>
                        <hr>
                     </div>
    <div class="col-3 mx-auto">
                        <label>User Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="User Name" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                        </div>
        </div>
                        <center>
                           <span class="badge badge-pill badge-info">Login Credentials</span>
                       <div class="col-3 mx-auto">
                        <label>User ID</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="User ID" ReadOnly="True"></asp:TextBox>
                        </div>
                           </div>
                            <div class="col-3 mx-auto">
                        <label>Old Password</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="Old Password" TextMode="Password"></asp:TextBox>
                        </div>
                                </div>
                            <div class="col-3 mx-auto">
                        <label>New Password</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox10" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                        </div>
                                </div>
                            <div class="col-3 mx-auto">
                        <center>
                           <div class="form-group">
                              <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
                           </div>
                        </center>
                                </div>
            <a href="homepage.aspx"><< Back to Home</a><br><br>
</asp:Content>
