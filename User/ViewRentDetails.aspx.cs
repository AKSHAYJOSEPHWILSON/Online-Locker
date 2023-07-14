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

             string type = dm.For_Scalar("select Type from UserRegistration_tb where UserId='" + Session["Id"].ToString() + "'");
             if (type == "Join Account")
             {
                 string joinId = dm.For_Scalar("select JointAcId from JoinAccount_tb where UserId='" + Session["Id"].ToString() + "'");
                 string Sql = "select UserId from JoinAccount_tb where JointAcId='" + joinId + "'";
                 DataSet dssq = dm.For_Adapter(Sql);
                 for (int j = 0; j < dssq.Tables[0].Rows.Count; j++)
                 {

                     Operations(dssq.Tables[0].Rows[j][0].ToString());
                     Bind(dssq.Tables[0].Rows[j][0].ToString());

                 }
             }
             else
             {
                 Operations(Session["Id"].ToString());
                 Bind(Session["Id"].ToString());
                
 
             }


        }

    }
    public void Operations(string UserId)
    {
        string str = "select * from LockerAllocation_tb where UserId='" + UserId + "'";
        DataSet ds = dm.For_Adapter(str);
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            string LockerId = ds.Tables[0].Rows[i][1].ToString();
            string date = ds.Tables[0].Rows[i][3].ToString();

            //DateTime dtd = DateTime.ParseExact(date, "dd/MM/yyyy", CultureInfo.InvariantCulture);

            string todate = Convert.ToDateTime(date).AddYears(1).ToString("dd/MM/yyyy");

            string sql = "select * from Rent_tb where LockerId='" + LockerId + "' and PeriodFrom='" + Convert.ToDateTime(date).ToString("dd/MM/yyyy") + "' and PeriodTo='" + todate + "'";
            DataSet dsq = dm.For_Adapter(sql);
            if (dsq.Tables[0].Rows.Count > 0)
            {
                string maxprd = dm.For_Scalar("select max(PeriodTo) from Rent_tb where LockerId='" + LockerId + "'");

                DateTime dt = DateTime.ParseExact(maxprd, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                if (dt.Date < DateTime.Now.Date)
                {

                    string status = dm.For_Scalar("select Status from LockerAllocation_tb where LockerId='" + LockerId + "'");
                    if (status == "Active")
                    {
                        string RId = dm.Gen_Id("select max(RentId) from Rent_tb", "REN");
                        string ins = "insert into Rent_tb values('" + RId + "','" + UserId + "','" + LockerId + "','" + dm.For_Scalar("select YearlyRent from RentAmount_tb") + "','" + todate + "','" + dt.Date.AddDays(1).ToString("dd/MM/yyyy") + "','" + dt.Date.AddYears(1).ToString("dd/MM/yyyy") + "')";
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
                string RId = dm.Gen_Id("select max(RentId) from Rent_tb", "REN");
                string ins = "insert into Rent_tb values('" + RId + "','" + UserId + "','" + LockerId + "','" + dm.For_Scalar("select YearlyRent from RentAmount_tb") + "','" + DateTime.Now.ToShortDateString() + "','" + Convert.ToDateTime(date).ToString("dd/MM/yyyy") + "','" + todate + "')";
                int r = dm.For_Execute(ins);
                if (r > 0)
                {

                }
            }
        }
    }
    public void Bind(string UserId)
    {
        string sql = "select * from Rent_tb where UserId='" + UserId + "'";
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