using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;
using System.Net;

public partial class Branch_ApproveUsers : System.Web.UI.Page
{
    DataManipulation dm = new DataManipulation();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string str = "select * from UserRegistration_tb where Status='Pending' and BranchId='" + Session["Id"] + "'";
            DataSet ds = dm.For_Adapter(str);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
                lblmsg.Text = "";
            }
            else
            {
                lblmsg.Text = "No Pending Users Found";
            }
        }
    }
    private bool CheckConnection()
    {
        WebClient client = new WebClient();
        try
        {
            using (client.OpenRead("http://www.google.com"))
            {
            }
            return true;
        }
        catch (WebException)
        {
            return false;
        }
    }

    private void Mail_Send()
    {

        if (CheckConnection())
        {
            try
            {
                MailMessage o = new MailMessage("onlinelockersystem@hotmail.com", txtusername.Text, "Online Locker System - User Approval Alert", "Hi <b>" + txtFirstName.Text.ToUpper() + " " + txtLastName.Text.ToUpper() + "</b>, </br></br>Your user account was approved by your branch, Now you can login through our website.</br></br></br>Thank You</br><b>Online Locker System<b/>");
                o.IsBodyHtml = true;
                NetworkCredential netCred = new NetworkCredential("onlinelockersystem@hotmail.com", "V@123456789");
                SmtpClient smtpobj = new SmtpClient("smtp-mail.outlook.com", 587);
                smtpobj.EnableSsl = true;
                smtpobj.UseDefaultCredentials = false;
                smtpobj.Credentials = netCred;
                smtpobj.Send(o);
            }
            catch {
                Response.Write("<script language='javascript'>alert('Error while sending approval email.')</script>");
            }
        }
        else
        {
            Response.Write("<script language='javascript'>alert('There is no Internet Connection')</script>");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string str = "Update UserRegistration_tb set Status='Approved' where UserId='" + ViewState["UserId"] + "'";
        int r = dm.For_Execute(str);
        if (r > 0)
        {
            Mail_Send();
            Response.Write("<script language='javascript'>alert('Approved Successfully...')</script>");
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Panel2.Visible = true;
        ViewState["UserId"] = GridView1.SelectedRow.Cells[0].Text;
        string str = "select * from UserRegistration_tb where UserId='" + GridView1.SelectedRow.Cells[0].Text + "'";
            DataSet ds = dm.For_Adapter(str);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lbltype.Text = ds.Tables[0].Rows[0][1].ToString();
                txtFirstName.Text = ds.Tables[0].Rows[0][2].ToString();
                txtLastName.Text = ds.Tables[0].Rows[0][3].ToString();
                lblgender.Text = ds.Tables[0].Rows[0][4].ToString();
                txtDateofBirth.Text = ds.Tables[0].Rows[0][5].ToString();
                txtaddress.Text = ds.Tables[0].Rows[0][6].ToString();
                txtaadhar_no.Text = ds.Tables[0].Rows[0][7].ToString();
                txtpan_no.Text = ds.Tables[0].Rows[0][8].ToString();
                lblcountry.Text = ds.Tables[0].Rows[0][9].ToString();
                lblstate.Text = ds.Tables[0].Rows[0][10].ToString();
                lbldistrict.Text = ds.Tables[0].Rows[0][11].ToString();
              
                imgIdProof.ImageUrl = ds.Tables[0].Rows[0][13].ToString();
                imgphoto.ImageUrl = ds.Tables[0].Rows[0][14].ToString();

                txtusername.Text = ds.Tables[0].Rows[0][15].ToString();

                
            }
    }
    protected void btnfinish_Click(object sender, EventArgs e)
    {
        string str = "Update UserRegistration_tb set Status='Rejected' where UserId='" + ViewState["UserId"] + "'";
        int r = dm.For_Execute(str);
        if (r > 0)
        {
            Response.Write("<script language='javascript'>alert('Rejected Successfully...')</script>");
        }
    }
}