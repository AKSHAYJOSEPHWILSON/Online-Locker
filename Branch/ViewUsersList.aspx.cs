using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Branch_ViewUsersList : System.Web.UI.Page
{
    DataManipulation dm = new DataManipulation();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string str = "select * from UserRegistration_tb where BranchId='" + Session["Id"] + "'";
            DataSet ds = dm.For_Adapter(str);
            if (ds.Tables[0].Rows.Count > 0)
            {
                DataList1.DataSource = ds.Tables[0];
                DataList1.DataBind();
                lblmsg.Text = "";
            }
            else
            {
                lblmsg.Text = "No Users list Found";
            }
        }
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            Response.Redirect("~/Branch/UserDetails.aspx?UserId=" + e.CommandArgument.ToString());
        }
    }
}