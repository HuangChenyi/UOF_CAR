<%@ Page Title="依工號匯入班表" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_TimeTable_ImportDutyByEmpNo" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ImportDutyByEmpNo.aspx.cs" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function CheckSelectFile(source, args) {
            var uploadBtn = $find("<%= UC_FileCenter.ClientID %>");
                if (uploadBtn.get_count() == 0) {
                    args.IsValid = false;
                    return;
                }
            }
    </script>
    <table class="PopTable" cellspacing="1">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label1Resource1"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="檔案" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <asp:CustomValidator ID="cvCheckSelectFile" runat="server" ErrorMessage="請選擇檔案" ClientValidationFunction="CheckSelectFile" Display="Dynamic" meta:resourcekey="cvCheckSelectFileResource1"></asp:CustomValidator>
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedMultipleFileSelection="false" AllowedFileType="Excel" />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/EIP/Duty/TimeTable/ImportDutyByEmpNoSample.xls" Text="下載Excel範例" Target="_blank" meta:resourcekey="btnDownloadResource1"></asp:HyperLink>             
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="訊息" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMessage" runat="server" ReadOnly="True" Rows="20" TextMode="MultiLine" Width="100%" meta:resourcekey="txtMessageResource1"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblDutyTTNoExist" runat="server" Text="班表不存在" Visible="False" meta:resourcekey="lblDutyTTNoExistResource1"></asp:Label>
    <asp:Label ID="lblCodeNoExist" runat="server" Text="班別代碼不正確" Visible="False" meta:resourcekey="lblCodeNoExistResource1"></asp:Label>
    <asp:Label ID="lblDateForm" runat="server" Text="日期{0}號" Visible="False" meta:resourcekey="lblDateFormResource1"></asp:Label>
    <asp:Label ID="lbDate" runat="server" Text="日期格式不正確" Visible="False" meta:resourcekey="lbDateResource1"></asp:Label>
    <asp:Label ID="lbDate2" runat="server" Text="檔案中該工號有重複的資料" Visible="False" meta:resourcekey="lbDate2Resource1"></asp:Label>
    <asp:Label ID="lblEmpNo" runat="server" Text="工號不存在" Visible="False" meta:resourcekey="lbAccountResource1"></asp:Label>
    <asp:Label ID="lbWorkHour" runat="server" Text="工時格式不正確" Visible="False" meta:resourcekey="lbWorkHourResource1"></asp:Label>
    <asp:Label ID="lbTime" runat="server" Text="時間格式不正確,正確格式為HH:mm" Visible="False" meta:resourcekey="lbTimeResource1"></asp:Label>
    <asp:Label ID="lbSuccess" runat="server" Text="匯入成功,共匯入{0}筆資料" Visible="False" meta:resourcekey="lbSuccessResource1"></asp:Label>
    <asp:Label ID="lblCover" runat="server" Text="最早上班時間不能早於前一天的最晚下班時間" Visible="False" meta:resourcekey="lblCoverResource1"></asp:Label>
    <asp:Label ID="lblNoAuthority" runat="server" Text="沒有此人員的維護權限，請修改資料後重新匯入。" Visible="False" meta:resourcekey="lblNoAuthorityResource1"></asp:Label>
    <asp:Label ID="lblFormateErrorMsg" runat="server" Text="匯入檔案格式錯誤，請重新上傳！" Visible="False" meta:resourcekey="lblFormateErrorMsgResource1"></asp:Label>
    <asp:Label ID="lblFileNotParse" runat="server" Visible="False" Text="匯入的檔案無法解析" meta:resourcekey="lblFileNotParseResource1"></asp:Label>

</asp:Content>

