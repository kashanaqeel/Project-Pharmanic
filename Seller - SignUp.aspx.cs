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
    public partial class WebForm7 : System.Web.UI.Page
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

                string cmpyname = CN.Text, sellername = SN.Text, sellertitle = ST.Text, sellercnic = SC.Text, passw = Pass.Text, phone1 = PN.Text, Cpass = CPass.Text, mail = EA.Text, country = Co.Text, city = Ci.Text, state = Stat.Text;
                int pcode = int.Parse(Pc.Text);

                SqlCommand cmd = new SqlCommand("addcompany", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CompanyName", SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@SellerCNIC", SqlDbType.NVarChar, 15);
                cmd.Parameters.Add("@SellerName", SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@SellerTitle", SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@City", SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@State_", SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@PostalCode", SqlDbType.NVarChar, 20);
                cmd.Parameters.Add("@Country", SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@PhoneNumber", SqlDbType.NVarChar, 13);
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@CompanyRating", SqlDbType.Float);
                cmd.Parameters.Add("@CurrentOrders", SqlDbType.Int);
                cmd.Parameters.Add("@PaymentMethods", SqlDbType.Int);
                cmd.Parameters.Add("@Password_", SqlDbType.NVarChar, 20);
                cmd.Parameters.Add("@check", SqlDbType.Int).Direction = ParameterDirection.Output;


                cmd.Parameters["@CompanyName"].Value = CN.Text;
                cmd.Parameters["@SellerCNIC"].Value = SC.Text;
                cmd.Parameters["@SellerName"].Value = SN.Text;
                cmd.Parameters["@SellerTitle"].Value = ST.Text;
                cmd.Parameters["@City"].Value = Ci.Text;
                cmd.Parameters["@State_"].Value = Stat.Text;
                cmd.Parameters["@PostalCode"].Value = pcode;
                cmd.Parameters["@Country"].Value = Co.Text;
                cmd.Parameters["@PhoneNumber"].Value = PN.Text;
                cmd.Parameters["@Email"].Value = EA.Text;
                cmd.Parameters["@CompanyRating"].Value = 0;
                cmd.Parameters["@CurrentOrders"].Value = 0;
                cmd.Parameters["@PaymentMethods"].Value = 1;
                cmd.Parameters["@Password_"].Value = Pass.Text;
                cmd.ExecuteNonQuery();

                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Inserted.');", true);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }
}