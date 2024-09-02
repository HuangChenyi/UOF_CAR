<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OverTimeBatchInfoAdvUC.ascx.cs" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields104.OverTimeBatchInfoAdvUC" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<style>
    .lbtnDisabled {
        color: rgb(118, 118, 118);
    }

    .cellBreakAll {
        word-break: break-all;
    }
</style>
<script type="text/javascript">
    function CheckDataEmpty(source, args) {

        var items = $("#<%=hfListItem.ClientID %>").val();
        if (items === null || items === '[]' || items === '') {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }

    function PriorCheck(source, args) {
        var fieldMode = $("#<%=hfFieldMode.ClientID%>").val();
        var needPriorCheck = $("#<%=hfNeedPriorCheck.ClientID%>").val();
        if (fieldMode == "Applicant" && needPriorCheck == "True") {
            var items = $("#<%=hfListItem.ClientID %>").val();
            if (!(items === null || items === '[]' || items === '')) {
                var PriorCheckState = $("#<%=hfPriorCheckState.ClientID%>").val();
                // 尚未檢查
                if (PriorCheckState == '') {
                    args.IsValid = false;
                    source.innerHTML = $("#<%=lblPriorCheck.ClientID%>").text();
                    $find('<%=rdbtnAddDetail.ClientID%>').focus();
                }
                else {
                    if (PriorCheckState == 'true') {
                        // pass
                        args.IsValid = true;
                    }
                    else {
                        // 已有檢查結果且未修正資料重置, 直接擋住
                        args.IsValid = false;
                        source.innerHTML = $("#<%=lblPriorCheckNeedSuccess.ClientID%>").text();
                        $find('<%=rdbtnAddDetail.ClientID%>').focus();
                        var lblPriorCheckFail = $("#<%=lblPriorCheckFail.ClientID%>");
                        if (lblPriorCheckFail != null && lblPriorCheckFail != undefined) {
                            lblPriorCheckFail.hide();
                        }
                    }
                }
            }
        }
    }
</script>

<asp:UpdatePanel ID="UpdatePanelOverTimeBatch" runat="server">
    <ContentTemplate>
        <asp:Label ID="lblEditlessOnMobileDevice" runat="server" Text="此欄位不允許在App編輯" Visible="false" ForeColor="Blue" meta:resourcekey="lblEditlessOnMobileDeviceResource1"></asp:Label>
        <div runat="server" id="divAddOverTimeDetail" style="padding-bottom: 5px;">
            <telerik:RadButton ID="rdbtnAddDetail" runat="server" Text="新增明細" CausesValidation="False" OnClick="rdbtnAddDetail_Click" meta:resourcekey="rdbtnAddDetailResource1"></telerik:RadButton>
            <telerik:RadButton ID="rdbtnPriorCheck" runat="server" Text="計算時數" CausesValidation="false" OnClick="rdbtnPriorCheck_Click" Visible="false" meta:resourcekey="rdbtnPriorCheckResource1"></telerik:RadButton>
            <asp:Label runat="server" ID="lblPriorCheckSuccess" Text="檢查通過" Visible="false" CssClass="SizeMemo" meta:resourcekey="lblPriorCheckSuccessResource1"></asp:Label>
            <asp:Label runat="server" ID="lblPriorCheckFail" Text="點按修改鈕可查看驗證失敗原因" Visible="false" ForeColor="Red" meta:resourcekey="lblPriorCheckFailResource1"></asp:Label>
            <asp:CustomValidator runat="server" ID="cvPriorCheck" Display="Dynamic" ClientValidationFunction="PriorCheck" ForeColor="Red" SetFocusOnError="true"></asp:CustomValidator>
            <asp:Label ID="lblModifyDataMemo" runat="server" Text="表單送出後才會依104系統的設定來計算和顯示個人實際加班時數" CssClass="SizeMemo" Visible="False" meta:resourcekey="lblModifyDataMemoResource1"></asp:Label>
        </div>
        <table style="width: 100%;">
            <tr>
                <td>
                    <div runat="server" id="divResultMsg" style="width: 100%;padding: 3px;background-color: aliceblue;border: 1px solid #bfbfbf;">
                        <asp:Label runat="server" ID="lblResutlMsg" ForeColor="Blue" meta:resourcekey="lblResutlMsgResource1"></asp:Label>
                        <asp:LinkButton ID="lbtnApplyDetail" runat="server" Text="點此查看失敗原因" ForeColor="Red" style="padding-left: 5px;" Visible="False" meta:resourcekey="lbtnApplyDetailResource1"></asp:LinkButton>
                        <asp:Label runat="server" ID="lblResultWaitMsg" ForeColor="Red" Text="部分加班人員加班時數尚未完成計算，請稍後。" Visible="False" meta:resourcekey="lblResultWaitMsgResource1"></asp:Label>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <Ede:Grid ID="grdOverTimeBatchAdv" runat="server" Width="100%"
                        AutoGenerateCheckBoxColumn="False" DataKeyNames="DETAIL_GUID" OnRowDataBound="grdOverTimeBatchAdv_RowDataBound"
                        AllowSorting="True" DefaultSortColumnName="STATE,SORT_USER" DefaultSortDirection="Ascending" OnSorting="grdOverTimeBatchAdv_Sorting"
                        CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" AutoGenerateColumns="False"
                        OnRowCommand="grdOverTimeBatchAdv_RowCommand" OnRowDeleting="grdOverTimeBatchAdv_RowDeleting"
                        PageSize="15" EmptyDataText="沒有資料" EnhancePager="False" KeepSelectedRows="False"
                        SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="grdOverTimeBatchAdvResource1">
                        <HeaderStyle Wrap="False" />
                        <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:Label ID="lblSeqNo" runat="server" Text='<%# Container.DataItemIndex+1 %>' meta:resourcekey="lblSeqNoResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="2%" />
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TFOperationResource1">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnModify" CommandName="Modify" runat="server" Text="修改" CausesValidation="False" meta:resourcekey="lbtnModifyResource1"></asp:LinkButton>
                                    <asp:LinkButton ID="lbtnDelete" CommandName="Delete" runat="server" Text="刪除" CausesValidation="False" meta:resourcekey="lbtnDeleteResource1"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="加班人員" SortExpression="SORT_USER" meta:resourcekey="BFOverTimeUserdResource1">
                                <ItemTemplate>
                                    <asp:Label ID="lblUser" runat="server" meta:resourcekey="lblUserResource1"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="18%" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="OT_TYPE" HeaderText="折換方式" SortExpression="OT_TYPE" meta:resourcekey="BFOTTypeResource1">
                                <ItemStyle HorizontalAlign="Center" Width="7%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MEAL_ALLOWANCE_TYPE" HeaderText="誤餐費" SortExpression="MEAL_ALLOWANCE_TYPE" meta:resourcekey="BFMealAllowanceTypeResource1">
                                <ItemStyle HorizontalAlign="Center" Width="7%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="START_TIME" HeaderText="加班時間(起)" DataFormatString="{0:d}" SortExpression="START_TIME" meta:resourcekey="BFStartTimeResource1">
                                <ItemStyle Wrap="False" Width="10%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="END_TIME" HeaderText="加班時間(訖)" DataFormatString="{0:d}" SortExpression="END_TIME" meta:resourcekey="BFEndTimeResource1">
                                <ItemStyle Wrap="False" Width="10%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EXCLUDE_TYPE" HeaderText="扣除時數" SortExpression="EXCLUDE_TYPE" meta:resourcekey="BFExcludeTypeResource1">
                                <ItemStyle Width="10%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PUNCH_CHECK" HeaderText="刷卡資料" SortExpression="PUNCH_CHECK" meta:resourcekey="BFPunchCheckResource1">
                                <ItemStyle Width="7%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="REMARK" HeaderText="事由" meta:resourcekey="BFRemarkResource1">
                                <ItemStyle Width="20%" CssClass="cellBreakAll" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CAL_RESULT" HeaderText="加班時數" SortExpression="CAL_RESULT" meta:resourcekey="BFCalResultResource1">
                                <ItemStyle HorizontalAlign="Right" Width="5%" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="驗證" SortExpression="STATE" meta:resourcekey="BFStateResource1">
                                <ItemTemplate>
                                    <asp:Label ID="lblState" runat="server" meta:resourcekey="lblStateResource1"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>
                        </Columns>
                    </Ede:Grid>
                </td>
            </tr>
        </table>

        <asp:CustomValidator ID="cvCheckData" runat="server" Display="Dynamic" ClientValidationFunction="CheckDataEmpty" ErrorMessage="請新增明細" ForeColor="Red" meta:resourcekey="cvCheckDataResource1"></asp:CustomValidator>

        <asp:HiddenField runat="server" ID="hfListItem" />
        <asp:HiddenField runat="server" ID="hfAllowModify" />
        <asp:HiddenField runat="server" ID="hfRemarkRequired" />
        <asp:HiddenField runat="server" ID="hfNeedPriorCheck" />
        <asp:HiddenField runat="server" ID="hfPriorCheckResult" />
        <asp:HiddenField runat="server" ID="hfFieldMode" />
        <asp:HiddenField runat="server" ID="hfPriorCheckState" />
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="rdbtnAddDetail" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>

<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<div id="divResource" runat="server" style="display: none;">
    <asp:CheckBoxList ID="cblExcludeHours" runat="server" RepeatDirection="Horizontal" meta:resourcekey="cblExcludeHoursResource1">
        <asp:ListItem Text="午餐" Value="Lunch|1" meta:resourcekey="cblExcludeHoursLunchResource1"></asp:ListItem>
        <asp:ListItem Text="晚餐" Value="Dinner|2" meta:resourcekey="cblExcludeHoursDinnerResource1"></asp:ListItem>
        <asp:ListItem Text="宵夜" Value="Supper|4" meta:resourcekey="cblExcludeHoursSupperResource1"></asp:ListItem>
        <asp:ListItem Text="其他" Value="Other|8" meta:resourcekey="cblExcludeHoursOtherResource1"></asp:ListItem>
    </asp:CheckBoxList>
    <asp:Label ID="lblAddItem" runat="server" Text="新增明細" Visible="False" meta:resourcekey="lblAddItemResource1"></asp:Label>
    <asp:Label ID="lblComfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblComfirmResource1"></asp:Label>
    <asp:Label ID="lblOTtypePayment" runat="server" Text="轉加班費" Visible="False" meta:resourcekey="lblOTtypePaymentResource1"></asp:Label>
    <asp:Label ID="lblOTtypeTimeOff" runat="server" Text="轉補休" Visible="False" meta:resourcekey="lblOTtypeTimeOffResource1"></asp:Label>
    <asp:Label ID="lblMeatAllowenceYes" runat="server" Text="依HR系統誤餐費設定" Visible="False" meta:resourcekey="lblMeatAllowenceYesResource1"></asp:Label>
    <asp:Label ID="lblMeatAllowenceNo" runat="server" Text="不支領" Visible="False" meta:resourcekey="lblMeatAllowenceNoResource1"></asp:Label>
    <asp:Label ID="lblPunchCheckYes" runat="server" Text="依104設定" Visible="False" meta:resourcekey="lblPunchCheckYesResource1"></asp:Label>
    <asp:Label ID="lblPunchCheckNo" runat="server" Text="不需檢查" Visible="False" meta:resourcekey="lblPunchCheckNoNoResource1"></asp:Label>
    <asp:Label ID="lblStatePass" runat="server" Text="成功" Visible="False" meta:resourcekey="lblStatePassResource1"></asp:Label>
    <asp:Label ID="lblStateFail" runat="server" Text="失敗" Visible="False" meta:resourcekey="lblStateFailResource1"></asp:Label>
    <asp:Label ID="lblCalResulting" runat="server" Text="待計算" Visible="False" meta:resourcekey="lblCalResultingResource1"></asp:Label>
    <asp:Label ID="lblResutlMsgFormat" runat="server" Text="申請人數:{0}  成功人數:{1}  失敗人數:{2}" Visible="False" meta:resourcekey="lblResutlMsgFormatResource1"></asp:Label>
    <asp:Label ID="lblDisplayTitleFormat" runat="server" Text="多時段加班({0}人)" Visible="False" meta:resourcekey="lblDisplayTitleFormatResource1"></asp:Label>
    <asp:Label ID="lblOverTimeUsersRowTitle" runat="server" Text="加班人員" Visible="False" meta:resourcekey="lblOverTimeUsersRowTitleResource1"></asp:Label>
    <asp:Label ID="lblOTTypeRowTitle" runat="server" Text="折換方式" Visible="False" meta:resourcekey="lblOTTypeRowTitleResource1"></asp:Label>
    <asp:Label ID="lblOverTimeRangeRowTitle" runat="server" Text="加班時間" Visible="False" meta:resourcekey="lblOverTimeRangeRowTitleResource1"></asp:Label>
    <asp:Label ID="lblOverTimeRemarkTitle" runat="server" Text="事由" Visible="False" meta:resourcekey="lblOverTimeRemarkTitleResource1"></asp:Label>
    <asp:Label ID="lblPriorCheck" runat="server" Text="請先計算時數並確認資料完全無誤後才可送出" meta:resourcekey="lblPriorCheckResource1"></asp:Label>
    <asp:Label ID="lblPriorCheckNeedSuccess" runat="server" Text="請刪除或修改驗證失敗人員申請內容" meta:resourcekey="lblPriorCheckNeedSuccessResource1"></asp:Label>
    <asp:Label ID="lblApplylessForApp" runat="server" Text="不支援在App申請此張表單" meta:resourcekey="lblApplylessForAppResource1"></asp:Label>
    <asp:Label ID="lblErrorMsg" Text="錯誤訊息" runat="server" meta:resourcekey="lblErrorMsgResource1"/>
</div>