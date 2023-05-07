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

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         
    }
     
    protected void Button2_Click(object sender, EventArgs e)
    {
        String Uid = TextBox1.Text.ToString();
        String UPwd = TextBox2.Text.ToString();
        String UCode = "";
        SqlDataReader Dr;
        basesql SqlObj = new basesql();
        String SqlStr;
        SqlStr = "select * from U_info where u_name='" + Uid + "' and u_pwd='" + UPwd + "'";
        Dr = SqlObj.ExecuteReader(SqlStr);
        if (Dr.Read())
        {
            UCode = Dr["u_id"].ToString();
            Dr.Close();
            SqlStr = "update u_info set logintimes=logintimes+1,lastlogin='" + System.DateTime.Now + "' where u_id='" + UCode + "'";
            SqlObj.ExecuteNonQuery(SqlStr);
            System.Web.Security.FormsAuthentication.SetAuthCookie(UCode, false);
            if (Request.QueryString["url"] != null)
            {
                String Url;
                Url = Request.QueryString["url"].ToString() + ".aspx";
                Response.Redirect(Url);
            }
            else
            {
                Response.Redirect("default.aspx");
            }
        }
        else
        {
            Label1.Text = "错误的用户名或密码！";
        }

    }
}
