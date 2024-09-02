<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="FormForum_UpdateDialog" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="UpdateDialog.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc1" TagName="UC_HtmlEditor" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style="width:100%"  class=PopTable cellspacing=1>
    <colgroup class=PopTableLeftTD></colgroup>
    <colgroup class=PopTableRightTD></colgroup>
        <tr>
            <td colspan="2">
            </td>
        </tr>
        <tr>
            <td style="width:8%">
                <asp:Label ID="Label2" runat="server" Text="張貼者" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td style="width:92%">
                <asp:Label ID="lblUser" runat="server" meta:resourcekey="lblUserResource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="width:8%">
                <asp:Label ID="Label1" runat="server" Text="主題" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td style="width:92%">
                <asp:Label ID="lblSubject" runat="server" Width="80%" meta:resourcekey="lblSubjectResource1"></asp:Label>
                <asp:TextBox ID="txtSubjct" runat="server" Width="100%" MaxLength="255" meta:resourcekey="txtSubjctResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubjct"
                    Display="Dynamic" ErrorMessage="請填入主旨" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width:8%">
                <asp:Label ID="Label3" runat="server" Text="內容" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td style="width:92%;height: 450px">
                <uc1:UC_HtmlEditor runat="server" ID="RadEditor1" Width="100%" Height="470px" ModuleName="WKF" ProxyEnabled="true"/>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblLastModify" Text="最後修改：" runat="server" Visible="False" meta:resourcekey="lblLastModifyResource1"></asp:Label>
</asp:Content>

