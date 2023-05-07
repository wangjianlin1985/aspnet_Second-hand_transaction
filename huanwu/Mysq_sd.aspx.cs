using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Mysq_sd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.User.Identity.IsAuthenticated == false)
        {
            Response.Redirect("login.aspx?url=mysq_sd");
        }
        SqlDataSource1.SelectParameters["userid"].DefaultValue = HttpContext.Current.User.Identity.Name.ToString();

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        String theJHID = e.CommandArgument.ToString();
        String SqlStr;
        basesql SqlObj = new basesql();
        if (e.CommandName == "agree")
        {
            SqlStr = "update huan_info set jh_tag='1',jh_enddate='" + System.DateTime.Now + "' where jhid='" + theJHID + "'";
            SqlObj.ExecuteNonQuery(SqlStr);
            SqlStr = "update wu_info set state='1' from huan_info where wu_bid=wuid and jhid='" + theJHID + "'";
            SqlObj.ExecuteNonQuery(SqlStr);
            GridView1.DataBind();
        }
        else
        {
            if (e.CommandName == "notagree")
            {
                SqlStr = "update huan_info set jh_tag='2',jh_enddate='" + System.DateTime.Now + "' where jhid='" + theJHID + "'";
                SqlObj.ExecuteNonQuery(SqlStr);
                GridView1.DataBind();

            }
        }
    }
}
