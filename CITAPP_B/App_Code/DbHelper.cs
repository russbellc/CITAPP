using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DbHelper
/// </summary>
public class DbHelper
{
    public DbHelper()
    { }
    
        public static DataTable ExecuteDataTable(string sproc) {
        DataSet ds = new DataSet();
        using (SqlConnection con = new SqlConnection("Data Source=BRTZ-DESKTOP\\SQLEXPRESS;Initial Catalog=CITAPPdb;Integrated Security=True"))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = sproc;
                cmd.Parameters.Clear();
                cmd.Connection = con;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds, "Table");
                }
                return ds.Tables["Table"];
            }
        }
    }

    public static object ExecuteDataTableParams(string v, string searchId)
    {
        throw new NotImplementedException();
    }
}
