<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Plant_CreateClass" Title="新增類別" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="CreateClass.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        Sys.Application.add_load(function () {
            var rbNoLimit = $('#<%=rbNoLimit.ClientID %>');
            if (rbNoLimit.prop("checked")) {
                IsExamine(0);
            }
        });

        function IsExamine(i) {
            if (i == 1) {
                $('#<%=trByExamine.ClientID%>').prop('hidden', false);
            }
            else {
                $('#<%=trByExamine.ClientID%>').prop('hidden', true);
            }
        }
        function rbClick(i) {

            var usedays = $find("<%=rncUseDay.ClientID%>");

            if (i == 0) {
                usedays.enable();
                document.getElementById('<%=ddlDays.ClientID%>').disabled = true;
                document.getElementById('<%=ddlTime.ClientID%>').disabled = true;
                document.getElementById('<%=ddlStartMonth.ClientID%>').disabled = true;
            }
            else if (i == 2) {
                usedays.disable();
                document.getElementById('<%=ddlDays.ClientID%>').disabled = false;
                document.getElementById('<%=ddlTime.ClientID%>').disabled = false;
                document.getElementById('<%=ddlStartMonth.ClientID%>').disabled = false;
            }
            else {
                usedays.disable();
                document.getElementById('<%=ddlDays.ClientID%>').disabled = true;
                document.getElementById('<%=ddlTime.ClientID%>').disabled = true;
                document.getElementById('<%=ddlStartMonth.ClientID%>').disabled = true;
            }
        }

        function AlertPlantExaming() {
            alert($("#<%=lblPlantExaming.ClientID%>").text());
        }
    </script>
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="無管理類別權限" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="類別名稱重複" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
    <table cellspacing="1" class="PopTable">
        <tr>
            <td>
                <span style="color: #ff0000">*</span><asp:Label ID="lbName" runat="server" Text="名稱" meta:resourcekey="lbNameResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txbName" runat="server" MaxLength="50" meta:resourcekey="txbNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbName" ForeColor="Red"
                    Display="Dynamic" ErrorMessage="不允許空白" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbCustodian" runat="server" Text="保管人" meta:resourcekey="lbCustodianResource1"></asp:Label></td>
            <td>
                <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap;">
                <asp:Label ID="lblIsMeetingRoom" runat="server" Text="會議室場地"
                    meta:resourcekey="lblIsMeetingRoomResource1"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rbIsMeetingRoom" runat="server"
                    RepeatDirection="Horizontal" meta:resourcekey="rbIsMeetingRoomResource1">
                    <asp:ListItem Value="Y" Text="是" meta:resourcekey="ListItemResource1"></asp:ListItem>
                    <asp:ListItem Value="N" Text="否" Selected="True"
                        meta:resourcekey="ListItemResource2"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap;">
                <asp:Label ID="Label1" runat="server" Text="借用限制" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td style="white-space: nowrap;">
                <table>
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:RadioButton ID="rdbtnNoUse" runat="server" Text="不限定" GroupName="Limit" Checked="True" onclick="rbClick(1)" meta:resourcekey="rdbtnNoUseResource1" />
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:RadioButton ID="rdbtnIsUseDay" runat="server" Text="可借用到系統日之後幾天" GroupName="Limit" onclick="rbClick(0)" meta:resourcekey="rdbtnIsUseDayResource1" />
                            <telerik:RadNumericTextBox ID="rncUseDay" runat="server" CssClass="RightAligned" Value="0" MinValue="0" Width="60px" DataType="System.Int32" Culture="zh-TW" DbValueFactor="1" LabelWidth="24px" meta:resourcekey="rncUseDayResource1">
                                <NegativeStyle Resize="None"></NegativeStyle>

                                <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>

                                <EmptyMessageStyle Resize="None"></EmptyMessageStyle>

                                <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                                <FocusedStyle Resize="None"></FocusedStyle>

                                <DisabledStyle Resize="None"></DisabledStyle>

                                <InvalidStyle Resize="None"></InvalidStyle>

                                <HoveredStyle Resize="None"></HoveredStyle>

                                <EnabledStyle Resize="None"></EnabledStyle>
                            </telerik:RadNumericTextBox>
                            <asp:Label ID="lblDay" runat="server" Text="天" meta:resourcekey="lblDayResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblNoticeMsg1" runat="server" Text="例如：系統日期是1/1，如設定3天，則可借用到1/3。" ForeColor="Blue" meta:resourcekey="lblNoticeMsg1Resource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButton ID="rdbtnMonths" runat="server" Text="每月" GroupName="Limit" onclick="rbClick(2)" meta:resourcekey="rdbtnMonthsResource1" />
                            <asp:DropDownList ID="ddlDays" Width="60" runat="server"></asp:DropDownList>
                            <asp:DropDownList ID="ddlTime" Width="75" runat="server"></asp:DropDownList>
                            <asp:Label ID="lblCanAdd" runat="server" Text="可新增" meta:resourcekey="lblCanAddResource1"></asp:Label>
                            <asp:DropDownList ID="ddlStartMonth" runat="server">
                                <asp:ListItem Value="0" Text="當月" meta:resourcekey="ListItemStartMonth0Resource1" />
                                <asp:ListItem Value="1" Text="次月" meta:resourcekey="ListItemStartMonth1Resource1" />
                                <asp:ListItem Value="2" Text="2個月後" meta:resourcekey="ListItemStartMonth2Resource1" />
                                <asp:ListItem Value="3" Text="3個月後" meta:resourcekey="ListItemStartMonth3Resource1" />
                                <asp:ListItem Value="4" Text="4個月後" meta:resourcekey="ListItemStartMonth4Resource1" />
                                <asp:ListItem Value="5" Text="5個月後" meta:resourcekey="ListItemStartMonth5Resource1" />
                                <asp:ListItem Value="6" Text="6個月後" meta:resourcekey="ListItemStartMonth6Resource1" />
                            </asp:DropDownList>
                            <asp:Label ID="lblBorrow" runat="server" Text="的借用" meta:resourcekey="lblBorrowResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblMonthsNoticeMsg1" runat="server" Text="例如：設定為每月5日 09:00可新增次月的借用" ForeColor="Blue" meta:resourcekey="lblMonthsNoticeMsg1Resource1"></asp:Label>
                            <br />
                            <asp:Label ID="lblMonthsNoticeMsg2" runat="server" Text="系統日期在7/5 09:00前，只能新增到7/31的借用" ForeColor="Blue" meta:resourcekey="lblMonthsNoticeMsg2Resource1"></asp:Label>
                            <br />
                            <asp:Label ID="lblMonthsNoticeMsg3" runat="server" Text="系統日期在7/5 09:00後，開放可新增8/1-8/31的借用" ForeColor="Blue" meta:resourcekey="lblMonthsNoticeMsg3Resource1"></asp:Label>
                        </td>
                    </tr>
                </table>



            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap;">
                <asp:Label ID="Label3" runat="server" Text="借用申請方式" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td colspan="3">
                            <asp:RadioButton ID="rbByExamine" runat="server" Text="由設備借用單借用" GroupName="Apply" onclick="IsExamine(1)" meta:resourcekey="rbByExamineResource1" />
                        </td>

                    </tr>
                    <tr id="trByExamine" runat="server">
                        <td></td>
                        <td>&nbsp;&nbsp;
                            <asp:Label ID="Label4" runat="server" Text="核准後，設備狀態更新為" meta:resourcekey="Label4Resource1"></asp:Label>
                            &nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rblStatus" runat="server"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="Booking" Text="預約" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                <asp:ListItem Value="Loaned" Text="已借出" meta:resourcekey="ListItemResource4"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:RadioButton ID="rbNoLimit" runat="server" Text="由行事曆借用" GroupName="Apply" Checked="True" onclick="IsExamine(0)" meta:resourcekey="rbNoLimitResource1" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap;">
                <asp:Label ID="lblNotifyCustodian" runat="server" Text="借用通知" meta:resourcekey="lblNotifyCustodianResource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="chkNotifyCustodian" runat="server" Text="借用設備後通知保管人" Checked="True" meta:resourcekey="chkNotifyCustodianResource1" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lbClassGuid" runat="server" Visible="False" meta:resourcekey="lbClassGuidResource1"></asp:Label>
    <asp:Label ID="lblPlantExaming" runat="server" Style="display: none;" Text="尚有設備借用申請單在簽核中" meta:resourcekey="lblPlantExamingResource1"></asp:Label>
    <asp:Label ID="lblDayString" runat="server" Style="display: none;" Text="日" meta:resourcekey="lblDayStringResource1"></asp:Label>
</asp:Content>

