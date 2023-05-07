<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="view_tc.aspx.cs" Inherits="view_tc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="view_hp_main">
        <div class="view_hp_left">
   <asp:FormView ID="FormView1" Width="100%"  DataSourceID="sqldatasource1" runat="server">
    <ItemTemplate>
    <table width="960" border="0" cellpadding="0" cellspacing="1">
    <tr>
    <td>
    <div>
        ※ <span class="span22">同城活动</span>
    </div>
    </td>
    </tr>
    <tr>
    <td width="20%">
        <asp:Image ID="Image1" ImageUrl='<%# Bind("Face","userpic/{0}")%>' width="112" height="106" runat="server" BorderStyle="Double" BorderColor="#e3e3e3" BorderWidth="2px" />
    </td>
    <td width="40%">
    <div style="padding-bottom: 8px;">
    <span class="span12">活动名称：</span>
    <asp:Label ID="Label14"  runat="server" Text='<%# Bind("hd_name")%>' />
    </div>
    <div style="padding-bottom: 8px;">
    <span class="span12">发起人：</span>
    <asp:Label ID="Label5"  runat="server" Text='<%# Bind("hd_name")%>' />
    </div>
    <div style="padding-bottom: 8px;">
    <span class="span12">城市：</span>
    <asp:Label ID="Label2" runat="server" Text='<%# Bind("hd_name")%>'></asp:Label>
    </div>
    <div style="padding-bottom: 8px;">
    <span class="span12">活动主题：</span>
    <asp:Label ID="Label4" runat="server" Text='<%# Bind("hd_title")%>'></asp:Label>
    </div> 
 
    <div style="padding-bottom: 8px;">
    <span class="span12">活动时间：</span>
    <asp:Label ID="Label1" runat="server" Text='<%# Bind("hd_time")%>'></asp:Label>
    </div>
    <div style="padding-bottom: 8px;">
    <span class="span12">参与人数：</span>
    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ppl_counts")%>'></asp:Label>
    </div>
    </td>
    <td>
    <div style="padding-bottom: 2px;">
        <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" ImageUrl="image/BM.png" BorderStyle="None" />

    </div>
    </td>
    </tr>
    <tr>
    <td colspan="3">
    <div style="padding-bottom: 8px;">
    <span class="span12">活动详情：</span>
    <div style="padding-top: 6px; padding-left: 5px;">
    <asp:Label ID="Label6" runat="server" Text='<%# Bind("hd_details")%>'></asp:Label></div>
    </div>  
    </td>
    </tr>
    </table>
    
    </ItemTemplate>
    
    </asp:FormView>
    
    </div>
    </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="select hd_id,host_id,U_Name,City_Name,hd_name,Face,hd_title,hd_details,hd_time,ppl_counts from tchd_info,U_Info,CS_info where CityID=city_id and u_id=host_id"
        FilterExpression="hd_id={0}" ConnectionString="<%$ ConnectionStrings:CnnString%>">
        <FilterParameters>
            <asp:QueryStringParameter Name="hd_id" QueryStringField="hd_id" />
        </FilterParameters>
    </asp:SqlDataSource>
</asp:Content>
