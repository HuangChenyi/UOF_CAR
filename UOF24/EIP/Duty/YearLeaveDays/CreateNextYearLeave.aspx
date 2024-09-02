<%@ Page Title="產生年休資訊" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_YearLeaveDays_CreateNextYearLeave" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="CreateNextYearLeave.aspx.cs" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">

        Sys.Application.add_load(function () {
            ControlSelectMonth();
        });

        function CheckSelectUser(source, args) {
            var userList = $('#<%= hfUserList.ClientID%>');
            if (userList.val() == '') {
                args.IsValid = false;
                return;
            }
        }

        function CopyFiled() {
            alert($('#<%= txtMsg.ClientID %>').val());
            //Add code to handle your event here.
            clipboardData.setData("Text", $('#<%= txtMsg.ClientID %>').val());
                 }
                 //add by taylor 檢查最大保留天數是否為負數。2012/11/14
                 function CheckNumber() {
                     if (window.event.keyCode == 45) {     //0-->空字元
                         window.event.keyCode = 0;
                     }
                 }
                 function NewKeyPress(sender, args) {

                     var keyCharacter = args.get_keyCharacter();

                     if (keyCharacter == sender.get_numberFormat().DecimalSeparator ||
                         keyCharacter == sender.get_numberFormat().NegativeSign) {

                         args.set_cancel(true);
                     }

                 }

                 function ControlSelectMonth() {
                     if ($('#<%=rbList.ClientID %>').find("input:checked").val() == "2") {
                $('#<%=ddlSelectMonth.ClientID %>').prop("disabled", true);
                $('#<%=ddlSelectDay.ClientID %>').prop("disabled", true);
                $('#<%=lblMaxStart.ClientID%>').hide();
            }
            else {
                $('#<%=ddlSelectMonth.ClientID %>').prop("disabled", false);
                $('#<%=ddlSelectDay.ClientID %>').prop("disabled", false);
                $('#<%=lblMaxStart.ClientID%>').show();
            }
        }

        function CheckExplainDays(sender, args) {
            //保留總數、只保留去年年休則最大保留天數為必填
            if ($('#<%=rbList.ClientID %>').find("input:checked").val() != "2") {
                var rdDays = $find("<%=rdDays.ClientID%>").get_value();
                if (rdDays === '') {
                    args.IsValid = false;
                    return;
                }
            }
        }

        function ConfirmActiveYear() {
            if (Page_IsValid) {
                var year = $('#<%= ddlYear.ClientID  %> option:selected').val();
                var data = [year];
                var result = $uof.pageMethod.sync("CheckIsExistYear", data);
                if (result === "true") {
                    if (!confirm('<%= lblConfirmMsg.Text%>'))
                        return false;
                }
            }

        }
    </script>
    <style type="text/css">
        .RightAligned {
            text-align: right;
        }
    </style>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable" cellpadding="0" cellspacing="1" style="width: 100%">
                <tr>
                    <td class="PopTableHeader" colspan="2" style="text-align: center;">
                        <center>
                            <asp:Label ID="Label1" runat="server" Text="年休產生設定" meta:resourcekey="Label1Resource1"></asp:Label>
                        </center>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="產生年度" meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True" meta:resourcekey="ddlYearResource1" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label2" runat="server" Text="上年度保留設定" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rbList" runat="server" AutoPostBack="True" onclick="ControlSelectMonth()" meta:resourcekey="rbListResource1" >
                            <asp:ListItem Selected="True" Value="0" meta:resourcekey="ListItemResource1" Text="保留總數"></asp:ListItem>
                            <asp:ListItem Value="1" meta:resourcekey="ListItemResource2" Text="只保留去年年休"></asp:ListItem>
                            <asp:ListItem Value="2" meta:resourcekey="ListItemResource3" Text="不保留"></asp:ListItem>
                        </asp:RadioButtonList>
                        <table style="width: 40%;">
                            <tr>
                                <td style="white-space: nowrap;">
                                    <asp:DropDownList ID="ddlSelectMonth" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSelectMonth_SelectedIndexChanged" meta:resourcekey="ddlSelectMonthResource1">
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlSelectDay" runat="server"
                                        meta:resourcekey="ddlSelectDayResource1">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="lblSetMHmemo" runat="server" Text="如選擇保留則可自訂保留期限，如不自訂則保留期限與新產生年休結束日相同。" CssClass="SizeMemo" meta:resourcekey="lblSetMHmemoResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
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
                        <asp:Label ID="lblUnit" runat="server" Text="天(時)數" meta:resourcekey="Label5Resource1"></asp:Label>
                        <asp:CustomValidator ID="cvCheckExplainDays" runat="server" ErrorMessage="請輸入最大保留數" Display="Dynamic" ClientValidationFunction="CheckExplainDays" meta:resourcekey="cvCheckExplainDaysResource1"></asp:CustomValidator>
                        <br />
                        <asp:Label ID="lblExplainDays" runat="server" Text="如要保留全部的年休數，請在最大保留數中輸入0。" CssClass="SizeMemo" meta:resourcekey="lblExplainDaysResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="PopTableLeftTD" style="white-space: nowrap">
                        <asp:Label ID="Label8" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label8Resource1"></asp:Label>
                        <asp:Label ID="lblUserTitle" runat="server" Text="人員" meta:resourcekey="lblUserTitleResource1"></asp:Label>
                    </td>
                    <td class="PopTableRightTD">
                        <asp:CustomValidator ID="cvCheckSelectUser" runat="server" ErrorMessage="請選擇人員" Display="Dynamic" ClientValidationFunction="CheckSelectUser" meta:resourcekey="cvCheckSelectUserResource1"></asp:CustomValidator>
                        <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceListUsers" ExpandToUser="false" />
                        <asp:HiddenField ID="hfUserList" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblCount" runat="server" CssClass="SizeMemo" Width="100%" Style="text-align: left" Visible="False" meta:resourcekey="lblCountResource1"></asp:Label>
            <asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" Width="100%" Height="150px" Visible="False" meta:resourcekey="txtMsgResource1"></asp:TextBox>
            <asp:Label ID="lblClick" runat="server" Text="*點擊這裡可複製錯誤訊息" CssClass="SizeMemo" Width="100%" Style="text-align: left" Visible="False" meta:resourcekey="lblClickResource1"></asp:Label>
            <asp:Label ID="lblCountText" runat="server" Text="產生{0}筆，未產生{1}筆" Width="100%" Visible="False" meta:resourcekey="lblCountTextResource1"></asp:Label>
            <asp:Label ID="lblNotSetDays" runat="server" Text="請輸入最大保留數" Visible="False" meta:resourcekey="lblNotSetDaysResource1"></asp:Label>
            <asp:Label ID="lblNotGroupLeaveDays" runat="server" Text=" 所在部門沒有部門年休資訊" Visible="False" meta:resourcekey="lblNotGroupLeaveDaysResource1"></asp:Label>
            <asp:Label ID="lblNotArraveDate" runat="server" Text=" 沒有設定到職日" Visible="False" meta:resourcekey="lblNotArraveDateResource1"></asp:Label>
            <asp:Label ID="lblNotSetDate" runat="server" Text=" 沒有設定起算基準日" Visible="False" meta:resourcekey="lblNotSetDateResource1"></asp:Label>
            <asp:Label ID="lblNotAllowCreate" runat="server" Text=" 不可產生舊年度的資料，已存在更新年度的資料" Visible="False" meta:resourcekey="lblNotAllowCreateResource1"></asp:Label>
            <asp:Label ID="lblNotYet" runat="server" Text=" 尚未到職" Visible="False" meta:resourcekey="lblNotYetResource1"></asp:Label>
            <asp:Label ID="lblErrorYearLeave" runat="server" Style="display: none" ForeColor="Red" Text="尚有審核中的年休假單,不可產生年休假資訊!" meta:resourcekey="lblErrorYearLeaveResource1"></asp:Label>
            <asp:Label ID="lblEMsg" runat="server" Style="display: none" ForeColor="Red" Text="，錯誤訊息如下:" meta:resourcekey="lblEMsgResource1"></asp:Label>
            <asp:Label ID="lblBtn" runat="server" Style="display: none" ForeColor="Red" Text="產生年休資訊" meta:resourcekey="lblBtnResource1"></asp:Label>
            <asp:Label ID="lblDaysError" runat="server" Visible="False" Text="最大保留數不可輸入負數。" meta:resourcekey="lblDaysErrorResource1"></asp:Label>
            <asp:Label ID="lblHour" runat="server" Visible="False" Text="小時" meta:resourcekey="lblHourResource1"></asp:Label>
            <asp:Label ID="lblDay" runat="server" Visible="False" Text="天" meta:resourcekey="lblDayResource1"></asp:Label>
            <asp:Label ID="lblConfirmMsg" runat="server" Style="display: none" Text="提醒您如有相同年度的資料，則會以本次產生的為主。" meta:resourcekey="lblConfirmMsgResource1"></asp:Label>
            <asp:Label ID="Label6" runat="server" Text="月" Visible="False" meta:resourcekey="Label6Resource1"></asp:Label>
            <asp:Label ID="Label7" runat="server" Text="日" Visible="False" meta:resourcekey="Label7Resource1"></asp:Label>
            <asp:Label ID="lblReason" runat="server" Text="產生年休" Visible="False" meta:resourcekey="lblReasonResource1"></asp:Label>
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
            <asp:HiddenField ID="hfSources" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
