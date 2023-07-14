using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Administrator_AddRentDetails : System.Web.UI.Page
{
    DataManipulation dm = new DataManipulation();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();
        }
    }
    public void Bind()
    {
        string sql = "select * from RentAmount_tb";
        DataSet ds = dm.For_Adapter(sql);
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        string sql = "select * from RentAmount_tb";
        DataSet ds = dm.For_Adapter(sql);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblmsg.Text = "Already Inserted";
        }
        else
        {
            string Id = dm.Gen_Id("select max(RentId) from RentAmount_tb", "RNA");
            string str = "Insert into RentAmount_tb values('" + Id + "','" + txtYearlyRent.Text + "','" + txtadditionalOp.Text + "')";
            int r = dm.For_Execute(str);
            if (r > 0)
            {
                lblmsg.Text = "Inserted Successfully...";
            }
        }
        Bind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string str = "delete from RentAmount_tb where RentId='" + GridView1.Rows[e.RowIndex].Cells[0].Text + "'";
        int r = dm.For_Execute(str);
        if (r > 0)
        {
            lblmsg.Text = "Deleted Successfully...";
            Response.Redirect("~/Administrator/AddRentDetails.aspx");
        }
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox txtrent=(TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0];
        TextBox txtcharge=(TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0];

        string str = "Update RentAmount_tb set YearlyRent='" + txtrent.Text + "',AdditionalCharge='" + txtcharge.Text + "' where RentId='" + GridView1.Rows[e.RowIndex].Cells[0].Text + "'";
    int r = dm.For_Execute(str);
        if (r > 0)
        {
            Response.Redirect("~/Administrator/AddRentDetails.aspx");
        }
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        Bind();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        Bind();
    }
}