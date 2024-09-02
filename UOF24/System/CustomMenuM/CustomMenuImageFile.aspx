<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="CustomMenuImageFile.aspx.cs" Inherits="System_CustomMenuM_CustomMenuImageFile" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="PopTable">
        <tr>
            <td style="width: 20%">
                <asp:Label ID="lblMenuIcon" runat="server" Text="選單圖示" meta:resourcekey="lblMenuIconResource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_FileCenter ID="UC_FileCenter" runat="server" AllowedFileType="Image" ModuleName="EIP"/>
                <asp:CustomValidator ID="cvFileCenterMaxCount" runat="server" Display="Dynamic" meta:resourcekey="cvFileCenterMaxCountResource1"></asp:CustomValidator>
            </td>
        </tr>
    </table>
    <div>
        <asp:Label ID="lblMaxFileCount" runat="server" Text="自訂選單圖示只可上傳一個檔案" ForeColor="Blue" meta:resourcekey="lblMaxFileCountResource1"></asp:Label>
    </div>
</asp:Content>
