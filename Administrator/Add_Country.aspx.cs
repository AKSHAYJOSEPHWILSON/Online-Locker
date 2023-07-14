using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Administrator_Add_Country : System.Web.UI.Page
{
    DataManipulation dm = new DataManipulation();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_Country();
        }
    }
    public void Bind_Country()
    {
        string str = "select * from Country_tb";
        DataSet ds = dm.For_Adapter(str);
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
        else
        {
            lblmsg.Text = "No Country Found";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string Id=dm.Gen_Id("select max(cid) from Country_tb","CON");
        string str = "insert into Country_tb values('" + Id + "','" + txtcountry.Text + "')";
        int r = dm.For_Execute(str);
        if (r > 0)
        {
            lblmsg.Text = "Country Inserted Successfully...";
            Bind_Country();
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string str = "delete from Country_tb where Cid='" + GridView1.Rows[e.RowIndex].Cells[0].Text + "'";
        int r = dm.For_Execute(str);
        if (r > 0)
        {
            Bind_Country();
        }
    }
}