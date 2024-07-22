using EmployeeManagment.App_Start;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeManagment
{
    public partial class LoginMaster : System.Web.UI.MasterPage
    {
        private string connectionString = "Data Source=DESKTOP-9IHNQBT;Initial Catalog=dbsept;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Clear any previous error messages
                lblMessage.Text = "";
            }
        }

        protected void lbtnsignin_Click(object sender, EventArgs e)
        {
            string username = txtusername.Text.Trim();
            string password = txtpassword.Text.Trim();

            if (ValidateUser(username, password))
            {
                // Redirect to main page upon successful login
                Response.Redirect("Welcome.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid username or password. Please try again.";
            }
        }
        private bool ValidateUser(string username, string password)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Query to check if the provided username and password exist in the database
                string query = "SELECT COUNT(*) FROM Login WHERE username = @username AND password = @password";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to prevent SQL injection
                    command.Parameters.AddWithValue("@username", username);
                    command.Parameters.AddWithValue("@password", password);

                    try
                    {
                        connection.Open();
                        int count = (int)command.ExecuteScalar();

                        // If count is greater than 0, it means the user exists
                        return count > 0;
                    }
                    catch (Exception ex)
                    {
                        // Log or handle any exceptions here
                        lblMessage.Text = "An error occurred while authenticating. Please try again later.";
                        return false;
                    }
                }
            }
        }

        protected void lbtnsignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}