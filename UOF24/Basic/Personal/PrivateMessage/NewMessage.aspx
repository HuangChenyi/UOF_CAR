<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Basic_Personal_PrivateMessage_NewMessage" Title="新增訊息" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="NewMessage.aspx.cs" %>

<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>

<%@ Register src="../../../Common/HtmlEditor/UC_HtmlEditor.ascx" tagname="UC_HtmlEditor" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" class="PopTable" cellspacing="1">
        <tr>
            <td style="width: 100px; white-space: nowrap;">
                <span style="color: #ff0000">*</span><asp:Label ID="Label1" runat="server" Text="收件人" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td>
                <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="false" />
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td style="width: 100px; white-space: nowrap;">
                <span style="color: #ff0000">*</span><asp:Label ID="Label2" runat="server" Text="主旨" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txbTopic" runat="server" Width="100%" MaxLength="255" meta:resourcekey="txbTopicResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbTopic" ForeColor="Red"
                    Display="Dynamic" ErrorMessage="請填寫主旨" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 100px; white-space: nowrap;">
                <asp:Label ID="Label3" runat="server" Text="內容" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td>
                <uc3:UC_HtmlEditor ID="UC_HtmlEditor1" runat="server" Height="500px" Width="100%"/>
            </td>
        </tr>
    </table>
    <asp:Label ID="lbMsgId" runat="server" Visible="False" meta:resourcekey="lbMsgIdResource1"></asp:Label><br />
    <asp:Label ID="msgMustselectreceive" runat="server" Text="請選擇收件人" Visible="False" meta:resourcekey="msgMustselectreceiveResource1"></asp:Label>
</asp:Content>

