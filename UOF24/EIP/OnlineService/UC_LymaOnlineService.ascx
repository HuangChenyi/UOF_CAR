<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_OnlineService_UC_LymaOnlineService" Codebehind="UC_LymaOnlineService.ascx.cs" %>
<asp:DataList ID="DataList1" runat="server" CellSpacing="20" RepeatColumns="3" 
    meta:resourcekey="DataList1Resource1">
    <ItemTemplate>
        <asp:Label ID="lblCode" runat="server" Text='<%# Bind("SCRIPT_CODE") %>' 
            meta:resourcekey="lblCodeResource1"></asp:Label>
    </ItemTemplate>
</asp:DataList>
