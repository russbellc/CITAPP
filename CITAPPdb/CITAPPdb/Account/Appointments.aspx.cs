using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CITAPPdb.Account
{
    public partial class Appointments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ListBox1.Visible = false;
            ListBox2.Visible = false;
        }

        protected void ApptDate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void CalendarAppt_SelectionChanged(object sender, EventArgs e)
        {
            ApptDate.Text = this.CalendarAppt.SelectedDate.ToShortDateString();

        }

        protected void BookButton_Click(object sender, EventArgs e)
        {
            string username = (WindowsIdentity.GetCurrent().Name).ToString();
            string server = "";
            int index = username.LastIndexOf("\\");
            if (index > 0)
            {
                server = username.Substring(0, index + 1) + "SQLEXPRESS";
            }

            string ConString = "Data Source=" + server + ";User ID=" + username + "; Integrated Security = SSPI; Trusted_Connection=Yes; ";
            
            string SQLCommand =
            "USING [CITAPP] DECLARE @ApptId INT DECLARE @PatientId INT DECLARE @SelDate DATETIME " +
            "SET @ApptId = (SELECT COUNT(id) FROM Citas )+ 1; " +
            "SET @PatientId = (SELECT id FROM Clientes WHERE first_name + ' ' +  last_name = '" + TextBox1.Text + "'); " +
            "SET @SelDate = '" + ApptDate.Text.ToString() + "'; " +
            "INSERT INTO Citas VALUES (@ApptId,'', @PatientId, @SelDate)"; ;


            if (ApptDate != null && !string.IsNullOrWhiteSpace(ApptDate.Text))
            {
                try
                {

                    using (SqlConnection cnn = new SqlConnection(ConString))
                    {
                        using (SqlCommand cmd = new SqlCommand(SQLCommand, cnn))
                        {
                            

                            cnn.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }

                    /*
                    using (var con = new SqlConnection(ConString))
                    {
                        con.Open();
                        var command = con.CreateCommand();
                        command.CommandText = SQLCommand;
                        command.ExecuteNonQuery();
                        using (SqlDataReader read = command.ExecuteReader())
                        {
                            idBox.Text = read.ToString();
                            read.Close();
                        }

                    }*/
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Your appointment was not booked correctly. Try again." + "');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "You need to pick a date first. Try again." + "');", true);
            }

        }

        protected void ListBoxPatients_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox1.Text = ListBoxPatients.SelectedValue.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ListBox1.Visible = true;
            ListBox2.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ListBox1.Visible = false;
            ListBox2.Visible = true;
        }
    }
}