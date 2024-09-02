<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_OptionalFields_OverTimeCancelInfoUC" Codebehind="OverTimeCancelInfoUC.ascx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>

<script type="text/javascript">
    function OverTimeCancelV1NotSuport(sender, args) {
        args.IsValid = false;
    }
</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:CustomValidator ID="cvOverTimeCancelV1NotSuport" runat="server" ErrorMessage="此版的銷班資訊已不支援使用，如要申請，請選擇V2版本。" Display="Dynamic" 
            ClientValidationFunction="OverTimeCancelV1NotSuport" meta:resourcekye="cvOverTimeCancelV1NotSuportResource1"></asp:CustomValidator>
        <table width="500px">
            <tr>
                <td>
                    <table class="PopTable" cellspacing="0" width="100%">
                        <tr>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;" >
                                <asp:Label ID="Label14" runat="server" ForeColor="Red" Text="*"
                                    meta:resourcekey="Label14Resource1"></asp:Label>
                                <asp:Label ID="Label1" runat="server" Text="加班單單號"
                                    meta:resourcekey="Label1Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD" colspan="3">
                                <asp:DropDownList ID="ddlOverTimeNbr" runat="server"
                                    OnSelectedIndexChanged="ddlOverTimeNbr_SelectedIndexChanged"
                                    AutoPostBack="True" meta:resourcekey="ddlOverTimeNbrResource1">
                                </asp:DropDownList>
                                <asp:Label ID="lblOverTimeNbr" runat="server"
                                    meta:resourcekey="lblOverTimeNbrResource1"></asp:Label>
                                <asp:HiddenField ID="hfTaskID" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="ddlOverTimeNbr" Display="Dynamic" ErrorMessage="請選擇加班單單號" 
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;">
                                <asp:Label ID="Label2" runat="server" Text="預計加班日期"
                                    meta:resourcekey="Label2Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD" colspan="3">
                                <asp:Label ID="lblExpectedDate" runat="server"
                                    meta:resourcekey="lblExpectedDateResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;" >
                                <asp:Label ID="Label4" runat="server" Text="加班時間(起)"
                                    meta:resourcekey="Label4Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblExpected_StartTime" runat="server"
                                    meta:resourcekey="lblExpected_StartTimeResource1"></asp:Label>
                            </td>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;">
                                <asp:Label ID="Label6" runat="server" Text="加班時間(訖)"
                                    meta:resourcekey="Label6Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblExpected_EndTime" runat="server"
                                    meta:resourcekey="lblExpected_EndTimeResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;">
                                <asp:Label ID="Label8" runat="server" Text="加班時數"
                                    meta:resourcekey="Label8Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD" colspan="3">
                                <asp:Label ID="lblExpected_Hours" runat="server"
                                    meta:resourcekey="lblExpected_HoursResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;">
                                <asp:Label ID="Label10" runat="server" Text="實際加班日期"
                                    meta:resourcekey="Label10Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD" colspan="3">
                                <asp:Label ID="lblActualDate" runat="server"
                                    meta:resourcekey="lblActualDateResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;">
                                <asp:Label ID="Label12" runat="server" Text="加班時間(起)"
                                    meta:resourcekey="Label12Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblActual_StartTime" runat="server"
                                    meta:resourcekey="lblActual_StartTimeResource1"></asp:Label>
                            </td>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;" >
                                <asp:Label runat="server" Text="加班時間(訖)" ID="lblActEndDateTitle" meta:resourcekey="LabelResource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblActual_EndTime" runat="server"
                                    meta:resourcekey="lblActual_EndTimeResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;" >
                                <asp:Label ID="Label13" runat="server" Text="加班時數"
                                    meta:resourcekey="Label13Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD" colspan="3">
                                <asp:Label ID="lblActual_Hours" runat="server"
                                    meta:resourcekey="lblActual_HoursResource1"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblSelectMsg" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectMsgResource1"></asp:Label>