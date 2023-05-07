<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
CodeFile="view_hp.aspx.cs" Inherits="view_hp" Title="查看换品" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="view_hp_main">
    <div class="view_hp_left">
        <table width="700" border="0" cellpadding="0" cellspacing="1">
            <tr>
                <td align="left" style="padding-left: 5px; padding-top: 6px;" valign="top">
                    <div>
                        ※ <span class="span22">查看换品</span>
                    </div>
                    <div>
                        <asp:FormView ID="FormView1" Width="100%" DefaultMode="ReadOnly" DataSourceID="sqldatasource1"
                            runat="server">
                            <ItemTemplate>
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr height="270">
                                        <td width="25%" valign="top" style="padding-top: 8px;" align="center">
                                            <asp:Image ID="Image1" ImageUrl='<%# Bind("wu_pic","wppic/{0}")%>' Width="140" Height="140"
                                                runat="server" />
                                        </td>
                                        <td width="45%" align="left" valign="top" style="padding-top: 8px; padding-left: 8px;">
                                            <div style="padding-bottom: 8px;">
                                                <span class="span12">换品名称：</span>
                                                <asp:Label ID="Label13" CssClass="span13" runat="server" Text='<%# Bind("wu_name")%>' />
                                            </div>
                                            <div style="padding-bottom: 8px;">
                                                <span class="span12">换品介绍：</span>
                                                <div style="padding-top: 6px; padding-left: 5px;">
                                                    <asp:Label ID="Label14" CssClass="span13" runat="server" Text='<%# Bind("wu_descr")%>' />
                                                </div>
                                            </div>
                                            <div style="padding-bottom: 8px;">
                                                <span class="span12">换品类别：</span>
                                                <asp:HyperLink ID="HyperLink5" CssClass="a11" runat="server" Text='<%# Bind("typename")%>'
                                                    NavigateUrl='<%# Bind("wu_type","ss_hp.aspx?type={0}")%>' />
                                            </div>
                                            <div style="padding-bottom: 8px;">
                                                <span class="span12">换品新旧程度：</span>
                                                <asp:Label ID="Label5" CssClass="span13" runat="server" Text='<%# Bind("wu_xjcd")%>' />
                                            </div>
                                            <div style="padding-bottom: 8px;">
                                                <span class="span12">浏览数：</span>
                                                <asp:Label ID="Label15" CssClass="span13" runat="server" Text='<%# Bind("clicknum")%>' />
                                            </div>
                                            <div style="padding-bottom: 25px;">
                                                <span class="span12">发布时间：</span>
                                                <asp:Label ID="Label16" CssClass="span13" runat="server" Text='<%# Bind("addtime","{0:yyyy-MM-dd}")%>' />
                                            </div>
                                        </td>
                                        <td width="30%" align="left" valign="top" style="padding-top: 15px;">
                                            <!--SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS-->
                                            <div style="padding-bottom: 2px;">
                                                <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# Eval("wuid","huan.aspx?wuid={0}") %>'
                                                    runat="server">
                <img src="image/sqjh.gif" border=0 />
                                                </asp:HyperLink>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr height="1">
                                        <td colspan="3" bgcolor="#bdbdbd">
                                        </td>
                                    </tr>
                                    <tr height="80">
                                        <td colspan="3" style="padding-top: 8px;">
                                            <div>
                                                ※ <span class="span22">交换意向</span>
                                            </div>
                                            <div style="padding-top: 10px; padding-left: 10px;">
                                                <span class="span8">想换的物品：</span>
                                                <asp:Label ID="Label7" CssClass="span13" runat="server" Text='<%# Bind("hop_wpname")%>' />
                                            </div>
                                            <div style="padding-top: 10px; padding-left: 10px;">
                                                <span class="span8">期望交换地点：</span>
                                                <asp:Label ID="Label9" CssClass="span13" runat="server" Text='<%# Bind("hop_addr")%>' />
                                            </div>
                                            <div style="padding-top: 10px; padding-left: 10px; padding-bottom: 10px;">
                                                <span class="span8">交换说明：</span>
                                                <asp:Label ID="Label19" CssClass="span13" runat="server" Text='<%# Bind("hop_memo")%>' />
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:FormView>
                    </div>
                </td>
            </tr>
            <separatortemplate>
        <tr height="1" bgcolor="#cdcdcd"><td colspan="4"></td></tr>
    </separatortemplate>
        </table>
        <br />

        <table width="700" border="0" cellpadding="0" cellspacing="1">
            <tr>
                <td align="left" style="padding-left: 5px; padding-top: 6px;" valign="top">
                    <div>
                        ※
                        <asp:Label ID="Label6" CssClass="span22" runat="server" Text="申请记录" /></div>
                    <div style="padding-left: 10px; padding-top: 10px;">
                        <asp:GridView ID="GridView1" SkinID="mygrid2" Width="97%" DataSourceID="sqldatasource2"
                            AutoGenerateColumns="false" runat="server" BorderWidth="0" GridLines="horizontal"
                            EmptyDataText="暂无记录">
                            <Columns>
                                <asp:HyperLinkField DataTextField="jhid" ControlStyle-CssClass="a5" DataNavigateUrlFields="jhid"
                                    DataNavigateUrlFormatString="view_jh.aspx?jhid={0}" HeaderText="交换编号">
                                    <ItemStyle Width="90px" />
                                </asp:HyperLinkField>
                                <asp:HyperLinkField DataTextField="z_uname" ControlStyle-CssClass="a5" DataNavigateUrlFields="z_uid"
                                    DataNavigateUrlFormatString="view_hk.aspx?id={0}" HeaderText="申请人">
                                    <ItemStyle Width="130px" />
                                </asp:HyperLinkField>
                                <asp:HyperLinkField DataTextField="wu_zname" ControlStyle-CssClass="a5" DataNavigateUrlFields="wu_zid"
                                    DataNavigateUrlFormatString="view_hp.aspx?id={0}" HeaderText="申请物品">
                                    <ItemStyle Width="200px" />
                                </asp:HyperLinkField>
                                <asp:HyperLinkField DataTextField="b_uname" ControlStyle-CssClass="a5" DataNavigateUrlFields="b_uid"
                                    DataNavigateUrlFormatString="view_hk.aspx?id={0}" HeaderText="被申请人">
                                    <ItemStyle Width="130px" />
                                </asp:HyperLinkField>
                                <asp:HyperLinkField DataTextField="wu_bname" ControlStyle-CssClass="a5" DataNavigateUrlFields="wu_bid"
                                    DataNavigateUrlFormatString="view_hp.aspx?id={0}" HeaderText="被请求物品">
                                    <ItemStyle Width="200px" />
                                </asp:HyperLinkField>
                                <asp:BoundField DataField="jhstate" HtmlEncode="false" HeaderText="状态">
                                    <ItemStyle Width="100px" ForeColor="Red" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </td>
            </tr>
        </table>
        <br />
        <table width="700" border="0" cellpadding="0" cellspacing="1">
            <tr>
                <td align="left" style="padding-left: 5px; padding-top: 6px;" valign="top">
                    <div>
                        ※
                        <asp:Label ID="Label11" CssClass="span22" runat="server" Text="针对该物品的留言" /></div>
                    <div style="padding-left: 10px; padding-top: 10px;">
                        <asp:GridView Width="98%" ID="GridView2" SkinID="mygrid1" DataSourceID="sqldatasource3"
                            runat="server" GridLines="Horizontal" EmptyDataText="暂无记录" AutoGenerateColumns="False"
                            CellPadding="4">
                            <Columns>
                                <asp:HyperLinkField DataTextField="u_name" ControlStyle-CssClass="a5" DataNavigateUrlFields="ly_user"
                                    DataNavigateUrlFormatString="view_hk.aspx?id={0}">
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
        <table width="700" border="0" cellpadding="0" cellspacing="1" bgcolor="#cdcdcd">
            <tr bgcolor="#f5f5f5">
                <td align="left" style="padding-left: 5px; padding-top: 6px;" valign="top">
                    <div>
                        ※
                        <asp:Label ID="Label12" CssClass="span22" runat="server" Text="针对该物品发表留言" /></div>
                    <div style="padding-left: 15px; padding-top: 10px;">
                        <asp:FormView ID="FormView2" DataSourceID="sqldatasource4" runat="server" DefaultMode="insert"
                            OnItemInserted="FormView2_Inserted" OnItemInserting="FormView2_Inserting">
                            <InsertItemTemplate>
                                <asp:TextBox ID="textbox1" Text='<%#Bind("lycontent") %>' TextMode="multiline" Rows="6"
                                    Columns="80" runat="server" />
                                <center>
                                    <asp:Button ID="Button1" CommandName="insert" runat="server" Text="提交留言" />
                                </center>
                            </InsertItemTemplate>
                        </asp:FormView>
                    </div>
                </td>
            </tr>
        </table>
    </div>
   <!-- <div>
        <table width="200" border="0" cellpadding="0" cellspacing="1" bgcolor="#cdcdcd">
            <tr>
                <td>
                    <div style="padding-bottom: 8px; width: 200px; height: 230px; background-color: White;
                        padding-left: 8px; padding-top: 5px;">
                      <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# Eval("xq_user","view_user.aspx?id={0}") %>'  runat="server">
                  <asp:Image ID="Image2" ImageUrl='<%# Bind("face","userpic/{0}")%>' width="80" height="80" runat="server" />
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
        </table>
    </div>-->
</div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="select wuid,wu_type,typename,wu_user,wu_name,wu_pic,wu_xjcd,wu_descr,hop_wpname,hop_addr,hop_memo,clicknum,addtime,u_name,jzarea,face,regtime,logintimes,lastlogin from wu_info,wu_type,u_info where wu_user=u_id and wu_type=typeid"
    FilterExpression="wuid={0}" ConnectionString="<%$ ConnectionStrings:CnnString%>">
    <FilterParameters>
        <asp:QueryStringParameter Name="wpid" QueryStringField="id" />
    </FilterParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="select jhid,wu_zid,(select wu_name from wu_info where wuid=wu_zid) as wu_zname,(select wu_user from wu_info where wuid=wu_zid) as z_uid,(select u_name from wu_info,u_info where wuid=wu_zid and wu_user=u_id) as z_uname,(select wu_name from wu_info where wuid=wu_bid) as wu_bname,(select wu_user from wu_info where wuid=wu_bid) as b_uid,(select u_name from wu_info,u_info where wuid=wu_bid and wu_user=u_id) as b_uname,wu_zid,wu_bid,jh_sqdate,case jh_tag when '0' then '等待回复' when '1' then '交换成功' when '2' then '交换失败' end as jhstate from huan_info where wu_zid=@wuid or wu_bid=@wuid"
    ConnectionString="<%$ ConnectionStrings:CnnString%>">
    <SelectParameters>
        <asp:QueryStringParameter Name="wuid" QueryStringField="id" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" SelectCommand="select ly_user,u_name,ly_nr,ly_date from u_ly,u_info where ly_user=u_id and wu_id=@wuid order by ly_date desc"
    ConnectionString="<%$ ConnectionStrings:CnnString%>">
    <SelectParameters>
        <asp:QueryStringParameter Name="wuid" QueryStringField="id" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource4" runat="server" InsertCommand="insert into u_ly(ly_user,ly_nr,to_lyr,wu_id) values(@lyr,@lycontent,@tolyr,@wuid)"
    ConnectionString="<%$ ConnectionStrings:CnnString%>">
    <InsertParameters>
        <asp:QueryStringParameter Name="wuid" QueryStringField="id" />
        <asp:Parameter Name="lyr" />
        <asp:Parameter Name="tolyr" />
    </InsertParameters>
</asp:SqlDataSource>
</asp:Content>
