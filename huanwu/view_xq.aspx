<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="view_xq.aspx.cs" Inherits="view_xq" Title="查看需求" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="840" border="0" cellpadding="0" cellspacing=1 bgcolor="#cdcdcd">
    <tr bgcolor="#f5f5f5">
      <td align="left" style="padding-left:5px;padding-top:6px;" valign="top">
        <asp:FormView ID="FormView1" Width="100%" DefaultMode="ReadOnly" DataSourceID="sqldatasource1" runat="server">
        <ItemTemplate>

            <div>
                 ※ <span class="span2">特想要：<asp:Label ID="Label12" runat="server" Text='<%# Bind("xq_title")%>' /></span>
            </div>
            <div> 
            <table width="100%" border=0 cellpadding=0 cellspacing=0>
            <tr height="200">
            <td width="60%" align=left valign="top" style="padding-top:15px;padding-left:15px;">
              <div style="padding-bottom:8px;">
                <span class="span12">特想要：</span>
                <asp:Label ID="Label13" CssClass="span13" runat="server" Text='<%# Bind("xq_title")%>' />
              </div>
              <div style="padding-bottom:15px;">
                <span class="span12">具体说明：</span>
                <div style="padding-top:8px;padding-left:5px;">
                <asp:Label ID="Label14" CssClass="span13" runat="server" Text='<%# Bind("xq_nr")%>' />
                </div>     
              </div>
              <div style="padding-bottom:15px;">  
                <span class="span12">回复数：</span>
                <asp:Label ID="Label5" CssClass="span13" runat="server" Text='<%# Bind("plnum")%>' />
              </div>                  
              <div style="padding-bottom:25px;">  
                <span class="span12">发布时间：</span>
                <asp:Label ID="Label16" CssClass="span13" runat="server" Text='<%# Bind("xq_date","{0:yyyy-MM-dd}")%>' />
              </div>                     
            </td>
            <td width="30%" align=left valign="top" style="padding-top:10px;">
              <div style="padding-bottom:6px;width:200px;height:200px;background-color:White;padding-left:8px;">
                <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# Eval("xq_user","view_user.aspx?id={0}") %>'  runat="server">
                  <asp:Image ID="Image2" ImageUrl='<%# Bind("face","userpic/{0}")%>' width="120" height="120" runat="server" />
                </asp:HyperLink>

                <div style="padding-top:8px;">
                <span class="span8">货主：</span>
                <asp:HyperLink ID="HyperLink3" CssClass="a11" runat="server" Text='<%# Bind("u_name")%>' NavigateUrl='<%# Bind("xq_user","view_hk.aspx?id={0}")%>' />
                </div>
                <div style="padding-top:8px;">
                  <span class="span8">所在地：</span>
                  <asp:Label ID="Label8" CssClass="span13" runat="server" Text='<%# Bind("jzarea")%>' />
                </div>
              </div>    
            </td>
          </tr>
          </table></div>            
        </ItemTemplate>
        </asp:FormView>
      </td>
    </tr>
    </table>
    <br />
    <table width="840" border="0" cellpadding="0" cellspacing=1 bgcolor="#cdcdcd">
    <tr bgcolor="#f5f5f5">
      <td align="left" style="padding-left:5px;padding-top:6px;" valign="top">
        <div>※ <asp:Label ID="Label11" CssClass="span2" runat="server" Text="对该需求的相关回复" /></div> 
        <div style="padding-left:10px;padding-top:10px;">
          <asp:GridView Width="98%" ID="GridView2" SkinID="mygrid1" DataSourceID="sqldatasource2" runat="server" GridLines="Horizontal" EmptyDataText="暂无记录" AutoGenerateColumns="False" CellPadding="4">
            <Columns>
              <asp:HyperLinkField DataTextField="u_name"  ControlStyle-CssClass="a5" DataNavigateUrlFields="ly_user" DataNavigateUrlFormatString="view_hk.aspx?id={0}" >
                <ItemStyle Width="100px" />
              </asp:HyperLinkField>
              <asp:BoundField DataField="ly_nr">
                <ItemStyle Width="400px" />
              </asp:BoundField>
              <asp:BoundField DataField="ly_date" DataFormatString="{0:yy-MM-dd hh:mm:ss}" HtmlEncode="False" />
            </Columns>
          </asp:GridView>
        </div>
      </td>
    </tr>
    </table>
    <br />
    <table width="840" border="0" cellpadding="0" cellspacing=1 bgcolor="#cdcdcd">
    <tr bgcolor="#f5f5f5">
      <td align="left" style="padding-left:5px;padding-top:6px;" valign="top">
        <div>※ <asp:Label ID="Label12" CssClass="span2" runat="server" Text="立即回应需求" /></div> 
        <div style="padding-left:15px;padding-top:10px;">
          <asp:FormView ID="FormView2" DataSourceID="sqldatasource3" runat="server" DefaultMode="insert" OnItemInserted="FormView2_Inserted" OnItemInserting="FormView2_Inserting">
          <InsertItemTemplate>
              <asp:TextBox id="textbox1" text='<%#Bind("lycontent") %>' TextMode="multiline" Rows="6" Columns="80" 
runat="server" />
            <center>
              <asp:Button ID="Button1" CommandName="insert" runat="server" Text="回应需求" />
            </center>                  
          </InsertItemTemplate>
          </asp:FormView>  
        </div>
      </td>
    </tr>
    </table>    
    
    <asp:SqlDataSource 
        id="SqlDataSource1" 
        runat="server" 
        SelectCommand="select id,xq_user,xq_title,xq_nr,xq_date,(select isnull(count(*),0) from u_ly where xq_id=xq_info.id) as plnum,u_name,jzarea,face from xq_info,u_info where xq_user=u_id "
        FilterExpression="id={0}" 
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
     <FilterParameters>
       <asp:QueryStringParameter Name="id" QueryStringField="id" /> 
     </FilterParameters>   
  </asp:SqlDataSource>
  
    <asp:SqlDataSource 
        id="SqlDataSource2" 
        runat="server" 
        SelectCommand="select ly_user,u_name,ly_nr,ly_date from u_ly,u_info where ly_user=u_id and xq_id=@xqid order by ly_date desc"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
     <SelectParameters>
        <asp:QueryStringParameter Name="xqid" QueryStringField="id" />      
     </SelectParameters> 
  </asp:SqlDataSource>
  
    <asp:SqlDataSource 
        id="SqlDataSource3" 
        runat="server" 
        InsertCommand="insert into u_ly(ly_user,ly_nr,to_lyr,xq_id) values(@lyr,@lycontent,@tolyr,@xqid)" 
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
      <InsertParameters>
        <asp:QueryStringParameter Name="xqid" QueryStringField="id" />
        <asp:Parameter Name="lyr" />
        <asp:Parameter Name="tolyr" />
      </InsertParameters>
  </asp:SqlDataSource>    

</asp:Content>

