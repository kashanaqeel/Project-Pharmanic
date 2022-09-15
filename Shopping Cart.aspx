<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Shopping Cart.aspx.cs" Inherits="WebApplication1.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container-fluid">
            <div class="card">
               <div class="card-body">
                        <center>
                           <img width="200px" src="imgs/cart.png"/>
                        </center>
                     </div>
                  </div>
                     <div class="col">
                        <center>
                           <h4>Your Shopping Cart</h4>
                           </center>
                     </div>
                        <hr>
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
            </Columns>

<HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>

<RowStyle BackColor="#A1DCF2"></RowStyle>
        </asp:GridView>
                     </div>
                      
            <a href="homepage.aspx"><< Back to Home</a><br><br>
</asp:Content>
