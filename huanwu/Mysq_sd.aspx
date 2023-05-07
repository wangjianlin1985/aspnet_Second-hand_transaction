<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Mysq_sd.aspx.cs" Inherits="Mysq_sd" Title="我收到的申请" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

   <table border=0 width="100%" cellpadding=0 cellspacing=1 bgcolor="#cdcdcd">
    <tr bgcolor="#f5f5f5" height="70">
      <td style="padding-left:8px;padding-top:5px" valign="top">
        <div>※ <span class="span2">我收到的申请</span></div> 
        <div style="padding-left:10px;padding-top:10px;padding-bottom:8px;">
          <asp:GridView ID="GridView1" SkinID="mygrid" Width="98%" DataKeyNames="jhid" AutoGenerateColumns="False" DataSourceID="sqldatasource1" runat="server" AllowPaging="True" PageSize="12" OnRowCommand="GridView1_RowCommand">
            <Columns>
              <asp:HyperLinkField DataTextField="jhid" ControlStyle-CssClass="a2" DataNavigateUrlFields="jhid" DataNavigateUrlFormatString="view_jh.aspx?jhid={0}" HeaderText="交换编号">
                <ItemStyle HorizontalAlign="Center" />
              </asp:HyperLinkField>  
              <asp:TemplateField HeaderText="交换详情">
                <ItemTemplate>
                  <asp:HyperLink ID="HyperLink1" CssClass="a2" Text='<%# Eval("u_name") %>' NavigateUrl='<%# Eval("u_id","view_hk.aspx?id={0}") %>' runat="server" />&nbsp;
                  <font color="red">请求用</font>&nbsp;
                  <asp:HyperLink ID="HyperLink2" CssClass="a2" Text='<%# Eval("wu_name") %>' NavigateUrl='<%# Eval("wuid","view_hp.aspx?id={0}") %>' runat="server" />&nbsp;
                  <font color="red">交换</font>&nbsp;
                  <asp:Label ID="Label2" runat="server" Text='<%# Eval("wpname1") %>' />
                </ItemTemplate>
              </asp:TemplateField>
              <asp:BoundField DataField="jh_sqdate" HeaderText="请求时间" HtmlEncode="false" DataFormatString="{0:yy-MM-dd}">
                <ItemStyle HorizontalAlign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="jhtag" HeaderText="当前状态" >
                <ItemStyle HorizontalAlign="Center" />
              </asp:BoundField>
              <asp:TemplateField HeaderText="操 作">
                <ItemTemplate>
                  <asp:LinkButton ID="agree" CommandName="agree" CommandArgument='<%# Eval("jhid") %>' runat="server" Text="同意" Visible='<%# ((Eval("jh_tag").ToString()=="0")?true:false) %>' />
                  <asp:LinkButton ID="notagree" CommandName="notagree" CommandArgument='<%# Eval("jhid") %>' runat="server" Text="拒绝" Visible='<%# ((Eval("jh_tag").ToString()=="0")?true:false) %>' />              
                </ItemTemplate>
              </asp:TemplateField>
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
        SelectCommand="select jhid,u_id,u_name,wuid,wu_name,jh_sqdate,jh_tag,(select wu_name from wu_info where wuid=wu_bid) as wpname1,case jh_tag when '0' then '交换中' when '1' then '交换成功' when '2' then '交换失败' end as jhtag from huan_info,wu_info,u_info where wu_zid=wuid and wu_user=u_id and wu_bid in (select wuid from wu_info where wu_user=@userid)"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
     <SelectParameters>
        <asp:Parameter Name="userid" />
     </SelectParameters>
  </asp:SqlDataSource>
</asp:Content>

