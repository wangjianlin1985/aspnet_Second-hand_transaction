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
using System.IO;

public partial class modiinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {  
        if (HttpContext.Current.User.Identity.IsAuthenticated == false)
        { 
            Response.Redirect("login.aspx?url=modiinfo");
        } 
        SqlDataSource1.SelectParameters["u_id"].DefaultValue = HttpContext.Current.User.Identity.Name.ToString();
    }

    protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        FileUpload FileObj;
        String thePath = Server.MapPath("userpic");
        FileObj = (FileUpload)FormView1.FindControl("face");
        if (FileObj.HasFile)
        {
            if (!Directory.Exists(thePath))
            {
                Directory.CreateDirectory(thePath);
            }
            FileObj.SaveAs(thePath + "\\" + FileObj.FileName);
            e.NewValues["face"]=FileObj.FileName;
        }
    }


}
