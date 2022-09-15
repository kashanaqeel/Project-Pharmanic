<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Frequently Bought Products.aspx.cs" Inherits="WebApplication1.WebForm10" %>
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
                           <h4>Frequently Bought Products</h4>
                           </center>
                     </div>
                        <hr>

        <asp:GridView ID="FrequentProducts" runat="server" AutoGenerateColumns="False" RowStyle-BackColor="#A1DCF2"
            HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" HorizontalAlign="Center" >
            <Columns>
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
                      
            <a href="homepage.aspx"><< Back to Home</a><br><br>
</asp:Content>
