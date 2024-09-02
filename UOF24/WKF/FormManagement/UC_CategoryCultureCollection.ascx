<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_UC_CategoryCultureCollection" Codebehind="UC_CategoryCultureCollection.ascx.cs" %>
<%@ Register src="UC_CategoryCulture.ascx" tagname="UC_CategoryCulture" tagprefix="uc1" %>
<asp:Table ID="Table1" runat="server" meta:resourcekey="Table1Resource1" Width="100%">
</asp:Table>

<asp:CustomValidator ID="CustomValidator1" runat="server" Display=Dynamic 
    meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
<asp:Label ID="lblDefalutCulture" runat="server" Text="預設語系" Visible=False 
    meta:resourcekey="lblDefalutCultureResource1"></asp:Label>
<asp:Label ID="lblDefault" runat="server" Text="預設值" Visible=False 
    meta:resourcekey="lblDefaultResource1"></asp:Label>
<asp:Label ID="Label1" runat="server" Text="類別名稱重覆：" Visible=False 
    meta:resourcekey="Label1Resource1"></asp:Label>