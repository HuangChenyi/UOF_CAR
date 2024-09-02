<%@ Page Title="匯入年休資訊" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_YearLeaveDays_ImportYearLeaveInfo" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="ImportYearLeaveInfo.aspx.cs" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        Sys.Application.add_load(function () {
            ControlSelectMonth();
            ChangedType();
        });
        function CopyFiled() {
            //Add code to handle your event here.
            // Safari 和 Chrome 無法透過javascript access clipboard.﻿
            clipboardData.setData("Text", $('#<%= txtMsg.ClientID %>').val());
        }

        function NewKeyPress(sender, args) {

            var keyCharacter = args.get_keyCharacter();

            if (keyCharacter === sender.get_numberFormat().DecimalSeparator ||
                keyCharacter === sender.get_numberFormat().NegativeSign) {

                args.set_cancel(true);
            }

        }

        function CheckSelectFile(source, args) {
            var uploadBtn = $find("<%= UC_FileCenter.ClientID %>");
            if (uploadBtn.get_count() === 0) {
                args.IsValid = false;
                return;
            }
        }

        function ControlSelectMonth() {
            if ($('#<%=rbList.ClientID %>').find("input:checked").val() === "2") {
                $('#<%=ddlSelectMonth.ClientID %>').prop("disabled", true);
                $('#<%=ddlSelectDay.ClientID %>').prop("disabled", true);
                $('#<%=lblMaxStart.ClientID%>').hide();
            } else {
                $('#<%=ddlSelectMonth.ClientID %>').prop("disabled", false);
                $('#<%=ddlSelectDay.ClientID %>').prop("disabled", false);
                $('#<%=lblMaxStart.ClientID%>').show();
            }
        }

        function CheckExplainDays(sender, args) {
            //保留總數、只保留去年年休則最大保留天數為必填
            if ($('#<%=rdbtnType.ClientID %>').find("input:checked").val() === "lastYear") {
                if ($('#<%=rbList.ClientID %>').find("input:checked").val() !== "2") {
                    var rdDays = $find("<%=rdDays.ClientID%>").get_value();
                    if (rdDays === '') {
                        args.IsValid = false;
                        return;
                    }
                }
            }
        }

        function ChangedType() {
            if ($('#<%=rdbtnType.ClientID %>').find("input:checked").val() === "lastYear") {
                $("#lastYearData").attr("style", "display:display");
                $("#lastYearDataMax").attr("style", "display:display");
            }
            else {
                $("#lastYearData").attr("style", "display:none");
                $("#lastYearDataMax").attr("style", "display:none");
            }
        }

        function ConfirmActiveYear() {
            //判斷是否有上傳檔案，有上傳的話在做以下的判斷。
            var uploadBtn = $find("<%= UC_FileCenter.ClientID %>");
            if (uploadBtn.get_count() > 0) {
                var year = $('#<%= ddlYear.ClientID  %> option:selected').val();
                var data = [year];
                var result = $uof.pageMethod.sync("CheckIsExistYear", data);
                if (result === "true") {
                    if (!confirm('<%= lblConfirmMsg.Text%>')) {
                        return false;
                    }
                }
            }
        }
       
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table cellpadding="0" cellspacing="1" class="PopTable">
                <tr>
                    <td style="width: 80px; white-space: nowrap;" class="PopTableLeftTD">
                        <asp:Label ID="Label1" runat="server" Text="匯入年度"
                            meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td class="PopTableRightTD">
                        <asp:DropDownList ID="ddlYear" runat="server"
                            meta:resourcekey="ddlYearResource1">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label6" runat="server" Text="上年度年休資訊來源" meta:resourcekey="Label6Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rdbtnType" runat="server" onclick="ChangedType()" meta:resourcekey="rdbtnTypeResource1">
                            <asp:ListItem Value="export" Text="依匯入檔案為主" meta:resourcekey="ListItemResource1"></asp:ListItem>
                            <asp:ListItem Value="lastYear" Text="依上年度保留設定" Selected="True" meta:resourcekey="ListItemResource2"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:Label ID="Label7" runat="server" Text="選擇依上年度保留設定時，即使匯入的檔案中有填入上年度年休資訊，也不會匯入該欄位。" CssClass="SizeMemo" meta:resourcekey="Label7Resource1"></asp:Label>
                    </td>
                </tr>
                <tr id="lastYearData" style="display:none">
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label2" runat="server" Text="上年度保留設定" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rbList" runat="server" AutoPostBack="True" onclick="ControlSelectMonth()" meta:resourcekey="rbListResource1">
                            <asp:ListItem Selected="True" Value="0" Text="保留總數" meta:resourcekey="ListItemResource3"></asp:ListItem>
                            <asp:ListItem Value="1" Text="只保留去年年休" meta:resourcekey="ListItemResource4"></asp:ListItem>
                            <asp:ListItem Value="2" Text="不保留" meta:resourcekey="ListItemResource5"></asp:ListItem>
                        </asp:RadioButtonList>
                        <table style="width: 40%;">
                            <tr>
                                <td style="white-space: nowrap;">
                                    <asp:DropDownList ID="ddlSelectMonth" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSelectMonth_SelectedIndexChanged" meta:resourcekey="ddlSelectMonthResource1">
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlSelectDay" runat="server" meta:resourcekey="ddlSelectDayResource1">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="lblSetMHmemo" runat="server" Text="如選擇保留則可自訂保留期限，如不自訂則保留期限與新產生年休結束日相同。" CssClass="SizeMemo" meta:resourcekey="lblSetMHmemoResource1"></asp:Label>
                    </td>
                </tr>
                <tr id="lastYearDataMax" style="display:none">
                    <td class="PopTableLeftTD" style="white-space: nowrap">
                        <asp:Label ID="lblMaxStart" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblMaxStartResource1"></asp:Label>
                        <asp:Label ID="Label3" runat="server" Text="最大保留數" meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td class="PopTableRightTD">
                        <telerik:RadNumericTextBox ID="rdDays" runat="server" Width="100px" MinValue="0" MaxValue="9999" MaxLength="4" CssClass="RightAligned" Culture="zh-TW" DbValueFactor="1" LabelCssClass="" LabelWidth="64px" meta:resourcekey="rdDaysResource1">
                            <NegativeStyle Resize="None" />
                            <NumberFormat GroupSeparator="" DecimalDigits="0" ZeroPattern="n"></NumberFormat>
                            <ClientEvents OnKeyPress="NewKeyPress" />
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="lblUnit" runat="server" Text="天(時)數" meta:resourcekey="lblUnitResource1"></asp:Label>
                        <asp:CustomValidator ID="cvCheckExplainDays" runat="server" ErrorMessage="請輸入最大保留數" Display="Dynamic" ClientValidationFunction="CheckExplainDays" meta:resourcekey="cvCheckExplainDaysResource1"></asp:CustomValidator>
                        <br />
                        <asp:Label ID="lblExplainDays" runat="server" Text="如要保留全部的年休數，請在最大保留數中輸入0。" CssClass="SizeMemo" meta:resourcekey="lblExplainDaysResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 80px; white-space: nowrap;" class="PopTableLeftTD">
                        <asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label5Resource1"></asp:Label>
                        <asp:Label ID="Label4" runat="server" Text="選擇匯入檔案" meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>
                    <td class="PopTableRightTD">
                        <asp:CustomValidator ID="cvCheckSelectFile" runat="server" ErrorMessage="請選擇檔案" ClientValidationFunction="CheckSelectFile" Display="Dynamic" meta:resourcekey="cvCheckSelectFileResource1"></asp:CustomValidator>
                        <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedFileType="Excel" AllowedMultipleFileSelection="false" />
                        <asp:HyperLink ID="hyLink" runat="server"
                            NavigateUrl="~/Eip/Duty/YearLeaveDays/ImportYearLeaveSample.xls"
                            meta:resourcekey="hyLinkResource1" Text="下載Excel範例"></asp:HyperLink>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblClick" runat="server" Text="*點擊這裡可複製錯誤訊息" ForeColor="Blue" Visible="False" meta:resourcekey="lblClickResource1"></asp:Label>
            <asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" Width="100%" Rows="5" Visible="False" meta:resourcekey="txtMsgResource1"></asp:TextBox>
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblNotArraveDate" runat="server" Text="沒有設定員工到職日" Visible="False" meta:resourcekey="lblNotArraveDateResource1"></asp:Label>
    <asp:Label ID="lblRow" runat="server" Text="第{0}資料" Visible="False" meta:resourcekey="lblRowResource1"></asp:Label>
    <asp:Label ID="lblAccountNotExist" runat="server" Text="帳號不存在" Visible="False" meta:resourcekey="lblAccountNotExistResource1"></asp:Label>
    <asp:Label ID="lblFormatError" runat="server" Text="匯入格式錯誤" Visible="False" meta:resourcekey="lblFormatErrorResource1"></asp:Label>
    <asp:Label ID="lblNoFile" runat="server" Text="請匯入檔案" Visible="False" meta:resourcekey="lblNoFileResource1"></asp:Label>
    <asp:Label ID="lblYearthNotInt" runat="server" Text="年資不為整數" Visible="False" meta:resourcekey="lblYearthNotIntResource1"></asp:Label>
    <asp:Label ID="lblYearthLessThanZero" runat="server" Text="年資不可小於0" Visible="False" meta:resourcekey="lblYearthLessThanZeroResource1"></asp:Label>
    <asp:Label ID="lblLeaveDaysNotNumber" runat="server" Text="本年度可休天數不為數值" Visible="False" meta:resourcekey="lblLeaveDaysNotNumberResource1"></asp:Label>
    <asp:Label ID="lblLeaveDaysLessThanZero" runat="server" Text="本年度可休天數不可小於0" Visible="False" meta:resourcekey="lblLeaveDaysLessThanZeroResource1"></asp:Label>
    <asp:Label ID="lblLeaveDaysBeginNotDate" runat="server" Text="本年度可休天數的可請時間(起)不為日期格式" Visible="False" meta:resourcekey="lblLeaveDaysBeginNotDateResource1"></asp:Label>
    <asp:Label ID="lblLeaveDaysEndNotDate" runat="server" Text="本年度可休天數的可請時間(迄)不為日期格式" Visible="False" meta:resourcekey="lblLeaveDaysEndNotDateResource1"></asp:Label>
    <asp:Label ID="lblLeaveDaysDateRangeError" runat="server" Text="本年度可休天數的可請時間(迄)不可早於可請時間(起)" Visible="False" meta:resourcekey="lblLeaveDaysDateRangeErrorResource1"></asp:Label>
    <asp:Label ID="lblLastYearLeaveDaysNotNumber" runat="server" Text="去年剩餘天數不為數值" Visible="False" meta:resourcekey="lblLastYearLeaveDaysNotNumberResource1"></asp:Label>
    <asp:Label ID="lblLastYearLeaveDaysLessThenZero" runat="server" Text="去年度剩餘天數不可小於0" Visible="False" meta:resourcekey="lblLastYearLeaveDaysLessThenZeroResource1"></asp:Label>
    <asp:Label ID="lblLastYearLeaveDaysBeginNotDate" runat="server" Text="去年剩餘天數的可請時間(起)不為日期格式" Visible="False" meta:resourcekey="lblLastYearLeaveDaysBeginNotDateResource1"></asp:Label>
    <asp:Label ID="lblLastYearLeaveDaysEndNotDate" runat="server" Text="去年剩餘天數的可請時間(迄)不為日期格式" Visible="False" meta:resourcekey="lblLastYearLeaveDaysEndNotDateResource1"></asp:Label>
    <asp:Label ID="lblLastYearLeaveDaysDateRangeError" runat="server" Text="去年剩餘天數的可請時間(迄)不可早於可請時間(起)" Visible="False" meta:resourcekey="lblLastYearLeaveDaysDateRangeErrorResource1"></asp:Label>
    <asp:Label ID="lblNotAllowCreate" runat="server" Text="不可匯入舊年度的資料，已存在更新年度的資料" Visible="False" meta:resourcekey="lblNotAllowCreateResource1"></asp:Label>
    <asp:Label ID="lblErrorYearLeave" runat="server" Style="display: none" ForeColor="Red" Text="尚有審核中的年休假單,不可產生年休假資訊!" meta:resourcekey="lblErrorYearLeaveResource1"></asp:Label>
    <asp:Label ID="lblDomainError" runat="server" Text="網域名稱不存在" Visible="False" meta:resourcekey="lblDomainErrorResource1"></asp:Label>
    <asp:Label ID="lblConfirmMsg" runat="server" Style="display: none" Text="提醒您如有相同年度的資料，則會以本次產生的為主。" meta:resourcekey="lblConfirmMsgResource1"></asp:Label>
    <asp:Label ID="lblNotAllowYearDays" runat="server" Visible="False" Text="今年年休可休(時)數不可小於今年度已用天(時)數:已用" meta:resourcekey="lblNotAllowYearDaysResource1"  ></asp:Label>
    <asp:Label ID="lblNotAllowLastYearDays" runat="server" Visible="False" Text="去年度保留年休天(時)數不可小於去年度已用天(時)數:已用" meta:resourcekey="lblNotAllowLastYearDaysResource1"  ></asp:Label>
    <asp:Label ID="lblDays" runat="server" Visible="False" Text="天" meta:resourcekey="lblDaysResource1"></asp:Label>
    <asp:Label ID="lblHours" runat="server" Visible="False" Text="小時" meta:resourcekey="lblHourssResource1"></asp:Label>
    <asp:Label ID="lblNeedInput" runat="server" Text="請輸入必填欄位" Visible="False" meta:resourcekey="lblNeedInputResource1"></asp:Label>
    <asp:Label ID="lblResultCount" runat="server" Text="已匯入{0}筆資料" Visible="False" meta:resourcekey="lblResultCountResource1"></asp:Label>
    <asp:Label ID="lblNoAuthority" runat="server" Text="沒有此人員的維護權限，請修改資料後重新匯入。" Visible="False" meta:resourcekey="lblNoAuthorityResource1"></asp:Label>
    <asp:Label ID="lblReason" runat="server" Text="匯入年休" Visible="False" meta:resourcekey="lblReasonResource1"></asp:Label>
    <asp:Label ID="lblMonth" runat="server" Text="月" Visible="False" meta:resourcekey="lblMonthResource1" ></asp:Label>
    <asp:Label ID="lblddlDay" runat="server" Text="日" Visible="False" meta:resourcekey="lblddlDayResource1" ></asp:Label>
    <asp:Label ID="lblNotSetDate" runat="server" Text="沒有設定起算基準日" Visible="False" meta:resourcekey="lblNotSetDateResource1"></asp:Label>
    <asp:Label ID="lblUserNotActive" runat="server" Text="人員已到期或停用" Visible="False" meta:resourcekey="lblUserNotActiveResource1"></asp:Label>
    <asp:Label ID="lblFileNotParse" runat="server"  Text="匯入的檔案無法解析" Visible="False" meta:resourcekey="lblFileNotParseResource1"></asp:Label>
</asp:Content>
