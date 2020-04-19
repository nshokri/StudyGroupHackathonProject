using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace UStudyGroup
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Server=tcp:doomed.database.windows.net,1433;Initial Catalog=StudyGroups;Persist Security Info=False;User ID=nshokri;Password=Doomeddogs123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            SqlCommand getStates = new SqlCommand("Select StateName From dbo.States;", con);

            con.Open();
            SqlDataReader reader = getStates.ExecuteReader();
            while (reader.Read())
            {
                DropDownList1.Items.Add(reader.GetString(reader.GetOrdinal("StateName")));
            }
            con.Close();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button1.Text = "It changed";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}