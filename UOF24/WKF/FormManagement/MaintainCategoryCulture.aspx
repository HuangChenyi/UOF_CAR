<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_MaintainCategoryCulture" Title="表單類別多國語言設定" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="MaintainCategoryCulture.aspx.cs" %>
<%@ Register src="UC_CategoryCultureCollection.ascx" tagname="UC_CategoryCultureCollection" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UC_CategoryCultureCollection ID="UC_CategoryCultureCollection1" 
        runat="server" />
    <asp:CustomValidator ID="CustomValidator1" runat="server"  Display=Dynamic
ErrorMessage="預設語系表單名稱重複" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator2" runat="server"  Display=Dynamic 
        meta:resourcekey="CustomValidator2Resource1" ></asp:CustomValidator>

    <asp:Label ID="lblFormRepeat" runat="server" Text="語系表單名稱重複" Visible=False 
        meta:resourcekey="lblFormRepeatResource1"></asp:Label>
        <asp:CustomValidator ID="CustomValidator3" runat="server"  Display=Dynamic 
        meta:resourcekey="CustomValidator3Resource1" ></asp:CustomValidator>
</asp:Content>

