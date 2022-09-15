<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="WebApplication1.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px"  src="imgs/checkout.png" />
                                          
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
                                <center>
                                        <h4>Customer Details</h4>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-5">
                               
                                <asp:Label ID="Label1" Font-Bold="true" runat="server" Text="CustomerName: "></asp:Label>
                                <div class="form-group">
                                     <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
                                  </div>
                            </div>
                           
                        </div>
                        <div class="row">
                            <div class="col-md-5">
                              
                                 <asp:Label ID="Label2" Font-Bold="true" runat="server" Text="City/Region: "></asp:Label>
                                 <div class="form-group">
                                     <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" ></asp:TextBox>
                                  </div>    
                                
                            </div>                           
                        </div>

                        <div class="row">
                            <div class="col-md-5">
                                <asp:Label ID="Label3" Font-Bold="true" runat="server" Text="Country: "></asp:Label>
                                 <div class="form-group">
                                     <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server"></asp:TextBox>
                                  </div>      
                                
                            </div>                           
                        </div>

                         <div class="row">
                            <div class="col">
                                
                                  <asp:Label ID="Label4" Font-Bold="true" runat="server" Text="Shipping Address: "></asp:Label>
                                      <div class="form-group">
                                     <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server"></asp:TextBox>
                                  </div>              
                            </div>                           
                        </div>
                  
                </div>
                <a href="homepage.aspx"><< Back to Home</a><br>
                <br>
                 </div>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Your Order Detail</h4>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                           <asp:GridView ID="Cart" runat="server" AutoGenerateColumns="False" RowStyle-BackColor="#A1DCF2"
            HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" HorizontalAlign="Center" >
            <Columns>
                <asp:BoundField ItemStyle-Width="150px" DataField="ProductName" HeaderText="ProductName">
<ItemStyle Width="150px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField ItemStyle-Width="150px" DataField="ProductDescription" HeaderText="ProductDescription">
<ItemStyle Width="150px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField ItemStyle-Width="150px" DataField="UnitPrice" HeaderText="UnitPrice" >
<ItemStyle Width="150px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField ItemStyle-Width="150px" DataField="Quantity" HeaderText="Quantity" >
<ItemStyle Width="150px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField ItemStyle-Width="150px" DataField="Ranking" HeaderText="Ranking" >
<ItemStyle Width="150px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
            </Columns>

<HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>

<RowStyle BackColor="#A1DCF2"></RowStyle>
        </asp:GridView>

      <%-- --------------------------------------------%>
      <asp:GridView ID="Total" runat="server" AutoGenerateColumns="False" RowStyle-BackColor="#A1DCF2"
            HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" HorizontalAlign="Center" >
            <Columns>
                <asp:BoundField ItemStyle-Width="150px" DataField="Total" HeaderText="Total">
<ItemStyle Width="150px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                 <asp:BoundField ItemStyle-Width="150px" DataField="DiscountTotal" HeaderText="Discounted Total">
<ItemStyle Width="150px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
            </Columns>

<HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>

<RowStyle BackColor="#A1DCF2"></RowStyle>
        </asp:GridView>
                     </div>
                      
          

                      
                          <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                               <centre>
                                   <h4>Payment Method</h4>
                               </centre>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">                                                               
                               <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
                                <label class="form-check-label" for="flexRadioDefault2">
                                    Cash on delivery
                                </label>
                                    </div>                      
                        
                                </div>
                        </div>

                   

                     

                          <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                           <div class="row">
                               <div class="col">
                                <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="CheckOut" OnClick="Button1_Click"/>                     
                               </div>
                           </div>

                    </div>
                </div>
            </div>
        </div>
  

</asp:Content>
