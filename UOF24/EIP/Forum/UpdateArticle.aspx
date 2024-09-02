<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Forum_UpdateArticle" Title="修改文章" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="UpdateArticle.aspx.cs" %>

<%@ Register Src="../../Common/HtmlEditor/UC_HtmlEditor.ascx" TagName="UC_HtmlEditor" TagPrefix="uc3" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>   

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="無權限維護" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <table width="100%"  class="PopTable" cellspacing="1">
        <tr>
            <td style="width:100px; white-space:nowrap">
                <asp:Label ID="Label2" runat="server" Text="張貼者" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td >
                <asp:Label ID="lblUser" runat="server" meta:resourcekey="lblUserResource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="width:100px; white-space:nowrap">
                <asp:Label ID="Label1" runat="server" Text="主題" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td >
                <asp:Label ID="lblSubject" runat="server" Width="80%" meta:resourcekey="lblSubjectResource1"></asp:Label>
                <asp:TextBox ID="txtSubjct" runat="server" Width="100%" MaxLength="255" meta:resourcekey="txtSubjctResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubjct"
                    Display="Dynamic" ErrorMessage="請填入主旨" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width:100px; white-space:nowrap">
                <asp:Label ID="Label3" runat="server" Text="內容" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td style="height: 470px"  >
                <uc3:UC_HtmlEditor ID="UC_HtmlEditor1" runat="server" Width="100%" Height="510px" />     
            </td>
        </tr>
        
    </table>
</asp:Content>

