<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ss_hk.aspx.cs" Inherits="ss_hk" Title="换客中心" %>

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
            <td width="15%" valign="top" style="padding-top:8px;">
              <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Bind("u_id","view_hk.aspx?id={0}")%>'>
                <asp:Image ID="Image1" ImageUrl='<%# Bind("face","userpic/{0}")%>' width="112" height="106" runat="server" BorderStyle="Double" BorderColor="#e3e3e3" BorderWidth="2px" />
              </asp:HyperLink> 
            </td>
            <td width="30%" align=left valign="top" style="padding-top:8px;">
              <div style="padding-bottom:5px;">
                <span class="span12">换客名称：</span>
                <asp:HyperLink ID="HyperLink3" CssClass="a12" runat="server" Text='<%# Bind("u_name")%>' NavigateUrl='<%# Bind("u_id","view_hk.aspx?id={0}")%>' />
              </div>
              <div style="padding-bottom:6px;">
                <span class="span12">所在地：</span>
                <asp:Label ID="Label1" CssClass="span13" runat="server" Text='<%# Bind("jzarea")%>' />
              </div>
              <div style="padding-bottom:6px;">  
                <span class="span12">电子邮箱：</span>
                <asp:Label ID="Label5" CssClass="span13" runat="server" Text='<%# Bind("email")%>' />
              </div>                  

            </td>
            <td width="35%" align=left valign="top" style="padding-top:8px;padding-right:8px;">
                <div style="padding-bottom:6px;">
                <span class="span12">发布换品：</span>
                <asp:Label ID="Label2" CssClass="span13" runat="server" Text='<%# Bind("hps")%>' />
                </div>
                <div style="padding-bottom:6px;">
                <span class="span12">发布需求：</span>
                <asp:Label ID="Label8" CssClass="span13" runat="server" Text='<%# Bind("xqs")%>' />
                </div>
                <div style="padding-bottom:4px;">
                <span class="span12">交换宣言：</span>
                <asp:Label ID="Label10" CssClass="span13" runat="server" Text='<%# Bind("memo")%>'/>
                </div>                
            </td>
         <!--   <td width="18%" align=left valign="top" style="padding-top:8px;">
                <div style="padding-bottom:6px;">
                <span class="span12">注册时间：</span>
                <asp:Label ID="Label7" CssClass="span13" runat="server" Text='<%# Bind("regtime","{0:yyyy-MM-dd}")%>' />
                </div>
                <div style="padding-bottom:6px;">
                <span class="span12">最后登录：</span>
                <asp:Label ID="Label3" CssClass="span13" runat="server" Text='<%# Bind("lastlogin","{0:yyyy-MM-dd}")%>' />
                </div>
                <div style="padding-bottom:6px;">
                <span class="span12">登录次数：</span>
                <asp:Label ID="Label9" CssClass="span13" runat="server" Text='<%# Bind("logintimes")%>' />
                </div>
            </td>-->
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

