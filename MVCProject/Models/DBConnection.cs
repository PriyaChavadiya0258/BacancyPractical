using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MVCProject.Models
{
    public class DBConnection
    {
        public static string conString = Convert.ToString(ConfigurationManager.ConnectionStrings["ConnString"]);

        public SqlConnection cn = new SqlConnection(conString);
        SqlCommand cmd = null;
        SqlDataAdapter ad = null;

        public static string DBConnectionString
        {
            get
            {
                return conString;
            }
            set
            {
                DBConnectionString = value;
            }
        }
        public bool InsertData(SqlCommand cmd)
        {
            try
            {
                if (cn.State == ConnectionState.Open)
                {
                    cn.Close();
                }

                using (cn = new SqlConnection(conString))
                {
                    cmd.Connection = cn;
                    cn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                ErrorHandle.WriteError(ex);
                return false;
            }
            finally
            { }
            return true;
        }
        public DataTable GetDataTable(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            try
            {
                using (cn = new SqlConnection(conString))
                {
                    cn.Open();
                    cmd.Connection = cn;
                    cmd.CommandTimeout = 300;
                    ad = new SqlDataAdapter(cmd);
                    ad.Fill(dt);
                }

                return dt;
            }
            catch (Exception ex)
            {
                ErrorHandle.WriteError(ex);
                return null;
            }
        }

    }
}