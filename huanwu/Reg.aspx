<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Reg.aspx.cs" Inherits="Reg" Title="用户注册" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <table border=0 width="75%" cellpadding=0 cellspacing=1 bgcolor="#cdcdcd">
    <tr bgcolor="#f5f5f5" height="70">
      <td style="padding-left:8px;padding-top:5px" valign="top" align="left">
        <div>※ <span class="span2">用户注册</span></div> 
        <div style="padding-left:10px;padding-top:10px;">
            <asp:FormView ID="FormView1" Width="96%" DataSourceID="sqldatasource1" runat="server" DefaultMode="Insert" OnItemInserting="FormView1_ItemInserting" OnItemInserted="FormView1_ItemInserted">
              <EditItemTemplate>
              <table align=center width="100%" border=0 cellpadding=0 cellspacing=0>
              <tr height=35 >
                <td align=right style="padding-right:8px;">换客名：</td>
                <td align=left >
                  <asp:TextBox ID="hkm" Text='<%# Bind("u_name")%>' runat="server" />
                  <font color="red">*</font>
                </td>
                <td align=left>                   
                  <asp:RequiredFieldValidator ID="Required1" ControlToValidate="hkm" runat="server" ErrorMessage="换客名不可为空！" Display="Dynamic"  />
              <!--    <font color="blue">(4-20个字符，包括小写字母、数字、下划线、中文)</font>   -->               
                </td>
              </tr>
              <tr height=35 >
                <td align=right style="padding-right:8px;">
                  换客密码：
                </td>
                <td align=left >
                  <asp:TextBox ID="pwd" Text='<%# Bind("u_pwd")%>' TextMode="password" runat="server" />
                  <font color="red">*</font>
                </td>
                <td align=left>                   
                  <asp:RequiredFieldValidator ID="Required2" ControlToValidate="pwd" runat="server" ErrorMessage="换客密码不可为空！" Display="Dynamic"/>
                  <font color="blue">(请不要与换客名相同)</font>
                </td>
              </tr>
              <tr height=35 >
                <td align=right style="padding-right:8px;">
                  再输一次密码：
                </td>
                <td align=left>
                  <asp:TextBox ID="repwd" TextMode="password" runat="server" />
                  <font color="red">*</font>
                </td>
                <td align=left>                  
                  <asp:CompareValidator ID="Compare1" runat="server" ControlToValidate="repwd" ControlToCompare="pwd" ErrorMessage="重复密码不匹配！" Display="Dynamic"/>
                  <font color="blue">(请再输入一遍您上面输入的密码)</font>                  
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
               <!--<font color="blue">(建议使用搜狐、网易或新浪邮箱)</font>-->
                </td>
              </tr>
              <tr height=35 >
                <td align=right style="padding-right:8px;">自选头像：</td>
                <td align=left>
                  <asp:FileUpload ID="face" runat="server" />
                </td>
                <td align=left>
                  (在此可选择自定义的头像)
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
                  (您的邮政编码，如430101)
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
                  <asp:Button ID="submit" CommandName="insert" runat="server" Text="提交" />
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
        InsertCommand="insert into u_info(u_name,u_pwd,jzarea,jzaddr,zipcode,tel,email,face,memo) values(@u_name,@u_pwd,@jzarea,@jzaddr,@zipcode,@tel,@email,@face,@memo)"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
    <InsertParameters>
      <asp:Parameter Name="face" DefaultValue="none.gif" />
    </InsertParameters>    
  </asp:SqlDataSource>    
</asp:Content>

