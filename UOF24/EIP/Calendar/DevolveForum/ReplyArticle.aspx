<%@ Page Title="回覆討論" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ReplyArticle.aspx.cs" Inherits="Ede.Uof.Web.EIP.Calendar.DevolveForum.ReplyArticle" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc1" TagName="UC_HtmlEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <table style="width:100%"  class=PopTable cellspacing=1>
        
        <tr style="width:100%">
            <td class="PopTableLeftTD" style="width: 100px; white-space:nowrap;" >
                <asp:Label ID="Label2"  runat="server" Text="張貼者"  nowrap="true" meta:resourcekey="Label2Resource1" ></asp:Label>
            </td>
            <td >
                <asp:Label ID="lblReplyUser" runat="server" meta:resourcekey="lblReplyUserResource1" ></asp:Label>
            </td>
        </tr>
        <tr style="width:100%">
            <td class="PopTableLeftTD" style="width: 100px; white-space:nowrap;">
                <asp:Label ID="Label3" runat="server" Text="內容" meta:resourcekey="Label3Resource1" ></asp:Label>
            </td>
            <td  >
                <uc1:UC_HtmlEditor runat="server" ID="RadEditor1" ModuleName="WKF" Width="100%" Height="470px" ProxyEnabled="true"/>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblLastModify" Text="回覆者：" runat="server" Visible="False" meta:resourcekey="lblLastModifyResource1" ></asp:Label>
    <asp:HiddenField ID="hfUserGuid" runat="server" />
    <asp:HiddenField ID="hfArticleGuid" runat="server" />
    <asp:HiddenField ID="hfDevolveGuid" runat="server" />
    <asp:HiddenField ID="hfDevolveSubject" runat="server" />
</asp:Content>
