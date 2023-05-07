using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.User.Identity.IsAuthenticated)//当用户认证为true时就就执行
        {
            PlaceHolder1.Visible = false;//标签
            PlaceHolder2.Visible = true;
            basesql SqlObj = new basesql();
            SqlDataReader Dr;
            String SqlStr;
            SqlStr = "select isnull(count(*),0) from u_ly where to_lyr=" + int.Parse(HttpContext.Current.User.Identity.Name.ToString()) + " and viewtag='0'";//HttpContext.Current.User.Identity.Name.ToString()是用户的ID
            Dr=SqlObj.ExecuteReader(SqlStr);
            if (Dr.Read())
            {
                HyperLink1.Text = "个人中心";
                Dr.Close();
            }
        }  
        else
        {
            PlaceHolder1.Visible = true;
            PlaceHolder2.Visible = false;
         }
    }

    protected void Search_Click(object sender, EventArgs e)
    {
        String theSel = DropDownList1.SelectedValue;
        if (theSel == "1")
        {
            Response.Redirect("ss_hp.aspx?ss=" + sstext.Text.ToString());
        }
        else
        {
            Response.Redirect("ss_hk.aspx?ss=" + sstext.Text.ToString());
        }
    }
}
