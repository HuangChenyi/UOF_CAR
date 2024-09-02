<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormForum_NewArticleDialog" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="NewArticleDialog.aspx.cs" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc1" TagName="UC_HtmlEditor" %>






<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="無權限維護" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="articleAlreadyExistValidator" Display="Dynamic" Text="本討論已開始，請重新整理。" runat="server" ErrorMessage="CustomValidator" meta:resourcekey="articleAlreadyExistValidatorResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="noSuchFormValidator" Display="Dynamic" Text="無此單號" runat="server" ErrorMessage="CustomValidator" meta:resourcekey="noSuchFormValidatorResource1"></asp:CustomValidator>
      <table style="width:100%; height:100%"  class=PopTable cellspacing=1>
        <tr style="height:20px">
            <td style="width: 100px; white-space:nowrap;" >
                <asp:Label ID="Label2"  runat="server" Text="張貼者"  nowrap="true" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td >
                <asp:Label ID="lblReplyUser" runat="server" meta:resourcekey="lblreplyUserResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 100px;white-space:nowrap">
                <asp:Label ID="Label3" runat="server" Text="內容" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td  >
                <uc1:UC_HtmlEditor runat="server" ID="RadEditor1" ModuleName="WKF" Width="100%" height="800px" ProxyEnabled="true"/>
            </td>
        </tr>
    </table>
        <asp:Label ID="lblLastModify" Text="回覆者：" runat="server" Visible="False" meta:resourcekey="lblLastModifyResource1"></asp:Label>
    <asp:Label ID="lblPoster" Text="張貼者：" runat="server" Visible="false"></asp:Label>
</asp:Content>
