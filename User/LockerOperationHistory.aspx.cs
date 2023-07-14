using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

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
                            string sql1 = "select UserRegistration_tb.* from UserRegistration_tb inner join JoinAccount_tb on UserRegistration_tb.UserId=JoinAccount_tb.UserId where JoinAccount_tb.JointAcId='" + joinId + "'";
                            DataSet ds11 = dm.For_Adapter(sql1);
                            if (ds11.Tables[0].Rows.Count > 0)
                            {
                                pnl1.Visible = true;
                                dl.DataSource = ds11.Tables[0];
                                dl.DataBind();
                            }
                            DataList dld = (DataList)it.FindControl("DataList3");
                            Label lblms = (Label)it.FindControl("lblmessage");

                            string streq = "select * from OperationRequst_tb where UserId='" + dsq.Tables[0].Rows[i][0].ToString() + "'";
                            DataSet dseq = dm.For_Adapter(streq);
                            for (int j = 0; j < dseq.Tables[0].Rows.Count; j++)
                            {
                                DateTime dt = DateTime.ParseExact(dseq.Tables[0].Rows[j][3].ToString(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                                if (dt.Date < DateTime.Now.Date)
                                {
                                    string qwe = "Update OperationRequst_tb set Status='Operated' where OpRequestId='" + dseq.Tables[0].Rows[j][0].ToString() + "'";
                                    int r = dm.For_Execute(qwe);
                                }
                            }

                            string stre = "select * from OperationRequst_tb where UserId='" + dsq.Tables[0].Rows[i][0].ToString() + "' and Status='Operated'";
                            DataSet dse = dm.For_Adapter(stre);
                            if (dse.Tables[0].Rows.Count > 0)
                            {
                                dld.DataSource = dse.Tables[0];
                                dld.DataBind();
                                lblms.Text = "";
                            }
                            else
                            {
                                lblms.Text = "No Operation History Found";
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
                    lblmsg.Text = "";

                    foreach (DataListItem it in DataList1.Items)
                    {
                        DataList dl = (DataList)it.FindControl("DataList3");
                        Label lblms = (Label)it.FindControl("lblmessage");

                        string streq = "select * from OperationRequst_tb where UserId='" + Session["Id"].ToString() + "'";
                        DataSet dseq = dm.For_Adapter(streq);
                        for (int i = 0; i < dseq.Tables[0].Rows.Count; i++)
                        {
                            DateTime dt = DateTime.ParseExact(dseq.Tables[0].Rows[i][3].ToString(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                            if (dt.Date < DateTime.Now.Date)
                            {
                                string qwe = "Update OperationRequst_tb set Status='Operated' where OpRequestId='" + dseq.Tables[0].Rows[i][0].ToString() + "'";
                                int r = dm.For_Execute(qwe);
                            }

                        }
                        string stre = "select * from OperationRequst_tb where UserId='" + Session["Id"].ToString() + "' and Status='Operated'";
                        DataSet dse = dm.For_Adapter(stre);
                        if (dse.Tables[0].Rows.Count > 0)
                        {
                            dl.DataSource = dse.Tables[0];
                            dl.DataBind();
                            lblms.Text = "";
                        }
                        else
                        {
                            lblms.Text = "No operation History";
                        }
                    }

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

    }
}