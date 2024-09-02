<%@ Page Title="批次更新時區資料" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ImportTimeZoneData.aspx.cs" Inherits="System_Organization_Employee_ImportTimeZoneData" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table class="PopTable" cellspacing="1">
        <tr>
            <td style=" white-space:nowrap;">
                <asp:Label ID="Label1" runat="server" Text="選擇更新檔案" meta:resourcekey="Label1Resource2"></asp:Label>
            </td>
            <td>
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedFileType="Excel" AllowedMultipleFileSelection="False" />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/System/Organization/Employee/Import_TimeZoneData_Sample.xls" Text="下載Excel範例" Target="_blank" meta:resourcekey="HyperLink1Resource2"></asp:HyperLink>
            </td>
        </tr>
        </table>
    <asp:TextBox ID="txtMsg" runat="server" ReadOnly="True" Rows="15" TextMode="MultiLine" Visible="False" Width="100%" meta:resourcekey="txtMsgResource2"></asp:TextBox>
    <asp:Label ID="lbError" runat="server" Text="更新時發生錯誤" Visible="False" meta:resourcekey="lbErrorResource2"></asp:Label>
    <asp:Label ID="lblImportFail" runat="server" Text="請檢查檔案是否為Excel 97-2003 活頁簿(*.xls)格式" Visible="False" meta:resourcekey="lblImportFailResource2" ></asp:Label>
    <asp:Label ID="lbFormatErrorMsg" runat="server" Text="格式不正確" Visible="False" meta:resourcekey="lbFormatErrorMsgResource2" ></asp:Label>
    <asp:Label ID="lblMsgAccount" runat="server" Text="帳號為必填" Visible="False" meta:resourcekey="lblMsgAccountResource2" ></asp:Label>
    <asp:Label ID="lblMsgAccountNotFound" runat="server" Text="帳號不存在" Visible="False" meta:resourcekey="lblMsgAccountNotFoundResource2" ></asp:Label>
    <asp:Label ID="lblMsgLocationNotFound" runat="server" Text="歸屬地點不存在，請先至歸屬地點維護頁面新增資料。" Visible="False" meta:resourcekey="lblMsgLocationNotFoundResource2" ></asp:Label>
    <asp:Label ID="lblMsgDisplayTimeZoneNotFound" runat="server" Text="顯示時區不存在，請確認資料是否正確。" Visible="False" meta:resourcekey="lblMsgDisplayTimeZoneNotFoundResource2" ></asp:Label>
    <asp:Label ID="lblMsgSuccess" runat="server" Text="更新成功" Visible="False" meta:resourcekey="lblMsgSuccessResource2" ></asp:Label>
    <asp:Label ID="lblNoAuthImport" runat="server" Text="沒有此人員的維護權限，請修改資料後重新匯入。" Visible="False" meta:resourcekey="lblNoAuthImportResource1"></asp:Label>
    <asp:Label ID="lblFileNotParse" runat="server" Visible="False" Text="匯入的檔案無法解析" meta:resourcekey="lblFileNotParseResource1"></asp:Label>    
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hfCurrentIP" runat="server" />
</asp:Content>
