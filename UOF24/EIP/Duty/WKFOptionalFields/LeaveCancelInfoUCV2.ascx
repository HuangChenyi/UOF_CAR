<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_OptionalFields_LeaveCancelInfoUCV2" Codebehind="LeaveCancelInfoUCV2.ascx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc1" %>
<script type="text/javascript">
    function CheckLock(source, args) {
        var ddlLeaveNbr = $find("<%= rddlLeaveNbr.ClientID %>").get_selectedItem().get_value();
        var validator = $("#<%=cvCheckLock.ClientID%>");
        var a = [$("#<%= lblErrorLeaveNbr.ClientID %>").text()];
        if (ddlLeaveNbr === null || ddlLeaveNbr === '' || ddlLeaveNbr === undefined) {
            args.IsValid = false;
            validator.text(source.errormessage = a);
        }
        else {
            if (ddlLeaveNbr != '') {
                var taskID = $("#<%=hfTaskID.ClientID %>").val(); //表單代碼
                var applicantGuid = $("#<%=hfApplicantGuid.ClientID %>").val();
                var data = [taskID, applicantGuid];
                var isPass = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/LeaveCancelInfoUCV2.ascx", "CheckDutyLock", data);
                if (isPass === "false") {
                    args.IsValid = false;
                }
                else {
                    args.IsValid = true;
                }
            }
        }
    }
    function CheckLeaDiffUse(source, args) {
        var ddlLeaveNbr = $find("<%= rddlLeaveNbr.ClientID %>").get_selectedItem().get_value();
        
        if (ddlLeaveNbr && ddlLeaveNbr != '') {
            var taskID = $("#<%=hfTaskID.ClientID %>").val(); //表單代碼
            var data = [taskID];
            var useDocNbr = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/LeaveCancelInfoUCV2.ascx", "CheckLeaDiffUse", data);
            if (useDocNbr != '') {
                source.textContent = $("#<%=lblErrlrLeaveDiffUse1.ClientID %>").text() + "(" + useDocNbr + ")" + $("#<%=lblErrlrLeaveDiffUse2.ClientID %>").text();
                args.IsValid = false;
                return;
            }
        }
    }
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table width="500px">
            <tr>
                <td>
                    <table class="PopTable" cellspacing="0" width="100%">
                        <tr>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;">
                                <asp:Label ID="Label1" runat="server" Text="請假單單號" meta:resourcekey="Label1Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <telerik:RadDropDownList ID="rddlLeaveNbr" runat="server"
                                    AutoPostBack="true" CausesValidation="false"
                                    OnSelectedIndexChanged="rddlLeaveNbr_SelectedIndexChanged" meta:resourcekey="rddlLeaveNbrResource1"></telerik:RadDropDownList>
                                <asp:Label ID="lblLeaveNbr" runat="server" meta:resourcekey="lblLeaveNbrResource1"></asp:Label>
                                <asp:HiddenField ID="hfTaskID" runat="server" />
                            </td>
                        </tr>
                        <tr id="placeTr" runat="server">
                            <td style="white-space: nowrap;">
                               <asp:Label ID="Label8" runat="server" Text="歸屬地點時區" meta:resourcekey="Label8Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblPlace" runat="server" Text="" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;">
                                <asp:Label ID="Label2" runat="server" Text="假別" meta:resourcekey="Label2Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblLeaCode" runat="server" meta:resourcekey="lblLeaCodeResource1"></asp:Label>
                                <asp:HiddenField ID="hfLeaCode" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;">
                                <asp:Label ID="Label3" runat="server" Text="請假日期(起)" meta:resourcekey="Label3Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblLeaStart" runat="server" meta:resourcekey="lblLeaStartResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;">
                                <asp:Label ID="Label4" runat="server" Text="請假日期(訖)" meta:resourcekey="Label4Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblLeaEnd" runat="server" meta:resourcekey="lblLeaEndResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;">
                                <asp:Label ID="Label5" runat="server" Text="請假時(天)數" meta:resourcekey="Label5Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblLeatime" runat="server" meta:resourcekey="lblLeatimeResource1"></asp:Label>
                                <asp:HiddenField ID="hfUnit" runat="server"/>
                                <asp:HiddenField ID="hfDays" runat="server" Value="0" />
                                <asp:HiddenField ID="hfHours" runat="server" Value="0"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;">
                                <asp:Label ID="Label6" runat="server" Text="事由" meta:resourcekey="Label6Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblLeaRemark" runat="server" meta:resourcekey="lblLeaRemarkResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;">
                                <asp:Label ID="Label7" runat="server" Text="職務代理人" meta:resourcekey="Label7Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblJobAgent" runat="server" meta:resourcekey="lblJobAgentResource1"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>
                    <asp:CustomValidator ID="cvCheckLock" runat="server" ErrorMessage="請假日期期間差勤結算已鎖定或關帳，不能銷單" ForeColor="Red" Display="Dynamic" ClientValidationFunction="CheckLock" meta:resourcekey="cvCheckLockResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvCheckLeaDiffUse" runat="server" ForeColor="Red" Display="Dynamic" ClientValidationFunction="CheckLeaDiffUse" ></asp:CustomValidator>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hfIsSendValue" runat="server" />
        <asp:HiddenField ID="hfApplicantGuid" runat="server" />
        <asp:HiddenField ID="hfStartTime" runat="server" />
        <asp:HiddenField ID="hfEndTime" runat="server" />
        <asp:Label ID="lblFieldValue" runat="server" Visible="False" meta:resourcekey="lblFieldValueResource1"></asp:Label>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Label ID="lblErrlrLeaveDiffUse1" runat="server" Text="已被其他請假單接續使用" Style="display: none" meta:resourcekey="lblErrlrLeaveDiffUse1Resource1"></asp:Label>
<asp:Label ID="lblErrlrLeaveDiffUse2" runat="server" Text="，不能銷單" Style="display: none" meta:resourcekey="lblErrlrLeaveDiffUse2Resource1"></asp:Label>
<asp:Label ID="lblErrorLeaveNbr" runat="server" Text="請選擇請假單單號" Style="display: none" ForeColor="Red" meta:resourcekey="lblErrorLeaveNbrResource1"></asp:Label>
<asp:Label ID="lblDay" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
<asp:Label ID="lblHour" runat="server" Text="時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
<asp:Label ID="lblLeaveCodeMiss" runat="server" Text="該假別已被修改或移除" Visible="False" meta:resourcekey="lblLeaveCodeMissResource1"></asp:Label>
<asp:Label ID="lblSelectMsg" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectMsgResource1"></asp:Label>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>