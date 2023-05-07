<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="modipwd.aspx.cs" Inherits="modipwd" Title="修改密码" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table border=0 width="100%" cellpadding=0 cellspacing=1 bgcolor="#cdcdcd">
    <tr bgcolor="#f5f5f5" height="70">
      <td style="padding-left:8px;padding-top:5px" valign="top">
        <div>※ <span class="span2">修改登录密码</span></div> 
        <div style="padding-left:10px;padding-top:10px;">
          <table width="50%" border=0 cellpadding=0 cellspacing=0>
          <tr height="28">
            <td width="30%" align="right" style="padding-right:8px;">
              旧密码：
            </td>
            <td width="70%" align=left>
              <asp:TextBox ID="TextBox1" TextMode="Password" runat="server" />
            </td>
          </tr>
          <tr height="28">
            <td align="right" style="padding-right:8px;">
              新密码：
            </td>
            <td align=left>
              <asp:TextBox ID="TextBox2" TextMode="Password" runat="server" />
            </td>
          </tr>
          <tr height="28">
            <td align="right" style="padding-right:8px;">
              重复新密码：
            </td>
            <td align=left>
              <asp:TextBox ID="TextBox3" TextMode="Password" runat="server" />
            </td>
          </tr>
          <tr height="40">
            <td colspan=2 align="center">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="立即提交" />
            </td>
          </tr>
          <tr height="40">
            <td colspan=2 align="center">
                <asp:Label ID="Label1" ForeColor="Red" runat="server" Text="" />
            </td>
          </tr>
          </table>
        </div>
      </td>
    </tr>
    </table>    
</asp:Content>

