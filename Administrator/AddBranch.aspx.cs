using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Administrator_AddBranch : System.Web.UI.Page
{
    DataManipulation dm = new DataManipulation();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string check_usr = "select * from Branch_tb where Username='" + txtusername.Text + "'";
        DataSet Checked = dm.For_Adapter(check_usr);
        if (Checked.Tables[0].Rows.Count > 0)
        {
            Response.Write("<script language='javascript'>alert('Username Already Exist')</script>");
        }
        else
        {
            string check_usr1 = "select * from Branch_tb where Place='" + txtplace.Text + "'";
            DataSet Checked1 = dm.For_Adapter(check_usr1);
            if (Checked1.Tables[0].Rows.Count > 0)
            {
                Response.Write("<script language='javascript'>alert('Branch Name Already Exist')</script>");
            }
            else
            {
                string Id = dm.Gen_Id("select max(BranchId) from Branch_tb", "BRC");
                string str = "insert into Branch_tb values('" + Id + "','" + txtplace.Text + "','" + txtaddress.Text + "','" + txtemail.Text + "','" + txtmobile.Text + "','" + txtwebsite.Text + "','" + txtnooflockers.Text + "','" + txtusername.Text + "','" + txtpassword.Text + "')";
                int r = dm.For_Execute(str);
                if (r > 0)
                {
                    Response.Write("<script language='javascript'>alert('Saved Successfully...')</script>");
                    Server.Transfer("~/Administrator/AddBranch.aspx");
                }
            }
        }
    }
}