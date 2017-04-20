using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace CITAPPdb.Account
{
    public partial class ClientList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ListBox1.Visible = false;
            ListBox2.Visible = false;
        }


        protected void CreateUser_Click(object sender, EventArgs e)
        {
            string user = "";
            if (FirstName.Text != "")
            {
                user = FirstName.Text;
                ListBox1.Visible = false;
                ListBox2.Visible = true;
                ListBox2.Items.Clear();
                for (int i = 0; i < ListBox1.Items.Count - 1; i++)
                {
                    if (ListBox1.Items[i].ToString().Contains(user))
                    {
                        ListBox2.Items.Add(ListBox1.Items[i]);
                    }
                }
                if (ListBox2.Items.Count == 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Tu Doctor No existe o no tiene clientes activos');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Ingresa tu usuario como doctor');", true);

            }
            

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ListBox2.Visible = false;
            ListBox1.Visible = true;
        }
    }


}