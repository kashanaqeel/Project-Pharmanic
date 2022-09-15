<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="WebApplication1.DisplayProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      
     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         }
         );
     </script>

</asp:Content>
   
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
      <div class="row">
         <div class="col">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Product Inventory List</h4>
                        </center>
                     </div>
                  </div
                      >
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                  <div class="row">'
                      <asp:SqlDataSource ID= "SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PharmanicConnectionString %>" SelectCommand="SELECT [ProductID], [ProductName], [ProductDescription], [UnitPrice], [DiscountAvailable], [Ranking], [UnitsinStock], [CompanyID] FROM [Products]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
                      <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="ProductID" HeaderText="ID" ReadOnly="True" SortExpression="ProductID" >

                                <ItemStyle Font-Bold="True" Font-Overline="False" />
                                </asp:BoundField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                         <div class="container-fluid">
                                            <div class="row">
                                                 <div class="col-lg-10">
                                                     <div class="row">
                                                         <div class="col-12">
                                                             <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductName") %>' Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label>
                                                             </div>
                                                     </div>
                                                     <div class="row">
                                                         <div class="col-12" style="font-weight: lighter">
                                                             CompanyId: <asp:Label ID="Label2" runat="server" Text='<%# Eval("CompanyID") %>' Font-Bold="True" Font-Size="Medium"></asp:Label>
                                                             &nbsp;| ProductRank: &nbsp;
                                                             <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("Ranking") %>'></asp:Label>
                                                             &nbsp;|
                                                          </div>
                                                     </div>
                                                     <div class="row">
                                                         <div class="col-12" style="font-weight: lighter">
                                                             DiscountAvalaibility: <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("DiscountAvailable") %>'></asp:Label>
                                                             &nbsp;| InStock: <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("UnitsinStock") %>'></asp:Label>
                                                             &nbsp;| Price: <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("UnitPrice") %>'></asp:Label>
                                                          </div>
                                                     </div>

                                                       <div class="row">
                                                         <div class="col-12" style="font-weight: lighter">
                                                            Description: <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("ProductDescription") %>'></asp:Label>
                                                            </div>
                                                     </div>
                                                 </div>
                                                <div class="col-lg-2">                                            
                                                 </div>

                                             </div>
                                         </div>
                                    </ItemTemplate>
                                    <ItemStyle Font-Bold="True" />
                                </asp:TemplateField>
                                  </Columns>
                         </asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
        
    
   
</asp:Content>
