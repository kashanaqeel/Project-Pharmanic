using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Order_Click(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string customid = Session["customerid"].ToString();
                int customerid = int.Parse(customid);
                string prodid = TextBox10.Text;
                int productid = int.Parse(prodid);
                string Quantit = TextBox1.Text;
                int Quantity = int.Parse(Quantit);

                SqlCommand cmd = new SqlCommand("PLaceOrder", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ProductId", SqlDbType.Int);
                cmd.Parameters.Add("@CustomerId", SqlDbType.Int);
                cmd.Parameters.Add("@PaymentId", SqlDbType.Int);
                cmd.Parameters.Add("@ShipperId", SqlDbType.Int);
                cmd.Parameters.Add("@isCompleted", SqlDbType.Int);
                cmd.Parameters.Add("@Quantity", SqlDbType.Int);
                cmd.Parameters.Add("@check", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.Parameters["@ProductId"].Value = productid;
                cmd.Parameters["@CustomerId"].Value = customerid;
                cmd.Parameters["@PaymentId"].Value = 1;
                cmd.Parameters["@ShipperId"].Value = 1;
                cmd.Parameters["@isCompleted"].Value = 0;
                cmd.Parameters["@Quantity"].Value = Quantity;
                cmd.ExecuteNonQuery();

                con.Close();
                int success = Convert.ToInt32(cmd.Parameters["@check"].Value);

                if (success == 1)
                {
                    int isDoc= int.Parse(Session["isDoctor"].ToString());
                    if(isDoc==1)
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Kudos to you for being a Doctor. You are getting a 5% discount on checkout.');", true);
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Product Out of Stock.');", true);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
            Response.Redirect("Checkout.aspx");
        }
    }
}