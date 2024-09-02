<%@ Page Title="匯入補休時數" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ImportTimeOffEdit.aspx.cs" Inherits="Ede.Uof.Web.EIP.Duty.TimeOff.ImportTimeOffEdit" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function CopyFiled() {
            //Add code to handle your event here.
            // Safari 和 Chrome 無法透過javascript access clipboard.﻿
            clipboardData.setData("Text", $('#<%= txtMsg.ClientID %>').val());
        }
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
            <td style=" white-space:nowrap;">
                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label1Resource1"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="選擇匯入檔案" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <asp:CustomValidator ID="cvCheckSelectFile" runat="server" ErrorMessage="請選擇檔案" ClientValidationFunction="CheckSelectFile" Display="Dynamic" meta:resourcekey="cvCheckSelectFileResource1"></asp:CustomValidator>
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedFileType="Excel" AllowedMultipleFileSelection="false" AjaxSupported="true"/>
                <asp:HyperLink ID="hyLinkImportSample" runat="server" NavigateUrl="~/EIP/Duty/TimeOff/ImportTimeOffSample.xls" Target="_blank" Text="下載Excel範例" meta:resourcekey="hyLinkImportSampleResource1"></asp:HyperLink>
            </td>
        </tr>
        </table>
    <asp:Label ID="lblClick" runat="server" Text="*點擊這裡可複製錯誤訊息" ForeColor="Blue" Visible="False" meta:resourcekey="lblClickResource1"></asp:Label>
    <asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" Width="100%" Rows="5" Visible="False" meta:resourcekey="txtMsgResource1"></asp:TextBox>
    <asp:Label ID="lblMsgAccount" runat="server" Text="人員帳號為必填" Visible="False" meta:resourcekey="lblMsgAccountResource1" ></asp:Label>
    <asp:Label ID="lblSuccess" runat="server" Text="匯入成功,共匯入{0}筆資料" Visible="False" meta:resourcekey="lblSuccessResource1" ></asp:Label>
    <asp:Label ID="lblDomainError" runat="server" Text="網域名稱不存在" Visible="False" meta:resourcekey="lblDomainErrorResource1" ></asp:Label>
    <asp:Label ID="lblAccountNotExist" runat="server" Text="帳號不存在" Visible="False" meta:resourcekey="lblAccountNotExistResource1" ></asp:Label>
    <asp:Label ID="lblHoursNotNumber" runat="server" Text="時數不為數值" Visible="False" meta:resourcekey="lblHoursNotNumberResource1" ></asp:Label>
    <asp:Label ID="lblUsedHoursNotNumber" runat="server" Text="已用時數不為數值" Visible="False" meta:resourcekey="lblUsedHoursNotNumberResource1" ></asp:Label>
    <asp:Label ID="lblStartDateNotDate" runat="server" Text="補休開始日不為日期格式" Visible="False" meta:resourcekey="lblStartDateNotDateResource1" ></asp:Label>
    <asp:Label ID="lblEndDateNotDate" runat="server" Text="補休到期日不為日期格式" Visible="False" meta:resourcekey="lblEndDateNotDateResource1" ></asp:Label>
    <asp:Label ID="lblDateRangeError" runat="server" Text="補休到期日不可早於開始日" Visible="False" meta:resourcekey="lblDateRangeErrorResource1" ></asp:Label>
    <asp:Label ID="lblFormateErrorMsg" runat="server" Text="匯入檔案格式錯誤，請重新上傳！" Visible="False" meta:resourcekey="lblFormateErrorMsgResource1"></asp:Label>
    <asp:Label ID="lblDisallowMinus" runat="server" Text="已用時數不可大於可用時數" Visible="False"  meta:resourcekey="lblDisallowMinusResource1"></asp:Label>
    <asp:Label ID="lblHourNotNegative" runat="server" Text="可用時數不可小於零" Visible="False"  meta:resourcekey="lblHourNotNegativeResource1"></asp:Label>
    <asp:Label ID="lblUseHourNotNegative" runat="server" Text="已用時數不可小於零" Visible="False"  meta:resourcekey="lblUseHourNotNegativeResource1"></asp:Label>    
    <asp:Label ID="lblFileNotParse" runat="server" Visible="False" Text="匯入的檔案無法解析" meta:resourcekey="lblFileNotParseResource1"></asp:Label>        
</asp:Content>
