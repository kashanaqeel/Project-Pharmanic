﻿using System;
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
    public partial class WebForm10 : System.Web.UI.Page
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

                string customid = Session["customerid"].ToString();
                int customerid = int.Parse(customid);

                SqlCommand cmd = new SqlCommand("frequent_products", con);
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
                    FrequentProducts.DataSource = DT;
                    FrequentProducts.DataBind();
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No Item Found in Frequently Bought Products.');", true);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }
}