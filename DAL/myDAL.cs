using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1.DAL
{
    public class myDAL
    {
        private static readonly string connString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
    }
}