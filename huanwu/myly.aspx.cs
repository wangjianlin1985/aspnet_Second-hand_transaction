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

public partial class myly : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.User.Identity.IsAuthenticated == false)
        {
            Response.Redirect("login.aspx?url=myly");
        }

        DataSet DS;
        String SqlStr;
        int CurrPage;
        basesql SqlObj = new basesql();
        PagedDataSource PDSource = new PagedDataSource();
        SqlStr = "update u_ly set viewtag='1' where to_lyr=" + HttpContext.Current.User.Identity.Name.ToString() + " and viewtag='0'";
        SqlObj.ExecuteNonQuery(SqlStr);

        SqlStr = "select id,ly_user,u_name,face,ly_nr,ly_date,wu_id,xq_id,(select wu_name from wu_info where wuid=wu_id) as wuname,(select xq_title from xq_info where xq_info.id=xq_id) as xq from u_ly,u_info where ly_user=u_id and to_lyr=" + HttpContext.Current.User.Identity.Name.ToString() + " order by ly_date desc";
        DS = SqlObj.ExecuteDataSet(SqlStr);
        PDSource.DataSource = DS.Tables[0].DefaultView;
        PDSource.AllowPaging = true;
        PDSource.PageSize = 10;
        if (Request.QueryString["page"] == null || Request.QueryString["page"].ToString() == "")
        {

            CurrPage = 1;
        }
        else
        {
            CurrPage = int.Parse(Request.QueryString["page"].ToString());
        }
        PDSource.CurrentPageIndex = CurrPage - 1;
        Repeater1.DataSource = PDSource;
        Repeater1.DataBind();
        SumNum.Text = DS.Tables[0].Rows.Count.ToString();
        CPage.Text = (PDSource.CurrentPageIndex + 1).ToString();
        SumPage.Text = PDSource.PageCount.ToString();
        fpage.NavigateUrl = Request.CurrentExecutionFilePath + "?page=1";
        epage.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + PDSource.PageCount;
        npage.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + (CurrPage + 1).ToString();
        ppage.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + (CurrPage - 1).ToString();
        if (PDSource.IsFirstPage)
        {
            fpage.Enabled = false;
            ppage.Enabled = false;
        }
        if (PDSource.IsLastPage)
        {
            epage.Enabled = false;
            npage.Enabled = false;
        }

    }
}
