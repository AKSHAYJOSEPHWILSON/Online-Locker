using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Branch_UserDetails : System.Web.UI.Page
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
        string str = "select * from UserRegistration_tb where UserId='" + UserId + "'";
        DataSet ds = dm.For_Adapter(str);
        if (ds.Tables[0].Rows.Count > 0)
        {
            if (ds.Tables[0].Rows[0][1].ToString() == "Join Account")
            {
                Panel1.Visible = true;
                string JointId = dm.For_Scalar("select JointAcId from JoinAccount_tb where UserId='" + UserId + "'");
                lbljointId.Text = JointId;
                string str3 = "select UserRegistration_tb.* from UserRegistration_tb inner join JoinAccount_tb on UserRegistration_tb.UserId=JoinAccount_tb.UserId where JoinAccount_tb.JointAcId='" + JointId + "'";
                DataSet ds3 = dm.For_Adapter(str3);
                if (ds3.Tables[0].Rows.Count > 0)
                {
                    GridView2.DataSource = ds3.Tables[0];
                    GridView2.DataBind();
                }
            }

            lbluserId.Text = ds.Tables[0].Rows[0][0].ToString();
            lbltype.Text = ds.Tables[0].Rows[0][1].ToString();
            txtFirstName.Text = ds.Tables[0].Rows[0][2].ToString();
            txtLastName.Text = ds.Tables[0].Rows[0][3].ToString();
            lblgender.Text = ds.Tables[0].Rows[0][4].ToString();
            txtDateofBirth.Text = ds.Tables[0].Rows[0][5].ToString();
            txtaddress.Text = ds.Tables[0].Rows[0][6].ToString();
            txtaadhar_no.Text = ds.Tables[0].Rows[0][7].ToString();
            txtpan_no.Text = ds.Tables[0].Rows[0][8].ToString();
            dm.For_Drop_Bind("select * from Country_tb", "Country", "Cid", ddlcountry);
            ddlcountry.SelectedItem.Text = ds.Tables[0].Rows[0][9].ToString();
            dm.For_Drop_Bind("select * from State_tb where Cid='" + ddlcountry.SelectedValue + "'", "State", "Sid", ddlstate);
            ddlstate.SelectedItem.Text = ds.Tables[0].Rows[0][10].ToString();
            dm.For_Drop_Bind("select * from District_tb where Sid='" + ddlstate.SelectedValue + "'", "District", "Did", ddldistrict);
            ddldistrict.SelectedItem.Text = ds.Tables[0].Rows[0][11].ToString();
            imgphoto.ImageUrl = ds.Tables[0].Rows[0][14].ToString();
            txtusername.Text = ds.Tables[0].Rows[0][15].ToString();

        }
    }
    protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        dm.For_Drop_Bind("select * from State_tb where Cid='" + ddlcountry.SelectedValue + "'", "State", "Sid", ddlstate);
    }
    protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        dm.For_Drop_Bind("select * from District_tb where Sid='" + ddlstate.SelectedValue + "'", "District", "Did", ddldistrict);
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind(GridView2.SelectedRow.Cells[0].Text);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Administrator/ScheduledLockerOperation.aspx?UserId=" + lbluserId.Text);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Administrator/LockerOperationHistory.aspx?UserId=" + lbluserId.Text);

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string str = "Update UserRegistration_tb set FirstName='" + txtFirstName.Text + "',LastName='" + txtLastName.Text + "',DateOfBirth='" + txtDateofBirth.Text + "',Address='" + txtaddress.Text + "',AadharNo='" + txtaadhar_no.Text + "',PanNo='" + txtpan_no.Text + "',Country='" + ddlcountry.SelectedItem.Text + "',State='" + ddlstate.SelectedItem.Text + "',District='" + ddldistrict.SelectedItem.Text + "',Username='" + txtusername.Text + "' where UserId='" + lbluserId.Text + "'";
        int r = dm.For_Execute(str);
        if (r > 0)
        {
            Response.Write("<script language='javascript'>alert('Updated Successfully...')</script>");
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        string str = "delete from UserRegistration_tb where UserId='" + lbluserId.Text + "'";
        int r = dm.For_Execute(str);
        if (r > 0)
        {
            Response.Write("<script language='javascript'>alert('Deleted Successfully...')</script>");
        }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Administrator/ViewRentDetails.aspx?UserId=" + lbluserId.Text);
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Administrator/ViewAdditionalChargeDetails.aspx?UserId=" + lbluserId.Text);

    }
}