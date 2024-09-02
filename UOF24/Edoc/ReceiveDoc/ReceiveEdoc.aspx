<%@ Page Title="收文起單" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="ReceiveEdoc.aspx.cs" Inherits="Ede.Uof.Web.Edoc.ReceiveDoc.ReceiveEdoc" Culture="auto" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        /* 隱藏Grid內的欄位 */
        .cssHidden {
            display: none;
        }
    </style>

    <script type="text/javascript">

        var isClickUpload = true;
        var lostAttachDocList = "";
        var isLostAttach = false;
        var mArgs = null;

        var rtbReceivedDoc = '<%=rtbReceivedDoc.ClientID%>';
        var grdReceiveEdocList = '<%=grdReceiveEdocList.ClientID%>';
        var grdReceiveEdocListChecked = '<%=grdReceiveEdocList.ClientID %> input[type="checkbox"]:checked';
        var grdReceiveEdocListSelectedRow = '<%=grdReceiveEdocList.ClientID %> tr[class="GridItemSelected"]';
        
        var lblUploadTitle = '<%=lblUploadTitle.ClientID%>';
        var lblUploading = '<%=lblUploading.ClientID%>';
        var lblSelectUpload = '<%=lblSelectUpload.ClientID%>';
        var lblAlreadyUpload = '<%=lblAlreadyUpload.ClientID%>';

        var lblConfirmUpload = '<%=lblConfirmUpload.ClientID%>';
        var lblConfirmUploadWhenAttachLost = '<%=lblConfirmUploadWhenAttachLost.ClientID%>';
        var lblFormStatusIsUploaded = '<%=lblFormStatusIsUploaded.ClientID%>';

        var lblCheckTitle = '<%=lblCheckTitle.ClientID%>';
        var lblChecking = '<%=lblChecking.ClientID%>';
        var lblOk = '<%=lblOk.ClientID%>';
        var lblCancel = '<%=lblCancel.ClientID%>';
        

        // 按下[起單]按鈕
        function rtbReceiveDocClientClick(sender, args) {
            
            if (args.get_item().get_value() === "Upload") {     // 起單

                // 判斷是否有勾選要起單的公文
                if ($('#' + grdReceiveEdocListChecked).length == 0) {
                    ShowAlertModal($('#' + lblUploadTitle).text(), $('#' + lblOk).text(), $('#' + lblSelectUpload).text());

                    args.set_cancel(true);
                }
                else {
                    // 先開啟檢查設定中的Modal
                    var para = {
                        title: $('#' + lblCheckTitle).text(),
                        message: $('#' + lblChecking).text(),
                    };
                    $eDoc.modal.message.show(para);

                    var confirmMessage = '';
                    // 先判斷公文是否重複起單
                    var errorEdocNumberStringList = '';
                    var isUploading = false;
                    // 取得所有勾選的公文Guid(以#字號隔開)
                    var allGridDocId = GetGridDocIdList();
                    // 傳Guid給後端事件，會回傳所有狀態為處理中的發文字號回來(一樣以#字號隔開)
                    var allErrorEdocNumberString = $uof.pageMethod.sync("CheckFormStatus", [allGridDocId]);
                    // 用#切割所有發文字號後，再以換行符號隔開丟給字串
                    errorEdocNumberStringList = SplitAllEdocNumberString(allErrorEdocNumberString);

                    // 若errorEdocNumberStringList不為空值，訊息改為公文已在處理中格式
                    if (errorEdocNumberStringList !== '') 
                        isUploading = true;
                    // 再判斷公文是否有缺檔，有缺檔需更換成缺檔提示的視窗
                    lostAttachDocList = "";
                    isLostAttach = false;

                    lostAttachDocList = SetLostAttachList();
                    // 若lostAttachDocList不為空值，起單訊息改為缺檔格式
                    if (lostAttachDocList !== '') 
                        isLostAttach = true;

                    confirmMessage = $('#' + lblConfirmUploadWhenAttachLost).text();

                    // 檢查過關後開始起單
                    $eDoc.modal.hide();

                    var submitFucName = '';
                    var isNeedRedMessage = '';
                    var redMessageList = '';
                    // 須判斷有重複起單+有缺檔、有重複起單+無缺檔、無重複起單+有缺檔、無重複起單+有缺檔四種情況
                    if (isUploading && isLostAttach) {

                        confirmMessage = $('#' + lblFormStatusIsUploaded).text();
                        submitFucName = 'ShowLostAttachConfirmModal';
                        isNeedRedMessage = isUploading;
                        redMessageList = errorEdocNumberStringList;
                    }
                    else if (isUploading) {

                        confirmMessage = $('#' + lblFormStatusIsUploaded).text();
                        submitFucName = 'ConfirmToUpload';
                        isNeedRedMessage = isUploading;
                        redMessageList = errorEdocNumberStringList;
                    }
                    else if (isLostAttach) {

                        confirmMessage = $('#' + lblConfirmUploadWhenAttachLost).text();
                        submitFucName = 'ConfirmToUpload';
                        isNeedRedMessage = isLostAttach;
                        redMessageList = lostAttachDocList;
                    }
                    else {
                        confirmMessage = $('#' + lblConfirmUpload).text();
                        submitFucName = 'ConfirmToUpload';
                    }
                    var para = {
                        title: $('#' + lblUploadTitle).text(),
                        button: $('#' + lblOk).text(),
                        cancelBtn: $('#' + lblCancel).text(),
                        message: confirmMessage,
                        submitFucName: submitFucName,
                        submitParam: '',
                        isNeedRedMessage: isNeedRedMessage,
                        redMessageList: redMessageList
                    };
                    // 開始起單
                    if (isClickUpload) {

                        $eDoc.modal.confirm.show(para);

                        args.set_cancel(true);
                    }
                    else {
                        // 執行此次起單，把flag改成true，下次按下起單按扭要做confirm
                        isClickUpload = true;

                        // 點擊收文將事件寫入TB_EDOC_ACTION_LOG
                        $uof.pageMethod.sync("WriteClickLog", ["RECEIVE", "UPLOAD_CLICK"]);

                        ShowAlreadyUploadMsg();

                        args.set_cancel(false);
                    }
                }
            }
        }

        // 取得所有勾選的欲起單之DocId，並使用#串接給字串
        function GetGridDocIdList() {
  
            var allDocId = '';

            for (i = 0; i < $('#' + grdReceiveEdocListSelectedRow).length; i++) {
                allDocId += $('#' + grdReceiveEdocListSelectedRow)[i].childNodes[3].innerText + '#';
            }
            return allDocId;
        }

        // 使用#分割所有的發文字號，再來每筆發文字號換行顯示
        function SplitAllEdocNumberString(allErrorEdocNumberString) {

            var newAllEdocNumberString = '';

            if (allErrorEdocNumberString.length > 0) {
                
                for (i = 0; i < allErrorEdocNumberString.split("#").length; i++) {
                    newAllEdocNumberString += allErrorEdocNumberString.split("#")[i] + '\r\n';
                }
            }
            return newAllEdocNumberString;
        }

        // 組合所有勾選的缺檔公文字號
        function SetLostAttachList() {

            var lostAttachDocList = '';

            for (i = 0; i < $('#' + grdReceiveEdocListSelectedRow).length; i++) {

                if ($('#' + grdReceiveEdocListSelectedRow)[i].childNodes[25].innerText === 'True') {
                    lostAttachDocList += $('#' + grdReceiveEdocListSelectedRow)[i].childNodes[9].innerText + '\r\n';
                }
            }
            return lostAttachDocList;
        }

        // 顯示缺檔的Modal提示視窗
        function ShowLostAttachConfirmModal() {
            
            // 確認是否要起單
            var para = {
                title: $('#' + lblUploadTitle).text(),
                button: $('#' + lblOk).text(),
                cancelBtn: $('#' + lblCancel).text(),
                message: $('#' + lblConfirmUploadWhenAttachLost).text(),
                submitFucName: 'ConfirmToUpload',
                submitParam: '',
                isNeedRedMessage: isLostAttach,
                redMessageList: lostAttachDocList 
            };
            $eDoc.modal.confirm.show(para);
        }
        
        // 起單的confirm後事件
        function ConfirmToUpload() {

            // 確定要起單，就把click flag改成false後執行[起單]按鈕進行[起單]
            isClickUpload = false;

            var receivedToolbar = $find(rtbReceivedDoc);
            var uploadBtn = receivedToolbar.findItemByValue("Upload");
            uploadBtn.click();
        }

        // 跳出"起單作業已進入系統排程"訊息
        function ShowAlreadyUploadMsg() {
            ShowAlertModal($('#' + lblUploadTitle).text(), $('#' + lblOk).text(), $('#' + lblAlreadyUpload).text());
            isClickUpload = true;
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
            <telerik:RadMultiPage ID="rmpReceive" runat="server" SelectedIndex="0">
                <telerik:RadPageView ID="pvReceived" Selected="True" runat="server">
                    <telerik:RadToolBar ID="rtbReceivedDoc" runat="server" OnButtonClick="rtbReceivedDoc_ButtonClick" 
                        OnClientButtonClicking="rtbReceiveDocClientClick" Width="100%" SingleClick="None">
                        <Items>
                            <telerik:RadToolBarButton Text="起單" Value="Upload" runat="server" CheckedImageUrl="~/Common/Images/Edoc/icon_m235.png"
                                DisabledImageUrl="~/Common/Images/Edoc/icon_m235.png" HoveredImageUrl="~/Common/Images/Edoc/icon_m235.png"
                                ImageUrl="~/Common/Images/Edoc/icon_m235.png">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sKeyword" />

                            <telerik:RadToolBarButton Text="查詢" Value="Query" runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m39.gif">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sKeyword" />

                            <telerik:RadToolBarButton Value="Tip">
                                <ItemTemplate>
                                    <%--padding-top→為了對齊前方ToolBarButton按鈕與文字 --%>
                                    <div id="divTip" style="padding-top:5px">
                                        <asp:Image ID="ImgAttachLostTip" runat="server" ImageUrl="~/Common/Images/Edoc/icon_m248.png"/>
                                        <asp:Label ID="lblAttachLostTip" runat="server" Text="：表示該封公文有缺少附件" ForeColor="Blue"></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>

                    <table class="PopTable">
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="收文日期"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="rdpReceiveStartDate" runat="server"></telerik:RadDatePicker>
                                <asp:Label ID="Label5" runat="server" Text="~"></asp:Label>
                                <telerik:RadDatePicker ID="rdpReceiveEndDate" runat="server"></telerik:RadDatePicker>
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="公文類型"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlEdocType" Width="200px" runat="server">
                                    <asp:ListItem Text="全部" Value="ALL"></asp:ListItem>
                                    <asp:ListItem Text="函" Value="LETTER"></asp:ListItem>
                                    <asp:ListItem Text="開會通知單" Value="MEETING_NOTICE"></asp:ListItem>
                                    <asp:ListItem Text="會勘通知單" Value="SITE_MEETING_NOTICE"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="收文機關"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlReceive" runat="server"></asp:DropDownList>
                            </td>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="表單狀態"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlStartFormStatus" Width="200px" runat="server">
                                    <asp:ListItem Text="全部" Value="ALL"></asp:ListItem>
                                    <asp:ListItem Text="尚未起單" Value="NONE"></asp:ListItem>
                                    <asp:ListItem Text="起單中" Value="UPLOADING"></asp:ListItem>
                                    <asp:ListItem Text="起單失敗" Value="FAILED"></asp:ListItem>
                                    <asp:ListItem Text="簽核中" Value="SIGNIN"></asp:ListItem>
                                    <asp:ListItem Text="結案(通過)" Value="ENDPASS"></asp:ListItem>
                                    <asp:ListItem Text="結案(否決)" Value="ENDREJECT"></asp:ListItem>
                                    <asp:ListItem Text="作廢" Value="ENDCANCEL"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="關鍵字"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="txtReceivedKeyWord" Width="550px" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>

                    <Ede:Grid ID="grdReceiveEdocList" runat="server" Width="100%" DataKeyNames="RECEIVE_DOC_ID"
                        EmptyDataText="沒有資料" PageSize="15" EnhancePager="True" AutoGenerateColumns="False"
                        AllowPaging="True" AllowSorting="True"
                        AutoGenerateCheckBoxColumn="True"
                        OnSorting="grdReceiveEdocList_Sorting"
                        OnRowDataBound="grdReceiveEdocList_RowDataBound"
                        OnBeforeExport="grdReceiveEdocList_BeforeExport"
                        OnPageIndexChanging="grdReceiveEdocList_PageIndexChanging"
                        DefaultSortColumnName="RECEIVE_DATE" DefaultSortDirection="Descending" 
                        CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" KeepSelectedRows="False" 
                        SelectedRowColor="" UnSelectedRowColor="">
                        <ExportExcelSettings AllowExportToExcel="True" />
                        <EnhancePagerSettings ShowHeaderPager="True" />
                        <HeaderStyle Wrap="False" />
                        <Columns>
                            <asp:BoundField DataField="ORG_ID" HeaderText="收文機關代碼hidden">
                                <HeaderStyle CssClass="cssHidden" />
                                <ItemStyle CssClass="cssHidden" />
                            </asp:BoundField>

                            <asp:BoundField DataField="ORG_NAME" HeaderText="收文機關" SortExpression="ORG_NAME">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="True" Width="150px"/>
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="附件">
                                <ItemTemplate>
                                    <div style="padding-top:5px;">
                                        <asp:Image ID="imgAttach" runat="server" />
                                    </div>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="RECEIVE_DOC_ID" HeaderText="收文代碼hidden">
                                <HeaderStyle CssClass="cssHidden" />
                                <ItemStyle CssClass="cssHidden" />
                            </asp:BoundField>

                            <asp:BoundField DataField="FROM_UNIT_NAME" HeaderText="發文機關" SortExpression="FROM_UNIT_NAME">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="True" Width="150px"/>
                            </asp:BoundField>

                            <asp:BoundField DataField="DOC_TYPE" HeaderText="公文類型Hidden">
                                <HeaderStyle CssClass="cssHidden" />
                                <ItemStyle CssClass="cssHidden" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="公文類型" SortExpression="DOC_TYPE">
                                <ItemTemplate>
                                    <asp:Label ID="lblDocTypeName" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="SEND_DATE" HeaderText="發文日期Hidden">
                                <HeaderStyle CssClass="cssHidden" />
                                <ItemStyle CssClass="cssHidden" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="發文日期" SortExpression="SEND_DATE">
                                <ItemTemplate>
                                    <asp:Label ID="lblSendDate" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="NUMBER_STRING" HeaderText="發文日期Hidden">
                                <HeaderStyle CssClass="cssHidden" />
                                <ItemStyle CssClass="cssHidden" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="發文字號" SortExpression="NUMBER_STRING">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnNumberString" runat="server"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="SPEED_TYPE" HeaderText="速別hidden">
                                <HeaderStyle CssClass="cssHidden" />
                                <ItemStyle CssClass="cssHidden" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="速別" SortExpression="SPEED_TYPE">
                                <ItemTemplate>
                                    <asp:Label ID="lblSpeedType" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="SUBJECT" HeaderText="主旨/事由">
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>

                            <asp:BoundField DataField="RECEIVE_DATE" HeaderText="收文時間hidden">
                                <HeaderStyle CssClass="cssHidden" />
                                <ItemStyle CssClass="cssHidden" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="收文時間" SortExpression="RECEIVE_DATE">
                                <ItemTemplate>
                                    <asp:Label ID="lblReceiveDate" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="DOC_NBR" SortExpression="DOC_NBR" HeaderText="表單編號Hidden">
                                <HeaderStyle CssClass="cssHidden" />
                                <ItemStyle CssClass="cssHidden" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="表單編號" SortExpression="DOC_NBR">
                                <ItemTemplate>
                                    <asp:Label ID="lblDocNbr" runat="server"></asp:Label>
                                    <asp:LinkButton ID="lbtnDocNbr" runat="server" Visible="false"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="BEGIN_TIME" HeaderText="表單申請時間hidden">
                                <HeaderStyle CssClass="cssHidden" />
                                <ItemStyle CssClass="cssHidden" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="表單申請時間" SortExpression="BEGIN_TIME">
                                <ItemTemplate>
                                    <asp:Label ID="lblBeginTime" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="FORM_STATUS" HeaderText="表單狀態Hidden">
                                <HeaderStyle CssClass="cssHidden" />
                                <ItemStyle CssClass="cssHidden" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="表單狀態" SortExpression="FORM_STATUS">
                                <ItemTemplate>
                                    <asp:Label ID="lblFormStatusName" runat="server"></asp:Label>
                                    <asp:LinkButton ID="lbtnFormStatusName" runat="server"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
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

                            <asp:BoundField DataField="TASK_ID" HeaderText="表單代碼">
                                <HeaderStyle CssClass="cssHidden" />
                                <ItemStyle CssClass="cssHidden" />
                            </asp:BoundField>

                            <asp:BoundField DataField="IS_ATTACH_LOST" HeaderText="附件是否缺檔">
                                <HeaderStyle CssClass="cssHidden" />
                                <ItemStyle CssClass="cssHidden" />
                            </asp:BoundField>
                        </Columns>
                    </Ede:Grid>
                </telerik:RadPageView>
            </telerik:RadMultiPage>

            <!-- Form Status中文字串 -->
            <asp:Label ID="lblNone" runat="server" Text="尚未起單" Visible="False"></asp:Label>
            <asp:Label ID="lblSignIn" runat="server" Text="簽核中" Visible="False"></asp:Label>
            <asp:Label ID="lblFailed" runat="server" Text="起單失敗" Visible="False"></asp:Label>
            <asp:Label ID="lblUploading" runat="server" Text="起單中" Visible="False"></asp:Label>
            <asp:Label ID="lblEndPass" runat="server" Text="結案(通過)" Visible="False"></asp:Label>
            <asp:Label ID="lblEndReject" runat="server" Text="結案(否決)" Visible="False"></asp:Label>
            <asp:Label ID="lblEndCancel" runat="server" Text="作廢" Visible="False"></asp:Label>

            <!-- Dialog Used -->
            <asp:Label ID="lblUploadStatus" runat="server" Text="起單狀態" Visible="False"></asp:Label>
            <asp:Label ID="lblDetail" runat="server" Text="詳細資訊" Visible="False"></asp:Label>
            <asp:Label ID="lblEdocContent" runat="server" Text="公文內容" Visible="False"></asp:Label>
            <asp:Label ID="lblView" runat="server" Text="觀看" Visible="False"></asp:Label>

            <!-- Modal used -->
            <asp:Label ID="lblErrorTitle" runat="server" Text="錯誤訊息" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblOk" runat="server" Text="確定" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblCancel" runat="server" Text="取消" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblCloseModal" runat="server" Text="隱藏視窗" CssClass="cssHidden"></asp:Label>

            <asp:Label ID="lblDeleteTitle" runat="server" Text="刪除" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblSelectDelete" runat="server" Text="請選擇要刪除的公文" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblSureDelete" runat="server" Text="確定要刪除嗎 ?" CssClass="cssHidden"></asp:Label>
            
            <asp:Label ID="lblUploadTitle" runat="server" Text="建立電子表單" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblConfirmUpload" runat="server" Text="確定要為所選擇的公文建立電子表單並送出申請?" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblConfirmUploadWhenAttachLost" runat="server" Text="以下公文缺少附件，確定要為所選擇的公文建立電子表單並送出申請?" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblFormStatusIsUploaded" runat="server" Text="起單中，提醒您，以下所選公文已在起單排程中，無法再次起單。" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblSelectUpload" runat="server" Text="請選擇要起單的公文" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblAlreadyUpload" runat="server" Text="起單作業已進入系統排程。" CssClass="cssHidden"></asp:Label>
                
            <asp:Label ID="lblCheckTitle" runat="server" Text="檢查設定" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblChecking" runat="server" Text="檢查設定中，請稍候......" CssClass="cssHidden"></asp:Label>
            
            <asp:Label ID="lblPlaceHolder" runat="server" Text="可搜尋發文機關名稱、發文字號、公文主旨或事由" CssClass="cssHidden"></asp:Label>

            <asp:Label ID="lblReceiveAll" runat="server" Text="全部" CssClass="cssHidden"></asp:Label>
            
            <asp:HiddenField ID="hfReceivePageIndex" runat="server" Value="0" />
            <asp:HiddenField ID="hfNowSortColumnName" runat="server" />
            <asp:HiddenField ID="hfNowSortDirection" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>