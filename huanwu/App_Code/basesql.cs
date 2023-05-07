using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

/// <summary>
///basesql 的摘要说明
/// </summary>
public class basesql
{
    public SqlConnection Cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CnnString"].ConnectionString.ToString());//创建数据库连接

    public basesql()
    {

        //
        //TODO: 在此处添加构造函数逻辑
        //
    }

    public void ExecuteNonQuery(string sqlstr)
    {
        Cnn.Open();
        SqlCommand Cmd = new SqlCommand(sqlstr, Cnn);
        Cmd.CommandType = CommandType.Text;
        try
        {
            Cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        finally
        {
            Cnn.Close();
        }
    }

    //'通过ExecuteScalar方法执行指定的SQL语句
    public object ExecuteScalar(string sqlstr)
    {
        Cnn.Open();
        SqlCommand Cmd = new SqlCommand(sqlstr, Cnn);
        Cmd.CommandType = CommandType.Text;
        object RetValue;//创建一个对象，用于存储执行结果
        try
        {
            RetValue = Cmd.ExecuteScalar();
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        finally
        {
            Cnn.Close();
        }
        return RetValue;
    }
    /// <summary>
    /// //5/1/a/s/px
    /// </summary>
    /// <param name="sqlstr"></param>
    /// <returns></returns>
    public SqlDataReader ExecuteReader(string sqlstr)
    {
        Cnn.Open();
        SqlCommand Cmd = new SqlCommand(sqlstr, Cnn);


        SqlDataReader dr;
        dr = Cmd.ExecuteReader(CommandBehavior.CloseConnection);

        return dr;
        Cnn.Close();

    }

    public DataSet ExecuteDataSet(string sqlstr)
    {
        Cnn.Open();
        SqlCommand Cmd = new SqlCommand(sqlstr, Cnn);
        Cmd.CommandType = CommandType.Text;
        SqlDataAdapter da = new SqlDataAdapter(sqlstr, Cnn);
        DataSet ds = new DataSet();

        //        da.SelectCommand = Cmd;
        da.Fill(ds);

        return ds;
        Cnn.Close();

    }

    public string FormatHTML(string fString)//
    {
        fString = fString.Replace(">", "&gt;");
        fString = fString.Replace("<", "&lt;");
        fString = fString.Replace(" ", "&nbsp;");
        fString = fString.Replace("\r\n", "<br />");
        return fString;
    }


}
