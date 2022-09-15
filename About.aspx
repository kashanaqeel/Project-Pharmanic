<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication1.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <section>
      <img src="imgs/pharmanic-bg.jpg" width="2000" class="img-fluid"/>
   </section>
<section>
<%--           <img width="150px" height="400px" src="imgs/b1.png"/>--%>
     <center>
               <div class="container">
                  <h2>About Us</h2>
          <br/><br/>
            <div class="col-md-4">
              <center>
         <img width="150px" src="imgs/mission.png"/>
          
                  <p><b>Our Mission:</b></p>
                  <p class="text-justify">Pharmanic's mission is to develop, produce and market safe, effective and quality medicines and healthcare products that will improve the health and quality of life of men, women and children.</p>
           </div>
                    </center>
                    
                     <center>
                         <div class="col-md-4">
                 <img width="100px" src="imgs/gp.png"/>
                  <p><b>Our Guiding Principle:</b></p>
                  <p class="text-justify">The principle of our approach to responsibility is based on the fact that our future success depends on our ability to enable healthier and happier lives all over the world. One way of doing it is to facilitate easy access of patients to safe and effective drugs as well as a commitment to being socially responsible in the way that we operate across the value chain.</p>    
                 <br/><br/>
                             </center>           
       </center>
    </div>
    </section>
    </asp:Content>
<%-- HAve to FIx:
   ==increase gap on left side for centre allignment
    ==increase gap with top and bottom bars
    --%>