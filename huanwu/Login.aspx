<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Title="用户登录" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="900px" border="0">
    <tr style="height:50px;"> 
        <td colspan=2><span class="span2">用户登录</span></td>   
    </tr>
    <tr style="height:35px;">
        <td style="width:45%;padding-right:5px;" align="right">
            <span class="span3">用户名：</span>
        </td>
        <td style="width:55%;padding-left:5px;" align="left">
            <asp:TextBox ID="TextBox1" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="请输入用户名" />
        </td>
    </tr>
    <tr style="height:35px;">
        <td style="padding-right:5px;" align="right">
            <span class="span3">用户密码：</span>
        </td>
        <td style="padding-left:5px;" align="left">
            <asp:TextBox ID="TextBox2" TextMode="Password" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ControlToValidate="TextBox2" runat="server" ErrorMessage="请输入用户密码" />
        </td>
    </tr>    
    <tr style="height:45px;"> 
        <td colspan=2>
            <asp:Button ID="Button2" runat="server" Text="登 录" onclick="Button2_Click" />
        </td>   
    </tr>    
    </table>
    <p>
        <asp:Label ID="Label1" ForeColor="Red" runat="server" Text="" />
    </p>
</asp:Content>

