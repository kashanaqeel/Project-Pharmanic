<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="WebApplication1.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
      <img src="imgs/pharmanic-bg.jpg" width="2000" class="img-fluid"/>
   </section>
<section>
      <div class="container">
         <div class="row">
            <div class="col-12">
               <center>
                  <h2>Our Features</h2>
                  <p><b>Our 3 Primary Features -</b></p>
               </center>
            </div>
         </div>
         <div class="row">
            <div class="col-md-4">
               <center>
                  <img width="150px" src="imgs/pharmacy.png"/>
                  <h4>Digital Pharmacy System</h4>
                  <p class="text-justify">You will have an experience of a Pharmacy while being at home!</center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" src="imgs/search-online.png"/>
                  <h4>Search Products</h4>
                  <p class="text-justify">From Medicines to Apparatus, everything is just one search away!</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" src="imgs/doctor.png"/>
                  <h4>Discount For Doctors</h4>
                  <p class="text-justify">Kudos to you if you are a doctor. We have a special discount for you.</p>
               </center>
            </div>
         </div>
      </div>
   </section>
   <section>
      <img src="imgs/banner.png" class="img-fluid"/>
   </section>
</asp:Content>
