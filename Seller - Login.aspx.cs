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
    public partial class WebForm6 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("login_company", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CompanyID", SqlDbType.Int);
                cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 20);
                cmd.Parameters.Add("@check", SqlDbType.Int).Direction=ParameterDirection.Output;

                cmd.Parameters["@CompanyID"].Value = companyid.Text;
                cmd.Parameters["@Password"].Value = Pass.Text;
                cmd.ExecuteNonQuery();
                int Found = Convert.ToInt32(cmd.Parameters["@check"].Value);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Successful login');</script>");
                        Session["sellerid"] = dr.GetValue(0).ToString();
                        Session["sellername"] = dr.GetValue(3).ToString();
                        Session["role"] = "seller";
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

            }
        }
    }
}