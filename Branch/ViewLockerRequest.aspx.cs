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
            string str = "select LockerRequest_tb.* from LockerRequest_tb inner join UserRegistration_tb on LockerRequest_tb.UserId=UserRegistration_tb.UserId where UserRegistration_tb.BranchId='" + Session["Id"] + "'and LockerRequest_tb.Status='Pending'";
            DataSet ds = dm.For_Adapter(str);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
                lblmsg.Text = "";
            }
            else
            {
                lblmsg.Text = "No Pending Request Found";
            }

        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblrequestid.Text = GridView1.SelectedRow.Cells[0].Text;
        lbldate.Text = GridView1.SelectedRow.Cells[2].Text;
        lblremark.Text = GridView1.SelectedRow.Cells[3].Text;
        Panel1.Visible = true;
        lbluserId.Text = GridView1.SelectedRow.Cells[1].Text;
        lbldateallocation.Text = DateTime.Now.ToShortDateString();

        string NoLock = dm.For_Scalar("select NoOfLockers from Branch_tb where BranchId='" + Session["Id"] + "'");

        for (int i = 1001; i <= (1000 + Convert.ToInt32(NoLock)); i++)
        {
            ddlLockerId.Items.Add("LOC" + i);
        }

        string ress = "select LockerId from LockerAllocation_tb where Status='Active' and UserId in (select UserId from UserRegistration_tb where BranchId='" + Session["Id"] + "')";
        DataSet dsRes = dm.For_Adapter(ress);
        for (int s = 0; s < dsRes.Tables[0].Rows.Count;s++ )
        {
            for (int j = 0; j < ddlLockerId.Items.Count; j++)
            {
                if (dsRes.Tables[0].Rows[s][0].ToString() == ddlLockerId.Items[j].Text)
                {
                    ddlLockerId.Items.RemoveAt(j);
                }
            }
        }

        ddlLockerId.Items.Insert(0, "---SELECT---");
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        string str = "Update LockerRequest_tb set Status='Approved' where RequestId='" + lblrequestid.Text + "'";
        int r = dm.For_Execute(str);
        if (r > 0)
        {
            string AllocationId = dm.Gen_Id("select max(AllocationId) from LockerAllocation_tb", "ALO");
            string sql = "insert into LockerAllocation_tb values('" + AllocationId + "','" + ddlLockerId.SelectedItem.Text + "','" + lbluserId.Text + "','" + lbldateallocation.Text + "','Active')";
            int r1 = dm.For_Execute(sql);
            if (r1 > 0)
            {
                Response.Write("<script language='javascript'>alert('Locker Request Approved Successfully...')</script>");
                Server.Transfer("~/Branch/ViewLockerRequest.aspx");
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string str = "Update LockerRequest_tb set Status='Rejected' where RequestId='" + lblrequestid.Text + "'";
        int r = dm.For_Execute(str);
        if (r > 0)
        {
            Response.Write("<script language='javascript'>alert('Locker Request Rejected Successfully...')</script>");
            Server.Transfer("~/Branch/ViewLockerRequest.aspx");
       
        }
    }
}