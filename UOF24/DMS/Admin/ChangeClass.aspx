<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_Admin_ChangeClass" Title="變更文件類別" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ChangeClass.aspx.cs" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="padding-left: 5px;">
        <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="沒有選擇要搬移的文件" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
        <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="請選擇類別" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
    </div>
    <telerik:RadTreeView runat="server" ID="treeClass" EnableNodeTextHtmlEncoding="true">
    </telerik:RadTreeView>    
    <asp:HiddenField ID="hidGridKey" runat="server" />
    <asp:Label ID="lblClass" runat="server" Text="文件類別" Visible="False" meta:resourcekey="lblClassResource1"></asp:Label>
</asp:Content>

