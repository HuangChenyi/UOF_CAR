<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_Admin_ModifyLendStatus" Title="修改調閱資料" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ModifyLendStatus.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table class="PopTable" cellspacing="1" style="width:100%">
    <tr>
        <td style="white-space:nowrap;" >            
            <asp:Label ID="Label1" runat="server" Text="文件名稱" meta:resourcekey="Label1Resource1"></asp:Label>
        </td>
        <td colspan="3">
            <SPAN style="WIDTH: 300px; WORD-BREAK: break-all">  
            <asp:Label ID="lblDocName" runat="server" Text="Label" meta:resourcekey="lblDocNameResource1"></asp:Label>
            </SPAN> 
        </td>
    </tr>  
    <tr runat="server" id="tr_DisplayTimeZone">
        <td style="white-space:nowrap;" >
            <asp:Label ID="lblLendUserTimeZone" runat="server" Text="調閱者時區" meta:resourcekey="lblLendUserTimeZoneResource1"></asp:Label>
        </td>
        <td colspan="3">
            <asp:DropDownList ID="ddlDisplayTimeZone" runat="server" Enabled="false" meta:resourcekey="ddlDisplayTimeZoneResource1"></asp:DropDownList>
        </td>
    </tr>   
    <tr>
        <td style="white-space:nowrap;">
            <asp:Label ID="Label2" runat="server" Text="起始日期" meta:resourcekey="Label2Resource1"></asp:Label>
        </td>
        <td >
            <telerik:RadDatePicker ID="wdcStartDate" runat="server"></telerik:RadDatePicker>
        </td>
        <td style="white-space:nowrap;">
            <asp:Label ID="Label3" runat="server" Text="結束日期" meta:resourcekey="Label3Resource1"></asp:Label>
        </td>
        <td >
            <telerik:RadDatePicker ID="wdcEndDate" runat="server"></telerik:RadDatePicker>
        </td>
    </tr>
    <tr>
        <td style="white-space:nowrap;">
            <asp:Label ID="Label4" runat="server" Text="調閱理由" meta:resourcekey="Label4Resource1"></asp:Label>
        </td>
        <td colspan="3" >
            <asp:TextBox ID="txtReason" runat="server" Rows="10" Width="100%" TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    
</table>
    <asp:Label ID="lblNoUpdate" runat="server" Text="沒有調閱資料被更新" Visible="False" meta:resourcekey="lblNoUpdateResource1"></asp:Label>
    <asp:Label ID="lblPageDataSourceMsg" runat="server" Text="此頁面的資料均以調閱者為主" CssClass="SizeMemo" meta:resourcekey="lblPageDataSourceMsgResource1"></asp:Label>
    <asp:Label ID="lblSelect" runat="server" Text="請選擇" Visible="false" meta:resourcekey="lblSelectResource1"></asp:Label>
</asp:Content>

