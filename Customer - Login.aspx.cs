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
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                SqlCommand cmd = new SqlCommand("login_customer", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CustomerCnic", SqlDbType.NVarChar, 15);
                cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 20);
                cmd.Parameters.Add("@check", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.Parameters["@CustomerCnic"].Value = cnic.Text;
                cmd.Parameters["@Password"].Value = Pass.Text;
                cmd.ExecuteNonQuery();
                int Found = Convert.ToInt32(cmd.Parameters["@check"].Value);
                SqlDataReader dr = cmd.ExecuteReader();
                // this checks if there are some rows with that id is in the database
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {   // session variable 
                        Response.Write("<script>alert('Successful login');</script>");
                        Session["customerid"] = dr.GetValue(0).ToString();
                        Session["customername"] = dr.GetValue(2).ToString();
                        Session["Country"] = dr.GetValue(9).ToString();
                        Session["City"] = dr.GetValue(6).ToString();
                        Session["Address"] = dr.GetValue(5).ToString();
                        Session["isDoctor"] = dr.GetValue(11).ToString();
                        Session["role"] = "user";
                    }
                    Response.Redirect("homepage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}