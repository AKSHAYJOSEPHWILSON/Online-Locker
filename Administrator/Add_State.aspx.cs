using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Administrator_Add_State : System.Web.UI.Page
{
    DataManipulation dm = new DataManipulation();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dm.For_Drop_Bind("select * from Country_tb", "Country", "Cid", ddlcountry);
            Bind_State();
        }
    }
    public void Bind_State()
    {
        string str = "select * from State_tb";
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        string Id = dm.Gen_Id("select max(Sid) from State_tb", "STA");
        string str = "insert into State_tb values('" + Id + "','"+txtstate.Text+"','" + ddlcountry.SelectedValue + "')";
        int r = dm.For_Execute(str);
        if (r > 0)
        {
            lblmsg.Text = "Country Inserted Successfully...";
            Bind_State();
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string str = "delete from State_tb where Sid='" + GridView1.Rows[e.RowIndex].Cells[0].Text + "'";
        int r = dm.For_Execute(str);
        if (r > 0)
        {
            Bind_State();
        }
    }
}