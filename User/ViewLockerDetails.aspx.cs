using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class User_ViewLockerDetails : System.Web.UI.Page
{
    DataManipulation dm = new DataManipulation();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string type = dm.For_Scalar("select Type from UserRegistration_tb where UserId='" + Session["Id"].ToString() + "'");
            if (type == "Join Account")
            {
                string joinId = dm.For_Scalar("select JointAcId from JoinAccount_tb where UserId='" + Session["Id"].ToString() + "'");
                string Sql = "select UserId from JoinAccount_tb where JointAcId='" + joinId + "'";
                DataSet dsq = dm.For_Adapter(Sql);
                for (int i = 0; i < dsq.Tables[0].Rows.Count; i++)
                {
                    string str = "select * from LockerAllocation_tb where UserId='" + dsq.Tables[0].Rows[i][0].ToString() + "'";
                    DataSet ds = dm.For_Adapter(str);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        DataList1.DataSource = ds.Tables[0];
                        DataList1.DataBind();
                        lblmsg.Visible = false;
                        foreach (DataListItem it in DataList1.Items)
                        {
                            DataList dl = (DataList)it.FindControl("DataList2");
                            Panel pnl1 = (Panel)it.FindControl("Panel1");
                            Label lblstatus = (Label)it.FindControl("lblstatus");
                            LinkButton lbsend = (LinkButton)it.FindControl("LinkButton1");
                            if (lblstatus.Text == "Canceled")
                            {
                                lbsend.Enabled = false;
                            }
                            else
                            {
                                lbsend.Enabled = true;
                            }
                            string sql1 = "select UserRegistration_tb.* from UserRegistration_tb inner join JoinAccount_tb on UserRegistration_tb.UserId=JoinAccount_tb.UserId where JoinAccount_tb.JointAcId='" + joinId + "'";
                            DataSet ds11 = dm.For_Adapter(sql1);
                            if (ds11.Tables[0].Rows.Count > 0)
                            {
                                pnl1.Visible = true;
                                dl.DataSource = ds11.Tables[0];
                                dl.DataBind();
                            }
                        }
                        lblmsg.Text = "";
                    }
                    else
                    {
                        lblmsg.Text = "No Locker Details Found";
                    }


                }
            }
            else
            {
                string str = "select * from LockerAllocation_tb where UserId='" + Session["Id"].ToString() + "'";
                DataSet ds = dm.For_Adapter(str);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    DataList1.DataSource = ds.Tables[0];
                    DataList1.DataBind();

                    foreach (DataListItem it in DataList1.Items)
                    {
                        Label lblstatus = (Label)it.FindControl("lblstatus");
                        LinkButton lbsend = (LinkButton)it.FindControl("LinkButton1");
                        if (lblstatus.Text == "Canceled")
                        {
                            lbsend.Enabled = false;
                        }
                        else
                        {
                            lbsend.Enabled = true;
                        }

                    }

                    lblmsg.Text = "";
                }
                else
                {
                    lblmsg.Text = "No Locker Details Found";
                }
            }
        }
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "send")
        {
            Response.Redirect("~/User/SendLockerOperationRequest.aspx?AllocationId=" + e.CommandArgument.ToString());
        }
        if (e.CommandName == "CancelRequest")
        {
            Response.Redirect("~/User/LockerCancelRequest.aspx?AllocationId=" +e.CommandArgument.ToString());
        }
    }
}