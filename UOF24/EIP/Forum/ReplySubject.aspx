<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Forum_ReplySubject" Title="回覆文章" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ReplySubject.aspx.cs" %>
<%@ Register Src="../../Common/HtmlEditor/UC_HtmlEditor.ascx" TagName="UC_HtmlEditor" TagPrefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="無權限維護" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="此主題已被鎖定,無法回覆" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
    <table style="width: 100%" class="PopTable" cellspacing="0" >
        <tr>
            <td class="PopTableLeftTD" style="width: 100px; white-space:nowrap;" >
                <asp:Label ID="Label2"  runat="server" Text="張貼者"  nowrap="true" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td >
                <asp:Label ID="lblRelyUser" runat="server" meta:resourcekey="lblRelyUserResource1"></asp:Label>
            </td>
        </tr>
        <tr >
            <td class="PopTableLeftTD" style="width: 100px;white-space:nowrap">
                <asp:Label ID="Label3" runat="server" Text="內容" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td  >
                <uc3:UC_HtmlEditor ID="UC_HtmlEditor1" runat="server" Width="100%" Height="545px" />     
            </td>
        </tr>

    </table>
    <asp:Label ID="msgAnonymous" runat="server" Text="匿名" Visible="False" meta:resourcekey="msgAnonymousResource1"></asp:Label>
</asp:Content>
