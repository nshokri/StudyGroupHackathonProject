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
            string current = DropDownList1.SelectedValue;
            DropDownList1.Items.Clear();

            SqlConnection con = new SqlConnection("Server=tcp:doomed.database.windows.net,1433;Initial Catalog=StudyGroups;Persist Security Info=False;User ID=nshokri;Password=Doomeddogs123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            SqlCommand getStates = new SqlCommand("Select StateName From dbo.States;", con);

            con.Open();

            SqlDataReader reader = getStates.ExecuteReader();

            while (reader.Read())
            {
                DropDownList1.Items.Add(reader.GetString(reader.GetOrdinal("StateName")));
            }
            con.Close();

            DropDownList1.SelectedValue = current;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Server=tcp:doomed.database.windows.net,1433;Initial Catalog=StudyGroups;Persist Security Info=False;User ID=nshokri;Password=Doomeddogs123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            SqlCommand getSchools = new SqlCommand($"Select SchoolName From dbo.Schools Where StateID = (Select StateID From dbo.States Where StateName = '{DropDownList1.Text}')", con);

            con.Open();

            SqlDataReader reader = getSchools.ExecuteReader();

            while (reader.Read())
            {
                DropDownList2.Items.Add(reader.GetString(reader.GetOrdinal("SchoolName")));
            }

            con.Close();

            DropDownList2.Visible = true;
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Server=tcp:doomed.database.windows.net,1433;Initial Catalog=StudyGroups;Persist Security Info=False;User ID=nshokri;Password=Doomeddogs123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            SqlCommand getCourses = new SqlCommand($"Select CourseCode From dbo.Courses Where SchoolID = (Select SchoolID From dbo.Schools Where SchoolName = '{DropDownList2.Text}')", con);

            con.Open();

            SqlDataReader reader = getCourses.ExecuteReader();

            while (reader.Read())
            {
                DropDownList3.Items.Add(reader.GetString(reader.GetOrdinal("CourseCode")));
            }

            con.Close();

            DropDownList3.Visible = true;
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Visible = true;
            TextBox1.Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {                   //State,            School,             Course
            string[] info = {DropDownList1.Text, DropDownList2.Text, DropDownList3.Text};

            SqlConnection con = new SqlConnection("Server=tcp:doomed.database.windows.net,1433;Initial Catalog=StudyGroups;Persist Security Info=False;User ID=nshokri;Password=Doomeddogs123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            SqlCommand findGroups = new SqlCommand($"Select GroupID From Groups Where GroupCurrent < GroupMax And CourseID =" +
                                                    $"(Select CourseID From Courses Where CourseCode = '{info[2]}');", con);

            con.Open();

            SqlDataReader reader = findGroups.ExecuteReader();

            if (!reader.HasRows) //no group found
            {
                Button1.Text = "No groups were found Create New Group Instead";
                Button2.Visible = true;
            } else //there is a group
            {
                reader.Read();
                SqlCommand joinGroup = new SqlCommand("Execute dbo.JoinGroup @GroupID, @MemberName, @MemberEmail, @MemberPhone", con);
                joinGroup.Parameters.AddWithValue("@GroupID", reader.GetInt32(reader.GetOrdinal("GroupID")));
                joinGroup.Parameters.AddWithValue("@MemberName", TextBox1.Text);
                joinGroup.Parameters.AddWithValue("@MemberEmail", TextBox2.Text);
                joinGroup.Parameters.AddWithValue("@MemberPhone", TextBox3.Text);
                reader.Close();
                joinGroup.ExecuteNonQuery();
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                Button1.Text = "You've Joined a group!";
            }
            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Server=tcp:doomed.database.windows.net,1433;Initial Catalog=StudyGroups;Persist Security Info=False;User ID=nshokri;Password=Doomeddogs123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            SqlCommand makeGroups = new SqlCommand("Execute dbo.CreateNewGroup " +
                  "@GroupMax, @CourseCode, @MemberName, @MemberPhone, @MemberEmail", con);
            makeGroups.Parameters.AddWithValue("@GroupMax", TextBox4.Text);
            makeGroups.Parameters.AddWithValue("@CourseCode", DropDownList3.Text);
            makeGroups.Parameters.AddWithValue("@MemberName", TextBox1.Text);
            makeGroups.Parameters.AddWithValue("@MemberPhone", TextBox3.Text);
            makeGroups.Parameters.AddWithValue("@MemberEmail", TextBox2.Text);
            con.Open();
                makeGroups.ExecuteNonQuery();
            con.Close();

            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            Button1.Text = "You've created and joined a new group!";
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            Label2.Visible = true;
            TextBox2.Visible = true;
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            Label3.Visible = true;
            TextBox3.Visible = true;
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            Label4.Visible = true;
            TextBox4.Visible = true;
        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {
            Button1.Visible = true;
        }
    }
}