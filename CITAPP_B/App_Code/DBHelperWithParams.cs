using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBHelperWithParams
/// </summary>
public class DBHelperWithParams
{
    public DBHelperWithParams()
    {
    }

    public static DataTable ExecuteDataTableParams(string sproc, object param)
    {
        DataSet ds = new DataSet();
        using (SqlConnection con = new SqlConnection("Data Source=BRTZ-DESKTOP\\SQLEXPRESS;Initial Catalog=CITAPPdb;Integrated Security=True"))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = sproc;
                cmd.Parameters.Clear();
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@UserId", param);

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds, "Table");
                }
                return ds.Tables["Table"];
            }
        }
    }
}