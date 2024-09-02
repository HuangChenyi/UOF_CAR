<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_OptionalFields_OverTimeCancelInfoUCV2" CodeBehind="OverTimeCancelInfoUCV2.ascx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>


<script type="text/javascript">
    function CheckTimeOff(e, args) {
        var otNbr = $('#<%=hfTaskID.ClientID %>');
        if (otNbr.val() == '') return;
        var data = [$('#<%= hfTaskID.ClientID  %>').val(), $('#<%= hfApplicantGuid.ClientID  %>').val()];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeCancelInfoUCV2.ascx", "CheckTimeOff", data);
        if (result == "true") {
            args.IsValid = false;
        }
    }

    function CheckLock(source, args) {
        var ddlOverTimeNbr = $find("<%= rddlOverTimeNbr.ClientID %>").get_selectedItem().get_value();
        var validator = $("#<%=cvCheckLock.ClientID%>");
        var ErrorTravelNbr = [$("#<%= lblErrorOverTimeNbr.ClientID %>").text()];
        if (ddlOverTimeNbr === null || ddlOverTimeNbr === '' || ddlOverTimeNbr === undefined) {
            args.IsValid = false;
            validator.text(source.errormessage = ErrorTravelNbr);
        }
        else {
            var otTaskID = $('#<%= hfTaskID.ClientID  %>').val();
            var data = [otTaskID, $('#<%= hfApplicantGuid.ClientID  %>').val()];
            var isPass = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeCancelInfoUCV2.ascx", "CheckDutyLock", data);

            if (isPass === "false") {
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }
    }
</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table style="width: 97%;">
            <tr>
                <td style="padding-left: 17px; padding-top: 10px">
                    <asp:Label ID="Label1" runat="server" Text="加班單單號"
                        meta:resourcekey="Label1Resource1"></asp:Label>
                    <asp:Label ID="Label14" runat="server" ForeColor="Red" Text="*"
                        meta:resourcekey="Label14Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <telerik:RadDropDownList ID="rddlOverTimeNbr" runat="server" EnableTheming="true"
                        OnSelectedIndexChanged="rddlOverTimeNbr_SelectedIndexChanged_SelectedIndexChanged"
                        AutoPostBack="true" CausesValidation="false"
                        meta:resourcekey="rddlOverTimeNbrResource1">
                    </telerik:RadDropDownList>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:Label ID="lblOverTimeNbr" runat="server"
                        meta:resourcekey="lblOverTimeNbrResource1"></asp:Label>
                    <asp:HiddenField ID="hfTaskID" runat="server" />
                </td>
            </tr>
            <tr id="placeTr" runat="server">
                <td>
                    <table>
                        <tr>
                            <td style="padding-left: 17px; padding-top: 10px;">
                                <asp:Label ID="Label3" runat="server" Text="歸屬地點時區" meta:resourcekey="Label3Resource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 17px">
                                <asp:Label ID="lblPlace" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 10px;width: 120px; white-space: nowrap;">
                    <asp:Label ID="Label2" runat="server" Text="預計加班時間" meta:resourcekey="Label2Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:Label ID="lblExpStartDate" runat="server" meta:resourcekey="lblExpStartDateResource1"></asp:Label>
                    <asp:Label ID="Label18" runat="server" Text="~" meta:resourcekey="Label18Resource1"></asp:Label>
                    <asp:Label ID="lblExpEndDate" runat="server" meta:resourcekey="lblExpEndDateResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 10px;width: 120px; white-space: nowrap;">
                    <asp:Label ID="Label16" runat="server" Text="預計用餐/休息時數" meta:resourcekey="Label16Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:Label ID="lblExpEatHours" runat="server" meta:resourcekey="lblExpEatHoursResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 10px;width: 120px; white-space: nowrap;">
                    <asp:Label ID="Label8" runat="server" Text="預計加班時數" meta:resourcekey="Label8Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:Label ID="lblExpected_Hours" runat="server"
                        meta:resourcekey="lblExpected_HoursResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 10px;width: 120px; white-space: nowrap;">
                    <asp:Label ID="Label10" runat="server" Text="實際加班時間" meta:resourcekey="Label10Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:Label ID="lblActualStartDate" runat="server" meta:resourcekey="lblActualStartDateResource1"></asp:Label>
                    <asp:Label ID="Label19" runat="server" Text="~" meta:resourcekey="Label19Resource1"></asp:Label>
                    <asp:Label ID="lblActualEndDate" runat="server" meta:resourcekey="lblActualEndDateResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 10px;width: 120px; white-space: nowrap;">
                    <asp:Label ID="Label17" runat="server" Text="實際用餐/休息時數" meta:resourcekey="Label17Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:Label ID="lblActualEatHours" runat="server" meta:resourcekey="lblActualEatHoursResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 10px;width: 120px; white-space: nowrap;">
                    <asp:Label ID="Label13" runat="server" Text="實際加班時數" meta:resourcekey="Label13Resource1"></asp:Label>
                </td>
            </tr>            
            <tr>
                <td style="padding-left: 17px">
                    <asp:Label ID="lblActual_Hours" runat="server" meta:resourcekey="lblActual_HoursResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 10px;width: 120px; white-space: nowrap;">
                    <asp:Label ID="Label15" runat="server" Text="歸屬日" meta:resourcekey="Label15Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:Label ID="lblBelongDate" runat="server" meta:resourcekey="lblBelongDateResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 10px;width: 120px; white-space: nowrap;">
                    <asp:Label ID="lblActHoursTitle" runat="server" Text="核銷時數" meta:resourcekey="lblActHoursTitleResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:Label ID="lblActHours" runat="server" meta:resourcekey="lblActHoursResource1"></asp:Label>
                </td>
            </tr>
        </table>
        </td>
            </tr>
        </table>
        <table style="width: 97%" cellpadding="0" cellspacing="0">
            <tr>
                <td style="padding-left: 17px; padding-top: 10px">
                    <asp:CustomValidator ID="cvCheckLock" runat="server" ErrorMessage="加班日期期間差勤結算已鎖定或關帳，不能銷單" ForeColor="Red" Display="Dynamic" EnableTheming="true"
                        ClientValidationFunction="CheckLock" meta:resourcekey="cvCheckLockResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 10px">
                    <asp:CustomValidator ID="cvCheckTimeOff" runat="server" ErrorMessage="加班人員補休已使用，不允許銷班。" Display="Dynamic" ForeColor="Red" EnableTheming="true"
                        ClientValidationFunction="CheckTimeOff"></asp:CustomValidator>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hfExpStart" runat="server" />
        <asp:HiddenField ID="hfExpEnd" runat="server" />
        <asp:HiddenField ID="hfActualStart" runat="server" />
        <asp:HiddenField ID="hfActualEnd" runat="server" />
    </ContentTemplate>
</asp:UpdatePanel>
<asp:HiddenField ID="hfIsSendValue" runat="server" />
<asp:HiddenField ID="hfApplicantGuid" runat="server" />
<asp:HiddenField ID="hfOvertimeType" runat="server" />
<asp:HiddenField ID="hfOvertimeSource" runat="server" />

<asp:Label ID="lblErrorOverTimeNbr" runat="server" Text="請選擇請假單單號" Style="display: none" ForeColor="Red" meta:resourcekey="lblErrorOverTimeNbrResource1"></asp:Label>
<asp:Label ID="lblFieldValue" runat="server" Visible="False" meta:resourcekey="lblFieldValueResource1"></asp:Label>
<asp:Label ID="lblHoursTitle" runat="server" Text="時" Visible="False" meta:resourcekey="lblHoursTitleResource1"></asp:Label>
<asp:Label ID="lblSelectMsg" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectMsgResource1"></asp:Label>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>