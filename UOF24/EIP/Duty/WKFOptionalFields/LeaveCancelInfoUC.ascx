<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_OptionalFields_LeaveCancelInfoUC" Codebehind="LeaveCancelInfoUC.ascx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc1" %>
<script type="text/javascript">
    function CheckLock(source, args) {
        var ddlLeaveNbr = $("#<%=ddlLeaveNbr.ClientID %> option:selected").val();

        if (ddlLeaveNbr != '') {
            
            var taskID = $("#<%=hfTaskID.ClientID %>").val(); //表單代碼
            var applicantGuid = $("#<%=hfApplicantGuid.ClientID %>").val();
            var data = [taskID, applicantGuid];
            var isPass = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/LeaveCancelInfoUC.ascx", "CheckDutyLock", data);
            if (isPass === "false") {
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }
    }

    function CancelLeaveV1NotSuport(sender, args) {
        args.IsValid = false;
    }
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:CustomValidator ID="cvCancelLeaveV1NotSuport" runat="server" ErrorMessage="此版的銷假資訊已不支援使用，如要申請，請選擇V2版本表單。" Display="Dynamic" 
            ClientValidationFunction="CancelLeaveV1NotSuport" meta:resourcekye="cvCancelLeaveV1NotSuportResource1"></asp:CustomValidator>

        <table width="500px">
            <tr>
                <td>
                    <table class="PopTable" cellspacing="0" width="100%">
                        <tr>
                            <td class="PopTableLeftTD" style="width:120px;" nowrap="nowrap">
                                <asp:Label ID="Label1" runat="server" Text="請假單單號" meta:resourcekey="Label1Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:DropDownList ID="ddlLeaveNbr" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLeaveNbr_SelectedIndexChanged" meta:resourcekey="ddlLeaveNbrResource1">
                                </asp:DropDownList>
                                <asp:Label ID="lblLeaveNbr" runat="server" meta:resourcekey="lblLeaveNbrResource1"></asp:Label>
                                <asp:HiddenField ID="hfTaskID" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="ddlLeaveNbr" Display="Dynamic" ErrorMessage="請選擇請假單單號" 
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width:120px;" nowrap="nowrap">
                                <asp:Label ID="Label2" runat="server" Text="假別"  meta:resourcekey="Label2Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblLeaCode" runat="server" meta:resourcekey="lblLeaCodeResource1"></asp:Label>
                                <asp:HiddenField ID="hfLeaCode" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width:120px;" nowrap="nowrap">
                                <asp:Label ID="Label3" runat="server" Text="請假日期(起)" meta:resourcekey="Label3Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblLeaStart" runat="server" meta:resourcekey="lblLeaStartResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width:120px;" nowrap="nowrap">
                                <asp:Label ID="Label4" runat="server" Text="請假日期(訖)" meta:resourcekey="Label4Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblLeaEnd" runat="server" meta:resourcekey="lblLeaEndResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width:120px;" nowrap="nowrap">
                                <asp:Label ID="Label5" runat="server" Text="請假時(天)數" meta:resourcekey="Label5Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblLeatime" runat="server" meta:resourcekey="lblLeatimeResource1"></asp:Label>
                                <asp:HiddenField ID="hfDays" runat="server" Value="0" />
                                <asp:HiddenField ID="hfHours" runat="server" Value="0"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width:120px;" nowrap="nowrap">
                                <asp:Label ID="Label6" runat="server" Text="事由" meta:resourcekey="Label6Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblLeaRemark" runat="server" meta:resourcekey="lblLeaRemarkResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width:120px;" nowrap="nowrap">
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
         </table>
        <asp:HiddenField ID="hfIsSendValue" runat="server" />
        <asp:HiddenField ID="hfApplicantGuid" runat="server" />
        <asp:Label ID="lblFieldValue" runat="server" Visible="False" meta:resourcekey="lblFieldValueResource1"></asp:Label>        
    </ContentTemplate>
</asp:UpdatePanel>
<asp:Label ID="lblDay" runat="server" Text="天" Visible="false"></asp:Label>
<asp:Label ID="lblHour" runat="server" Text="時" Visible="false"></asp:Label>
<asp:Label ID="lblLeaveCodeMiss" runat="server" Text="該假別已被修改或移除" Visible="False" meta:resourcekey="lblLeaveCodeMissResource1"></asp:Label>
<asp:Label ID="lblSelectMsg" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectMsgResource1"></asp:Label>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>