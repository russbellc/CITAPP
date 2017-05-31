using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for GraphsCreation
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class GraphsCreation : System.Web.Services.WebService
{
    public class DoctorEntity
    {
        public string Name { get; set; }
        public int Value { get; set; }
    }
    [WebMethod]
    public List<DoctorEntity> DoctorAppointments()
    {
        List<DoctorEntity> DoctorAppts = new List<DoctorEntity>();
        DataSet ds = new DataSet();
        using (SqlConnection con = new SqlConnection("Data Source=BRTZ-DESKTOP\\SQLEXPRESS;Initial Catalog=CITAPPdb;Integrated Security=True"))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT DoctorUsuarioId, COUNT(*)  FROM CitasDisponibles a " +
                                "INNER JOIN Cita b ON a.IdCitaDisp = b.CitasDispobiblesIdCitaDisp " +
                                "WHERE a.StatusCita = 'Disponible' GROUP BY a.DoctorUsuarioId";
                cmd.Connection = con;
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds, "DoctorAppointments");

                }
                foreach (DataRow dr in ds.Tables["DoctorAppointments"].Rows)
                {
                    DoctorAppts.Add(new DoctorEntity
                    {
                        Name = dr["name"].ToString(),
                        Value = Convert.ToInt32(dr["value"])
                    });
                }
            }
            return DoctorAppts;
        }   
            
            
        
    }
 

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

}
