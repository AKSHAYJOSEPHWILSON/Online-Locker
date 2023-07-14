using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;

public partial class Common_ForgotPassword : System.Web.UI.Page
{
    DataManipulation dm = new DataManipulation();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.SetActiveView(View1);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        string str = "select * from UserRegistration_tb where Username ='" + txtusername.Text + "'";
        DataSet ds = dm.For_Adapter(str);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["username"] = txtusername.Text;
            MultiView1.SetActiveView(View2);
        }
        else
        {
            lblmsg.Text = "Invalid Username";
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string str = "select * from UserRegistration_tb where Username ='" + Session["username"].ToString() + "'and FirstName='" + txtFirstName.Text + "' and LastName='" + txtLastName.Text + "' and DateOfBirth='" + txtDateofBirth.Text + "' and AadharNo='"+txtaadhar_no.Text+"'";
        DataSet ds = dm.For_Adapter(str);
        if (ds.Tables[0].Rows.Count > 0)
        {
            MultiView1.SetActiveView(View3);  
        }
        else
        {
            lblmsg.Text = "Invalid Credential";
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string sql = "Update UserRegistration_tb set Password='" + txtnewpassword.Text + "' where Username='" + Session["username"].ToString() + "' ";
        int r = dm.For_Execute(sql);
        if (r > 0)
        {
            lblmsg2.Text = "Password Changed Successfully....";
        }

    }
}