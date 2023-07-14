using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Administrator_Add_District : System.Web.UI.Page
{
    DataManipulation dm = new DataManipulation();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dm.For_Drop_Bind("select * from Country_tb", "Country", "Cid", ddlcountry);

            Bind_District();
        }
    }
    public void Bind_District()
    {
        string str = "select * from District_tb";
        DataSet ds = dm.For_Adapter(str);
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
        else
        {
            lblmsg.Text = "No State Found";
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        string Id = dm.Gen_Id("select max(Did) from District_tb", "DIS");
        string str = "insert into District_tb values('" + Id + "','" + txtdistrictname.Text + "','" + ddlstate.SelectedValue + "')";
        int r = dm.For_Execute(str);
        if (r > 0)
        {
            lblmsg.Text = "Country Inserted Successfully...";
            Bind_District();
        }
    }
    protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        dm.For_Drop_Bind("select * from State_tb where Cid='"+ddlcountry.SelectedValue+"'", "State", "Sid", ddlstate);
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string str = "delete from District_tb where Did='" + GridView1.Rows[e.RowIndex].Cells[0].Text + "'";
        int r = dm.For_Execute(str);
        if (r > 0)
        {
            Bind_District();
        }
    }
}