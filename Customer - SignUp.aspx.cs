using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class WebForm8 : System.Web.UI.Page
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
                string cnic1 = cnic.Text, cname = name.Text, passw = Pass.Text, phone1 = Phone.Text, Cpass = ConfirmPass.Text, mail = email.Text, country = ddlCountry.Text, city = TextBox4.Text, state = TextBox9.Text, addres = address.Text;
                int postalcode = int.Parse(code.Text), age1 = int.Parse(age.Text);
                string gender=null;
                int isdoc=0;
                if(CheckBox1.Checked)
                {
                    isdoc = 1;
                }
                if(RadioButton1.Checked)
                {
                    gender = "M";
                }
                else if(RadioButton2.Checked)
                {
                    gender = "F";
                }

                SqlCommand cmd = new SqlCommand("addcustomer",con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CustomerCNIC", SqlDbType.NVarChar, 15);
                cmd.Parameters.Add("@CustomerName", SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@Age", SqlDbType.Int);
                cmd.Parameters.Add("@Gender", SqlDbType.Char);
                cmd.Parameters.Add("@CustomerAddress",SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@City", SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@State_",SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@PostalCode", SqlDbType.NVarChar, 20);
                cmd.Parameters.Add("@Country",SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@Phone", SqlDbType.NVarChar, 13);
                cmd.Parameters.Add("@isDoctor", SqlDbType.Int);
                cmd.Parameters.Add("@Password_",SqlDbType.NVarChar, 20);
                cmd.Parameters.Add("@Email",SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@check", SqlDbType.Int).Direction = ParameterDirection.Output;
                
                
                cmd.Parameters["@CustomerCNIC"].Value = cnic.Text;
                cmd.Parameters["@CustomerName"].Value = name.Text;
                cmd.Parameters["@Password_"].Value = Pass.Text;
                cmd.Parameters["@Phone"].Value = Phone.Text;
                cmd.Parameters["@Email"].Value = email.Text;
                cmd.Parameters["@Country"].Value = ddlCountry.Text;
                cmd.Parameters["@City"].Value = TextBox4.Text;
                cmd.Parameters["@State_"].Value = TextBox9.Text;
                cmd.Parameters["@CustomerAddress"].Value = address.Text;
                cmd.Parameters["@Gender"].Value = gender;
                cmd.Parameters["@isDoctor"].Value = isdoc;
                cmd.Parameters["@PostalCode"].Value = postalcode;
                cmd.Parameters["@Age"].Value = age1;
                cmd.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Inserted.');", true);          
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void cnic_TextChanged(object sender, EventArgs e)
        {

        }
    }
}