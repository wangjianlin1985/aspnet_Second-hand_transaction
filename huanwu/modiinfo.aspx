<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="modiinfo.aspx.cs" Inherits="modiinfo" Title="修改个人资料" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   <table border=0 width="100%" cellpadding=0 cellspacing=1 bgcolor="#cdcdcd">
    <tr bgcolor="#f5f5f5" height="70">
      <td style="padding-left:8px;padding-top:5px" valign="top">
        <div>※ <span class="span2">修改个人资料</span></div> 
        <div style="padding-left:10px;padding-top:10px;">
            <asp:FormView ID="FormView1" Width="96%" DataKeyNames="u_id" DataSourceID="sqldatasource1" runat="server" DefaultMode="edit" OnItemUpdating="FormView1_ItemUpdating">
              <EditItemTemplate>
              <table align=center width="100%" border=0 cellpadding=0 cellspacing=0>
              <tr height=35 >
                <td align=right style="padding-right:8px;">换客名：</td>
                <td colspan=2 align=left >
                  <asp:Label ID="Label2" ForeColor="red" runat="server" Text='<%# Bind("u_name") %>' />
                </td>
              </tr>
              <tr height=35 >
                <td width="15%" align=right  style="padding-right:8px;">电子邮件：</td>
                <td width="40%" align=left >
                  <asp:TextBox ID="email" Text='<%# Bind("email")%>' runat="server" />
                  <font color="red">*</font>
                </td>
                <td width="45%" align=left>
                <asp:RequiredFieldValidator ID="Required3" ControlToValidate="email" runat="server" ErrorMessage="电子邮件不可为空！" Display="Dynamic"/>
                <font color="blue">(建议使用搜狐、网易或新浪邮箱)</font>
                </td>
              </tr>
              <tr height=35 >
                <td align=right style="padding-right:8px;">自选头像：</td>
                <td align=left>
                  <asp:FileUpload ID="face" runat="server" /><br />
                  当前头像：<asp:Label ID="Label1" runat="server" ForeColor="red" Text='<%# Bind("face")%>' />
                </td>
                <td align=left>
                  (在此可更换自定义的头像)
                </td>
              </tr>
              <tr height=35 >
                <td align=right style="padding-right:8px;">居住区域：</td>
                <td align=left>
                  <asp:TextBox ID="area" Text='<%# Bind("jzarea")%>' runat="server" />
                </td>
                <td align=left>
                  (您的居住区域，如湖南长沙)
                </td>
              </tr>
              <tr height=35 >
                <td align=right style="padding-right:8px;">居住地址：</td>
                <td align=left>
                  <asp:TextBox ID="addr" Text='<%# Bind("jzaddr")%>' Width="220" runat="server" />
                </td>
                <td align=left>
                  (您的居住地址)
                </td>
              </tr>
              <tr height=35 >
                <td align=right  style="padding-right:8px;">邮政编码：</td>
                <td align=left>
                  <asp:TextBox ID="zipcode" Text='<%# Bind("zipcode")%>' runat="server" />
                </td>
                <td align=left>
                  (您的邮政编码，如430100)
                </td>
              </tr>
              <tr height=35 >
                <td align=right style="padding-right:8px;">联系电话：</td>
                <td align=left>
                  <asp:TextBox ID="tel" Text='<%# Bind("tel")%>' runat="server" />
                </td>
                <td align=left>
                  <font color="blue">(未经您许可下，联系电话不会向他人公开)</font>
                </td>
              </tr>
              <tr height=35 >
                <td align=right valign=top style="padding-right:8px;" >换客宣言：</td>
                <td align=left colspan=2>
                  <font color="blue">请输入您的换客宣言，以便吸引更多的人关注</font><br />
                  <asp:TextBox ID="hkxy" Rows="5" Text='<%# Bind("memo")%>' Columns="50" TextMode="MultiLine" runat="server" />
                </td>
              </tr>
              <tr height=35 >
                <td colspan=3 align=center>
                  <asp:Button ID="submit" CommandName="update" runat="server" Text="提交" />
                </td>
              </tr>  
              </table>
              </EditItemTemplate>
              </asp:FormView>
        </div>
      </td>
    </tr>
    </table>    
  <asp:SqlDataSource 
        id="SqlDataSource1" 
        runat="server" 
        SelectCommand="select * from u_info where u_id=@u_id"
        UpdateCommand="update u_info set jzarea=@jzarea,jzaddr=@jzaddr,zipcode=@zipcode,tel=@tel,email=@email,face=@face,memo=@memo where u_id=@u_id"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
    <SelectParameters>
      <asp:Parameter Name="u_id" />    
    </SelectParameters>
    <UpdateParameters>
      <asp:Parameter Name="face" Type="string" />
    </UpdateParameters>
  </asp:SqlDataSource>    
</asp:Content>

