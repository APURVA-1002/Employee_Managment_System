using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeManagment
{
    public partial class Resister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtnresister_Click(object sender, EventArgs e)
        {
            // Get the values entered by the user
            string username = txtusername.Text;
            string password = txtpassword.Text;

            // Connection string to your database
            string connectionString = "Data Source=DESKTOP-9IHNQBT;Initial Catalog=dbsept;Integrated Security=True";

            // SQL query to insert data into Login table
            string query = "INSERT INTO Login (username, Password) VALUES (@username, @Password)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the command
                    command.Parameters.AddWithValue("@username", username);
                    command.Parameters.AddWithValue("@password", password);

                    try
                    {
                        // Open the connection
                        connection.Open();

                        // Execute the command
                        command.ExecuteNonQuery();

                        // Optional: You can redirect the user to a different page after successful registration
                        Response.Redirect("Login.aspx");
                    }
                    catch (Exception ex)
                    {
                        // Handle exceptions, if any
                        Response.Write("Error: " + ex.Message);
                    }
                }
            }
        }
    }
}