using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class User_SendLockerOperationRequest : System.Web.UI.Page
{
    DataManipulation dm=new DataManipulation();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string AllocationId = Request.QueryString["AllocationId"];

             string strs = "select * from LockerAllocation_tb where AllocationId='" + AllocationId + "'";
                    DataSet dss = dm.For_Adapter(strs);
                    if (dss.Tables[0].Rows.Count > 0)
                    {
                        lblallocationId.Text = dss.Tables[0].Rows[0][0].ToString();
                        lbllockerId.Text = dss.Tables[0].Rows[0][1].ToString();
                        lbluserId.Text = dss.Tables[0].Rows[0][2].ToString();
                        lbldate.Text = dss.Tables[0].Rows[0][3].ToString();
                        lblstatus.Text=dss.Tables[0].Rows[0][4].ToString();
                        string str = "select Type from UserRegistration_tb where UserId='" + lbluserId.Text + "'";
                        string type = dm.For_Scalar(str);
                        if (type == "Join Account")
                        {
                            ViewState["Type"] = "Join";
                            string joinId = dm.For_Scalar("select JointAcId from JoinAccount_tb where UserId='" + lbluserId.Text + "'");
                            ViewState["JointId"] = joinId;
                            string sql = "select UserRegistration_tb.* from UserRegistration_tb inner join JoinAccount_tb on UserRegistration_tb.UserId=JoinAccount_tb.UserId where JoinAccount_tb.JointAcId='" + joinId + "'";
                            DataSet ds = dm.For_Adapter(sql);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                DataList1.DataSource = ds.Tables[0];
                                DataList1.DataBind();
                            }
                            Panel1.Visible = true;

                        }
                        else
                        {
                            Panel1.Visible = false;
                        }
                    }
        }

    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "verify")
        {
            Button btn = (Button)e.Item.FindControl("btnverify");
            TextBox txtusername = (TextBox)e.Item.FindControl("txtusername");
            TextBox txtpassword = (TextBox)e.Item.FindControl("txtpassword");
            Label lblUser = (Label)e.Item.FindControl("lblUserId");

            string st = "select * from UserRegistration_tb where Username='" + txtusername.Text + "' and Password='" + txtpassword.Text + "' and UserId='" + lblUser.Text + "'";
            DataSet ds = dm.For_Adapter(st);
            if (ds.Tables[0].Rows.Count > 0)
            {
                btn.Enabled = false;
                btn.Text = "Verified";
                btn.CssClass = "btn btn-warning";
            }
            else
            {
                Response.Write("<script language='javascript'>alert('Invalid Username or Password')</script>");

            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (ViewState["Type"]!=null)
        {
            int count = 0;
            foreach (DataListItem it in DataList1.Items)
            {
                Button btn = (Button)it.FindControl("btnverify");
                if (btn.Text == "Verified")
                {
                    count++;
                }
            }
            if (count == DataList1.Items.Count)
            {

                string Id = dm.Gen_Id("select Max(CRequestId) from CancelRequest_tb", "CNL");
                string str = "insert into CancelRequest_tb values('" + Id + "','" + lbluserId.Text + "','" + lbllockerId.Text + "','" + DateTime.Now.ToShortDateString() + "','" + txtremark.Text + "','Cancel')";
                int r = dm.For_Execute(str);
                if (r > 0)
                {
                    Response.Write("<script language='javascript'>alert('Request Sent Successfully...')</script>");

                }
            }
            else
            {
                Response.Write("<script language='javascript'>alert('Please Verify User')</script>");
            }
        }
        else
        {
            string Id = dm.Gen_Id("select Max(CRequestId) from CancelRequest_tb", "CNL");
            string str = "insert into CancelRequest_tb values('" + Id + "','" + lbluserId.Text + "','" + lbllockerId.Text + "','" + DateTime.Now.ToShortDateString() + "','" + txtremark.Text + "','Cancel')";
            int r = dm.For_Execute(str);
            if (r > 0)
            {
                Response.Write("<script language='javascript'>alert('Request Sent Successfully...')</script>");

            }
        }
    }
}