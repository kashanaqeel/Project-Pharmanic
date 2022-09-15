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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string sellid = Session["sellerid"].ToString();
                int sellerid = int.Parse(sellid);

                SqlCommand cmd = new SqlCommand("productsList", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CompanyID", SqlDbType.Int);
                cmd.Parameters.Add("@check", SqlDbType.Int).Direction = ParameterDirection.Output;


                cmd.Parameters["@CompanyID"].Value = sellerid;
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
                    ProductsList.DataSource = DT;
                    ProductsList.DataBind();
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No Product Found.');", true);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
           
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                float unitpr = int.Parse(TextBox5.Text);
                int catid = int.Parse(TextBox4.Text),instock= int.Parse(TextBox6.Text), discount = int.Parse(TextBox8.Text);
                //int rank = int.Parse(TextBox9.Text);
                string scomid = Session["sellerid"].ToString();
                int comid = int.Parse(scomid);

                SqlCommand cmd = new SqlCommand("addProduct", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@ProductName",SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@ProductDescription", SqlDbType.NVarChar, 250);
                cmd.Parameters.Add("@CompanyID", SqlDbType.Int);
                cmd.Parameters.Add("@CategoryID", SqlDbType.Int);
                cmd.Parameters.Add("@UnitPrice", SqlDbType.Float);
                cmd.Parameters.Add("@UnitsinStock", SqlDbType.Int);
                cmd.Parameters.Add("@UnitsOnOrder", SqlDbType.Int);
                cmd.Parameters.Add("@DiscountAvailable", SqlDbType.Int);
                cmd.Parameters.Add("@Ranking", SqlDbType.Int);
                cmd.Parameters.Add("@check", SqlDbType.Int).Direction = ParameterDirection.Output;


                cmd.Parameters["@ProductName"].Value = TextBox1.Text;
                cmd.Parameters["@ProductDescription"].Value = TextBox3.Text;
                cmd.Parameters["@CompanyID"].Value = comid;
                cmd.Parameters["@CategoryID"].Value = catid;
                cmd.Parameters["@UnitPrice"].Value = unitpr;
                cmd.Parameters["@UnitsinStock"].Value = instock;
                cmd.Parameters["@UnitsOnOrder"].Value = 0;
                cmd.Parameters["@DiscountAvailable"].Value = discount;
                cmd.Parameters["@Ranking"].Value = 1;

                cmd.ExecuteNonQuery();
                con.Close();

                int success = Convert.ToInt32(cmd.Parameters["@check"].Value);
                if (success == 1)
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Product Added Successfully.');", true);
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Insertion Failed.');", true);
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void ButtonRemove_Click(object sender, EventArgs e)
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

                string prodid = TextBox10.Text;
                int producid = int.Parse(prodid);

                SqlCommand cmd = new SqlCommand("deleteProduct", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@productID", SqlDbType.Int);
                cmd.Parameters.Add("@companyID", SqlDbType.Int);
                cmd.Parameters.Add("@check", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.Parameters["@productID"].Value = producid;
                cmd.Parameters["@companyID"].Value = comid;
                cmd.ExecuteNonQuery();
                con.Close();
                int success = Convert.ToInt32(cmd.Parameters["@check"].Value);
                if (success == 1)
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Product Removed Successfully.');", true);
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Operation Failed.');", true);
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}