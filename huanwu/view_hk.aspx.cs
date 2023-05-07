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

public partial class view_hk : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null || Request.QueryString["id"].ToString() == "")
        {
            Response.Redirect("default.aspx");
        }
        
    }

    protected void FormView2_Inserting(object sender,System.Web.UI.WebControls.FormViewInsertEventArgs e)
    {
        if (HttpContext.Current.User.Identity.IsAuthenticated == false)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "info", "alert('请先登录！');", true);
            e.Cancel = true;
        }
        else
        {
            e.Values["lyr"] = HttpContext.Current.User.Identity.Name.ToString();

        }

    }

    protected void FormView2_Inserted(object sender, System.Web.UI.WebControls.FormViewInsertedEventArgs e)
    {
        GridView4.DataBind();
    }

}
