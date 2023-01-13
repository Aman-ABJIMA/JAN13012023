using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ADO.net_WEB
{
    public partial class WebForm1 : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {
           
                SqlConnection connect = new SqlConnection("data source=.;Database=MYDATABASE;Integrated Security=SSPI");
                SqlCommand command = new SqlCommand("SELECT *FROM EMPLOYEE", connect);
                connect.Open();
            try
            { 
                SqlDataReader reader = command.ExecuteReader();
                GridView1.DataSource = reader;
                GridView1.DataBind();
            }
            catch { Console.WriteLine("Somthing Went Wrong"); }
            finally
            {
              connect.Close();
            }
        }
    }
}