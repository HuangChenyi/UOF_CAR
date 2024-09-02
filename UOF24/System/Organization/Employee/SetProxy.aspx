<%@ Page Title="批次設定Proxy" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Employee_SetProxy" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SetProxy.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table  class="PopTable" cellspacing="1" style="width:100%">
<tr>
    <td style="white-space:nowrap">    <asp:Label ID="Label1" runat="server" Text="部門" 
            meta:resourcekey="Label1Resource1"></asp:Label></td>
    <td><asp:Label ID="lblGroupName" runat="server" 
            meta:resourcekey="lblGroupNameResource1"></asp:Label></td>
</tr>
<tr>
    <td style="white-space:nowrap">    <asp:Label ID="Label2" runat="server" Text="是否包含子部門" 
            meta:resourcekey="Label2Resource1"></asp:Label></td>
    <td><asp:CheckBox ID="CheckBox1" runat="server" 
            meta:resourcekey="CheckBox1Resource1" /></td>
</tr>
<tr>
    <td style="white-space:nowrap">    <asp:Label ID="Label3" runat="server" Text="Proxy設定" 
            meta:resourcekey="Label3Resource1"></asp:Label></td>
    <td>
    <asp:DropDownList ID="ddlProxy" runat="server" meta:resourcekey="ddlProxyResource1">
    </asp:DropDownList><asp:CustomValidator ID="cvProxy" runat="server" 
            ErrorMessage="此Proxy已停用" Display="Dynamic" 
            meta:resourcekey="cvProxyResource1"  ></asp:CustomValidator><br />
    <asp:Label ID="lblProxyMsg" runat="server" CssClass="SizeMemo"
            Text="變更proxy設定,需重新登入系統方能生效" meta:resourcekey="lblProxyMsgResource1" ></asp:Label> </td>
</tr>    
    
</table>
    <asp:Label ID="lblNoProxy" runat="server" Text="不使用" Visible="False" 
        meta:resourcekey="lblNoProxyResource1" ></asp:Label>

</asp:Content>

