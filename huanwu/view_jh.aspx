<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="view_jh.aspx.cs" Inherits="view_jh" Title="物品交换信息" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FormView ID="FormView1" Width="90%" DefaultMode="ReadOnly" DataSourceID="sqldatasource1" runat="server">
    <ItemTemplate>
        <table width="800" border="0" cellpadding="0" cellspacing="0">
        <tr height="40">
            <td colspan=2 style="padding-left:310px;padding-top:20px;" align="left">
              <div style="padding-bottom:12px;">
                <span class="span12">交易编号：</span>
                <asp:Label ID="Label19" CssClass="span6" runat="server" Text='<%# Bind("jhid")%>' />
              </div>
              <div style="padding-bottom:12px;">
                <span class="span12">申请时间：</span>
                <asp:Label ID="Label1" CssClass="span6" runat="server" Text='<%# Bind("jh_sqdate","{0:yyyy-MM-dd}")%>' />              
              </div>
              <div style="padding-bottom:20px;">
                <span class="span12">交易状态：</span>
                <asp:Label ID="Label2" CssClass="span6" runat="server" Text='<%# Bind("jhstate")%>' />              
              </div>
            </td>
        
        </tr>
        
        <tr>
          <td width="50%" align="left" style="padding-right:5px;" valign="top">
            <table height="90" border=0 width="90%" cellpadding=0 cellspacing=1 bgcolor="#cdcdcd">
            <tr bgcolor="#f5f5f5" height="90">
              <td style="padding-left:8px;padding-top:5px" valign="top">
                <div>
                     ※ <span class="span2">货主</span>
                </div>
                <div style="padding-top:10px;">
                    <table width="95%" border=0 cellpadding=0 cellspacing=0>
                    <tr>  
                      <td width="25%" valign="top">
                        <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# Eval("b_uid","view_hk.aspx?id={0}") %>'  runat="server">
                          <asp:Image ID="Image2" ImageUrl='<%# Bind("b_face","userpic/{0}")%>' width="60" height="60" runat="server" />
                        </asp:HyperLink>                      
                      </td>
                      <td width="75%" valign="top">
                        <div style="padding-bottom:8px;">
                          <asp:HyperLink ID="HyperLink3" CssClass="a13" runat="server" Text='<%# Bind("b_uname")%>' NavigateUrl='<%# Bind("b_uid","view_hk.aspx?id={0}")%>' />
                        </div>
                      <!--  <div style="padding-bottom:8px;">
                          <span class="span8">注册时间：</span>
                          <asp:Label ID="Label7" CssClass="span13" runat="server" Text='<%# Bind("b_regtime","{0:yyyy-MM-dd hh:mm:ss}")%>' />
                        </div>-->
                        <div style="padding-bottom:8px;">
                          <span class="span8">最后登录：</span>
                          <asp:Label ID="Label3" CssClass="span13" runat="server" Text='<%# Bind("b_lastlogin","{0:yyyy-MM-dd hh:mm:ss}")%>' />
                        </div>
                        <div style="padding-bottom:5px;">
                          <asp:HyperLink ID="HyperLink4" CssClass="a12" runat="server" Text="[去他/她的换铺看看？]" NavigateUrl='<%# Bind("b_uid","view_hk.aspx?id={0}")%>' />
                        </div>                        
                      </td>
                    </tr>
                    </table>
                </div>
              </td>
            </tr>
            </table>
          </td>
          
          <td width="50%" align="left" style="padding-left:6px;" valign="top">
            <table height="90" border=0 width="90%" cellpadding=0 cellspacing=1 bgcolor="#cdcdcd">
            <tr bgcolor="#f5f5f5" height="90">
              <td style="padding-left:8px;padding-top:5px" valign="top">
                <div>
                     ※ <span class="span2">申请人</span>
                </div>
                <div style="padding-top:10px;">
                    <table width="95%" border=0 cellpadding=0 cellspacing=0>
                    <tr>  
                      <td width="25%" valign="top">
                        <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# Eval("z_uid","view_hk.aspx?id={0}") %>'  runat="server">
                          <asp:Image ID="Image1" ImageUrl='<%# Bind("z_face","userpic/{0}")%>' width="60" height="60" runat="server" />
                        </asp:HyperLink>                      
                      </td>
                      <td width="75%" valign="top">
                        <div style="padding-bottom:8px;">
                          <asp:HyperLink ID="HyperLink5" CssClass="a13" runat="server" Text='<%# Bind("z_uname")%>' NavigateUrl='<%# Bind("z_uid","view_hk.aspx?id={0}")%>' />
                        </div>
                      <!--  <div style="padding-bottom:8px;">
                          <span class="span8">注册时间：</span>
                          <asp:Label ID="Label4" CssClass="span13" runat="server" Text='<%# Bind("z_regtime","{0:yyyy-MM-dd hh:mm:ss}")%>' />
                        </div>-->
                        <div style="padding-bottom:8px;">
                          <span class="span8">最后登录：</span>
                          <asp:Label ID="Label5" CssClass="span13" runat="server" Text='<%# Bind("z_lastlogin","{0:yyyy-MM-dd hh:mm:ss}")%>' />
                        </div>
                        <div style="padding-bottom:5px;">
                          <asp:HyperLink ID="HyperLink6" CssClass="a12" runat="server" Text="[去他/她的换铺看看？]" NavigateUrl='<%# Bind("z_uid","view_hk.aspx?id={0}")%>' />
                        </div>                        
                      </td>
                    </tr>
                    </table>
                </div>

              </td>
            </tr>
            </table>
          </td>
        </tr>
        <tr height="5">
            <td colspan=3></td>
        </tr>
        <tr>
          <td align="left" style="padding-right:5px;" valign="top">
            <table height="90" border=0 width="90%" cellpadding=0 cellspacing=1 bgcolor="#cdcdcd">
            <tr bgcolor="#f5f5f5" height="90">
              <td style="padding-left:8px;padding-top:5px" valign="top">
                <div>
                     ※ <span class="span2">被申请的物品</span>
                </div>
                <div style="padding-top:10px;">
                    <table width="95%" border=0 cellpadding=0 cellspacing=0>
                    <tr>  
                      <td width="25%" valign="top">
                        <asp:HyperLink ID="HyperLink7" NavigateUrl='<%# Eval("wu_bid","view_hp.aspx?id={0}") %>'  runat="server">
                          <asp:Image ID="Image3" ImageUrl='<%# Bind("b_wppic","wppic/{0}")%>' width="60" height="60" runat="server" />
                        </asp:HyperLink>                      
                      </td>
                      <td width="75%" valign="top">
                        <div style="padding-bottom:8px;">
                          <asp:HyperLink ID="HyperLink8" CssClass="a13" runat="server" Text='<%# Bind("wu_bname")%>' NavigateUrl='<%# Bind("wu_bid","view_hp.aspx?id={0}")%>' />
                        </div>
                        <div style="padding-bottom:8px;">
                          <span class="span8">物品新旧：</span>
                          <asp:Label ID="Label6" CssClass="span13" runat="server" Text='<%# Bind("b_xjcd")%>' />
                        </div>
                        <div style="padding-bottom:8px;">
                          <span class="span8">浏览次数：</span>
                          <asp:Label ID="Label8" CssClass="span13" runat="server" Text='<%# Bind("b_clicknum")%>' />
                        </div>
                      </td>
                    </tr>
                    </table>
                </div>

              </td>
            </tr>
            </table>
          </td>
          
          <td align="left" style="padding-left:6px;" valign="top">
            <table height="90" border=0 width="90%" cellpadding=0 cellspacing=1 bgcolor="#cdcdcd">
            <tr bgcolor="#f5f5f5" height="90">
              <td style="padding-left:8px;padding-top:5px" valign="top">
                <div>
                     ※ <span class="span2">用来交换的物品</span>
                </div>
                <div style="padding-top:10px;">
                    <table width="95%" border=0 cellpadding=0 cellspacing=0>
                    <tr>  
                      <td width="25%" valign="top">
                        <asp:HyperLink ID="HyperLink9" NavigateUrl='<%# Eval("wu_zid","view_hp.aspx?id={0}") %>'  runat="server">
                          <asp:Image ID="Image4" ImageUrl='<%# Bind("z_wppic","wppic/{0}")%>' width="60" height="60" runat="server" />
                        </asp:HyperLink>                      
                      </td>
                      <td width="75%" valign="top">
                        <div style="padding-bottom:8px;">
                          <asp:HyperLink ID="HyperLink10" CssClass="a13" runat="server" Text='<%# Bind("wu_zname")%>' NavigateUrl='<%# Bind("wu_zid","view_hp.aspx?id={0}")%>' />
                        </div>
                        <div style="padding-bottom:8px;">
                          <span class="span8">物品新旧：</span>
                          <asp:Label ID="Label9" CssClass="span13" runat="server" Text='<%# Bind("z_xjcd")%>' />
                        </div>
                        <div style="padding-bottom:8px;">
                          <span class="span8">浏览次数：</span>
                          <asp:Label ID="Label10" CssClass="span13" runat="server" Text='<%# Bind("z_clicknum")%>' />
                        </div>
                      </td>
                    </tr>
                    </table>
                </div>
              </td>
            </tr>
            </table>
          </td>
        </tr>
        
        </table>
    </ItemTemplate>
    </asp:FormView>
    
    <asp:SqlDataSource 
        id="SqlDataSource1" 
        runat="server" 
        SelectCommand="select jhid,(select wu_name from wu_info where wuid=wu_zid) as wu_zname,(select wu_pic from wu_info where wuid=wu_zid) as z_wppic,(select face from wu_info,u_info where wuid=wu_zid and wu_user=u_id) as z_face,(select wu_user from wu_info where wuid=wu_zid) as z_uid,(select wu_xjcd from wu_info where wuid=wu_zid) as z_xjcd,(select clicknum from wu_info where wuid=wu_zid) as z_clicknum,(select u_name from wu_info,u_info where wuid=wu_zid and wu_user=u_id) as z_uname,(select regtime from wu_info,u_info where wuid=wu_zid and wu_user=u_id) as z_regtime,(select lastlogin from wu_info,u_info where wuid=wu_zid and wu_user=u_id) as z_lastlogin,(select wu_name from wu_info where wuid=wu_bid) as wu_bname,(select wu_user from wu_info where wuid=wu_bid) as b_uid,(select wu_xjcd from wu_info where wuid=wu_bid) as b_xjcd,(select wu_pic from wu_info where wuid=wu_bid) as b_wppic,(select clicknum from wu_info where wuid=wu_bid) as b_clicknum,(select u_name from wu_info,u_info where wuid=wu_bid and wu_user=u_id) as b_uname,(select face from wu_info,u_info where wuid=wu_bid and wu_user=u_id) as b_face,(select regtime from wu_info,u_info where wuid=wu_bid and wu_user=u_id) as b_regtime,(select lastlogin from wu_info,u_info where wuid=wu_bid and wu_user=u_id) as b_lastlogin,wu_zid,wu_bid,jh_sqdate,case jh_tag when '0' then '等待回复' when '1' then '交换成功' when '2' then '交换失败' end as jhstate from huan_info where jhid=@jhid"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
     <SelectParameters>
       <asp:QueryStringParameter Name="jhid" QueryStringField="jhid" /> 
     </SelectParameters>
  </asp:SqlDataSource>   
</asp:Content>

