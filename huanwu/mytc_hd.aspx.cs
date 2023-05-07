using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mytc_hd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.User.Identity.IsAuthenticated == false)
        {
            Response.Redirect("login.aspx?url=myhp");
        }
        SqlDataSource1.SelectParameters["userid"].DefaultValue = HttpContext.Current.User.Identity.Name.ToString();
    
    }
}