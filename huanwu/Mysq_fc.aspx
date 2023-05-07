<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Mysq_fc.aspx.cs" Inherits="Mysq_fc" Title="我发出的请求" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   <table border=0 width="100%" cellpadding=0 cellspacing=1 bgcolor="#cdcdcd">
    <tr bgcolor="#f5f5f5" height="70">
      <td style="padding-left:8px;padding-top:5px" valign="top">
        <div>※ <span class="span2">我发出的申请</span></div> 
        <div style="padding-left:10px;padding-top:10px;padding-bottom:8px;">
          <asp:GridView ID="GridView1" SkinID="mygrid" Width="98%" DataKeyNames="jhid" AutoGenerateColumns="False" DataSourceID="sqldatasource1" runat="server" AllowPaging="True" PageSize="12">
            <Columns>
              <asp:HyperLinkField DataTextField="jhid" ControlStyle-CssClass="a2" DataNavigateUrlFields="jhid" DataNavigateUrlFormatString="view_jh.aspx?jhid={0}" HeaderText="交换编号">
                <ItemStyle HorizontalAlign="Center" />
              </asp:HyperLinkField>  
              <asp:TemplateField HeaderText="交换详情">
                <ItemTemplate>
                  您 <font color="red">请求用</font>&nbsp;
                  <asp:Label ID="Label2" runat="server" Text='<%# Eval("wpname1") %>' />交换
                  &nbsp;<asp:HyperLink ID="HyperLink1" CssClass="a2" Text='<%# Eval("u_name") %>' NavigateUrl='<%# Eval("u_id","view_hk.aspx?id={0}") %>' runat="server" />&nbsp;
                  的&nbsp;
                  <asp:HyperLink ID="HyperLink2" CssClass="a2" Text='<%# Eval("wu_name") %>' NavigateUrl='<%# Eval("wuid","view_hp.aspx?id={0}") %>' runat="server" />&nbsp;
                </ItemTemplate>
              </asp:TemplateField>
              <asp:BoundField DataField="jh_sqdate" HeaderText="请求时间" HtmlEncode="false" DataFormatString="{0:yy-MM-dd}">
                <ItemStyle HorizontalAlign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="jhtag" HeaderText="当前状态" >
                <ItemStyle HorizontalAlign="Center" />
              </asp:BoundField>
            </Columns>
            <EmptyDataTemplate>暂无记录</EmptyDataTemplate>
          </asp:GridView>
        </div>
      </td>
    </tr>
    </table>    
  <asp:SqlDataSource 
        id="SqlDataSource1"
        runat="server"
        SelectCommand="select jhid,u_id,u_name,wuid,wu_name,jh_sqdate,(select wu_name from wu_info where wuid=wu_zid) as wpname1,case jh_tag when '0' then '交换中' when '1' then '交换成功' when '2' then '交换失败' end as jhtag from huan_info,wu_info,u_info where wu_bid=wuid and wu_user=u_id and wu_zid in (select wuid from wu_info where wu_user=@userid)"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
     <SelectParameters>
        <asp:Parameter Name="userid" />
     </SelectParameters>
  </asp:SqlDataSource>
</asp:Content>

