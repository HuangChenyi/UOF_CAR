<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Basic_Personal_AddressBook_ImportAddressBook" Title="匯入人員" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ImportAddressBook.aspx.cs" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%">
        <tr>
            <td>
                <asp:Label ID="lblSuccessImport" runat="server" ForeColor="Blue" Text="已匯入" Visible="False" meta:resourcekey="Label1Resource1"></asp:Label>
                <asp:Label ID="lbSuccess" runat="server" Font-Bold="True" ForeColor="Blue" Visible="False" meta:resourcekey="lbSuccessResource1"></asp:Label>
                <asp:Label ID="lblSuccessRecoder" runat="server" ForeColor="Blue" Text="筆資料" Visible="False" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Height="120px" ReadOnly="True" Width="80%" TextMode="MultiLine" meta:resourcekey="TextBox1Resource1"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" />
            </td>
        </tr>
    </table> 
     <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Basic/Personal/AddressBook/AddressBookSample.xls" Text="下載Excel格式範例" Target="_blank" meta:resourcekey="btnDownloadResource1"></asp:HyperLink>             
    <asp:Label ID="lbExcelVersion" runat="server" Text="v2.0" 
        meta:resourcekey="lbExcelVersionResource1"></asp:Label><br />
    
    <asp:Label ID="lbNotAllowNull" runat="server" Text="Name & Class 欄位不得為空" Visible="False" meta:resourcekey="lbNotAllowNullResource1"></asp:Label>
    <asp:Label ID="lbAccountExist" runat="server" Text="帳號已存在" Visible="False" meta:resourcekey="lbAccountExistResource1"></asp:Label>
    <asp:Label ID="lbAccountFormatError" runat="server" Text="帳號格式不正確" Visible="False" meta:resourcekey="lbAccountFormatErrorResource1"></asp:Label>
    <asp:Label ID="lbError" runat="server" Text="匯入發生錯誤" Visible="False" meta:resourcekey="lbErrorResource1"></asp:Label>
    <asp:Label ID="lbModifyXLS" runat="server" Text="請修正XLS" Visible="False" meta:resourcekey="lbModifyXLSResource1" ></asp:Label>    
    <asp:Label ID="lbFormatErrorMsg" runat="server" Text="格式不正確" Visible="False" meta:resourcekey="lbFormatErrorMsgResource1" ></asp:Label>
    <asp:Label ID="lblSexErr" runat="server" Text="性別只允許輸入M或F" Visible="False" meta:resourcekey="lblSexErrResource1"></asp:Label>
    <asp:Label ID="lbPersonId" runat="server" Visible="False" meta:resourcekey="lbPersonIdResource1"></asp:Label>
    <asp:Label ID="lbClassGuid" runat="server" Visible="False" meta:resourcekey="lbClassGuidResource1"></asp:Label>
    <asp:Label ID="lblFileNotParse" runat="server" Visible="False" Text="匯入的檔案無法解析" meta:resourcekey="lblFileNotParseResource1"></asp:Label>
</asp:Content>


