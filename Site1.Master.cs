using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    LinkButton9.Visible = true; // display products link button
                    LinkButton8.Visible = false; // edit profile link button

                    LinkButton5.Visible = false; // edit seller profile button
                    LinkButton12.Visible = false; // frequently bought products link button


                    LinkButton4.Visible = false; // shopping cart link button
                    LinkButton1.Visible = true; // customer login link button
                    LinkButton2.Visible = true; // customer signup link button
                    LinkButton3.Visible = false; // logout link button
                    LinkButton7.Visible = false; // hello user link button
                    LinkButton6.Visible = true; // seller signup link button
                    LinkButton11.Visible = true; // seller login link button
                    LinkButton10.Visible = false; // add / remove product link button
                    LinkButton13.Visible = false; // place order button
                }
                else if (Session["role"].Equals("user"))
                {
                    LinkButton9.Visible = true; // display products link button
                    LinkButton8.Visible = true; // edit profile link button

                    LinkButton5.Visible = false; // edit seller profile button
                    LinkButton12.Visible = true; // frequently bought products link button


                    LinkButton4.Visible = true; // shopping cart link button
                    LinkButton1.Visible = false; // customer login link button
                    LinkButton2.Visible = false; // customer signup link button
                    LinkButton3.Visible = true; // logout link button
                    LinkButton7.Visible = true; // hello user link button
                    LinkButton7.Text = "Hello "+ Session["customername"].ToString(); // hello user link button
                    LinkButton6.Visible = false; // seller signup link button
                    LinkButton11.Visible = false; // seller login link button
                    LinkButton10.Visible = false; // add / remove product link button
                    LinkButton13.Visible = true; // place order button
                }
                else if (Session["role"].Equals("seller"))
                {
                    LinkButton9.Visible = true; // display products link button
                    LinkButton8.Visible = false; // edit profile link button

                    LinkButton5.Visible = true; // edit seller profile button
                    LinkButton12.Visible = false; // frequently bought products link button


                    LinkButton4.Visible = false; // shopping cart link button
                    LinkButton1.Visible = false; // customer login link button
                    LinkButton2.Visible = false; // customer signup link button
                    LinkButton3.Visible = true; // logout link button
                    LinkButton7.Visible = true; // hello user link button
                    LinkButton7.Text = "Hello " + Session["sellername"].ToString(); // hello user link button
                    LinkButton6.Visible = false; // seller signup link button
                    LinkButton11.Visible = false; // seller login link button
                    LinkButton10.Visible = true; // add / remove product link button
                    LinkButton13.Visible = false; // place order button
                }
            }
            catch (Exception ex)
            {

            }
        }
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Seller - SignUp.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("Seller - Login.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add - Remove Product.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["sellerid"] = "";
            Session["sellername"] = "";
            Session["customerid"] = "";
            Session["customername"] = "";
            Session["role"] = "";

            LinkButton9.Visible = true; // display products link button
            LinkButton8.Visible = false; // edit profile link button

            LinkButton5.Visible = false; // edit seller profile button
            LinkButton12.Visible = false; // frequently bought products link button


            LinkButton4.Visible = false; // shopping cart link button
            LinkButton1.Visible = true; // customer login link button
            LinkButton2.Visible = true; // customer signup link button
            LinkButton3.Visible = false; // logout link button
            LinkButton7.Visible = false; // hello user link button
            LinkButton6.Visible = true; // seller signup link button
            LinkButton11.Visible = true; // seller login link button
            LinkButton10.Visible = false; // add / remove product link button

            Response.Redirect("homepage.aspx");
        }
    }
}