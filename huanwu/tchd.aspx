﻿
<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="tchd.aspx.cs" Inherits="tchd" Title="同城活动" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="StyleSheet/tchd.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
    <div class="article">   
    </div>
    <div class="side">
    </div>
    </div>

   
    <table width="940" border="0" cellpadding="0" cellspacing="1" >
    <tr bgcolor="white">
      <td align="left" style="padding-left:5px;padding-top:6px;" valign="top">
        <div>▃▅█ <asp:Label ID="Label4" CssClass="span2" runat="server" Text="同城活动" /></div> 
        <div style="padding-left:10px;padding-top:10px;">
      <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>
          <table width="97%" border=0 cellpadding=0 cellspacing=0>
        </HeaderTemplate>
        <ItemTemplate>
          <tr height="130">
            <td width="16%" valign="top" style="padding-top:8px;">
              <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Bind("hd_id","view_tc.aspx?hd_id={0}")%>'>
                <asp:Image ID="Image1" ImageUrl='<%# Bind("Face","userpic/{0}")%>' width="112" height="106" runat="server" BorderStyle="Double" BorderColor="#e3e3e3" BorderWidth="2px" />
              </asp:HyperLink> 
            </td>
            <td width="35%" align=left valign="top" style="padding-top:8px;padding-right:30px;">
              <div style="padding-bottom:5px;">
                <span class="span22">活动名称：</span>
                <asp:HyperLink ID="HyperLink3" CssClass="a22" runat="server" Text='<%# Bind("hd_name")%>' NavigateUrl='<%# Bind("hd_id","view_tc.aspx?hd_id={0}")%>' />
              </div>
              <div style="padding-bottom:6px;">
                <span class="span12">发布者：</span>
                    <asp:HyperLink ID="HyperLink2" CssClass="a12" runat="server" Text='<%# Bind("u_name")%>' NavigateUrl='<%# Bind("host_id","view_hk.aspx?id={0}")%>' />
              </div>
                  <div style="padding-bottom:6px;">  
                <span class="span12">活动时间：</span>

                <asp:Label ID="Label7" CssClass="span12" runat="server" Text='<%# Bind("hd_time","{0:yyyy-MM-dd}")%>' />
              </div>  

            </td>
            <td width="35%" align=left valign="top" style="padding-top:8px;">
              <div style="padding-bottom:6px;">
                <span class="span23">城市：</span>
                <asp:Label ID="Label8" CssClass="span21" runat="server" Text='<%# Bind("City_Name")%>' />
              </div>
                <div style="padding-bottom:6px;">
                <span class="span12">活动详情：</span>
                <asp:Label ID="Label2" CssClass="span13" runat="server" Text='<%# Bind("hd_details")%>' />
                </div>


            </td>
            <td width="15%" align=left valign="top" style="padding-top:8px;">
                <div style="padding-bottom:6px;">
                <span class="span23">当前参与者：</span>
                <asp:Label ID="Label13" CssClass="span13" runat="server" Text='<%# Bind("ppl_counts")%>' />
                </div>
            </td>
          </tr>
        </ItemTemplate>
        <SeparatorTemplate>
          <tr height="1" bgcolor="#cdcdcd"><td colspan="4"></td></tr>
        </SeparatorTemplate>  
        <FooterTemplate>
          </table>
        </FooterTemplate>
      </asp:Repeater>
      </div>
      <p align=center class="foot">
          共 <asp:Label ID="SumNum" ForeColor="red" runat="server" Text="" /> 条记录
          &nbsp;&nbsp;
          当前<asp:Label ID="CPage" runat="server" ForeColor="red" Text="" />/<asp:Label ID="SumPage" runat="server" Text="" />页
          &nbsp;&nbsp;
          <asp:HyperLink ID="fpage" runat="server" Text="首页" />&nbsp;&nbsp;
          <asp:HyperLink ID="ppage" runat="server" Text="<" />&nbsp;&nbsp;
          <asp:HyperLink ID="npage" runat="server" Text=">" ToolTip="下一页" />&nbsp;&nbsp;
          <asp:HyperLink ID="epage" runat="server" Text="末页" />
      </p>
      </td>
    </tr>
    
    </table>




</asp:Content>
