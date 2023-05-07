<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="换物首页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="840" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="50%" align="left" style="padding-right:5px;" valign="top">
        <table height="200" border=0 width="100%" cellpadding=0 cellspacing=1 bgcolor="#FFFFFF">
        <tr bgcolor="#FFFFFF" height="200">
          <td style="padding-left:8px;padding-top:5px" valign="top">
            <div>
                 ※ <span class="span2">最新添加物品</span>
            </div>
            <div>
              <asp:GridView ID="GridView1" SkinID="mygrid1" Width="98%" DataSourceID="sqldatasource1" runat="server" EmptyDataText="暂无记录" ShowHeader="false" AutoGenerateColumns="false">
              <Columns>
                <asp:TemplateField>
                  <ItemTemplate>
                    <img src="image/icon1.gif" />
                    <asp:HyperLink ID="HyperLink1" CssClass="a5" Text='<%# Eval("wu_name") %>' NavigateUrl='<%# Eval("wuid","view_hp.aspx?id={0}") %>' runat="server" />
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                  <ItemTemplate>
                    <asp:Label ID="Label1" ForeColor="red" runat="server" Text="要换" />
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="hop_wpname" NullDisplayText="随意吧" />
              </Columns>
              </asp:GridView>            
            </div>
          </td>
        </tr>
        </table>
      </td>
        <td align="left" style="padding-left:6px;" valign="top">
        <table height="200" border=0 width="100%" cellpadding=0 cellspacing=1 bgcolor="#FFFFFF">
        <tr bgcolor="#FFFFFF" height="200">
          <td style="padding-left:8px;padding-top:5px" valign="top">
            <div>
                 ※ <span class="span2">最新需求</span>
            </div>
            <div>
              <asp:GridView ID="GridView5" SkinID="mygrid1" Width="98%" DataSourceID="sqldatasource5" runat="server" EmptyDataText="暂无记录" ShowHeader="false" AutoGenerateColumns="false">
              <Columns>
                <asp:TemplateField>
                  <ItemTemplate>
                    <img src="image/icon1.gif" />
                    <asp:HyperLink ID="HyperLink1" CssClass="a5" Text='<%# Eval("xq_title") %>' NavigateUrl='<%# Eval("id","view_xq.aspx?id={0}") %>' runat="server" />
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataTextField="u_name" ControlStyle-CssClass="a5" DataNavigateUrlFields="xq_user" DataNavigateUrlFormatString="view_hk.aspx?id={0}" />
              </Columns>
              </asp:GridView>          
            </div>
          </td>
        </tr>
        </table>
      </td>
      
     
    </tr>
    <tr height="5">
        <td colspan=3></td>
    </tr>
    <!--
        <tr height="60" bgcolor="#FFFFFF">
      <td colspan=2>

         <marquee direction="left" id="mq" name="mq" scrollamount="3" behavior="scroll" scrolldelay='100' onmouseover=mq.stop() onmouseout=mq.start()>
           <table width="100%" border=0 cellpadding=0 cellspacing=0>
             <tr bgcolor="#FFFFFF">
               <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sqldatasource2">
               <ItemTemplate>
                 <td align="center" style="padding:3px;">
                   <asp:Image ID="Image1" runat="server" ImageUrl='<!%# Eval("wu_pic","wppic/{0}") %>' ToolTip='<!%# Eval("wu_name") %>' Height="80" width=100 /><br />
                   <asp:HyperLink ID="HyperLink1" CssClass="a5" Text='<!%# Eval("wpname") %>' NavigateUrl='<!%# Eval("wuid","view_hp.aspx?id={0}") %>' runat="server" />
                 </td>
              </ItemTemplate>
               </asp:Repeater>             
             </tr>
           </table>
         </marquee> 
      </td>
    </tr> 
      
    -->
   
    <tr height="5">
        <td colspan=3></td>
    </tr>
    <tr>
      <td align="left" style="padding-right:5px;" valign="top">
        <table height="200" border=0 width="100%" cellpadding=0 cellspacing=1 bgcolor="#FFFFFF">
        <tr bgcolor="#FFFFFF" height="200">
          <td style="padding-left:8px;padding-top:5px" valign="top">
            <div>
                 ※ <span class="span2">最新请求交易</span>
            </div>
            <div>
              <asp:GridView ID="GridView3" SkinID="mygrid1" Width="98%" DataSourceID="sqldatasource4" runat="server" EmptyDataText="暂无记录" ShowHeader="false" AutoGenerateColumns="false">
              <Columns>
                <asp:TemplateField>
                  <ItemTemplate>
                    <img src="image/icon1.gif" />
                    <asp:HyperLink ID="HyperLink1" CssClass="a5" Text='<%# Eval("zwpname") %>' NavigateUrl='<%# Eval("wu_zid","view_hp.aspx?id={0}") %>' runat="server" />
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                  <ItemTemplate>
                    <asp:Label ID="Label1" ForeColor="red" runat="server" Text="请求交换" />
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                  <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" CssClass="a5" Text='<%# Eval("bwpname") %>' NavigateUrl='<%# Eval("wu_bid","view_hp.aspx?id={0}") %>' runat="server" />
                  </ItemTemplate>
                </asp:TemplateField>
            
              </Columns>
              </asp:GridView>        
            </div>
          </td>
        </tr>
        </table>
      </td>
      
      <td width="50%" align="left" style="padding-left:6px;" valign="top">
        <table height="200" border=0 width="100%" cellpadding=0 cellspacing=1 bgcolor="#FFFFFF">
        <tr bgcolor="#FFFFFF" height="200">
          <td style="padding-left:8px;padding-top:5px" valign="top">
            <div>
                 ※ <span class="span2">最新成功交易</span>
            </div>
            <div>
              <asp:GridView ID="GridView2" SkinID="mygrid1" Width="98%" DataSourceID="sqldatasource3" runat="server" EmptyDataText="暂无记录" ShowHeader="false" AutoGenerateColumns="false">
              <Columns>
                <asp:TemplateField>
                  <ItemTemplate>
                    <img src="image/icon1.gif" />
                    <asp:HyperLink ID="HyperLink1" CssClass="a5" Text='<%# Eval("zwpname") %>' NavigateUrl='<%# Eval("jhid","view_jh.aspx?jhid={0}") %>' runat="server" />
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                  <ItemTemplate>
                    <asp:Label ID="Label1" ForeColor="red" runat="server" Text="成功交换" />
                  </ItemTemplate>
                </asp:TemplateField> 

                <asp:TemplateField>
                  <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" CssClass="a5" Text='<%# Eval("bwpname") %>' NavigateUrl='<%# Eval("wu_bid","view_hp.aspx?id={0}") %>' runat="server" />
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="jh_enddate" DataFormatString="{0:yy-MM-dd}" HtmlEncode="false" />
              </Columns>
              </asp:GridView>           
            </div>
          </td>
        </tr>
        </table>
      </td>
    </tr>
    
    </table>
    
    <asp:SqlDataSource 
        id="SqlDataSource1" 
        runat="server" 
        SelectCommand="select top 7 * from wu_info order by addtime desc"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
  </asp:SqlDataSource>    

    <!--<asp:SqlDataSource 
        id="SqlDataSource2" 
        runat="server" 
        SelectCommand="select top 10 *,case when len(wu_name)>8 then left(wu_name,6)+'...' else wu_name end as wpname from wu_info where wu_pic <>'' and wu_pic is not null order by addtime desc"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
  </asp:SqlDataSource> -->     
  
  <asp:SqlDataSource 
        id="SqlDataSource3" 
        runat="server" 
        SelectCommand="select top 4 jhid,wu_zid,(select wu_name from wu_info where wuid=wu_zid) as zwpname,wu_bid,(select wu_name from wu_info where wuid=wu_bid) as bwpname,jh_enddate from huan_info where jh_tag='1' order by jh_enddate"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
  </asp:SqlDataSource>
  
  <asp:SqlDataSource 
        id="SqlDataSource4" 
        runat="server" 
        SelectCommand="select top 4 jhid,wu_zid,(select wu_name from wu_info where wuid=wu_zid) as zwpname,wu_bid,(select wu_name from wu_info where wuid=wu_bid) as bwpname from huan_info where jh_tag='0' order by jh_sqdate"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
  </asp:SqlDataSource>
    
    <asp:SqlDataSource 
        id="SqlDataSource5" 
        runat="server" 
        SelectCommand="select top 7 id,xq_title,xq_user,u_name from xq_info,u_info where u_id=xq_user order by xq_date desc"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
  </asp:SqlDataSource>      
</asp:Content>

