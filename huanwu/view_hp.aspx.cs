using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class view_hp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null || Request.QueryString["id"].ToString() == "")
        {
            Response.Redirect("default.aspx");
        }
        if (!Page.IsPostBack)
        {
            basesql SqlObj = new basesql();
            String SqlStr;
            SqlStr = "update wu_info set clicknum=clicknum+1 where wuid='" + Request.QueryString["id"].ToString() + "'";
            SqlObj.ExecuteNonQuery(SqlStr);
        }

    }

    protected void FormView2_Inserting(object sender, System.Web.UI.WebControls.FormViewInsertEventArgs e)
    {
        if (HttpContext.Current.User.Identity.IsAuthenticated == false)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "info", "alert('请先登录！');", true);
            e.Cancel = true;
        }
        else
        {
            SqlDataReader Dr;
            String SqlStr = "select wu_user from wu_info where wuid='" + Request.QueryString["id"].ToString() + "'";
            basesql SqlObj = new basesql();
            Dr = SqlObj.ExecuteReader(SqlStr);
            if (Dr.Read())
            {
                e.Values["tolyr"] = Dr["wu_user"].ToString();
            }
            else
            {
                e.Cancel = true;
            }
            e.Values["lyr"] = HttpContext.Current.User.Identity.Name.ToString();
        }

    }

    protected void FormView2_Inserted(object sender, System.Web.UI.WebControls.FormViewInsertedEventArgs e)
    {
        GridView2.DataBind();
    }
}
