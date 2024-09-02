<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Member_ImportMember" Title="匯入會員" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="ImportMember.aspx.cs" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="PopTable" cellspacing="1">
        <tr>
            <td style="white-space: nowrap;">
                <asp:Label ID="Label3" runat="server" Text="選擇匯入檔案" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedMultipleFileSelection="false" AllowedFileType="Excel" />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/System/Organization/Member/Import Member Sample.xls" Text="下載Excel範例" Target="_blank" meta:resourcekey="btnDownloadResource1"></asp:HyperLink>
                <asp:Label ID="lblVersion" runat="server" Text="v4.0" meta:resourcekey="lblVersionResource1"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:Label ID="Label1" runat="server" ForeColor="Blue" Text="已匯入" Visible="False" meta:resourcekey="Label1Resource1"></asp:Label>
    <asp:Label ID="lbSuccess" runat="server" Font-Bold="True" ForeColor="Blue" Visible="False" meta:resourcekey="lbSuccessResource1"></asp:Label>
    <asp:Label ID="Label2" runat="server" ForeColor="Blue" Text="筆資料" Visible="False" meta:resourcekey="Label2Resource1"></asp:Label>
    <asp:Panel ID="panSendPW" runat="server" meta:resourcekey="panSendPWResource1">
        <asp:CheckBox ID="cbSendPW" runat="server" Text="匯入後立即發送密碼通知函給該使用者" Checked="True" meta:resourcekey="cbSendPWResource1" />
        <br />
        <asp:Label ID="Label39" runat="server" CssClass="SizeMemo" Text="若不勾選，亦可於匯入後到主畫面點選批次發送密碼函" meta:resourcekey="Label39Resource1"></asp:Label>
    </asp:Panel>
    <asp:TextBox ID="TextBox1" runat="server" Rows="5" ReadOnly="True" Width="100%" TextMode="MultiLine" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
    <asp:Label ID="lblAccountRepeat" runat="server" Text="Excel中帳號與其他筆資料重複" Visible="False" meta:resourcekey="lblAccountRepeatResource1"></asp:Label>       
    <asp:Label ID="lbNotAllowNull" runat="server" Text="Name & Group 欄位不得為空" Visible="False" meta:resourcekey="lbNotAllowNullResource1"></asp:Label>
    <asp:Label ID="lbAccountExist" runat="server" Text="帳號已存在" Visible="False" meta:resourcekey="lbAccountExistResource1"></asp:Label>
    <asp:Label ID="lbAccountFormatError" runat="server" Text="帳號格式不正確" Visible="False" meta:resourcekey="lbAccountFormatErrorResource1"></asp:Label>
    <asp:Label ID="lbError" runat="server" Text="匯入發生錯誤" Visible="False" meta:resourcekey="lbErrorResource1"></asp:Label>
    <asp:Label ID="lbModifyXLS" runat="server" Text="請修正XLS" Visible="False" meta:resourcekey="lbModifyXLSResource1"></asp:Label>
    <asp:Label ID="lbFormatErrorMsg" runat="server" Text="格式不正確" Visible="False" meta:resourcekey="lbFormatErrorMsgResource1"></asp:Label>
    <asp:Label ID="lblDepNameErr" runat="server" Text="部門名稱錯誤" Visible="False" meta:resourcekey="lblDepNameErrResource1"></asp:Label>
    <asp:Label ID="lblNoAuthority" runat="server" Text="沒有此群組的維護權限，請修改資料後重新匯入。" Visible="False" meta:resourcekey="lblNoAuthorityResource1"></asp:Label>
    <asp:Label ID="lblTimeZoneErr" runat="server" Text="匯入的時區不正確" Visible="False"  meta:resourcekey="lblTimeZoneErrResource1"></asp:Label>
    <asp:Label ID="lblEmailFormatError" runat="server" Text="Email格式不正確" Visible="False" meta:resourcekey="lblEmailFormatErrorResource1" ></asp:Label>    
    <asp:Label ID="lblFileNotParse" runat="server" Visible="False" Text="匯入的檔案無法解析" meta:resourcekey="lblFileNotParseResource1"></asp:Label>        
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
