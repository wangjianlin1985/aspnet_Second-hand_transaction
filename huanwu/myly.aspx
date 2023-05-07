<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="myly.aspx.cs" Inherits="myly" Title="我的留言" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table border=0 width="100%" cellpadding=0 cellspacing=1 bgcolor="#cdcdcd">
    <tr bgcolor="#f5f5f5" height="70">
      <td style="padding-left:8px;padding-top:5px" valign="top">
        <div>※ <span class="span2">我的留言</span></div> 
        <div style="padding-left:10px;padding-top:10px;">
      <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>
          <table width="97%" border=0 cellpadding=0 cellspacing=0>
        </HeaderTemplate>
        <ItemTemplate>
          <tr>
            <td width="18%" valign="top" style="padding-top:8px;padding-bottom:8px;">
              <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Bind("ly_user","view_hk.aspx?id={0}")%>'>
                <asp:Image ID="Image1" ImageUrl='<%# Bind("face","userpic/{0}")%>' width="95" height="90" runat="server" />
              </asp:HyperLink> 
            </td>
            <td width="82%" align=left valign="top" style="padding-top:8px;padding-bottom:8px;">
              <div style="padding-bottom:8px;">
                <span class="span12">留言人：</span>
                <asp:HyperLink ID="HyperLink3" CssClass="a11" runat="server" Text='<%# Bind("u_name")%>' NavigateUrl='<%# Bind("ly_user","view_hk.aspx?id={0}")%>' />
              </div>
              <div style="padding-bottom:8px;">
                <span class="span12">留言时间：</span>
                <asp:Label ID="Label2" CssClass="span13" runat="server" Text='<%# Bind("ly_date","{0:yyyy-MM-dd hh:mm:ss}")%>' />
              </div>
              <asp:PlaceHolder ID="PlaceHolder1" runat="server" Visible='<%# ((Eval("wu_id").ToString()=="")?false:true) %>'>
                  <div style="padding-bottom:8px;">  
                    <span class="span12">针对换品：</span>
                    <asp:Label ID="Label7" CssClass="span13" runat="server" Text='<%# Bind("wuname")%>' />
                  </div>                  
              </asp:PlaceHolder>
              <asp:PlaceHolder ID="PlaceHolder2" runat="server" Visible='<%# ((int.Parse(Eval("xq_id").ToString())==0)?false:true) %>'>
                  <div style="padding-bottom:8px;">  
                    <span class="span12">针对需求：</span>
                    <asp:Label ID="Label1" CssClass="span13" runat="server" Text='<%# Bind("xq")%>' />
                  </div>                  
              </asp:PlaceHolder>
              <div style="padding-bottom:8px;">
                <span class="span12">留言内容：</span>
              </div>              
              <div style="padding-bottom:5px;padding-left:15px;">
                <asp:Label ID="Label5" CssClass="span13" runat="server" Text='<%# Bind("ly_nr")%>' />
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
      <p align=center>
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

