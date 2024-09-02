<%@ Page Title="新增討論" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="CreateArticle.aspx.cs" Inherits="Ede.Uof.Web.EIP.Calendar.DevolveForum.CreateArticle" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc1" TagName="UC_HtmlEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:CustomValidator ID="cvNonAuth" runat="server" Display="Dynamic" ErrorMessage="無權限維護" meta:resourcekey="cvNonAuthResource1" ></asp:CustomValidator>
    <asp:CustomValidator ID="cvArticleAlreadyExist" Display="Dynamic" Text="本討論已開始，請重新整理。" runat="server" ErrorMessage="CustomValidator" meta:resourcekey="cvArticleAlreadyExistResource1" ></asp:CustomValidator>
    <asp:CustomValidator ID="cvNonDevolve" Display="Dynamic" Text="無此交辦" runat="server" ErrorMessage="CustomValidator" meta:resourcekey="cvNonDevolveResource1" ></asp:CustomValidator>
      <table class="PopTable" cellspacing=1>
        <tr >
            <td style="width: 100px; white-space:nowrap;" >
                <asp:Label ID="Label2"  runat="server" Text="張貼者"  nowrap="true" meta:resourcekey="Label2Resource1" ></asp:Label>
            </td>
            <td >
                <asp:Label ID="lblReplyUser" runat="server" meta:resourcekey="lblReplyUserResource1" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:8%">
                <asp:Label ID="Label1" runat="server" Text="主題" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td style="width:92%">
                <asp:Label ID="lblSubject" runat="server" meta:resourcekey="lblSubjectResource1" ></asp:Label>
                <asp:TextBox ID="txtSubjct" runat="server" Width="100%" MaxLength="255" meta:resourcekey="txtSubjctResource1" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfCheckSubject" runat="server" ControlToValidate="txtSubjct" Display="Dynamic" ErrorMessage="請填入主旨" meta:resourcekey="rfCheckSubjectResource1" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 100px;white-space:nowrap">
                <asp:Label ID="Label3" runat="server" Text="內容" meta:resourcekey="Label3Resource1" ></asp:Label>
            </td>
            <td>
                <uc1:UC_HtmlEditor runat="server" ID="RadEditor1" ModuleName="WKF" Width="100%" height="800px" ProxyEnabled="true"/>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblLastModify" Text="回覆者：" runat="server" Visible="False" meta:resourcekey="lblLastModifyResource1" ></asp:Label>
    <asp:Label ID="lblPoster" Text="張貼者：" runat="server" Visible="False" meta:resourcekey="lblPosterResource1"></asp:Label>
    <asp:HiddenField ID="hfDevolveGuid" runat="server" />
    <asp:HiddenField ID="hfDevolveSubject" runat="server" />
    <asp:HiddenField ID="hfUserGuid" runat="server" />
    <asp:HiddenField ID="hfArticleGuid" runat="server" />
</asp:Content>