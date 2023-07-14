using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Configuration;

/// <summary>
/// Summary description for DataManipulation
/// </summary>
public class DataManipulation
{
    SqlConnection con;
	public DataManipulation()
	{
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ToString());
		//
		// TODO: Add constructor logic here
		//
	}
    public int For_Execute(string str)
    {
        SqlCommand cmd = new SqlCommand(str, con);
        con.Open();
        int r = cmd.ExecuteNonQuery();
        con.Close();
        return r;
    }
    public DataSet For_Adapter(string str)
    {
        SqlDataAdapter adpt = new SqlDataAdapter(str, con);
        DataSet ds = new DataSet();
        con.Open();
        adpt.Fill(ds);
        con.Close();
        return ds;
    }
    public void For_Drop_Bind(string str, string txt, string val, DropDownList ddl)
    {
        DataSet ds = For_Adapter(str);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddl.DataSource = ds.Tables[0];
            ddl.DataTextField = txt;
            ddl.DataValueField = val;
            ddl.DataBind();
        }
        else
        {
            ddl.Items.Clear();
        }
        ddl.Items.Insert(0, "---SELECT---");
    }
    public string For_Scalar(string str)
    {
        SqlCommand cmd = new SqlCommand(str, con);
        con.Open();
        string data = cmd.ExecuteScalar().ToString();
        con.Close();
        return data;
    }
    public string Gen_Id(string str, string frmt)
    {
        string res = "";
        SqlCommand cmd = new SqlCommand(str, con);
        con.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            if (sdr[0].ToString() == "")
            {
                res = frmt + "1000";
            }
            else
            {
                string data = sdr[0].ToString();
                int temp = Convert.ToInt32(data.Substring(3, 4));
                temp++;
                res = frmt + temp;
            }
        }
        con.Close();
        return res;
    }
}