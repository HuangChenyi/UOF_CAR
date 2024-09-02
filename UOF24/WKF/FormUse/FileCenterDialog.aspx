<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_FileCenterDialog" Title="檔案操作" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="FileCenterDialog.aspx.cs" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td width="20"></td>
            <td>
                <asp:Label ID="lblConstrain" runat="server" Text="未購買文件轉檔服務時，只允許上傳PDF檔案。" Visible="False" CssClass="SizeMemo" meta:resourcekey="lblConstrainResource1"></asp:Label>
                <uc1:UC_FileCenter runat="server" ID="Uc_FileCenter1" AllowedMultipleFileSelection="true" ProxyEnabled="true"/>
            </td>
        </tr>
        <tr>
            <td width="20"></td>
            <td>
                <asp:Label ID="lblLimitDiscription" runat="server" CssClass="SizeMemo" Visible="False" meta:resourcekey="lblLimitDiscriptionResource1"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblLimitDiscriptionText" runat="server" Text="※單一檔案大小不可超出 {0}" CssClass="SizeMemo" Visible="False" meta:resourcekey="lblLimitDiscriptionTextResource1"></asp:Label>
</asp:Content>

