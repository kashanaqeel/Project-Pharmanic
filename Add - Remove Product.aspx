<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Add - Remove Product.aspx.cs" Inherits="WebApplication1.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="container-fluid">
     
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Add Product</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="imgs/products.png" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-2">
                        <label>Seller ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Product Name</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Product Name"></asp:TextBox>
                              </div>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Product Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Product Description"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-3">
                        <label>Category ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="ID"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Unit Price</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="PKR"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Units in Stock</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Units in Stock"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                       <div class="col-md-4">
                        <label>Units On Order</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="N/A" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-4">
                        <label>Discount Available</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="0 or 1"></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-4">
                        <label>Ranking</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="N/A" ReadOnly="true"></asp:TextBox>
                        </div>
                     </div> 
                     <div class="col-12">
                        <asp:Button ID="Button4" class="btn btn-lg btn-block btn-success" runat="server" Text="Add Product" OnClick="Button4_Click" />
                     </div>
                  </div>
                   </div>
                <div class="col">
                 <hr />
             </div>
                <div class="col">
                    <center>
                 <h4>Remove Product</h4>
                        </center>
             </div>
                <div class="col">
                        <center>
                           <img width="100px" src="imgs/products.png" />
                        </center>
                     </div>
                <div class="col">
                        <hr>
                     </div>
                <div class="col-md-4">
                        <label>Product ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" Placeholder="Product ID"></asp:TextBox>
                        </div>
                     </div>
                <div class="form-group">
                                <asp:Button ID="ButtonRemove" class="btn btn-lg btn-block btn-danger" runat="server" Text="Remove Product" OnClick="ButtonRemove_Click" />
                            </div>
                  
                </div>
             </div>
          
             <div class="col-md-7">
                 <br /><br /><br /><br /><br /><br /><br />
             <hr />
                 <center>
             <h3>Find Your Products List Below</h3>
                     </center>
             <hr />    
             </div>
            
         <div class="col-md-12">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Products List</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:GridView ID="ProductsList" runat="server" AutoGenerateColumns="False" RowStyle-BackColor="#A1DCF2"
            HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" HorizontalAlign="Center" >
            <Columns>
                <asp:BoundField ItemStyle-Width="150px" DataField="ProductID" HeaderText="ProductID">
<ItemStyle Width="150px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField ItemStyle-Width="150px" DataField="ProductName" HeaderText="ProductName">
<ItemStyle Width="150px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField ItemStyle-Width="150px" DataField="ProductDescription" HeaderText="ProductDescription">
<ItemStyle Width="150px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField ItemStyle-Width="150px" DataField="CompanyID" HeaderText="CompanyID" >
<ItemStyle Width="150px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField ItemStyle-Width="150px" DataField="CategoryID" HeaderText="CategoryID" >
<ItemStyle Width="150px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField ItemStyle-Width="150px" DataField="UnitPrice" HeaderText="UnitPrice" >
<ItemStyle Width="150px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField ItemStyle-Width="150px" DataField="UnitsinStock" HeaderText="UnitsinStock" >
<ItemStyle Width="150px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField ItemStyle-Width="150px" DataField="UnitsonOrder" HeaderText="UnitsonOrder" >
<ItemStyle Width="150px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField ItemStyle-Width="150px" DataField="DiscountAvailable" HeaderText="DiscountAvailable" >
<ItemStyle Width="150px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField ItemStyle-Width="150px" DataField="Ranking" HeaderText="Ranking" >
<ItemStyle Width="150px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>

            </Columns>

<HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>

<RowStyle BackColor="#A1DCF2"></RowStyle>
        </asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
        <a href="homepage.aspx"><< Back to Home</a><br>
   </div>
             
</asp:Content>
