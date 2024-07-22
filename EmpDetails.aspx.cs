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
    public partial class EmpDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowGrid();
                //txtempid.Focus();
                ViewState.Add("foundflag", false);
            }
        }
        public void ShowGrid()
        {
            DAL d = new DAL();
            DataTable dt = d.GetTable("select * from employeemaster");
            grddata.DataSource = dt;
            grddata.DataBind();
        }
        protected void grddata_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onclick", "ShowRecords(this);");
                e.Row.Style.Add("cursor:pointer;cursor:hand", "");
                e.Row.Attributes.Add("onmouseover", "SetColors(this, 'Yellow');");
                e.Row.Attributes.Add("onmouseout", "SetColors(this, 'White');");
            }
        }
        protected void txtempid_TextChanged(object sender, EventArgs e)
        {
            DAL d = new DAL();
            SqlDataReader rdr = d.GetReader("select * from employeemaster where empid =" + common.cInt(txtempid.Text));

            if (rdr != null && rdr.HasRows)
            {
                //hdnfndflag.Value = "true";
                ViewState["foundflag"] = true;
                rdr.Read();
                txtempname.Text = rdr["empname"].ToString();
                cmbdesignation.Text = rdr["designation"].ToString();
                txtgrossal.Text = rdr["grossal"].ToString();
                txtdeducts.Text = rdr["deducts"].ToString();
                txtnetsal.Text = rdr["netsal"].ToString();
                if (rdr["isactive"].ToString() == "Y")
                    chkisactive.Checked = true;
                else
                    chkisactive.Checked = false;
            }
            else
            {
                //hdnfndflag.Value = "false";
                ViewState["foundflag"] = false;
                txtempname.Text = "";
                cmbdesignation.SelectedIndex = 0;
                txtgrossal.Text = "";
                txtdeducts.Text = "";
                txtnetsal.Text = "";
                chkisactive.Checked = false;
            }
            txtempid.Focus();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            DAL d = new DAL();
            d.ClearParameters();
            d.AddParameters("empid", common.cInt(txtempid.Text).ToString());
            d.AddParameters("empname", txtempname.Text);
            d.AddParameters("designation", cmbdesignation.Text);
            d.AddParameters("grossal", txtgrossal.Text);
            d.AddParameters("deducts", txtdeducts.Text);
            d.AddParameters("netsal", txtnetsal.Text);
            d.AddParameters("isactive", chkisactive.Checked ? "Y" : "N");
            d.isProcall = true;
            if ((bool)ViewState["foundflag"])
            {
                d.AddParameters("action", "update");
            }
            else
            {
                d.AddParameters("action", "insert");
            }
            int res = d.ExecuteQuery("pr_empmaster");
            if (res > 0)
            {
                Response.Write("Record inserted successfully");
            }
            ShowGrid();
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            DAL d = new DAL();
            d.ClearParameters();
            d.AddParameters("empid", common.cInt(txtempid.Text).ToString());
            d.isProcall = true;
            d.AddParameters("action", "delete");
            int res = d.ExecuteQuery("pr_empmaster");

            if (res > 0)
            {
                Response.Write("Record deleted successfully");
            }

            ShowGrid();
        }
    }
}