<%@ Page Title="匯入假日" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_OrganizationCalendar_ImportHoliday" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ImportHoliday.aspx.cs" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="沒有權限設定" Display="Dynamic" ForeColor="Red" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
    <table class="PopTable" style="width:100%;">
        <tr>
            <td style=" width:80px; white-space:nowrap;" class="PopTableLeftTD">
                <asp:Label ID="lblSelectFile" runat="server" Text="選擇檔案" 
                    meta:resourcekey="lblSelectFileResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="width:80%"> 
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" />
                <asp:HyperLink ID="hlSample" Text="下載Excel範例"  
                    NavigateUrl="~/EIP/OrganizationCalendar/Import_Holiday_Sample.xls" 
                    runat="server" meta:resourcekey="lblSampleResource1"></asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="vertical-align: top;" class="PopTableRightTD">
                <asp:TextBox ID="txtErrorMsg" Width="100%" Rows="8" TextMode="MultiLine"
                    ReadOnly="True" runat="server" meta:resourcekey="txtErrorMsgResource1"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfGroupID" runat="server" Visible="False" />
    <asp:Label ID="lblStartDateErr" runat="server" Text=" 開始日期格式錯誤" Visible="False" meta:resourcekey="lblStartDateErrResource1"></asp:Label>
    <asp:Label ID="lblEndDateErr" runat="server" Text=" 結束日期格式錯誤" Visible="False" meta:resourcekey="lblEndDateErrResource1"></asp:Label>
    <asp:Label ID="lblSubjectErr1" runat="server" Text="第 " Visible="False" meta:resourcekey="lblSubjectErr1Resource1"></asp:Label>
    <asp:Label ID="lblSubjectErr2" runat="server" Text=" 列，主旨欄位為必填" Visible="False" meta:resourcekey="lblSubjectErr2Resource1"></asp:Label>
    <asp:Label ID="lblDateErr2" runat="server" Text="，請填入開始日期" Visible="False" meta:resourcekey="lblDateErr2Resource1"></asp:Label>
    <asp:Label ID="lblDateErr3" runat="server" Text="，請填入結束日期" Visible="False" meta:resourcekey="lblDateErr3Resource1"></asp:Label>
    <asp:Label ID="lblDateErr4" runat="server" Text="，開始日期需在結束日期之前" Visible="False" meta:resourcekey="lblDateErr4Resource1"></asp:Label>
    <asp:Label ID="lblImportCount1" runat="server" Text="已匯入" Visible="False" meta:resourcekey="lblImportCount1Resource1" ></asp:Label>
    <asp:Label ID="lblImportCount2" runat="server" Text="筆" Visible="False" meta:resourcekey="lblImportCount2Resource1" ></asp:Label>
    <asp:Label ID="lblEmptyHolidayType" runat="server" Text="，請選擇類型" Visible="False" meta:resourcekey="lblEmptyHolidayTypeResource1"></asp:Label>
    <asp:Label ID="lblFileNotParse" runat="server" Visible="False" Text="匯入的檔案無法解析" meta:resourcekey="lblFileNotParseResource1"></asp:Label>        
</asp:Content>

