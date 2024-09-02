<%@ Page Title="批次匯入卡號工號" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ImportCardNbrData.aspx.cs" Inherits="System_Organization_Employee_ImportCardNbrData" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="PopTable">
        <tr>
            <td style="width: 20%; white-space: nowrap">
                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label1Resource1"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="選擇匯入檔案" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedFileType="Excel" AllowedMultipleFileSelection="false" AjaxSupported="true" />
                <asp:HyperLink ID="hyLinkImportExcelDemo" runat="server" Text="下載Excel範例" NavigateUrl="~/System/Organization/Employee/Import_Card_Nbr_Sample.xls" Target="_blank" meta:resourcekey="hyLinkImportExcelDemoResource1"></asp:HyperLink>
            </td>
        </tr>
    </table>

    <asp:Label ID="lblMsgerr" runat="server" ReadOnly="True" Rows="2" TextMode="MultiLine" Visible="False" Width="100%" Height="15%" meta:resourcekey="lblMsgerrResource1"></asp:Label>
    <asp:TextBox ID="txtMsg" runat="server" ReadOnly="True" Rows="5" TextMode="MultiLine" Visible="False" Width="100%" Height="50%" meta:resourcekey="txtMsgResource1"></asp:TextBox>
    <asp:Label ID="lblError" runat="server" Text="更新時發生的錯誤" Visible="False" meta:resourcekey="lblErrorResource1"></asp:Label>
    <asp:Label ID="lblImportFail" runat="server" Text="請檢查檔案是否為Excel 97-2003 活頁簿(*.xls)格式" Visible="False" meta:resourcekey="lblImportFailResource1"></asp:Label>
    <asp:Label ID="lblFormatErrorMsg" runat="server" Text="格式不正確" Visible="False" meta:resourcekey="lblFormatErrorMsgResource1"></asp:Label>
    <asp:Label ID="lblMsgExcelAccount" runat="server" Text="Line {0} 的帳號：{1}是重複的資料" Visible="False" meta:resourcekey="lblNotAllowNullResource1"></asp:Label>
    <asp:Label ID="lblMsgAccount" runat="server" Text="帳號為必填" Visible="False" meta:resourcekey="lblMsgAccountResource1"></asp:Label>
    <asp:Label ID="lblMsgAccountNotFound" runat="server" Text="帳號不存在" Visible="False" meta:resourcekey="lblMsgAccountNotFoundResource1"></asp:Label>
    <asp:Label ID="lblSussessCount" runat="server" Visible="False" meta:resourcekey="lblSussessCountResource1"></asp:Label>
    <asp:Label ID="lblSuccessmsgFormat" runat="server" Text="成功匯入：{0}筆資料" Visible="False" meta:resourcekey="lblSuccessmsgFormat1"></asp:Label>
    
    <asp:Label ID="lblerrMsgFormat" runat="server" Text="Line {0}：{1}" Visible="False" meta:resourcekey="lblerrMsgFormat1"></asp:Label>
    <asp:Label ID="lblerrMsgEmpNo" runat="server" Text="Employee No 與 {1} 重複" Visible="False" meta:resourcekey="lblerrMsgEmpNo1"></asp:Label>
    <asp:Label ID="lblerrMsgCardNo" runat="server" Text="Card No 與 {1} 重複" Visible="False" meta:resourcekey="lblerrMsgCardNo1"></asp:Label>
    <asp:Label ID="lblerrMsgAiraFaceId" runat="server" Text="airaFace No 與 {1} 重複" Visible="False" meta:resourcekey="lblerrMsgAiraFaceId"></asp:Label>
    <asp:Label ID="lblAllexist" runat="server" Text="Card No 以及 Employee No 皆與 {1} 重複" Visible="False" meta:resourcekey="lblAllexist1"></asp:Label>
    <asp:Label ID="lblLineFormat" runat="server" Text="Line {0}： " Visible="False" meta:resourcekey="lblLineFormat1"></asp:Label>
    <asp:Label ID="lblNoAuthImport" runat="server" Text="沒有此人員的維護權限，請修改資料後重新匯入。" Visible="False" meta:resourcekey="lblNoAuthImportResource1"></asp:Label>
    <asp:Label ID="lblFileNotParse" runat="server" Visible="False" Text="匯入的檔案無法解析" meta:resourcekey="lblFileNotParseResource1"></asp:Label>
    <asp:Label ID="lblColumnLengthTooLong" runat="server" Visible="False" Text="超過長度限制50" meta:resourcekey="lblColumnLengthTooLongResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
