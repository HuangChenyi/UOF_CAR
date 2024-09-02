<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Personal_Briefcase_CreateFile" Title="新增檔案" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CreateFile.aspx.cs" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ValidationSummary id="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource1" BackColor="Red" ForeColor="White"></asp:ValidationSummary>
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="None" ErrorMessage="請上傳檔案" ForeColor="Red" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <table  class="PopTable" cellspacing="1">
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label1" runat="server" Text="檔案所在目錄" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="folderLbl" runat="server" Text="我的公事包\專案目錄" meta:resourcekey="folderLblResource1"></asp:Label></td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label2" runat="server" Text="檔案位置" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td>
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" />
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label3" runat="server" Text="備註" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td >
                <asp:TextBox ID="descriptionTB" runat="server" MaxLength="255" meta:resourcekey="descriptionTBResource1" Height="200px" TextMode="MultiLine" Width="100%"></asp:TextBox></td>
        </tr>
    </table>
</asp:Content>

