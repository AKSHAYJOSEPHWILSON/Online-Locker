using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

public partial class User_ViewRentDetails : System.Web.UI.Page
{
    DataManipulation dm = new DataManipulation();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind(Request.QueryString["UserId"]);

        }

    }
    public void Bind(string UserId)
    {

        string type = dm.For_Scalar("select Type from UserRegistration_tb where UserId='" + UserId + "'");
        if (type == "Join Account")
        {
            string joinId = dm.For_Scalar("select JointAcId from JoinAccount_tb where UserId='" + UserId + "'");
            string Sql = "select UserId from JoinAccount_tb where JointAcId='" + joinId + "'";
            DataSet dssq = dm.For_Adapter(Sql);
            for (int i = 0; i < dssq.Tables[0].Rows.Count; i++)
            {


                string sql = "select * from AdditionalCharge_tb where UserId='" + dssq.Tables[0].Rows[i][0].ToString() + "'";
                DataSet dsq = dm.For_Adapter(sql);
                if (dsq.Tables[0].Rows.Count > 0)
                {
                    GridView1.DataSource = dsq;
                    GridView1.DataBind();
                    lblmsg.Text = "";
                }
                else
                {
                    lblmsg.Text = "No Records Found";
                }
                if (GridView1.Rows.Count > 0)
                {
                    lblmsg.Visible = false;
                }
                else
                {
                    lblmsg.Visible = true;
                }
            }

        }
        else
        {
            string sql = "select * from AdditionalCharge_tb where UserId='" + UserId + "'";
            DataSet dsq = dm.For_Adapter(sql);
            if (dsq.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = dsq;
                GridView1.DataBind();
                lblmsg.Text = "";
            }
            else
            {
                lblmsg.Text = "No Records Found";
            }
        }
    }
}