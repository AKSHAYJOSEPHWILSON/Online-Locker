using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Branch_ChangePassword : System.Web.UI.Page
{
    DataManipulation dm = new DataManipulation();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string str = "select * from UserRegistration_tb where UserId='" + Session["Id"].ToString() + "' and Password='" + txtoldpassword.Text + "'";
        DataSet ds = dm.For_Adapter(str);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblmsg.Text = "";
            string sql = "update UserRegistration_tb set Password='" + txtnewpassword.Text + "' where UserId='" + Session["Id"].ToString() + "'";
            int r = dm.For_Execute(sql);
            if (r > 0)
            {
                Response.Write("<script language='javascript'>alert('Password Update Successfully...')</script>");
            }

        }
        else
        {
            lblmsg.Text = "Old Password Doestn't Match";
        }
    }
}