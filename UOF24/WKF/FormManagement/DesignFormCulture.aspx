<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_DesignFormCulture" Title="表單名稱多國語言設定" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="DesignFormCulture.aspx.cs" %>
<%@ Register src="UC_FormCulture.ascx" tagname="UC_FormCulture" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <asp:Table ID="Table1" runat="server" meta:resourcekey="Table1Resource1">
    </asp:Table>
    
    <uc1:UC_FormCulture ID="UC_FormCulture1" runat="server" />
    
    <asp:CustomValidator ID="CustomValidator1" runat="server"  Display=Dynamic
ErrorMessage="預設語系表單名稱重複" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator2" runat="server"  Display=Dynamic 
        meta:resourcekey="CustomValidator2Resource1" ></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator3" runat="server"  Display=Dynamic 
ErrorMessage="預設語系不能空白！" meta:resourcekey="CustomValidator3Resource1" ></asp:CustomValidator>

    <asp:Label ID="lblFormRepeat" runat="server" Text="語系表單名稱重複" Visible=False 
        meta:resourcekey="lblFormRepeatResource1"></asp:Label>

</asp:Content>

