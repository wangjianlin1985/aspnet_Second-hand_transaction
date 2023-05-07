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

public partial class ss_hp : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet DS;
        String SqlStr;
        int CurrPage;
        basesql SqlObj = new basesql();
        PagedDataSource PDSource = new PagedDataSource(); 
        if (Request.QueryString["ss"] == null || Request.QueryString["ss"].ToString() == "")
        {
            if (Request.QueryString["type"] == null || Request.QueryString["type"].ToString() == "")
            {
                Label4.Text = "所有物品";
                SqlStr = "select wuid,wu_user,u_name,wu_name,wu_pic,wu_xjcd,jzarea,addtime,hop_wpname,clicknum,(select count(*) from huan_info where wu_zid=wuid or wu_bid=wuid) as jhnum from wu_info,u_info where wu_user=u_id order by addtime desc";
            }
            else
            {
                SqlDataReader Dr;
                SqlStr = "select typename from wu_type where typeid='" + Request.QueryString["type"].ToString() + "'";
                Dr = SqlObj.ExecuteReader(SqlStr);
                if (Dr.Read())
                {
                    Label4.Text = "分类换品：" + Dr["typename"].ToString();
                }
                else
                {
                    Label4.Text = "分类换品：";
                }
                Dr.Close();
                SqlStr = "select wuid,wu_user,u_name,wu_name,wu_pic,wu_xjcd,jzarea,addtime,hop_wpname,clicknum,(select count(*) from huan_info where wu_zid=wuid or wu_bid=wuid) as jhnum from wu_info,u_info where wu_user=u_id and wu_type='" + Request.QueryString["type"].ToString() + "' order by addtime desc";
            }
        }
        else
        {
            Label4.Text = "搜索结果：" + Request.QueryString["ss"].ToString();
            SqlStr = "select wuid,wu_user,u_name,wu_name,wu_pic,wu_xjcd,jzarea,addtime,hop_wpname,clicknum,(select count(*) from huan_info where wu_zid=wuid or wu_bid=wuid) as jhnum from wu_info,u_info where wu_user=u_id and wu_name like '%" + Request.QueryString["ss"].ToString() + "%' order by addtime desc";
        }

        DS = SqlObj.ExecuteDataSet(SqlStr);
        PDSource.DataSource = DS.Tables[0].DefaultView;
        PDSource.AllowPaging = true;//允不允许分页
        PDSource.PageSize = 6;
        if (Request.QueryString["page"] == null || Request.QueryString["page"].ToString() == "")
        {

            CurrPage = 1;
        }
        else
        {
            CurrPage = int.Parse(Request.QueryString["page"].ToString());
        }
        PDSource.CurrentPageIndex = CurrPage-1;
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
