using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Administrator_ManageBranchDetails : System.Web.UI.Page
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
        string str = "select * from Branch_tb";
        DataSet ds = dm.For_Adapter(str);
        if (ds.Tables[0].Rows.Count > 0)
        {
            DataList1.DataSource = ds.Tables[0];
            DataList1.DataBind();
            lblmsg.Text = "";
        }
        else
        {
            lblmsg.Text = "No Branch Found";
        }
    }
    protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
    {
        DataList1.EditItemIndex = e.Item.ItemIndex;
        Bind();
    }
    protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        Label lblid = (Label)e.Item.FindControl("lblbranchId");
        TextBox txtplace = (TextBox)e.Item.FindControl("txtplace");
        TextBox txtaddress = (TextBox)e.Item.FindControl("txtaddress");
        TextBox txtemail = (TextBox)e.Item.FindControl("txtemail");
        TextBox txtmobile = (TextBox)e.Item.FindControl("txtmobile");
        TextBox txtwebsite = (TextBox)e.Item.FindControl("txtwebsite");
        TextBox txtnooflockers = (TextBox)e.Item.FindControl("txtnooflockers");
        TextBox txtusername = (TextBox)e.Item.FindControl("txtusername");


        string str = "update Branch_tb set Place='"+txtplace.Text+"',Address='"+txtaddress.Text+"',Email='"+txtemail.Text+"',Mobile='"+txtmobile.Text+"',Website='"+txtwebsite.Text+"',NoOfLockers='"+txtnooflockers.Text+"',Username='"+txtusername.Text+"' where BranchId='" + lblid.Text + "'";
        int r = dm.For_Execute(str);
        if (r > 0)
        {
            DataList1.EditItemIndex = -1;
            Bind();
            Response.Write("<script language='javascript'>alert('Updated Successfully...')</script>");
        }
    }
    protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        Label lblid = (Label)e.Item.FindControl("lblbranchId");
        string str = "delete from Branch_tb where BranchId='" + lblid.Text + "'";
        int r = dm.For_Execute(str);
        if (r > 0)
        {
            Response.Write("<script language='javascript'>alert('Deleted Successfully...')</script>");
            Bind();
        }
    }
    protected void DataList1_CancelCommand(object source, DataListCommandEventArgs e)
    {

        DataList1.EditItemIndex = -1;
        Bind();
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "List")
        {
            Response.Redirect("~/Administrator/ViewUsersList.aspx?BranchId=" + e.CommandArgument.ToString());
        }
    }
}