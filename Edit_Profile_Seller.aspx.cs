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
    public partial class WebForm3 : System.Web.UI.Page
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
                string scomid = Session["sellerid"].ToString();
                int comid = int.Parse(scomid);
                TextBox8.Text = scomid;

                string comname = TextBox1.Text;

                string oldpass = TextBox9.Text, newpass = TextBox10.Text;
                SqlCommand cmd = new SqlCommand("editCompanyDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@companyID", SqlDbType.Int);
                cmd.Parameters.Add("@newPassword", SqlDbType.NVarChar, 20);
                cmd.Parameters.Add("@oldPassword", SqlDbType.NVarChar, 20);
                cmd.Parameters.Add("@check", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.Parameters["@companyID"].Value = comid;
                cmd.Parameters["@newPassword"].Value = newpass;
                cmd.Parameters["@oldPassword"].Value = oldpass;

                cmd.ExecuteNonQuery();
                con.Close();
                int success = Convert.ToInt32(cmd.Parameters["@check"].Value);
                if(success==1)
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Password Updated Successfully.');", true);
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid Credentials.');", true);
            }
            catch
            {
            }
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add - Remove Product.aspx");
        }
    }
}