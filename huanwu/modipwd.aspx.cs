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

public partial class modipwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.User.Identity.IsAuthenticated == false)
        {
            Response.Redirect("login.aspx?url=modipwd");
        }  
    } 

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataReader Dr;
        basesql SqlObj = new basesql();
        String SqlStr;
        if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox3.Text == "")
        {
            Label1.Text = "输入不完整，请重新输入！";
        }
        else
        {
            if (TextBox2.Text != TextBox3.Text)
            {
                Label1.Text = "新密码与重复新密码不一致，请重新输入！";
            }
            else
            {
                SqlStr = "select * from u_info where u_id=" + HttpContext.Current.User.Identity.Name.ToString() + " and u_pwd='" + TextBox1.Text + "'";
                Dr = SqlObj.ExecuteReader(SqlStr);
                if (Dr.Read())
                {
                    Dr.Close();
                    SqlStr = "update u_info set u_pwd='" + TextBox2.Text + "' where u_id=" + HttpContext.Current.User.Identity.Name.ToString();
                    SqlObj.ExecuteNonQuery(SqlStr);
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "info", "alert('密码修改成功！');", true);
                    Label1.Text = "密码修改成功！";
                }
                else
                {
                    Label1.Text = "旧密码不正确，请重新输入！";
                    Dr.Close();
                }

            }
        }
    }
}
