<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Customer - Login.aspx.cs" Inherits="WebApplication1.WebForm9" %>
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
                           <h4>Customer Login </h4>
                           </center>
                     </div>
                  </div>
                      <hr>
                     </div>


             <div class="col-3 mx-auto">
                            <centre>
                                <label>CNIC</label>
                             </centre>
                            <div class="form-group">
                                 <asp:TextBox CssClass="form-control" ID="cnic" runat="server" placeholder="xxxxx-xxxxxxx-x" ></asp:TextBox>
                             </div>
              </div>
                        
                       <div class="col-3 mx-auto">
                           <centre>
                        <label>Password</label>
                               </centre>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="Pass" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                           </div>
                                  
    
                           <div class="col-3 mx-auto">
                                   <centre>
                                <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Login" OnClick="Button1_Click" /> 
                                       </centre>
                               </div>
                          
            <a href="homepage.aspx"><< Back to Home</a><br><br>




</asp:Content>
