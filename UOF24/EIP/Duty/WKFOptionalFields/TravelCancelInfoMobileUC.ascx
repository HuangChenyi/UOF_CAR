<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TravelCancelInfoUC.ascx.cs" Inherits="WKF_OptionalFields_TravelCancelInfoUC" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<script>
    function CheckTravelNbr(source, args) {
        var ddlTravelNbr = $find("<%= rddlTravelNbr.ClientID %>").get_selectedItem().get_value();
        var validator = $("#<%=cvCheckTravelNbr.ClientID%>");
        var ErrorTravelNbr = [$("#<%= lblErrorTravelNbr.ClientID %>").text()];
        if (ddlTravelNbr === null || ddlTravelNbr === '' || ddlTravelNbr === undefined) {
            args.IsValid = false;
            validator.text(source.errormessage = ErrorTravelNbr);
        }
        else {
            if (ddlTravelNbr != '') {
                var taskID = $("#<%=hfTaskID.ClientID %>").val(); //表單代碼
                var applicantGuid = $("#<%=hfApplicantGuid.ClientID %>").val();
                var data = [taskID, applicantGuid];
                var isPass = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/TravelCancelInfoUC.ascx", "CheckDutyLock", data);
                if (isPass === "false") {
                    args.IsValid = false;
                }
                else {
                    args.IsValid = true;
                }
            }
        }
    }
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table style="width: 97%;">
            <tr>
                <td style="padding-left: 17px; padding-top: 10px">
                    <asp:Label ID="Label1" runat="server" Text="出差單單號" meta:resourcekey="Label1Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <telerik:RadDropDownList ID="rddlTravelNbr" runat="server"
                        AutoPostBack="True" CausesValidation="False"
                        OnSelectedIndexChanged="rddlTravelNbr_SelectedIndexChanged" Width="100%" meta:resourcekey="rddlTravelNbrResource1">
                    </telerik:RadDropDownList>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:Label ID="lblTravelNbr" runat="server" meta:resourcekey="lblTravelNbrResource1"></asp:Label>
                    <asp:HiddenField ID="hfTaskID" runat="server" />
                </td>
            </tr>
            <tr id="officeTr" runat="server">
                <td>
                    <table>
                        <tr>
                            <td style="padding-left: 17px; padding-top: 10px; white-space: nowrap">
                                <asp:Label ID="lblTextOfficePlace" runat="server" Text="歸屬地點時區" meta:resourcekey="lblTextOfficePlaceResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 17px">
                                <asp:Label ID="lblOfficePlace" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 10px">
                    <asp:Label ID="Label2" runat="server" Text="類別" meta:resourcekey="Label2Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:Label ID="lblType" runat="server" meta:resourcekey="lblTypeResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 10px">
                    <asp:Label ID="Label3" runat="server" Text="出差時間(起)" meta:resourcekey="Label3Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:Label ID="lblStartDateTime" runat="server" meta:resourcekey="lblStartDateTimeResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 10px">
                    <asp:Label ID="Label4" runat="server" Text="出差時間(訖)" meta:resourcekey="Label4Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:Label ID="lblEndDateTime" runat="server" meta:resourcekey="lblEndDateTimeResource1"></asp:Label>
                </td>
            </tr>
            <tr >
                <td style="padding-left: 17px; padding-top: 10px">
                    <asp:Label ID="Label5" runat="server" Text="出發地" meta:resourcekey="Label5Resource1"></asp:Label>
                </td>
            </tr>
            <tr >
                <td style="padding-left: 17px">
                    <asp:Label ID="lblDeparture" runat="server" meta:resourcekey="lblDepartureResource1"></asp:Label>
                </td>
            </tr>
            <tr >
                <td style="padding-left: 17px; padding-top: 10px">
                    <asp:Label ID="Label6" runat="server" Text="目的地(國家/城市)" meta:resourcekey="Label6Resource1"></asp:Label>
                </td>
            </tr>
            <tr >
                <td style="padding-left: 17px">
                    <asp:Label ID="lblDestinaion" runat="server" meta:resourcekey="lblDestinaionResource1"></asp:Label>
                </td>
            </tr>
            <tr >
                <td style="padding-left: 17px; padding-top: 10px">
                    <asp:Label ID="Label7" runat="server" Text="出差事由" meta:resourcekey="Label7Resource1"></asp:Label>
                </td>
            </tr>
            <tr >
                <td style="padding-left: 17px">
                    <asp:Label ID="lblReason" runat="server" meta:resourcekey="lblReasonResource1"></asp:Label>
                </td>
            </tr>
            <tr style="display: none;">
                <td style="padding-left: 17px; padding-top: 10px">
                    <asp:Label ID="Label8" runat="server" Text="80Km以上住宿" meta:resourcekey="Label8Resource1"></asp:Label>
                </td>
            </tr>
            <tr style="display: none;">
                <td style="padding-left: 17px">
                    <asp:Label ID="lblAccommodation" runat="server" meta:resourcekey="lblAccommodationResource1"></asp:Label>
                </td>
            </tr>
            <tr style="display: none;">
                <td style="padding-left: 17px; padding-top: 10px">
                    <asp:Label ID="Label9" runat="server" Text="80Km以上飛機或高鐵" meta:resourcekey="Label9Resource1"></asp:Label>
                </td>
            </tr>
            <tr style="display: none;">
                <td style="padding-left: 17px">
                    <asp:Label ID="lblTransport" runat="server" meta:resourcekey="lblTransportResource1"></asp:Label>
                </td>
            </tr>
            <tr style="display: none;">
                <td style="padding-left: 17px; padding-top: 10px">
                    <asp:Label ID="Label10" runat="server" Text="職務代理人" meta:resourcekey="Label10Resource1"></asp:Label>
                </td>
            </tr>
            <tr style="display: none;">
                <td style="padding-left: 17px">
                    <asp:Label ID="lblJobAgent" runat="server" meta:resourcekey="lblJobAgentResource1"></asp:Label>
                </td>
            </tr>
        </table>
        <table style="width: 97%;">
            <tr>
                <td style="padding-left: 17px; padding-top: 10px">
                    <asp:CustomValidator ID="cvCheckTravelNbr" ClientValidationFunction="CheckTravelNbr" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="出差日期期間差勤結算已鎖定或關帳，不能銷單" meta:resourcekey="cvCheckTravelNbrResource1"></asp:CustomValidator>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hfApplicantGuid" runat="server" />
        <asp:HiddenField ID="hfTotalHour" runat="server" />
        <asp:HiddenField ID="hfStartDateTime" runat="server" />
        <asp:HiddenField ID="hfEndDateTime" runat="server" />
        <asp:Label ID="lblFieldValue" runat="server" Visible="False" meta:resourcekey="lblFieldValueResource1"></asp:Label>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Label ID="lblErrorTravelNbr" runat="server" Text="請選擇出差單單號" Style="display: none" ForeColor="Red" meta:resourcekey="lblErrorTravelNbrResource1"></asp:Label>
<asp:Label ID="lblSelectMsg" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectMsgResource1"></asp:Label>
<asp:Label ID="lblTrue" runat="server" Text="是" Visible="False" meta:resourcekey="lblTrueResource1"></asp:Label>
<asp:Label ID="lblFalse" runat="server" Text="否" Visible="False" meta:resourcekey="lblFalseResource1"></asp:Label>
<asp:Label ID="lblDomestic" runat="server" Text="國內出差" Visible="False" meta:resourcekey="lblDomesticResource1"></asp:Label>
<asp:Label ID="lblForeign" runat="server" Text="國外出差" Visible="False" meta:resourcekey="lblForeignResource1"></asp:Label>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>            
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>