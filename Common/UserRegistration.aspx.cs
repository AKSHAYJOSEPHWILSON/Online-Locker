using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Common_UserRegistration : System.Web.UI.Page
{
    DataManipulation dm = new DataManipulation();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dm.For_Drop_Bind("select * from Branch_tb", "Place", "BranchId", ddlbranch);
            dm.For_Drop_Bind("select * from Country_tb", "Country", "Cid", ddlcountry);

            if (Session["type"] != null)
            {
                Panel1.Visible = true;

                ddltype.SelectedIndex = 1;
                ddltype.Items[0].Enabled = false;
                lbljointId.Text = Session["JointId"].ToString();
                string str = "select UserRegistration_tb.* from UserRegistration_tb inner join JoinAccount_tb on UserRegistration_tb.UserId=JoinAccount_tb.UserId where JoinAccount_tb.JointAcId='" + lbljointId.Text + "'";
                DataSet ds = dm.For_Adapter(str);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    GridView1.DataSource = ds.Tables[0];
                    GridView1.DataBind();
                    if (ds.Tables[0].Rows.Count >= 2)
                    {
                        btnfinish.Visible = true;
                        btnfinish.Enabled = true;
                    }
                    else
                    {
                        btnfinish.Visible = true;
                        btnfinish.Enabled = false;
                    }
                }
            }

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        string check_usr = "select * from UserRegistration_tb where Username='" + txtusername.Text + "'";
        DataSet Checked = dm.For_Adapter(check_usr);
        if (Checked.Tables[0].Rows.Count > 0)
        {
            Response.Write("<script language='javascript'>alert('Username Already Exist')</script>");
        }
        else
        {

            string Id = dm.Gen_Id("select Max(UserId) from UserRegistration_tb", "USR");
            string path = "~/User/IdProof/" + fuIdProof.FileName;
            fuIdProof.SaveAs(Server.MapPath(path));

            if (ddltype.SelectedItem.Text == "Individual")
            {

                string str = "Insert into UserRegistration_tb values('" + Id + "','" + ddltype.SelectedItem.Text + "','" + txtFirstName.Text + "','" + txtLastName.Text + "','" + rdogender.SelectedItem.Text + "','" + txtDateofBirth.Text + "','" + txtaddress.Text + "','" + txtaadhar_no.Text + "','" + txtpan_no.Text + "','" + ddlcountry.SelectedItem.Text + "','" + ddlstate.SelectedItem.Text + "','" + ddldistrict.SelectedItem.Text + "','" + ddlbranch.SelectedValue + "','" + path + "','" + imgphoto.ImageUrl + "','" + txtusername.Text + "','" + txtpassword.Text + "','Pending')";
                int r = dm.For_Execute(str);
                if (r > 0)
                {
                    Response.Write("<script language='javascript'>alert('Registered Successfully....')</script>");
                }

            }
            else
            {
                if (Session["JointId"] == null)
                {
                    string JointACId = dm.Gen_Id("select max(JointAcId) from JoinAccount_tb", "JAC");
                    Session["JointId"] = JointACId;
                }

                string str = "Insert into UserRegistration_tb values('" + Id + "','" + ddltype.SelectedItem.Text + "','" + txtFirstName.Text + "','" + txtLastName.Text + "','" + rdogender.SelectedItem.Text + "','" + txtDateofBirth.Text + "','" + txtaddress.Text + "','" + txtaadhar_no.Text + "','" + txtpan_no.Text + "','" + ddlcountry.SelectedItem.Text + "','" + ddlstate.SelectedItem.Text + "','" + ddldistrict.SelectedItem.Text + "','" + ddlbranch.SelectedValue + "','" + path + "','" + imgphoto.ImageUrl + "','" + txtusername.Text + "','" + txtpassword.Text + "','Pending')";
                int r = dm.For_Execute(str);
                if (r > 0)
                {
                    string JoinId = dm.Gen_Id("select max(JoinId) from JoinAccount_tb", "JON");
                    string sql = "Insert into JoinAccount_tb values('" + JoinId + "','" + Id + "','" + Session["JointId"].ToString() + "')";
                    int rs = dm.For_Execute(sql);
                    if (rs > 0)
                    {
                        Session["type"] = "Join";
                        Response.Redirect("~/Common/UserRegistration.aspx");
                    }
                }

            }
        }
    }
    protected void btnupload_Click(object sender, EventArgs e)
    {
        if (fuphoto.HasFile)
        {
            string Id = dm.Gen_Id("select Max(UserId) from UserRegistration_tb", "USR");
            string path = "~/User/Photo/" + fuphoto.FileName;
            fuphoto.SaveAs(Server.MapPath(path));
            imgphoto.ImageUrl = path;

        }
    }
    protected void btnfinish_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Write("<script language='javascript'>alert('Joint Account Created Successfully....')</script>");

    }
    protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        dm.For_Drop_Bind("select * from State_tb where Cid='" + ddlcountry.SelectedValue + "'", "State", "Sid", ddlstate);
    }
    protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        dm.For_Drop_Bind("select * from District_tb where Sid='" + ddlstate.SelectedValue + "'", "District", "Did", ddldistrict);
    }
}