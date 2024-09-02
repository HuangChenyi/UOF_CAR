<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_SendEdocList.ascx.cs" Inherits="UC_SendEdocList" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<style type="text/css">
    /* 隱藏Grid內的欄位 */
    .cssHidden {
        display: none;
    }
</style>

<script type="text/javascript">

    var isClickBuild = true;

    var rtbSendDoc = '<%=rtbSendDoc.ClientID%>';
    var grdSendEdocList = '<%=grdSendEdocList.ClientID%>';
    var grdSendEdocListChecked = '<%=grdSendEdocList.ClientID %> input[type="checkbox"]:checked';
    var grdSendEdocListSelectedRow = '<%=grdSendEdocList.ClientID %> tr[class="GridItemSelected"]';

    var lblBuildTitle = '<%=lblBuildTitle.ClientID%>';
    var lblBuilding = '<%=lblBuilding.ClientID%>';
    var lblSelectBuild = '<%=lblSelectBuild.ClientID%>';
    var lblConfirmBuild = '<%=lblConfirmBuild.ClientID%>';
    var lblBuildStatusIsProcessing = '<%=lblBuildStatusIsProcessing.ClientID%>';

    var lblCheckTitle = '<%=lblCheckTitle.ClientID%>';
    var lblChecking = '<%=lblChecking.ClientID%>';
    var lblOk = '<%=lblOk.ClientID%>';
    var lblCancel = '<%=lblCancel.ClientID%>';
    var lblUClientNotWork = '<%=lblUClientNotWork.ClientID%>';
    var lblUClientNotWorkForBlockSingle = '<%=lblUClientNotWorkForBlockSingle.ClientID%>';
    var hfClientBlockType = '<%=hfClientBlockType.ClientID%>';

    // 按下[產生公文檔]按鈕
    function rtbSendDocClientClick(sender, args) {

        if (args.get_item().get_value() === "Build") { //產生公文

            // 判斷是否有勾選要製作的公文
            if ($('#' + grdSendEdocListChecked).length == 0) {

                ShowAlertModal($('#' + lblBuildTitle).text(), $('#' + lblOk).text(), $('#' + lblSelectBuild).text());

                args.set_cancel(true);

                return;
            }
            else {
                // 檢查UClient是否正常運作，驅動模式為共用Client先檢查，若是獨立Client則透過後面的PageMethod做檢查
                if ($('#' + hfClientBlockType).val() === 'ALL' && CheckUOFeDocClientIsOnline('CheckUOFeDocClientIsOnlineForBlockAll', ['NONE']) === 'False') {

                    $eDoc.modal.hide();

                    ShowAlertModal($('#' + lblCheckTitle).text(), $('#' + lblOk).text(), $('#' + lblUClientNotWork).text());

                    args.set_cancel(true);
                }

                // 先檢查所有獨立機關是否都有啟動Client，若都有啟動，則再檢查是否已有處理中的公文
                var errorEdocNumberStringList = '';
                var confirmMessage = '';
                var isProcessing = false;
                // 取得所有勾選的公文Guid(以#字號隔開)
                var allGridDocId = GetGridDocIdList();
                // 透過PageMethod回傳所有未啟動Client服務的機關名稱
                var allOfflineClientOrgName = CheckUOFeDocClientIsOnline('CheckUOFeDocClientIsOnlineForBlockSingle', [allGridDocId]);

                allOfflineClientOrgName = SplitStringAndBreakLine(allOfflineClientOrgName);

                if (allOfflineClientOrgName !== '') {
                    ShowAlertModal($('#' + lblCheckTitle).text(), $('#' + lblOk).text(), $('#' + lblUClientNotWorkForBlockSingle).text() + '\r\n' + allOfflineClientOrgName);
                    args.set_cancel(true);
                    return;
                }
                // 透過PageMethod回傳所有狀態為處理中的發文字號回來(一樣以#字號隔開)
                var allErrorEdocNumberString = $uof.pageMethod.syncUc("/Edoc/SendDoc/UC_SendEdocList.ascx", "CheckBuildStatus", [allGridDocId]);
                // 用#切割所有發文字號後，再以換行符號隔開丟給字串
                errorEdocNumberStringList = SplitStringAndBreakLine(allErrorEdocNumberString);

                // 若errorEdocNumberStringList不為空值，訊息改為公文已在處理中格式
                if (errorEdocNumberStringList !== '') {
                    confirmMessage = $('#' + lblBuildStatusIsProcessing).text();
                    isProcessing = true;
                }
                else {
                    confirmMessage = $('#' + lblConfirmBuild).text();
                }
                // 檢查過關後開始起單
                $eDoc.modal.hide();

                if (isClickBuild) {
                    // 確認是否要產生公文檔
                    var para = {
                        title: $('#' + lblBuildTitle).text(),
                        button: $('#' + lblOk).text(),
                        cancelBtn: $('#' + lblCancel).text(),
                        message: confirmMessage,
                        submitFucName: 'ConfirmToBuild',
                        submitParam: '',
                        isNeedRedMessage: isProcessing,
                        redMessageList: errorEdocNumberStringList
                    };
                    $eDoc.modal.confirm.show(para);

                    args.set_cancel(true);
                }
                else {
                    // 執行此次產生公文，把flag改成true，下次按下產生公文按扭要做confirm
                    isClickBuild = true;
                    // 點擊發文將事件寫入TB_EDOC_ACTION_LOG
                    $uof.pageMethod.syncUc("/Edoc/SendDoc/UC_SendEdocList.ascx", "WriteClickLog", ["SEND", "BUILD_CLICK"]);

                    ShowAlertModal($('#' + lblBuildTitle).text(), $('#' + lblOk).text(), $('#' + lblBuilding).text());

                    args.set_cancel(false);
                }
            }
        }
    }

    // 檢查UClient是否正常運作
    function CheckUOFeDocClientIsOnline(methodName, parm) {

        var result = $uof.pageMethod.syncUc("/Edoc/SendDoc/UC_SendEdocList.ascx", methodName, parm);

        return result;
    }

    // 取得所有勾選的欲產生公文之DocId，並使用#串接給字串
    function GetGridDocIdList() {

        var allDocId = '';

        for (i = 0; i < $('#' + grdSendEdocListSelectedRow).length; i++) {
            allDocId += $('#' + grdSendEdocListSelectedRow)[i].childNodes[7].innerText + '#';
        }
        return allDocId;
    }

    // 使用#分割所有的發文字號，再來每筆發文字號換行顯示
    function SplitStringAndBreakLine(needSplitString) {

        var newString = '';

        if (needSplitString.length > 0) {

            for (i = 0; i < needSplitString.split("#").length; i++) {
                newString += needSplitString.split("#")[i] + '\r\n';
            }
        }
        return newString;
    }

    // 產生公文的confirm後事件
    function ConfirmToBuild() {

        // 確定要產生公文檔，就把click flag改成false後執行[產生公文檔]按鈕進行[製作]
        isClickBuild = false;

        var sendToolbar = $find(rtbSendDoc);
        var buildBtn = sendToolbar.findItemByValue("Build");
        buildBtn.click();
    }

    // 開啟alert modal
    function ShowAlertModal(title, buttonName, message) {
        var para = {
            title: title,
            button: buttonName,
            message: message
        };
        $eDoc.modal.alert.show(para);
    }

</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <telerik:RadMultiPage ID="rmpSend" runat="server" SelectedIndex="0">
            <telerik:RadPageView ID="rpvSend" Selected="True" runat="server">
                <telerik:RadToolBar ID="rtbSendDoc" runat="server" OnButtonClick="rtbSendDoc_ButtonClick" OnClientButtonClicking="rtbSendDocClientClick"
                    Width="100%" SingleClick="None">
                    <Items>
                        <telerik:RadToolBarButton Text="產生公文檔" Value="Build" CheckedImageUrl="~/Common/Images/Edoc/icon_m238.png"
                            DisabledImageUrl="~/Common/Images/Edoc/icon_m238.png" HoveredImageUrl="~/Common/Images/Edoc/icon_m238.png"
                            ImageUrl="~/Common/Images/Edoc/icon_m238.png" runat="server">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sBuild" />

                        <telerik:RadToolBarButton Text="查詢" Value="Query" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m39.gif" runat="server">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sQuery" />
                    </Items>
                </telerik:RadToolBar>

                <table class="PopTable">
                    <tr>
                        <td>
                            <asp:Label ID="lblSendDocDate" runat="server" Text="發文日期"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadDatePicker ID="rdpSendDocStartDate" runat="server"></telerik:RadDatePicker>
                            <asp:Label ID="Label5" runat="server" Text="~"></asp:Label>
                            <telerik:RadDatePicker ID="rdpSendDocEndDate" runat="server"></telerik:RadDatePicker>
                        </td>
                        <td>
                            <asp:Label ID="lblSendDocType" runat="server" Text="公文類型"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlSendDocType" Width="200px" runat="server">
                                <asp:ListItem Text="全部" Value="ALL"></asp:ListItem>
                                <asp:ListItem Text="函" Value="LETTER"></asp:ListItem>
                                <asp:ListItem Text="開會通知單" Value="MEETING_NOTICE"></asp:ListItem>
                                <asp:ListItem Text="會勘通知單" Value="SITE_MEETING_NOTICE"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="發文機關"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlSendUnitName" runat="server"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="lblBuildStatus" runat="server" Text="製作狀態"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlBuildStatus" Width="200px" runat="server">
                                <asp:ListItem Text="全部" Value="ALL"></asp:ListItem>
                                <asp:ListItem Text="尚未產生" Value="NONE"></asp:ListItem>
                                <asp:ListItem Text="處理中" Value="PROCESSING"></asp:ListItem>
                                <asp:ListItem Text="失敗" Value="FAILED"></asp:ListItem>
                                <asp:ListItem Text="成功" Value="SUCCESS"></asp:ListItem>
                            </asp:DropDownList>

                            <asp:DropDownList ID="ddlBuildStatusForPersonalEdoc" Width="200px" runat="server">
                                <asp:ListItem Text="全部" Value="ALL"></asp:ListItem>
                                <asp:ListItem Text="未產生" Value="NOT_SUCCESS"></asp:ListItem>
                                <asp:ListItem Text="已產生" Value="SUCCESS"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblSendDocKeyWord" runat="server" Text="關鍵字"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="txtSendDocKeyWord" Width="550px" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>

                <Ede:Grid ID="grdSendEdocList" runat="server" Width="100%" DataKeyNames="SEND_DOC_ID"
                    EmptyDataText="沒有資料" PageSize="15" EnhancePager="True" AutoGenerateColumns="False"
                    AllowPaging="True" AllowSorting="True"
                    AutoGenerateCheckBoxColumn="True"
                    OnSorting="grdSendEdocList_Sorting"
                    OnRowDataBound="grdSendEdocList_RowDataBound"
                    OnBeforeExport="grdSendEdocList_BeforeExport"
                    OnPageIndexChanging="grdSendEdocList_PageIndexChanging"
                    DefaultSortColumnName="SEND_DATE" DefaultSortDirection="Descending" CustomDropDownListPage="False"
                    DataKeyOnClientWithCheckBox="False" KeepSelectedRows="False"
                    SelectedRowColor="" UnSelectedRowColor="">
                    <ExportExcelSettings AllowExportToExcel="True" />
                    <EnhancePagerSettings ShowHeaderPager="True" />
                    <HeaderStyle Wrap="False" />
                    <Columns>
                        <asp:TemplateField HeaderText="申請者" SortExpression="APPLICANT">
                            <ItemTemplate>
                                <asp:Label ID="lblApplicant" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>

                        <asp:BoundField DataField="TASK_ID" SortExpression="TASK_ID" HeaderText="表單代碼Hidden">
                            <HeaderStyle CssClass="cssHidden" />
                            <ItemStyle CssClass="cssHidden" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="表單編號" SortExpression="DOC_NBR">
                            <ItemTemplate>
                                <asp:Label ID="lblDocNbr" runat="server"></asp:Label>
                                <asp:LinkButton ID="lbtnDocNbr" runat="server" Visible="false"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="附件">
                            <ItemTemplate>
                                <asp:Image ID="imgAttach" runat="server" />
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:BoundField DataField="DOC_TYPE" HeaderText="公文類型Hidden">
                            <HeaderStyle CssClass="cssHidden" />
                            <ItemStyle CssClass="cssHidden" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="公文類型" SortExpression="DOC_TYPE">
                            <ItemTemplate>
                                <asp:Label ID="lblDocType" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>

                        <asp:BoundField DataField="SEND_DOC_ID" HeaderText="發文代碼hidden">
                            <HeaderStyle CssClass="cssHidden" />
                            <ItemStyle CssClass="cssHidden" />
                        </asp:BoundField>

                        <asp:BoundField DataField="FROM_UNIT_ID" HeaderText="發文機關代碼hidden">
                            <HeaderStyle CssClass="cssHidden" />
                            <ItemStyle CssClass="cssHidden" />
                        </asp:BoundField>

                        <asp:BoundField DataField="SEND_DATE" HeaderText="發文日期Hidden">
                            <HeaderStyle CssClass="cssHidden" />
                            <ItemStyle CssClass="cssHidden" />
                        </asp:BoundField>

                        <asp:BoundField DataField="FROM_UNIT_NAME" HeaderText="發文機關" SortExpression="FROM_UNIT_NAME">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="發文日期" SortExpression="SEND_DATE">
                            <ItemTemplate>
                                <asp:Label ID="lblSendDate" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="發文字號" SortExpression="NUMBER_STRING">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnNumberString" runat="server"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="速別" SortExpression="SPEED_TYPE">
                            <ItemTemplate>
                                <asp:Label ID="lblSpeedType" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>

                        <asp:BoundField DataField="SUBJECT" HeaderText="主旨/事由" HeaderStyle-Wrap="False" />

                        <asp:TemplateField HeaderText="受文機關" SortExpression="TO_UNIT_NAME">
                            <ItemTemplate>
                                <asp:Label ID="lblToUnitName" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>

                        <asp:BoundField DataField="SEND_STATUS" HeaderText="發文狀態Hidden">
                            <HeaderStyle CssClass="cssHidden" />
                            <ItemStyle CssClass="cssHidden" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="製作狀態" SortExpression="BUILD_STATUS">
                            <ItemTemplate>
                                <asp:Label ID="lblBuildStatusName" runat="server"></asp:Label>
                                <asp:LinkButton ID="lbtnBuildStatusName" runat="server"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="公文檔狀態" SortExpression="BUILD_STATUS">
                            <ItemTemplate>
                                <asp:Label ID="lblEdocFileStatus" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="動作時間" SortExpression="ACTION_TIME">
                            <ItemTemplate>
                                <asp:Label ID="lblActionTime" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="觀看">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDetail" Text="資訊" runat="server"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:BoundField DataField="ATTACH_FILE_GROUP_ID" HeaderText="公文附件GroupId">
                            <HeaderStyle CssClass="cssHidden" />
                            <ItemStyle CssClass="cssHidden" />
                        </asp:BoundField>
                    </Columns>
                </Ede:Grid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>

        <asp:HiddenField ID="hfSendPageIndex" runat="server" Value="0" />
        <asp:HiddenField ID="hfNowSortColumnName" runat="server" />
        <asp:HiddenField ID="hfNowSortDirection" runat="server" />

    </ContentTemplate>
</asp:UpdatePanel>


<!-- Build Status中文字串 -->
<asp:Label ID="lblNone" runat="server" Text="尚未產生" Visible="False"></asp:Label>
<asp:Label ID="lblProcessing" runat="server" Text="處理中" Visible="False"></asp:Label>
<asp:Label ID="lblFailed" runat="server" Text="失敗" Visible="False"></asp:Label>
<asp:Label ID="lblSuccess" runat="server" Text="成功" Visible="False"></asp:Label>

<!-- BuildStatusForPersonalEdoc中文字串 -->
<asp:Label ID="lblNotSuccess" runat="server" Text="未產生" Visible="False"></asp:Label>
<asp:Label ID="lblDone" runat="server" Text="已產生" Visible="False"></asp:Label>

<!-- Dialog used -->
<asp:Label ID="lblDetail" runat="server" Text="詳細資訊" Visible="False"></asp:Label>
<asp:Label ID="lblEdocContent" runat="server" Text="公文內容" Visible="False"></asp:Label>
<asp:Label ID="lblView" runat="server" Text="觀看" Visible="False"></asp:Label>

<!-- Modal used -->
<asp:Label ID="lblOk" runat="server" Text="確定" CssClass="cssHidden"></asp:Label>
<asp:Label ID="lblCancel" runat="server" Text="取消" CssClass="cssHidden"></asp:Label>

<asp:Label ID="lblBuildTitle" runat="server" Text="產生公文檔" CssClass="cssHidden"></asp:Label>
<asp:Label ID="lblSelectBuild" runat="server" Text="請選擇要製作的公文" CssClass="cssHidden"></asp:Label>
<asp:Label ID="lblConfirmBuild" runat="server" Text="確定要將所選擇的公文轉換為電子交換格式？" CssClass="cssHidden"></asp:Label>
<asp:Label ID="lblBuildStatusIsProcessing" runat="server" Text="公文檔產生中，提醒您，以下所選公文已在排程中，不會重複產生公文檔。" CssClass="cssHidden"></asp:Label>
<asp:Label ID="lblBuilding" runat="server" Text="轉換中，請稍候。" CssClass="cssHidden"></asp:Label>

<asp:Label ID="lblCheckTitle" runat="server" Text="檢查設定" CssClass="cssHidden"></asp:Label>
<asp:Label ID="lblChecking" runat="server" Text="檢查設定中，請稍候......" CssClass="cssHidden"></asp:Label>
<asp:Label ID="lblUClientNotWork" runat="server" Text="尚未安裝或啟動UOF eDoc Client，無法製作公文檔案。" CssClass="cssHidden"></asp:Label>
<asp:Label ID="lblUClientNotWorkForBlockSingle" runat="server" Text="以下機關尚未安裝或啟動UOF eDoc Client，無法製作公文檔案。" CssClass="cssHidden"></asp:Label>

<%-- UI used --%>
<asp:Label ID="lblPlaceHolder" runat="server" Text="可搜尋受文機關名稱、發文字號、公文主旨或事由" CssClass="cssHidden"></asp:Label>
<asp:Label ID="lblPlaceHolderForPersonalEdoc" runat="server" Text="可搜尋受文機關名稱、申請者、發文字號、公文主旨或事由" CssClass="cssHidden"></asp:Label>
<asp:Label ID="lblSendAll" runat="server" Text="全部" CssClass="cssHidden"></asp:Label>
<asp:Label ID="lblEdocFileStatus" runat="server" Text="公文檔狀態" CssClass="cssHidden"></asp:Label>

<asp:HiddenField ID="hfClientBlockType" runat="server" />
