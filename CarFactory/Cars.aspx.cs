using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace CarFactory
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CarFactoryConnectionString"].ConnectionString);
                string com = "Select * from Manufacturers";
                SqlDataAdapter adpt = new SqlDataAdapter(com, con);
                DataTable dt = new DataTable();
                adpt.Fill(dt);
                DropDownList1.DataSource = dt;
                DropDownList1.DataBind();
                DropDownList1.DataTextField = "Mf_Name";
                DropDownList1.DataValueField = "MfID";
                DropDownList1.DataBind();
            }

        }

        protected void ButtonAddCar_Click(object sender, EventArgs e)
        {
            string CName = TextCarName.Text;
            string YrRelease = TextYrRelease.Text;
            int mID = Convert.ToInt32(DropDownList1.SelectedValue);

      
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CarFactoryConnectionString"].ConnectionString);
            myConnection.Open();

            string query = "Insert into [dbo].[Cars] (Car_Name,Year_of_release,MfID) Values (@Car_Name,@Year_of_release,@MfID)";

            SqlCommand insertCommand = new SqlCommand(query, myConnection);
            insertCommand.Parameters.AddWithValue("@Car_Name", CName);
            insertCommand.Parameters.AddWithValue("@Year_of_release", YrRelease);
            insertCommand.Parameters.AddWithValue("@MfID", mID);
            insertCommand.ExecuteNonQuery();
            myConnection.Close();
            Response.Redirect(Request.RawUrl);

        }
    }
}