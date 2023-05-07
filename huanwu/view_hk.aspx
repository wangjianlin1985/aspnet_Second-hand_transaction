<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="view_hk.aspx.cs" Inherits="view_hk" Title="查看换客" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table width="840" border="0" cellpadding="0" cellspacing=1 bgcolor="#cdcdcd">
    <tr bgcolor="#f5f5f5">
      <td align="left" style="padding-left:5px;padding-top:6px;" valign="top">
            <div>
                 ※ <span class="span2">换客信息</span>
            </div>
        <div> 
        <asp:FormView ID="FormView1" Width="100%" DefaultMode="ReadOnly" DataSourceID="sqldatasource1" runat="server">
        <ItemTemplate>
            <table width="100%" border=0 cellpadding=0 cellspacing=0>
            <tr height="105">
            <td width="15%" valign="top" style="padding-top:8px;" align="left">
              <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Bind("u_id","view_hk.aspx?id={0}")%>'>
                <asp:Image ID="Image1" ImageUrl='<%# Bind("face","userpic/{0}")%>' width="95" height="90" runat="server" />
              </asp:HyperLink> 
            </td>
            <td width="25%" align=left valign="top" style="padding-top:8px;">
              <div style="padding-bottom:8px;">
                <span class="span12">换客名称：</span>
                <asp:HyperLink ID="HyperLink3" CssClass="a11" runat="server" Text='<%# Bind("u_name")%>' NavigateUrl='<%# Bind("u_id","view_hk.aspx?id={0}")%>' />
              </div>
              <div style="padding-bottom:8px;">
                <span class="span12">所在地：</span>
                <asp:Label ID="Label1" CssClass="span13" runat="server" Text='<%# Bind("jzarea")%>' />
              </div>
                <div style="padding-bottom:4px;">
                <span class="span12">交换宣言：</span>        
                <asp:Label ID="Label4" CssClass="span13" runat="server" Text='<%# Bind("memo")%>' />
                </div>    

            </td>
            <td width="40%" align=left valign="top" style="padding-top:8px;">
                <div style="padding-bottom:8px;">
                <span class="span12">发布换品：</span>
                <asp:Label ID="Label2" CssClass="span13" runat="server" Text='<%# Bind("hps")%>' />
                </div>
                <div style="padding-bottom:8px;">
                <span class="span12">发布需求：</span>
                <asp:Label ID="Label8" CssClass="span13" runat="server" Text='<%# Bind("xqs")%>' />
                </div>         
            </td>
          <!--  <td width="20%" align=left valign="top" style="padding-top:8px;">
                <div style="padding-bottom:8px;">
                <span class="span12">注册时间：</span>
                <asp:Label ID="Label7" CssClass="span13" runat="server" Text='<%# Bind("regtime","{0:yyyy-MM-dd}")%>' />
                </div>
                <div style="padding-bottom:8px;">
                <span class="span12">最后登录：</span>
                <asp:Label ID="Label3" CssClass="span13" runat="server" Text='<%# Bind("lastlogin","{0:yyyy-MM-dd}")%>' />
                </div>
                <div style="padding-bottom:8px;">
                <span class="span12">登录次数：</span>
                <asp:Label ID="Label9" CssClass="span13" runat="server" Text='<%# Bind("logintimes")%>' />
                </div>
            </td>-->
       
          </tr>
          </table>            
        </ItemTemplate>
        </asp:FormView></div>
      </td>
    </tr>
    </table>
    <br />
    <table width="840" border="0" cellpadding="0" cellspacing=1 bgcolor="#cdcdcd">
    <tr bgcolor="#f5f5f5">
      <td align="left" style="padding-left:5px;padding-top:6px;" valign="top">
        <div>※ <asp:Label ID="Label6" CssClass="span2" runat="server" Text="我的发布" /></div> 
        <div style="padding-left:10px;padding-top:10px;">
          <asp:DataList ID="DataList1" Width="100%" DataSourceID="sqldatasource2" ItemStyle-Wrap="true" runat="server" RepeatColumns="6" CellPadding=0  CellSpacing =0>
            <ItemTemplate>
              <div align=left style="padding-top:5px;line-height:1.5;">
                <asp:HyperLink NavigateUrl='<%# Eval("wuid","view_hp.aspx?id={0}") %>' ID="HyperLink1" runat="server">
                <img src='<%# Eval("wu_pic","wppic/{0}") %>' width="110" height="100" border=0 />
                </asp:HyperLink>
                <br />
                <asp:Label ID="Label1" runat="server"  ForeColor="red" Text='<%# Eval("wu_name") %>' />
                <br />
                点击:<asp:Label ID="Label2" ForeColor="red" runat="server" Text='<%# Eval("clicknum") %>' />
                留言:<asp:Label ID="Label3" ForeColor="red" runat="server" Text='<%# Eval("lynum") %>' />
           <!--     <br />
                收藏:<asp:Label ID="Label4" runat="server" Text='<%# Eval("addtime","{0:yy-MM-dd}") %>' />-->
              </div>
            </ItemTemplate>          
          </asp:DataList>  
      </div>
      </td>
    </tr>
    </table>
    <br />
    <table width="840" border="0" cellpadding="0" cellspacing=0>
    <tr bgcolor="#f5f5f5">
      <td width="50%" align="left" style="padding-right:5px;" valign="top">
        <table height="200" border=0 width="100%" cellpadding=0 cellspacing=1 bgcolor="#cdcdcd">
        <tr bgcolor="#f5f5f5" height="200">
          <td style="padding-left:8px;padding-top:5px" valign="top">
            <div>
                 ※ <span class="span2">发出交换请求</span>
            </div>
            <div style="padding-top:6px;">
          <asp:GridView ID="GridView1" SkinID="mygrid2" Width="97%" DataSourceID="sqldatasource3" AutoGenerateColumns="false" runat="server" BorderWidth=0 GridLines="horizontal" EmptyDataText="暂无记录">
            <Columns>
            
          <asp:HyperLinkField DataTextField="jhid"  ControlStyle-CssClass ="a5" DataNavigateUrlFields="jhid" DataNavigateUrlFormatString="view_jh.aspx?jhid={0}" HeaderText="交换编号">
            <ItemStyle Width="90px" />
          </asp:HyperLinkField>
          <asp:HyperLinkField DataTextField="u_name" ControlStyle-CssClass="a5" DataNavigateUrlFields="u_id" DataNavigateUrlFormatString="view_hk.aspx?id={0}" HeaderText="被请求用户">
            <ItemStyle  Width="130px" />
          </asp:HyperLinkField>
          <asp:HyperLinkField DataTextField="wu_name" ControlStyle-CssClass="a5" DataNavigateUrlFields="wuid" DataNavigateUrlFormatString="view_hp.aspx?id={0}"  HeaderText="被请求物品">
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
      </td>
      
      <td width="50%" align="left" style="padding-left:6px;" valign="top">
        <table height="200" border=0 width="100%" cellpadding=0 cellspacing=1 bgcolor="#cdcdcd">
        <tr bgcolor="#f5f5f5" height="200">
          <td style="padding-left:8px;padding-top:5px" valign="top">
            <div>
                 ※ <span class="span2">收到交换请求</span>
            </div>
            <div style="padding-top:6px;">
              <asp:GridView ID="GridView2" SkinID="mygrid2" DataSourceID="sqldatasource4" runat="server" AutoGenerateColumns="false" BorderWidth=0 GridLines="horizontal" EmptyDataText="暂无记录">
                <Columns>
              <asp:HyperLinkField DataTextField="jhid" ControlStyle-CssClass="a5" DataNavigateUrlFields="jhid" DataNavigateUrlFormatString="view_jh.aspx?jhid={0}" HeaderText="交换编号">
                <ItemStyle Width="90px" />
              </asp:HyperLinkField>
              <asp:HyperLinkField DataTextField="u_name" ControlStyle-CssClass="a5" DataNavigateUrlFields="u_id" DataNavigateUrlFormatString="view_hk.aspx?id={0}" HeaderText="请求用户">
                <ItemStyle Width="130px" />
              </asp:HyperLinkField>
              <asp:HyperLinkField DataTextField="wu_name" ControlStyle-CssClass="a5" DataNavigateUrlFields="wuid" DataNavigateUrlFormatString="view_hp.aspx?id={0}"  HeaderText="请求物品">
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
      </td>
    </tr>
    </table>
    <br />
    <table width="840" border="0" cellpadding="0" cellspacing=1 bgcolor="#cdcdcd">
    <tr bgcolor="#f5f5f5">
      <td align="left" style="padding-left:5px;padding-top:6px;" valign="top">
        <div>※ <asp:Label ID="Label11" CssClass="span2" runat="server" Text="他人留言" /></div> 
        <div style="padding-left:10px;padding-top:10px;">
          <asp:GridView Width="98%" ID="GridView4" SkinID="mygrid1"   DataSourceID="sqldatasource5" runat="server" GridLines="Horizontal" EmptyDataText="暂无记录" AutoGenerateColumns="False" CellPadding="4">
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
        <div>※ <asp:Label ID="Label12" CssClass="span2" runat="server" Text="在线留言" /></div> 
        <div style="padding-left:15px;padding-top:10px;">
          <asp:FormView ID="FormView2" DataSourceID="sqldatasource6" runat="server" DefaultMode="insert" OnItemInserted="FormView2_Inserted" OnItemInserting="FormView2_Inserting">
          <InsertItemTemplate>
              <asp:TextBox id="textbox1" text='<%#Bind("lycontent") %>' TextMode="multiline" Rows="6" Columns="80" 
runat="server" />
            <center>
              <asp:Button ID="Button1" CommandName="insert" runat="server" Text="提交留言" />
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
        SelectCommand="select *,(select isnull(count(*),0) from wu_info where wu_user=u_id) as hps,(select isnull(count(*),0) from xq_info where xq_user=u_id) as xqs from u_info"
        FilterExpression="u_id={0}" 
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
     <FilterParameters>
       <asp:QueryStringParameter Name="userid" QueryStringField="id" /> 
     </FilterParameters>   
  </asp:SqlDataSource>
  
    <asp:SqlDataSource 
        id="SqlDataSource2" 
        runat="server" 
        SelectCommand="select top 6 wuid,wu_name,wu_user,addtime,clicknum,wu_pic,(select count(*) from u_ly where wu_id=wuid) as lynum from wu_info order by addtime desc"
        FilterExpression="wu_user={0}" 
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
     <FilterParameters>
       <asp:QueryStringParameter Name="userid" QueryStringField="id" /> 
     </FilterParameters>   
  </asp:SqlDataSource>   
  
    <asp:SqlDataSource 
        id="SqlDataSource3" 
        runat="server" 
        SelectCommand="select top 6 jhid,u_name,u_id,wuid,wu_name,jh_sqdate,case jh_tag when '0' then '等待回复' when '1' then '成功交换' when '2' then '拒绝交换' end as jhstate from huan_info,wu_info,u_info where wu_bid=wuid and wu_user=u_id and jhid in (select jhid from huan_info,wu_info where wu_zid=wuid and wu_user=@userid)"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
     <SelectParameters>
        <asp:QueryStringParameter Name="userid" QueryStringField="id" />      
     </SelectParameters> 
  </asp:SqlDataSource>

    <asp:SqlDataSource 
        id="SqlDataSource4" 
        runat="server" 
        SelectCommand="select jhid,u_name,u_id,wuid,wu_name,jh_sqdate,case jh_tag when '0' then '等待回复' when '1' then '成功交换' when '2' then '拒绝交换' end as jhstate from huan_info,wu_info,u_info where wu_zid=wuid and wu_user=u_id and jhid in (select jhid from huan_info,wu_info where wu_bid=wuid and wu_user=@userid)"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
     <SelectParameters>
        <asp:QueryStringParameter Name="userid" QueryStringField="id" />      
     </SelectParameters> 
  </asp:SqlDataSource>  

    <asp:SqlDataSource 
        id="SqlDataSource5" 
        runat="server" 
        SelectCommand="select ly_user,u_name,ly_nr,ly_date from u_ly,u_info where ly_user=u_id and to_lyr=@userid order by ly_date desc"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
     <SelectParameters>
        <asp:QueryStringParameter Name="userid" QueryStringField="id" />      
     </SelectParameters> 
  </asp:SqlDataSource>
  
    <asp:SqlDataSource 
        id="SqlDataSource6" 
        runat="server" 
        InsertCommand="insert into u_ly(ly_user,ly_nr,to_lyr,wu_id) values(@lyr,@lycontent,@tolyr,'')" 
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
      <InsertParameters>
        <asp:QueryStringParameter Name="tolyr" QueryStringField="id" />
        <asp:Parameter Name="lyr" />
      </InsertParameters>
  </asp:SqlDataSource>    
</asp:Content>

