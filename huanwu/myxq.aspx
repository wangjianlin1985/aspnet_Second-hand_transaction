<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="myxq.aspx.cs" Inherits="myxq" Title="我的需求" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   <table border=0 width="100%" cellpadding=0 cellspacing=1 bgcolor="#cdcdcd">
    <tr bgcolor="#f5f5f5" height="70">
      <td style="padding-left:8px;padding-top:5px" valign="top">
        <div>※ <span class="span2">我的需求</span></div> 
        <div style="padding-left:10px;padding-top:10px;padding-bottom:8px;">
          <asp:GridView ID="GridView1" SkinID="mygrid" Width="98%" DataKeyNames="id" AutoGenerateColumns="False" DataSourceID="sqldatasource1" runat="server" AllowPaging="True" PageSize="12">
            <Columns>
              <asp:BoundField DataField="id" HeaderText="编号" >
                <ItemStyle HorizontalAlign="Center" />
              </asp:BoundField>
              <asp:HyperLinkField DataNavigateUrlFields="id" ControlStyle-CssClass="a2" DataNavigateUrlFormatString="view_xq.aspx?id={0}"
                DataTextField="xq_title" HeaderText="我想要" />
              <asp:BoundField DataField="xq_date" HeaderText="发布时间" >
                <ItemStyle HorizontalAlign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="lynum" HeaderText="留言数" >
                <ItemStyle HorizontalAlign="Center" />
              </asp:BoundField>
              <asp:CommandField HeaderText="删除" ShowDeleteButton="True" >
                <ItemStyle HorizontalAlign="Center" />
              </asp:CommandField>
            </Columns>
          </asp:GridView>
        </div>
      </td>
    </tr>
    </table>    
  <asp:SqlDataSource 
        id="SqlDataSource1"
        runat="server"
        SelectCommand="select id,xq_user,xq_title,xq_nr,xq_date,(select count(*) from u_ly where xq_id=xq_info.id) as lynum from xq_info where xq_user=@userid order by id"
        DeleteCommand="delete from xq_info where id=@id;delete from u_ly where xq_id=@id" 
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
     <SelectParameters>
       <asp:Parameter Name="userid" />
     </SelectParameters>   
  </asp:SqlDataSource>
</asp:Content>

