using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace CarFactory
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            string MName = TextManfName.Text;
            string MLocation = TextLocation.Text;

            SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CarFactoryConnectionString"].ConnectionString);
            myConnection.Open();

            string query = "Insert into [dbo].[Manufacturers] (Mf_Name,Mf_Location) Values (@Mf_Name,@Mf_Location)";

            SqlCommand insertCommand = new SqlCommand(query, myConnection);
            insertCommand.Parameters.AddWithValue("@Mf_Name", MName);
            insertCommand.Parameters.AddWithValue("@Mf_Location", MLocation);
            insertCommand.ExecuteNonQuery();
            myConnection.Close();

            Response.Redirect(Request.RawUrl);
        }
    }
}