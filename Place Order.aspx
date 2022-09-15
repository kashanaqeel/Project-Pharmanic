<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Place Order.aspx.cs" Inherits="WebApplication1.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      
    <div class="container-fluid">
    
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                     <center>
                  <div class="row">
                    
                <div class="col">
                    <h4>Order Placement</h4>
                    </div>
                      </div>
                         
                   </center>
                   <div class="row">
                      <div class="col">
                    <hr />
                     </div>
                       </div>
                   <div class="row">
                      <div class="col">
                        <label>Product ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" Placeholder="Product ID"></asp:TextBox>
                        </div>
                          <label>Quantity</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" Placeholder="Quantity"></asp:TextBox>
                        </div>
                          </div>
                    </div>
                      <div class="row">
                 <div class="col">
                <div class="form-group">
                                <asp:Button ID="Order" class="btn btn-lg btn-block btn-success" runat="server" Text="Confirm Order" OnClick="Order_Click"/>
                            </div>
                  
                </div>
                          </div>
             </div>
                </div>
            
            <a href="homepage.aspx"><< Back to Home</a><br>
            <br>
              </div>
         <div class="col-md-5">
             <center>
                 <br />
             <img width="300px" src="imgs/placeorder.png"/>
               </center>
        
             </div>
          
            </div>
        
         </div>
</asp:Content>
