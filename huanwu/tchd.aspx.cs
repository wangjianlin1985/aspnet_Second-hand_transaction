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

public partial class tchd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet DS;
        String SqlStr;
        int CurrPage;
        basesql SqlObj = new basesql();
        PagedDataSource PDSource = new PagedDataSource();
        SqlStr = "select hd_id,host_id,U_Name,City_Name,hd_name,Face,hd_title,hd_details,hd_time,ppl_counts from tchd_info,U_Info,CS_info where CityID=city_id and u_id=host_id";
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