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

public partial class ss_hk : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet DS;
        String SqlStr;
        int CurrPage;
        basesql SqlObj = new basesql();
        PagedDataSource PDSource = new PagedDataSource(); ;
        if (Request.QueryString["ss"] == null || Request.QueryString["ss"].ToString() == "")
        {
            Label4.Text = "所有换客";
            SqlStr = "select u_info.*,(select count(*) from wu_info where wu_user=u_id) as hps,(select count(*) from xq_info where xq_user=u_id) as xqs from u_info order by hps desc";
        }
        else
        {
            Label4.Text = "换客搜索：" + Request.QueryString["ss"].ToString();
            SqlStr = "select u_info.*,(select count(*) from wu_info where wu_user=u_id) as hps,(select count(*) from xq_info where xq_user=u_id) as xqs from u_info where u_name like '%" + Request.QueryString["ss"].ToString() + "%' order by hps desc";
        }

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
