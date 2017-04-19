using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CITAPPdb.Account
{
    public partial class Appointments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ApptDate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void CalendarAppt_SelectionChanged(object sender, EventArgs e)
        {
            ApptDate.Text = CalendarAppt.SelectedDate.ToString();
        }
    }
}