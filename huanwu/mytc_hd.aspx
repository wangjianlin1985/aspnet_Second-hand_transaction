<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="mytc_hd.aspx.cs" Inherits="mytc_hd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   <table border=0 width="100%" cellpadding=0 cellspacing=1 bgcolor="#cdcdcd">
    <tr bgcolor="#f5f5f5" height="70">
      <td style="padding-left:8px;padding-top:5px" valign="top">
        <div>※ <span class="span2">我的活动</span></div> 
        <div style="padding-left:10px;padding-top:10px;padding-bottom:8px;">
          <asp:GridView ID="GridView1" SkinID="mygrid" Width="98%" DataKeyNames="hd_id" AutoGenerateColumns="False" DataSourceID="sqldatasource1" runat="server" AllowPaging="True" PageSize="10">
            <Columns>
              <asp:BoundField DataField="hd_id" HeaderText="活动编号" >
                <ItemStyle HorizontalAlign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="hd_name" HeaderText="活动名称" >
                <ItemStyle HorizontalAlign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="hd_title" HeaderText="活动主题" >
                <ItemStyle HorizontalAlign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="hd_time" HeaderText="活动时间" >
                <ItemStyle HorizontalAlign="Center" />
              </asp:BoundField>
              <asp:BoundField DataField="ppl_counts" HeaderText="参与人数" >
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
        SelectCommand="select hd_id,host_id,U_Name,City_Name,hd_name,Face,hd_title,hd_details,hd_time,ppl_counts from tchd_info,U_Info,CS_info where CityID=city_id and u_id=host_id and host_id=@userid"
        DeleteCommand="delete from tchd_info where hd_id=@hd_id;" 
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
    <SelectParameters>
      <asp:Parameter Name="userid" />
    </SelectParameters>
  </asp:SqlDataSource>
</asp:Content>

