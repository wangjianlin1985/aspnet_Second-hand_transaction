<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ss_hp.aspx.cs" Inherits="ss_hp" Title="换品中心" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="940" border="0" cellpadding="0" cellspacing="1" >
    <tr bgcolor="white">
      <td align="left" style="padding-left:5px;padding-top:6px;" valign="top">
        <div>▃▅█ <asp:Label ID="Label4" CssClass="span2" runat="server" Text="" /></div> 
        <div style="padding-left:10px;padding-top:10px;">
      <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>
          <table width="97%" border=0 cellpadding=0 cellspacing=0>
        </HeaderTemplate>
        <ItemTemplate>
          <tr height="130">
            <td width="16%" valign="top" style="padding-top:8px;">
              <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Bind("wuid","view_hp.aspx?id={0}")%>'>
                <asp:Image ID="Image1" ImageUrl='<%# Bind("wu_pic","wppic/{0}")%>' width="112" height="106" runat="server" BorderStyle="Double" BorderColor="#e3e3e3" BorderWidth="2px" />
              </asp:HyperLink> 
            </td>
            <td width="35%" align=left valign="top" style="padding-top:8px;padding-right:30px;">
              <div style="padding-bottom:5px;">
                <span class="span22">待换物品：</span>
                <asp:HyperLink ID="HyperLink3" CssClass="a22" runat="server" Text='<%# Bind("wu_name")%>' NavigateUrl='<%# Bind("wuid","view_hp.aspx?id={0}")%>' />
              </div>
              <div style="padding-bottom:6px;">
                <span class="span12">发布者：</span>
                    <asp:HyperLink ID="HyperLink2" CssClass="a12" runat="server" Text='<%# Bind("u_name")%>' NavigateUrl='<%# Bind("wu_user","view_hk.aspx?id={0}")%>' />
              </div>
             <!-- <div style="padding-bottom:6px;">
                <span class="span23">城市：</span>
                <asp:Label ID="Label8" CssClass="span13" runat="server" Text='<%# Bind("jzarea")%>' />
              </div> -->

            </td>
            <td width="35%" align=left valign="top" style="padding-top:8px;">
                <div style="padding-bottom:6px;">
                <span class="span12">交换意向：</span>
                <asp:Label ID="Label2" CssClass="span21" runat="server" Text='<%# Bind("hop_wpname")%>' />
                </div>
               <!-- <div style="padding-bottom:6px;">  
                <span class="span23">发布时间：</span>

                <asp:Label ID="Label7" CssClass="span13" runat="server" Text='<%# Bind("addtime","{0:yyyy-MM-dd}")%>' />
              </div>  -->
                 <div style="padding-bottom:6px;">
                <span class="span23">城市：</span>
                <asp:Label ID="Label1" CssClass="span13" runat="server" Text='<%# Bind("jzarea")%>' />
              </div>  

            </td>
            <td width="15%" align=left valign="top" style="padding-top:8px;">
                <div style="padding-bottom:6px;">
                <span class="span12">交换数：</span>
                <asp:Label ID="Label3" CssClass="span24" runat="server" Text='<%# Bind("jhnum")%>' />
                </div>
                <div style="padding-bottom:6px;">
                <span class="span23">浏览数：</span>
                <asp:Label ID="Label13" CssClass="span13" runat="server" Text='<%# Bind("clicknum")%>' />
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

