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