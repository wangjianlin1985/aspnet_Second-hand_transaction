<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="xqfb.aspx.cs" Inherits="xqfb" Title="发布需求" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   <table border=0 width="100%" cellpadding=0 cellspacing=1 bgcolor="#cdcdcd">
    <tr bgcolor="#f5f5f5" height="70">
      <td style="padding-left:8px;padding-top:5px" valign="top">
        <div>※ <span class="span2">发布新的需求</span></div> 
        <div style="padding-left:10px;padding-top:10px;">
            <asp:FormView ID="FormView1" DataSourceID="sqldatasource1" runat="server" DefaultMode="insert" OnItemInserting="FormView1_ItemInserting">
              <InsertItemTemplate>
              <table align=center width="620" height="350" border=0 cellpadding=0 cellspacing=0>
              <tr height="35">
                <td width="140" align="right" style="padding-right:8px;">我特想要：(<font color="red">*</font>)：</td>
                <td width="480" align="left">
                  <asp:TextBox ID="title" Text='<%# Bind("title")%>' Width="270" runat="server" />
                  <asp:RequiredFieldValidator ID="Required1" ControlToValidate="title"
                    runat="server" ErrorMessage="我想要的输入不可为空" />
                </td>
              </tr>
              <tr height="35">
                <td align="right" valign="top" style="padding-right:8px;">具体说明：(<font color="red">*</font>)：</td>
                <td align="left" >
                  <asp:TextBox ID="content" Rows="16" Text='<%# Bind("content")%>' Columns="48" TextMode="MultiLine" runat="server" />
                </td>
              </tr>
              <tr height="30">
                <td colspan=2 align=center style="padding-top:8px;padding-bottom:8px;">
                  <asp:Button ID="Button1" CommandName="insert" runat="server" Text="提 交" />
                </td>
              </tr>
              </table>
              </InsertItemTemplate>
              </asp:FormView>
        </div>
      </td>
    </tr>
    </table>    
    <asp:SqlDataSource 
        id="SqlDataSource1" 
        runat="server" 
        InsertCommand="insert into xq_info(xq_user,xq_title,xq_nr) values(@userid,@title,@content)"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
        <InsertParameters >
          <asp:Parameter Name="userid" />
        </InsertParameters>
  </asp:SqlDataSource>
</asp:Content>

