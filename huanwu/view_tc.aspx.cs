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

public partial class view_tc : System.Web.UI.Page
{
    String queryString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["hd_id"] == null) {
            queryString = Request.QueryString["hd_id"];
            Response.Redirect("tchd.aspx");

        }

    }

    protected void ImageButton1_Click(object sender, EventArgs e) {

        if (HttpContext.Current.User.Identity.IsAuthenticated == false)
        {
            Response.Redirect("login.aspx?url=tchd");
        }
        try
        {
            
            String uid = HttpContext.Current.User.Identity.Name.ToString();
            String hdid = Request.QueryString["hd_id"];
            basesql sql_actor = new basesql();
            //String select_cmd = "select * from Canyu_Guanxi where attender_id=" + uid;
            String select_cmd = "select cy_tag from Canyu_Guanxi";
            if (sql_actor.ExecuteScalar(select_cmd) == "1")
          {
               Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "info", "alert('您已经关注此活动！');window.location='tchd.aspx?hd_id=" + queryString + "';", true);
           }
           else 
          {
                String insert_cmd = "insert into Canyu_Guanxi(attender_id,act_id) values(" + uid + "," + hdid + ")";
                sql_actor.ExecuteScalar(insert_cmd);
                String updatecount_cmd = "update tchd_info set ppl_counts=ppl_counts+1 where hd_id=" + hdid;
                sql_actor.ExecuteScalar(updatecount_cmd);
                String updatetag_cmd = "update Canyu_Guanxi set cy_tag=1 " ;
                sql_actor.ExecuteScalar(updatetag_cmd);
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "info", "alert('数据添加成功！');window.location='tchd.aspx?hd_id=" + queryString + "';", true);
            }
           
        }
        catch (Exception)
        {

            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "info", "alert('数据添加失败，请重试！');window.location='tchd.aspx?hd_id=" + queryString + "';", true);
        }
       
    }
}