using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Reg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        SqlDataReader Dr;
        String SqlStr;
        basesql SqlObj = new basesql();
        SqlStr = "select * from u_info where u_name='" + e.Values["u_name"].ToString() + "'";
        Dr = SqlObj.ExecuteReader(SqlStr);
        if (Dr.Read())
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "info", "alert('该换客名已经存在，请重新输入！');", true);
            e.Cancel = true;
            Dr.Close();
        }
        else
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
                e.Values["face"] = FileObj.FileName;
            }
        }
    }

    protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "info", "alert('恭喜您注册成功！系统将转向登录页面！');window.location='login.aspx'", true);
    }

}
