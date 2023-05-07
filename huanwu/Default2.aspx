<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">




    <asp:SqlDataSource 
        id="SqlDataSource1" 
        runat="server" 
        SelectCommand="select top 7 * from wu_info order by addtime desc"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
  </asp:SqlDataSource>    

    <asp:SqlDataSource 
        id="SqlDataSource2" 
        runat="server" 
        SelectCommand="select top 10 *,case when len(wu_name)>8 then left(wu_name,6)+'...' else wu_name end as wpname from wu_info where wu_pic <>'' and wu_pic is not null order by addtime desc"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
  </asp:SqlDataSource>      
  
  <asp:SqlDataSource 
        id="SqlDataSource3" 
        runat="server" 
        SelectCommand="select top 7 jhid,wu_zid,(select wu_name from wu_info where wuid=wu_zid) as zwpname,wu_bid,(select wu_name from wu_info where wuid=wu_bid) as bwpname,jh_enddate from huan_info where jh_tag='1' order by jh_enddate"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
  </asp:SqlDataSource>
  
  <asp:SqlDataSource 
        id="SqlDataSource4" 
        runat="server" 
        SelectCommand="select top 7 jhid,wu_zid,(select wu_name from wu_info where wuid=wu_zid) as zwpname,wu_bid,(select wu_name from wu_info where wuid=wu_bid) as bwpname,jh_sqdate from huan_info where jh_tag='0' order by jh_sqdate"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
  </asp:SqlDataSource>
    
    <asp:SqlDataSource 
        id="SqlDataSource5" 
        runat="server" 
        SelectCommand="select top 7 id,xq_title,xq_user,u_name from xq_info,u_info where u_id=xq_user order by xq_date desc"
        ConnectionString="<%$ ConnectionStrings:CnnString%>" >
  </asp:SqlDataSource>   
</asp:Content>

