using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

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



                        string todate = Convert.ToDateTime(lbldate.Text).AddYears(1).ToString("dd/MM/yyyy");

                        string sql = "select * from AdditionalCharge_tb where LockerId='" + lbllockerId.Text + "' and PeriodFrom='" + Convert.ToDateTime(lbldate.Text).ToString("dd/MM/yyyy") + "' and PeriodTo='" + todate + "'";
                        DataSet dsq = dm.For_Adapter(sql);
                        if (dsq.Tables[0].Rows.Count > 0)
                        {

                            string maxprd = dm.For_Scalar("select max(PeriodTo) from AdditionalCharge_tb where LockerId='" + lbllockerId.Text + "'");


                            string minprd = dm.For_Scalar("select max(PeriodFrom) from AdditionalCharge_tb where LockerId='" + lbllockerId.Text + "'");


                            ViewState["ChargeId"] = dm.For_Scalar("select max(ChargeId) from AdditionalCharge_tb where LockerId='" + lbllockerId.Text + "'");

                            string query = "select * from OperationRequst_tb where (UserId='" + lbluserId.Text + "' and LockerId='" + lbllockerId.Text + "') and (Status='Approved' or Status='Operated')";
                           // string query = "select * from OperationRequst_tb where Date between '" + minprd + "' and '" + maxprd + "'";
                            DataSet dsquery = dm.For_Adapter(query);
                            int count = 0;

                            DateTime dtmin = DateTime.ParseExact(minprd, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                            DateTime dtmax = DateTime.ParseExact(maxprd, "dd/MM/yyyy", CultureInfo.InvariantCulture);


                            for (int i = 0; i < dsquery.Tables[0].Rows.Count; i++)
                            {
                                DateTime dtdata = DateTime.ParseExact(dsquery.Tables[0].Rows[i][3].ToString(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                                if ((dtdata.Date > dtmin.Date) && (dtdata.Date < dtmax.Date))
                                {
                                    count++;
                                }
                            }
                                if (count >= 12)
                                {

                                    string charge = dm.For_Scalar("select AdditionalCharge from RentAmount_tb");
                                    lblcharge.Text = "Additional charges may apply...  Rs. " + charge + "/-";
                                }
                                else
                                {
                                    lblcharge.Text = "";
                                }
                      

                            DateTime dt = DateTime.ParseExact(maxprd, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                            if (dt.Date < DateTime.Now.Date)
                            {

                                string status = dm.For_Scalar("select Status from LockerAllocation_tb where LockerId='" + lbllockerId.Text + "'");
                                if (status == "Active")
                                {
                                    string RId = dm.Gen_Id("select max(ChargeId) from AdditionalCharge_tb", "ADC");
                                    string ins = "insert into AdditionalCharge_tb values('" + RId + "','" + Session["Id"].ToString() + "','" + lbllockerId.Text + "','0','"+DateTime.Now.ToShortDateString()+"','" + dt.Date.AddDays(1).ToString("dd/MM/yyyy") + "','" + dt.Date.AddYears(1).ToString("dd/MM/yyyy") + "')";
                                    int r = dm.For_Execute(ins);
                                    if (r > 0)
                                    {

                                    }
                                }
                                else
                                {

                                }

                            }


                        }
                        else
                        {
                            string RId = dm.Gen_Id("select max(ChargeId) from AdditionalCharge_tb", "ADC");
                            string ins = "insert into AdditionalCharge_tb values('" + RId + "','" + Session["Id"].ToString() + "','" + lbllockerId.Text + "','0','" + DateTime.Now.ToShortDateString() + "','" + Convert.ToDateTime(lbldate.Text).ToString("dd/MM/yyyy") + "','" + todate + "')";
                            int r = dm.For_Execute(ins);
                            if (r > 0)
                            {

                            }
                        }




                        string str = "select Type from UserRegistration_tb where UserId='" + lbluserId.Text + "'";
                        string type = dm.For_Scalar(str);
                        if (type == "Join Account")
                        {
                            ViewState["Type"] = "Join";
                            string joinId = dm.For_Scalar("select JointAcId from JoinAccount_tb where UserId='" + lbluserId.Text + "'");
                            ViewState["JointId"] = joinId;
                            string sqls = "select UserRegistration_tb.* from UserRegistration_tb inner join JoinAccount_tb on UserRegistration_tb.UserId=JoinAccount_tb.UserId where JoinAccount_tb.JointAcId='" + joinId + "'";
                            DataSet ds = dm.For_Adapter(sqls);
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

                string Id = dm.Gen_Id("select Max(OpRequestId) from OperationRequst_tb", "OPR");
                string str = "insert into OperationRequst_tb values('" + Id + "','" + lbluserId.Text + "','" + lbllockerId.Text + "','" + txtdate.Text + "','"+txttime.Text+"','Pending')";
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
            string Id = dm.Gen_Id("select Max(OpRequestId) from OperationRequst_tb", "OPR");
            string str = "insert into OperationRequst_tb values('" + Id + "','" + lbluserId.Text + "','" + lbllockerId.Text + "','" + txtdate.Text + "','" + txttime.Text + "','Pending')";
            int r = dm.For_Execute(str);
            if (r > 0)
            {
                Response.Write("<script language='javascript'>alert('Request Sent Successfully...')</script>");

            }
        }
        if(lblcharge.Text!="")
        {

        string chargeup=dm.For_Scalar("select Charge from AdditionalCharge_tb where ChargeId='"+ ViewState["ChargeId"]+"'");
        int newCharge=Convert.ToInt32(chargeup)+Convert.ToInt32(dm.For_Scalar("select AdditionalCharge from RentAmount_tb"));
        string qryy="Update AdditionalCharge_tb set Charge='"+newCharge.ToString()+"' where ChargeId='"+ ViewState["ChargeId"]+"'";
        int up=dm.For_Execute(qryy);
        if(up>0)
        {

        }
        }
       




    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}