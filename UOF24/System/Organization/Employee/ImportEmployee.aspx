<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Employee_ImportEmployee" Title="匯入人員" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ImportEmployee.aspx.cs" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function updateWarning() {
            if (!confirm('<%=lblWarning.Text %>')) {
                return false;
            }
        }
    </script>
    <table width="100%">
        <tr>
            <td>
                <asp:Label ID="lblInsertCount" runat="server" ForeColor="Blue" Visible="False" meta:resourcekey="lblInsertCountResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblUpdateCount" runat="server" ForeColor="Blue" Visible="False" meta:resourcekey="lblUpdateCountResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Height="120px" ReadOnly="True" Width="80%" TextMode="MultiLine" meta:resourcekey="TextBox1Resource1"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedFileType="Excel" AllowedMultipleFileSelection="false" />
            </td>
        </tr>
    </table> 
     
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/System/Organization/Employee/Import_Employee_Sample.xls" Text="下載Excel範例" Target="_blank" meta:resourcekey="btnDownloadResource1"></asp:HyperLink>             
    
    <asp:Label ID="lbExcelVersion" runat="server" Text="v6.0" meta:resourcekey="lbExcelVersionResource1"></asp:Label>
    <br />
    <asp:Label ID="lblDescription" runat="server" ForeColor="Blue" Text="說明：\r\n 1.匯入的Excel中若有系統中已存在的帳號，將會更新該人員資料，但欄位為空白時不會覆蓋。\r\n 2.部門資料僅會更新主要部門。" meta:resourcekey="lblDescriptionResource1"></asp:Label><br />
    <asp:Panel ID="panSendPW" runat="server" meta:resourcekey="panSendPWResource1">
    <asp:CheckBox ID="cbSendPW" runat="server" Text="帳號建立後立即發送密碼通知函給該使用者" Checked="True" meta:resourcekey="cbSendPWResource1" /> <br/>
    <asp:Label ID="Label39" runat="server"  CssClass="SizeMemo" Text="若不勾選，亦可於帳號建立後到主畫面點選批次發送密碼函" meta:resourcekey="Label39Resource1" ></asp:Label> </asp:Panel> 
    <asp:Label ID="lbNotAllowNull" runat="server" Text="Account & Name & Department 欄位不得為空" Visible="False" meta:resourcekey="lbNotAllowNullResource1"></asp:Label>
    <asp:Label ID="lbAccountExist" runat="server" Text="帳號已存在" Visible="False" meta:resourcekey="lbAccountExistResource1"></asp:Label>
    <asp:Label ID="lblADAccountExist" runat="server" Text="AD帳號已存在" Visible="False" meta:resourcekey="lblADAccountExistResource1"></asp:Label>
    <asp:Label ID="lbCardNoExist" runat="server" Text="卡片號碼已存在" Visible="False" meta:resourcekey="lbCardNoExist1"></asp:Label>
    <asp:Label ID="lbEmployeeNoExist" runat="server" Text="員工編號已存在" Visible="False"  meta:resourcekey="lbEmployeeNoExist1"></asp:Label>
    <asp:Label ID="lbAiraFaceIdExist" runat="server" Text="人臉辨識編號已存在" Visible="False"  meta:resourcekey="lbAiraFaceIdExist1"></asp:Label>
    
    <asp:Label ID="lbAccountFormatError" runat="server" Text="帳號格式不正確" Visible="False" meta:resourcekey="lbAccountFormatErrorResource1"></asp:Label>
    <asp:Label ID="lblADAccountFormatError" runat="server" Text="AD帳號格式不正確" Visible="False" meta:resourcekey="lblADAccountFormatErrorResource1"></asp:Label>   
    <asp:Label ID="lbError" runat="server" Text="匯入發生錯誤" Visible="False" meta:resourcekey="lbErrorResource1"></asp:Label>
    <asp:Label ID="lbModifyXLS" runat="server" Text="請修正XLS" Visible="False" meta:resourcekey="lbModifyXLSResource1" ></asp:Label>    
    <asp:Label ID="lbFormatErrorMsg" runat="server" Text="格式不正確" Visible="False" meta:resourcekey="lbFormatErrorMsgResource1" ></asp:Label>
    <asp:Label ID="lblDepNameErr" runat="server" Text="部門名稱錯誤" Visible="False" meta:resourcekey="lblDepNameErrResource1" ></asp:Label>
    <asp:Label ID="lblDomainError" runat="server" Text="網域名稱不存在" Visible="False" meta:resourcekey="lblDomainErrorResource1" ></asp:Label>
    <asp:Label ID="lblImportFail" runat="server" Text="請檢查檔案是否為Excel 97-2003 活頁簿(*.xls)格式" Visible="False" meta:resourcekey="lblImportFailResource1" ></asp:Label>
    <asp:Label ID="lblTimeZoneErr" runat="server" Text="匯入的時區不正確" Visible="False"  meta:resourcekey="lblTimeZoneErrResource1"></asp:Label>    
    <asp:Label ID="lblDepInPartTime" runat="server" Text="主要部門與兼任部門重複" Visible="False" meta:resourcekey="lblDepInPartTimeResource1"></asp:Label>    
    <asp:Label ID="lblAccountRepeat" runat="server" Text="Excel中帳號與其他筆資料重複" Visible="False" meta:resourcekey="lblAccountRepeatResource1"></asp:Label>    
    <asp:Label ID="lblEmailFormatError" runat="server" Text="Email格式不正確" Visible="False" meta:resourcekey="lblEmailFormatErrorResource1" ></asp:Label>
    <asp:Label ID="lblCompanyNoisOver" runat="server" Text="公司別代碼超過長度限制10"  Visible="False" meta:resourcekey="lblCompanyNoisOverResource1"></asp:Label>
    <asp:Label ID="lblTaxNoisOver" runat="server" Text="公司統編超過長度限制8" Visible="False" meta:resourcekey="lblTaxNoisOverResource1"></asp:Label>
    <asp:Label ID="lblIsMember" runat="server" Text="此帳號為外部會員" Visible="False" meta:resourcekey="lblIsMemberResource1"></asp:Label>
    <asp:Label ID="lblAdded" runat="server" Text="已新增{0}筆資料" Visible="False" meta:resourcekey="lblAddedResource1"></asp:Label>
    <asp:Label ID="lblUpdated" runat="server" Text="已更新{0}筆資料" Visible="False" meta:resourcekey="lblUpdatedResource1"></asp:Label>
    <asp:Label ID="lblWarning" runat="server" Text="匯入的人員資料若已存在，系統會進行資料更新，確定要匯入？" Visible="False" meta:resourcekey="lblWarningResource1"></asp:Label>
    <asp:Label ID="lblAccountlockup" runat="server" Text="鎖定帳號格式錯誤" Visible="False" meta:resourcekey="lblAccountlockupResource1"></asp:Label>
    <asp:Label ID="lblExpiredat" runat="server" Text="帳號到期日格式錯誤" Visible="False" meta:resourcekey="lblExpiredatResource1"></asp:Label>
    <asp:Label ID="lblSuspendaccount" runat="server" Text="停用帳號格式錯誤" Visible="False" meta:resourcekey="lblSuspendaccountResource1"></asp:Label>
    <asp:Label ID="lblFileNotParse" runat="server" Visible="False" Text="匯入的檔案無法解析" meta:resourcekey="lblFileNotParseResource1"></asp:Label>        
    <asp:Label ID="lblColumnLengthTooLong" runat="server" Visible="False" Text="超過長度限制" meta:resourcekey="lblColumnLengthTooLongResource1"></asp:Label>
    
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hfIsUpdate" runat="server" Value="False"/>
</asp:Content>


