using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;
using System.Net;

public partial class Common_Login : System.Web.UI.Page
{
    DataManipulation dm = new DataManipulation();
    protected void Page_Load(object sender, EventArgs e)
    {
  
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string str="select * from UserRegistration_tb where Username='"+txtusername.Text+"' and Password='"+txtpassword.Text+"'";
        DataSet ds=dm.For_Adapter(str);
        if(ds.Tables[0].Rows.Count>0)
        {
            if (ds.Tables[0].Rows[0][17].ToString() == "Approved")
            {
                Session["Id"] = ds.Tables[0].Rows[0][0].ToString();
                Response.Redirect("~/User/UserProfile.aspx");
            }
            else
            {


                lblmsg.Text = "You are waiting for Approval";
            }
        }
        else
        {
            string str1 = "select * from Branch_tb where Username='" + txtusername.Text + "' and Password='" + txtpassword.Text + "'";
            DataSet ds1 = dm.For_Adapter(str1);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                Session["Id"] = ds1.Tables[0].Rows[0][0].ToString();
                Response.Redirect("~/Branch/ApproveUsers.aspx");
            }
            else
            {
                string str12 = "select * from Admin_tb where Username='" + txtusername.Text + "' and Password='" + txtpassword.Text + "'";
                DataSet ds12 = dm.For_Adapter(str12);
                if (ds12.Tables[0].Rows.Count > 0)
                {
                    Session["Id"] = ds12.Tables[0].Rows[0][0].ToString();
                    Response.Redirect("~/Administrator/ManageBranchDetails.aspx");
                }
                else
                {
                    lblmsg.Text = "Invalid Username or Password";
                }
            }
        }


    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Common/ForgotPassword.aspx");
    }
   
}