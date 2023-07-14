using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Branch_ViewLockerRequest : System.Web.UI.Page
{
    DataManipulation dm = new DataManipulation();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string str = "select OperationRequst_tb.* from OperationRequst_tb inner join UserRegistration_tb on OperationRequst_tb.UserId=UserRegistration_tb.UserId where UserRegistration_tb.BranchId='" + Session["Id"] + "'and OperationRequst_tb.Status='Approved' order by OperationRequst_tb.Date asc ";
            DataSet ds = dm.For_Adapter(str);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
                lblmsg.Text = "";
            }
            else
            {
                lblmsg.Text = "No Scheduled Operation Found";
            }

        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblrequestid.Text = GridView1.SelectedRow.Cells[0].Text;
        lbluserId.Text = GridView1.SelectedRow.Cells[1].Text;
lbllockerId.Text = GridView1.SelectedRow.Cells[2].Text;

        lbldate.Text = GridView1.SelectedRow.Cells[3].Text;
        lbltime.Text = GridView1.SelectedRow.Cells[4].Text;

        
        Panel1.Visible = true;
       
        string qry = "select JointAcId from JoinAccount_tb where UserId='" + GridView1.SelectedRow.Cells[1].Text + "'";
        DataSet dsq = dm.For_Adapter(qry);
        if (dsq.Tables[0].Rows.Count>0)
        {

            string sql = "select UserRegistration_tb.* from UserRegistration_tb inner join JoinAccount_tb on UserRegistration_tb.UserId=JoinAccount_tb.UserId where JoinAccount_tb.JointAcId='" + dsq.Tables[0].Rows[0][0].ToString() + "'";
            DataSet ds = dm.For_Adapter(sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                DataList1.DataSource = ds.Tables[0];
                DataList1.DataBind();
            }

        }
        else
        {
            string str = "select * from UserRegistration_tb where UserId='" + GridView1.SelectedRow.Cells[1].Text + "'";
            DataSet ds = dm.For_Adapter(str);
            if (ds.Tables[0].Rows.Count > 0)
            {
                DataList1.DataSource = ds.Tables[0];
                DataList1.DataBind();
            }
        }

    }
   
}