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
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Text = (string)Session["customername"];
            TextBox2.Text = (string)Session["City"];
            TextBox3.Text = (string)Session["Country"];
            TextBox4.Text = (string)Session["Address"];
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

                SqlCommand cmd = new SqlCommand("viewcart", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CustomerID", SqlDbType.Int);
                cmd.Parameters.Add("@check", SqlDbType.Int).Direction = ParameterDirection.Output;


                cmd.Parameters["@CustomerID"].Value = customerid;
                cmd.ExecuteNonQuery();

                con.Close();
                int success = Convert.ToInt32(cmd.Parameters["@check"].Value);

                if (success == 1)
                {
                    DataSet ds = new DataSet();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds);
                    }
                    DataTable DT = new DataTable();
                    DT = ds.Tables[0];
                    Cart.DataSource = DT;
                    Cart.DataBind();

                    DataTable DT2 = new DataTable();
                    DT2 = ds.Tables[1];
                    Total.DataSource = DT2;
                    Total.DataBind();
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No Item Found In Cart.');", true);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
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


                SqlCommand cmd = new SqlCommand("OrderIsCompleted", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CustomerID", SqlDbType.Int);

                cmd.Parameters["@CustomerID"].Value = customerid;

                cmd.ExecuteNonQuery();
                con.Close();
                int isDoc = int.Parse(Session["isDoctor"].ToString());
                if (isDoc == 1)
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Order Placed Successfully...Kudos to you for being a Doctor. Enjoy the 5% discounted rate!');", true);
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Order Placed Successfully.');", true);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }
}