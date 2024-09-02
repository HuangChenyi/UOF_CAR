<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="EditEdocDialog.aspx.cs" Inherits="Ede.Uof.Web.Edoc.SendDoc.EditEdocDialog" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        .cssCenter {
            text-align: center !important;
        }

        .cssHidden {
            display: none;
        }
    </style>

    <script type="text/javascript">

        function rtbImportEdocOnClientButtonClicking(sender, args) {

            var value = args.get_item().get_value();

            if (value === "ImportEDocZip") {

                args.set_cancel(true);

                $uof.dialog.open2("~/Edoc/SendDoc/ImportEdoc.aspx", args.get_item(), "", 380, 530, openDialogResult,
                    {
                        "docType": $('#<%=hfDocType.ClientID%>').val()
                    });
            }
        }

        // 全選checkBox
        function DoCheckAll(chkStatus) {
            $("#<%=grdDuplicate.ClientID %>").find("[type='checkbox']").prop('checked', chkStatus.checked);
        }

        // Validate正本是否有選擇受文機關
        function CheckOriginalNull(source, args) {
            GridIsValidLogic(args, "original")
        }

        // Validate主持人是否有選擇受文機關
        function CheckChairmanNull(source, args) {
            GridIsValidLogic(args, "chairman")
        }

        // Validate出席者是否有選擇受文機關
        function CheckAttendeeNull(source, args) {
            GridIsValidLogic(args, "attendee")
        }

        // Validate開會時間或會勘時間
        function CheckTimeNull(source, args) {
            GridIsValidLogic(args, "time");
        }

        // 檢查正本、主持人、出席者是否有選；檢查開會時間及會勘時間是否有選
        function GridIsValidLogic(args, toTypeOrTime) {

            var checkGridSize = null;
            var hlFocus = null;

            switch (toTypeOrTime) {

                case 'original':
                    checkGridSize = $('#<%=grdOriginal.ClientID%> tr').length;
                    hlFocus = $('#<%=hlOriginalFocus.ClientID%>');
                    break;

                case 'chairman':
                    checkGridSize = $('#<%=grdChairman.ClientID%> tr').length;
                    hlFocus = $('#<%=hlChairman.ClientID%>');
                    break;

                case 'attendee':
                    checkGridSize = $('#<%=grdAttendee.ClientID%> tr').length;
                    hlFocus = $('#<%=hlAttendee.ClientID%>');
                    break;

                case 'time':
                    checkGridSize = $('#<%=grdTime.ClientID%> tr').length;
                    hlFocus = $('#<%=hlFocusChooseTime.ClientID%>');
                    break;
            }

            // 沒資料時會有一個tr為"沒有資料"，也要列入判斷依據
            if (checkGridSize <= 1) {
                args.IsValid = false;
                $(hlFocus).focus();
            } else {
                args.IsValid = true;
            }
        }

        // Validate發文字號
        function CheckNumberString(source, args) {

            var hfNumberVal = $('#<%=hfNumber.ClientID%>').val();
            var hfTempNumberStringVal = $('#<%=hfTempNumberString.ClientID%>').val();
            var ddlNumberStringVal = $("#<%=ddlNumberString.ClientID%>").val();

            if (hfTempNumberStringVal.length === 0 || ddlNumberStringVal.length === 0) {
                args.IsValid = false;
                $('#<%=hlFocusNumber.ClientID%>').focus();
                return;
            }

            if (parseInt(hfNumberVal, 10) === 0) {

                // 字號檢查
                if ($('#<%=ddlNumberString.ClientID%> option').length === 0) {
                    source.textContent = $('#<%=lblCreateNumberString.ClientID%>').text();
                    args.IsValid = false;
                    $('#<%=hlFocusNumber.ClientID%>').focus();
                    return;
                }

                var ddlNumberStringEle = document.getElementById("<%=ddlNumberString.ClientID%>");

                var ddlNumberStringSelectedIndex = ddlNumberStringEle.options[ddlNumberStringEle.selectedIndex].index;

                if (ddlNumberStringSelectedIndex === 0) {
                    args.IsValid = false;
                    $('#<%=hlFocusNumber.ClientID%>').focus();
                    return;
                }
            }

            args.IsValid = true;
        }

        // Validate發文機關
        function CheckSendUnitName(source, args) {

            var hfNumber = $('#<%=hfNumber.ClientID%>').val();

            if (parseInt(hfNumber, 10) === 0) {
                // 發文機關檢查
                var value = document.getElementById("<%=ddlSendUnitName.ClientID%>");
                var ddlSendUnitNameIndex = value.options[value.selectedIndex].index;
                if (ddlSendUnitNameIndex === 0) {

                    //lblErrorMsg要清空
                    $('#<%=lblErrorMsg.ClientID%>').text("");

                    args.IsValid = false;
                    $('#<%=hlSendUnitName.ClientID%>').focus();
                    return;
                }
            }

            args.IsValid = true;
        }

        // 檢查說明欄位
        function CheckDescription(source, args) {

            var header = m_DocEditor.getValue().header;
            var nodes = m_DocEditor.getValue().nodes;

            // header填寫後在刪掉會有回車符號，要加入判斷
            header = header.replace("\n", "");

            if (header.length === 0 && nodes.length === 0) {
                args.IsValid = false;
                $('#<%=hlFocusLetterContent.ClientID%>').focus();
                return;
            }

            args.IsValid = true;
        }

        // 點擊正本的"選擇"按鈕，開啟受文機關選擇Dialog
        function btnOriginal_ClientClicking(sender, args) {
            OpenDialogLogic("original", "original", sender);
            ResetValid("original");
        }

        // 點擊副本的"選擇"按鈕，開啟受文機關選擇Dialog 
        function btnDuplicate_ClientClicking(sender, args) {
            if ($("#<%=hfDocType.ClientID%>").val() === 'Letter') {
                OpenDialogLogic("duplicate", "duplicate", sender);
            }
            else {
                OpenDialogLogic("duplicate", "duplicate", sender);
            }
            ResetValid("duplicate");
        }

        // 點擊主持人的"選擇"按鈕，開啟受文機關選擇Dialog 
        function btnChairMan_ClientClicking(sender, args) {
            OpenDialogLogic("chairman", "chairman", sender);
            ResetValid("chairman");
        }

        // 點擊出席者的"選擇"按鈕，開啟受文機關選擇Dialog 
        function btnAttendee_ClientClicking(sender, args) {
            OpenDialogLogic("attendee", "attendee", sender);
            ResetValid("attendee");
        }

        // 點擊列席者的"選擇"按鈕，開啟受文機關選擇Dialog 
        function btnPresent_ClientClicking(sender, args) {
            OpenDialogLogic("present", "present", sender);
            ResetValid("present");
        }

        // 點擊"選擇聯絡人"按鈕，開啟選擇聯絡人Dialog
        function OnContactClicking(sender, args) {

            //先將編輯器內容、發文字號類別存到hidden field
            saveToHiddenField();

            $uof.dialog.open2("~/Edoc/Personal/ContactPersonDialogDetail.aspx", sender, '<%=lblContactPerson.Text%>', 800, 400, openDialogResult, { "USER_GUID": $('#<%=hfUserGuid.ClientID%>').val() });
        }

        // 點擊"加入常用"按鈕，開啟選擇聯絡人Dialog
        function OnAddContactClicking(sender, args) {

            //先將編輯器內容、發文字號類別存到hidden field
            saveToHiddenField();
        }

        // 刪除選擇機關
        function ConfirmDelete() {

            //先將編輯器內容、發文字號類別存到hidden field
            saveToHiddenField();

            if (confirm('<%=lblDelete.Text%>')) {
                return true;
            }
            else {
                return false;
            }
        }

        // 開啟受文機關選擇Dialog
        function OpenDialogLogic(nowToType, checkToType, sender) {

            //先將編輯器內容、發文字號類別存到hidden field
            saveToHiddenField();

            // 開啟dialog
            $uof.dialog.open2("~/Edoc/SendDoc/ChooseOrgDialog.aspx", sender, $("#<%=lblToOrgTitle.ClientID%>").text(), 980, 750,
                function (returnValue) {
                    return true;
                },
                {
                    "nowToType": nowToType,
                    "checkToType": checkToType,
                    "sendDocId": $('#<%=hfDocId.ClientID%>').val(),
                    "fromUnitId": $('#<%=hfFromUnitId.ClientID%>').val(),
                });
        }

        // 點擊開會時間或會勘時間的選擇按鈕，開啟選擇時間的dialog
        function btnChooseTime_ClientClicking(sender, args) {

            //先將編輯器內容、發文字號類別存到hidden field
            saveToHiddenField();

            var dialogTitle = $('#<%=hfDocType.ClientID%>').val() == 'MeetingNotice' ? $('#<%=lblMnTimeTitle.ClientID%>').text() : $('#<%=lblSmnTimeTitle.ClientID%>').text();

            // 開啟dialog
            $uof.dialog.open2("~/Edoc/SendDoc/ChooseDateDialog.aspx", sender, dialogTitle, 500, 320,
                function (returnValue) {
                    return true;
                },
                {
                    "sendDocId": $('#<%=hfDocId.ClientID%>').val(),
                    "docType": $('#<%=hfDocType.ClientID%>').val()
                });
        }

        function openDialogResult(returnValue) {

            if (typeof (returnValue) == 'undefined') {
                return '';
            }
            return returnValue;
        }

        function SendUnitNameChange() {

            if ($("#<%=ddlSendUnitName.ClientID%> > option:selected").text() === '') { } else {
                //原先的發文機關內容存到HiddenField
                $("#<%=hfFromUnitId.ClientID%>").val($("#<%=ddlSendUnitName.ClientID%> > option:selected").val());
                $("#<%=hfFromUnitName.ClientID%>").val($("#<%=ddlSendUnitName.ClientID%> > option:selected").text());

                //取得原本的資訊
                var originalSendUnitID = $("#<%=ddlSendUnitName.ClientID%> > option:selected").val();
                var originalNumberString = $("#<%=ddlNumberString.ClientID%> > option:selected").val();

                //清空字號類別下拉選單
                $("#<%=ddlNumberString.ClientID%>").html("");

                //取得所選擇的機關ID
                var hfFromUnitId = $('#<%=hfFromUnitId.ClientID%>').val();
                var data = [hfFromUnitId];

                //呼叫後端method取得該類別下有權限的表單名稱
                var numberStringList = $uof.pageMethod.sync("GetNumberStringList", data);

                //將回傳值轉回物件才可以跑回圈抓出資料
                var obj = JSON.parse(numberStringList);

                //跑迴圈把JSON的內容組成ddlNumberString的HTML
                $.each(obj, function (i, val) {
                    if (hfFromUnitId != originalSendUnitID) {
                        //有變換機關，要讓字號類別預設值回到第一筆
                        $("#<%=ddlNumberString.ClientID%>").append($("<option></option>").val(i).html(val));
                    }
                    else {
                        if (originalNumberString == i)
                            $("#<%=ddlNumberString.ClientID%>").append($("<option></option>").val(i).html(val).attr('selected', 'selected'));
                        else
                            $("#<%=ddlNumberString.ClientID%>").append($("<option></option>").val(i).html(val));
                    }
                });
            }
        }

        //新增時清除驗證狀態(不管有無新增資料，點選按鈕即清除)
        function ResetValid(type) {
            if (type === 'original') { //正本-清除正/副本驗證
                $('#<%=hfGridOCValid.ClientID%>').val('true');
                $('#<%=hfGridCValid.ClientID%>').val('true');
            }
            else if (type === 'duplicate') { //副本-清除所有驗證
                $('#<%=hfGridOCValid.ClientID%>').val('true');
                $('#<%=hfGridCValid.ClientID%>').val('true');
                $('#<%=hfGridCMValid.ClientID%>').val('true');
                $('#<%=hfGridATValid.ClientID%>').val('true');
                $('#<%=hfGridPRValid.ClientID%>').val('true');
            }
            else { //主持人/出席者/列席者-清除除了正本以外的驗證
                $('#<%=hfGridCValid.ClientID%>').val('true');
                $('#<%=hfGridCMValid.ClientID%>').val('true');
                $('#<%=hfGridATValid.ClientID%>').val('true');
                $('#<%=hfGridPRValid.ClientID%>').val('true');
            }
        }

        // 將資料存到hidden field
        function saveToHiddenField() {

            //將發文字號類別存到hidden field
            $('#<%=hfTempNumberString.ClientID%>').val($("#<%=ddlNumberString.ClientID%> > option:selected").text());

            // 將編輯器內容存到hidden field
            $('#<%=hfEditorContent.ClientID%>').val(JSON.stringify(m_DocEditor.getValue()));
        }

        function NumberStringChange() {

            //將發文字號類別存到hidden field
            $('#<%=hfTempNumberString.ClientID%>').val($("#<%=ddlNumberString.ClientID%> > option:selected").text());
        }

    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <table class="PopTable">
                <tr>
                    <td colspan="2">
                        <telerik:RadToolBar ID="rtbImportEdoc" runat="server" OnButtonClick="rtbImportEdoc_ButtonClick"
                            OnClientButtonClicking="rtbImportEdocOnClientButtonClicking" Width="100%" SingleClick="None">
                            <Items>
                                <telerik:RadToolBarButton Text="匯入公文檔" Value="ImportEDocZip" CausesValidation="false"
                                    CheckedImageUrl="~/Common/Images/Edoc/icon_m234.png"
                                    DisabledImageUrl="~/Common/Images/Edoc/icon_m234.png"
                                    HoveredImageUrl="~/Common/Images/Edoc/icon_m234.png"
                                    ImageUrl="~/Common/Images/Edoc/icon_m234.png" runat="server">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sKeyword" />
                            </Items>
                        </telerik:RadToolBar>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="cssCenter PopTableHeader">
                        <asp:Label ID="Label30" runat="server" Text="發文機關"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label51" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text="發文機關："></asp:Label>
                    </td>
                    <td>
                        <asp:HyperLink ID="hlSendUnitName" NavigateUrl="#" runat="server"></asp:HyperLink>
                        <asp:DropDownList ID="ddlSendUnitName" onchange="SendUnitNameChange();" runat="server"></asp:DropDownList>
                        <asp:Label ID="lblSendUnitName" runat="server"></asp:Label>
                        <asp:Label ID="lblErrorMsg" ForeColor="red" runat="server"></asp:Label>
                        <asp:CustomValidator ID="cvSendUnitName" ClientValidationFunction="CheckSendUnitName" ErrorMessage="必填" Display="Dynamic" runat="server"></asp:CustomValidator>

                    </td>
                </tr>

                <asp:Panel ID="pnlLetterContact" runat="server">
                    <tr>
                        <td colspan="2" class="cssCenter PopTableHeader">
                            <asp:Label ID="Label2" runat="server" Text="聯絡人資訊"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="Label22" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            <asp:Label ID="Label3" runat="server" Text="地址："></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" Style="width: 40%"></asp:TextBox>
                            <telerik:RadButton ID="rbtnContact" runat="server" Text="選擇聯絡人" Visible="false" OnClick="btnContact_Click" OnClientClicking="OnContactClicking" CausesValidation="false" />
                            <telerik:RadButton ID="rbtnAddContact" runat="server" Text="加入常用" Visible="false" OnClick="btnAddContact_Click" OnClientClicking="OnAddContactClicking" CausesValidation="false" />
                            <asp:Label ID="lblAddContact" runat="server" Text="已加入" ForeColor="Blue" Visible="false"></asp:Label>
                            <asp:Label ID="lblContact" runat="server" Text="請填寫聯絡人名稱" ForeColor="Red" Visible="false"></asp:Label>
                            <asp:Label ID="lblExistContact" runat="server" Text="聯絡人資訊已存在" ForeColor="Red" Visible="false"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtAddress"
                                Display="Dynamic" SetFocusOnError="true" runat="server" ErrorMessage="必填">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="Label23" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            <asp:Label ID="Label4" runat="server" Text="聯絡人："></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" Style="width: 20%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtName"
                                Display="Dynamic" SetFocusOnError="true" runat="server" ErrorMessage="必填">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="Label24" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            <asp:Label ID="Label5" runat="server" Text="電話："></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhone" runat="server" Style="width: 20%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtPhone"
                                Display="Dynamic" SetFocusOnError="true" runat="server" ErrorMessage="必填">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="Label6" runat="server" Text="傳真："></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtFax" runat="server" Style="width: 20%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="Label7" runat="server" Text="電子信箱："></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMailAddress" runat="server" Style="width: 20%"></asp:TextBox>
                        </td>
                    </tr>
                </asp:Panel>

                <tr>
                    <td colspan="2" class="cssCenter PopTableHeader">
                        <asp:Label ID="Label8" runat="server" Text="屬性設定"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label25" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        <asp:Label ID="Label9" runat="server" Text="發文日期："></asp:Label>
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="rdpSendEdocDate" runat="server"></telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="rdpSendEdocDate"
                            Display="Dynamic" SetFocusOnError="true" runat="server" ErrorMessage="必填">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label26" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        <asp:Label ID="Label10" runat="server" Text="發文字號："></asp:Label>
                    </td>
                    <td>
                        <asp:Panel ID="pnlNumberString" runat="server">
                            <asp:DropDownList ID="ddlNumberString" runat="server" onchange="NumberStringChange();"></asp:DropDownList>
                            <asp:Label ID="lblNumberString" runat="server" Text="字"></asp:Label>
                            <asp:Label ID="lblWhich" runat="server" Text="第"></asp:Label>
                            <asp:DropDownList ID="ddlYear" runat="server"></asp:DropDownList>
                            <asp:TextBox ID="txtNumber" runat="server" Enabled="false"></asp:TextBox>
                            <asp:Label ID="lblNumber" runat="server" Text=""></asp:Label>
                            <asp:Label ID="Label50" runat="server" Text="號"></asp:Label>
                            <asp:Label ID="Label34" runat="server" Text=" - "></asp:Label>
                            <asp:TextBox ID="txtBranchNumber" runat="server" MaxLength="1" Style="width: 6vw;"></asp:TextBox>
                            <asp:CustomValidator ID="cvNumberStringNull" ClientValidationFunction="CheckNumberString" ErrorMessage="請選擇發文字號類別" Display="Dynamic" runat="server"></asp:CustomValidator>
                            <asp:CustomValidator ID="cvNumberStringError" ErrorMessage="此字號類別已無使用權限或被停用，請重新選擇" Display="Dynamic" runat="server"></asp:CustomValidator>

                            <asp:HyperLink ID="hlFocusNumber" NavigateUrl="#" runat="server"></asp:HyperLink>
                            <br />
                            <asp:Label ID="Label43" runat="server" ForeColor="Blue" Text="*表單送出後由系統依發文機關及字號類別自動取號"></asp:Label>

                        </asp:Panel>

                        <asp:Label ID="lblCompleteNumberString" runat="server" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label11" runat="server" Text="速別："></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSpeedType" Width="200px" runat="server">
                            <asp:ListItem Text="普通件" Value="NORMAL"></asp:ListItem>
                            <asp:ListItem Text="速件" Value="FAST"></asp:ListItem>
                            <asp:ListItem Text="最速件" Value="TOP"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label12" runat="server" Text="密等："></asp:Label>
                    </td>
                    <td>
                        <!-- 目前電子公文只支援無機密公文 -->
                        <asp:DropDownList ID="ddlSecretType" Width="200px" runat="server" Enabled="false" Visible="false">
                            <asp:ListItem Text="" Value="NULL"></asp:ListItem>
                            <asp:ListItem Text="密" Value="Level1"></asp:ListItem>
                            <asp:ListItem Text="機密" Value="Level2"></asp:ListItem>
                            <asp:ListItem Text="極機密" Value="Level3"></asp:ListItem>
                            <asp:ListItem Text="絕對機密" Value="Level4"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label44" runat="server" Text="採用電子交換格式的公文不可設定公文密等" ForeColor="Blue"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" class="cssCenter PopTableHeader">
                        <asp:Label ID="Label13" runat="server" Text="公文內容"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label14" runat="server" Text="附件："></asp:Label>
                    </td>
                    <td>
                        <uc1:UC_FileCenter ID="UC_FileCenter" runat="server"  ModuleName="EDOC" TotalFileSizeLimit="10140" AllowedMultipleFileSelection="true" ScannerDisabled="true" />
                        <asp:CustomValidator ID="cvCheckCharacterDataStandards" runat="server" ErrorMessage="附件檔名請勿使用 # 符號" ForeColor="Red" Visible="false" ></asp:CustomValidator>
                        <br />
                        <asp:Label ID="Label32" runat="server" Text="*公文電子交換附件大小上限為10MB" ForeColor="Blue"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label27" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lblSubjectHeader" runat="server" Text="主旨："></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSubject" runat="server" Style="width: 70.7em"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtSubject"
                            Display="Dynamic" SetFocusOnError="true" runat="server" ErrorMessage="必填">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <asp:Panel ID="pnlLetterContent" runat="server">
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="Label28" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            <asp:Label ID="Label16" runat="server" Text="說明："></asp:Label>
                        </td>
                        <td>
                            <div style="width: 70em; height: 30em; margin-right: 0.3em; border: 1px solid lightgrey; display: inline; overflow-y: auto; float: left">
                                <div style="background-color: gray; white-space: nowrap; background-color: white; display: inline-block; margin: 0.5em;">
                                    <input type="button" class="icon" value="，" onclick="InsertChar('，');" />
                                    <input type="button" class="icon" value="。" onclick="InsertChar('。');" />
                                    <input type="button" class="icon" value="、" onclick="InsertChar('、');" />
                                    <input type="button" class="icon" value="；" onclick="InsertChar('；');" />
                                    <input type="button" class="icon" value="：" onclick="InsertChar('：');" />
                                    <input type="button" class="icon" value="！" onclick="InsertChar('！');" />
                                    <input type="button" class="icon" value="？" onclick="InsertChar('？');" />
                                    <input type="button" class="icon" value="ˇ" onclick="InsertChar('ˇ');" />
                                    <input type="button" class="icon" value="─" onclick="InsertChar('─');" />
                                    <input type="button" class="icon" value="○" onclick="InsertChar('○');" />
                                    <input type="button" class="icon" value="※" onclick="InsertChar('※');" />
                                    <input type="button" class="icon" value="（" onclick="InsertChar('（');" />
                                    <input type="button" class="icon" value="）" onclick="InsertChar('）');" />
                                    <input type="button" class="icon" value="「" onclick="InsertChar('「');" />
                                    <input type="button" class="icon" value="」" onclick="InsertChar('」');" />
                                    <input type="button" class="icon" value="『" onclick="InsertChar('『');" />
                                    <input type="button" class="icon" value="』" onclick="InsertChar('』');" />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:ImageButton ID="imgbtnLetterLeft" ImageUrl="~/Common/Images/Edoc/icon_m249.png" CausesValidation="false" OnClientClick="LeftButton_Click(); return false;" runat="server" />
                                    <asp:ImageButton ID="imgbtnLetterRight" ImageUrl="~/Common/Images/Edoc/icon_m250.png" CausesValidation="false" OnClientClick="RightButton_Click(); return false;" runat="server" />
                                </div>
                                <div id="paragraphDiv" style="width: 68.8em; height: 26.0em; border: 1px solid grey; overflow-y: auto; margin: 0.5em; border-radius: 5px;"></div>
                            </div>
                            <div style="display: inline;">
                                <asp:HyperLink ID="hlFocusLetterContent" NavigateUrl="#" runat="server"></asp:HyperLink>
                                <asp:CustomValidator ID="CustomValidator1" ClientValidationFunction="CheckDescription" Display="Dynamic" ErrorMessage="必填" runat="server"></asp:CustomValidator>
                            </div>
                        </td>
                    </tr>
                </asp:Panel>
                <asp:Panel ID="pnlOtherContent" runat="server">
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="Label31" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            <asp:Label ID="lblTimeHeader" runat="server" Text="開會時間："></asp:Label>
                        </td>
                        <td>
                            <telerik:RadButton ID="btnChooseTime" runat="server" OnClientClicking="btnChooseTime_ClientClicking" OnClick="btnChooseTime_Click" Text="新增" CausesValidation="false"></telerik:RadButton>
                            <asp:HyperLink ID="hlFocusChooseTime" NavigateUrl="#" runat="server"></asp:HyperLink>
                            <asp:CustomValidator ID="CustomValidator5" ClientValidationFunction="CheckTimeNull" Display="Dynamic" ErrorMessage="不允許空白" runat="server"></asp:CustomValidator>
                            <Ede:Grid ID="grdTime" runat="server"
                                DataKeyNames="DATETIME_ITEM" AutoGenerateCheckBoxColumn="False"
                                AutoGenerateColumns="False" EmptyDataRowStyle-CssClass="cssHidden"
                                OnRowDataBound="grdTime_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="序號" HeaderStyle-Width="50">
                                        <ItemStyle CssClass="cssCenter" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblSeq" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="DATETIME_ITEM" HeaderText="時間Hidden">
                                        <HeaderStyle CssClass="cssHidden" />
                                        <ItemStyle CssClass="cssHidden" />
                                    </asp:BoundField>

                                    <asp:TemplateField HeaderText="開會時間" HeaderStyle-Width="350">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTime" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="操作" HeaderStyle-Width="50">
                                        <ItemStyle CssClass="cssCenter" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnDelete" runat="server" OnClick="lbtnDelete_Click" Text="刪除" CausesValidation="false"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </Ede:Grid>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="Label15" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            <asp:Label ID="lblLocationHeader" runat="server" Text="開會地點："></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLocation" runat="server" Style="width: 40%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtLocation"
                                Display="Dynamic" SetFocusOnError="true" runat="server" ErrorMessage="必填">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="Label33" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            <asp:Label ID="Label36" runat="server" Text="主持人："></asp:Label>
                        </td>
                        <td>
                            <telerik:RadButton ID="btnChairman" runat="server" OnClientClicking="btnChairMan_ClientClicking" OnClick="btnChairman_Click" Text="新增" CausesValidation="false"></telerik:RadButton>
                            <asp:HyperLink ID="hlChairman" NavigateUrl="#" runat="server"></asp:HyperLink>
                            <asp:CustomValidator ID="CustomValidator3" ClientValidationFunction="CheckChairmanNull" Display="Dynamic" ErrorMessage="不允許空白" runat="server"></asp:CustomValidator>
                            <div style="overflow-x: auto">
                                <Ede:Grid ID="grdChairman" runat="server"
                                    DataKeyNames="SEND_TO_ID" AutoGenerateCheckBoxColumn="False"
                                    AutoGenerateColumns="False" EmptyDataRowStyle-CssClass="cssHidden"
                                    OnRowDataBound="grdChairman_RowDataBound">
                                    <HeaderStyle Wrap="false" />
                                    <Columns>
                                        <asp:BoundField DataField="SEND_TO_ID" HeaderText="受文代碼Hidden">
                                            <HeaderStyle CssClass="cssHidden" />
                                            <ItemStyle CssClass="cssHidden" />
                                        </asp:BoundField>

                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDeleteChairman" Text="刪除" runat="server" OnClientClick="return ConfirmDelete()" CausesValidation="false"
                                                    CommandName="DeleteId" CommandArgument='<%#: Eval("SEND_TO_ID") %>' OnCommand="CommandBtnDeleteChairman_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="SEQ" HeaderText="序" ItemStyle-CssClass="cssCenter" />

                                        <asp:BoundField DataField="TO_UNIT_ID" HeaderText="通訊錄機關代碼Hidden">
                                            <HeaderStyle CssClass="cssHidden" />
                                            <ItemStyle CssClass="cssHidden" />
                                        </asp:BoundField>

                                        <asp:BoundField DataField="TO_UNIT_NAME" HeaderText="通訊錄機關名稱">
                                            <ItemStyle CssClass="cssHidden" />
                                            <HeaderStyle CssClass="cssHidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="通訊錄機關名稱">
                                            <ItemTemplate>
                                                <asp:Label ID="lblToUnitName" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="TO_UNIT_ALIAS" HeaderText="受文者名稱Hidden">
                                            <HeaderStyle CssClass="cssHidden" />
                                            <ItemStyle CssClass="cssHidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="受文者名稱">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtToUnitAlias" runat="server"></asp:TextBox>
                                                <br />
                                                <asp:CustomValidator ID="cvSameToUnitAlias" runat="server" ErrorMessage="受文者名稱相同" Display="Dynamic"></asp:CustomValidator>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="TO_UNIT_NICKNAME" HeaderText="主持人名稱Hidden">
                                            <HeaderStyle CssClass="cssHidden" />
                                            <ItemStyle CssClass="cssHidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="主持人名稱">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtChairmanName" runat="server"></asp:TextBox>
                                                <br />
                                                <asp:CustomValidator ID="cvChairmanName" runat="server" ErrorMessage="主持人名稱相同" Display="Dynamic"></asp:CustomValidator>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="USED_SEND_TYPE" HeaderText="發文方式">
                                            <ItemStyle CssClass="cssHidden" />
                                            <HeaderStyle CssClass="cssHidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderStyle-Width="100">
                                            <ItemStyle CssClass="cssCenter" />
                                            <HeaderTemplate>
                                                <asp:Label ID="lblChairmanSendType" runat="server" Text="發文方式"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlChairmanSendType" Width="100px" runat="server">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </Ede:Grid>
                            </div>
                            <asp:CustomValidator ID="cvChairman" Display="Dynamic" ErrorMessage="" runat="server"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="Label37" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            <asp:Label ID="Label38" runat="server" Text="聯絡人姓名："></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtOtherName" runat="server" Style="width: 10%"></asp:TextBox>
                            <telerik:RadButton ID="rbtnContactDate" runat="server" Text="選擇聯絡人" Visible="false" OnClick="btnContactDate_Click" OnClientClicking="OnContactClicking" CausesValidation="false" />
                            <telerik:RadButton ID="rbtnAddContactDate" runat="server" Text="加入常用" Visible="false" OnClick="btnAddContact_Click" OnClientClicking="OnAddContactClicking" CausesValidation="false" />
                            <asp:Label ID="lblAddContactDate" runat="server" Text="已加入" ForeColor="Blue" Visible="false"></asp:Label>
                            <asp:Label ID="lblContactDate" runat="server" Text="請填寫聯絡人姓名" ForeColor="Red" Visible="false"></asp:Label>
                            <asp:Label ID="lblExistContactDate" runat="server" Text="聯絡人資訊已存在" ForeColor="Red" Visible="false"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtOtherName"
                                Display="Dynamic" SetFocusOnError="true" runat="server" ErrorMessage="必填">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="Label45" runat="server" Text="聯絡人職稱："></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtOtherTitle" runat="server" Style="width: 10%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="Label46" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            <asp:Label ID="Label47" runat="server" Text="聯絡人電話："></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtOtherPhone" runat="server" Style="width: 10%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txtOtherPhone"
                                Display="Dynamic" SetFocusOnError="true" runat="server" ErrorMessage="必填">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </asp:Panel>

                <tr>
                    <td colspan="2" class="cssCenter PopTableHeader">
                        <asp:Label ID="Label17" runat="server" Text="受文機關"></asp:Label>
                    </td>
                </tr>

                <asp:Panel ID="pnlLetterReceiveOrg" runat="server">
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="Label29" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            <asp:Label ID="Label18" runat="server" Text="正本："></asp:Label>
                        </td>
                        <td>
                            <telerik:RadButton ID="btnOriginal" runat="server" OnClientClicking="btnOriginal_ClientClicking" OnClick="btnOriginal_Click" Text="新增" CausesValidation="false"></telerik:RadButton>
                            <asp:HyperLink ID="hlOriginalFocus" NavigateUrl="#" runat="server"></asp:HyperLink>
                            <asp:CustomValidator ID="CustomValidator2" ClientValidationFunction="CheckOriginalNull" Display="Dynamic" ErrorMessage="不允許空白" runat="server"></asp:CustomValidator>

                            <div style="overflow-x: auto">
                                <Ede:Grid ID="grdOriginal" runat="server"
                                    DataKeyNames="SEND_TO_ID" AutoGenerateCheckBoxColumn="False"
                                    AutoGenerateColumns="False" EmptyDataRowStyle-CssClass="cssHidden"
                                    OnRowDataBound="grdOriginal_RowDataBound">
                                    <HeaderStyle Wrap="false" />
                                    <Columns>
                                        <asp:BoundField DataField="SEND_TO_ID" HeaderText="受文代碼Hidden">
                                            <HeaderStyle CssClass="cssHidden" />
                                            <ItemStyle CssClass="cssHidden" />
                                        </asp:BoundField>

                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDeleteOriginal" Text="刪除" runat="server" OnClientClick="return ConfirmDelete()" CausesValidation="false"
                                                    CommandName="DeleteId" CommandArgument='<%#: Eval("SEND_TO_ID") %>' OnCommand="CommandBtnDeleteOriginal_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="SEQ" HeaderText="序" ItemStyle-CssClass="cssCenter" />

                                        <asp:BoundField DataField="TO_UNIT_ID" HeaderText="通訊錄機關代碼Hidden">
                                            <HeaderStyle CssClass="cssHidden" />
                                            <ItemStyle CssClass="cssHidden" />
                                        </asp:BoundField>

                                        <asp:BoundField DataField="TO_UNIT_NAME" HeaderText="通訊錄機關名稱">
                                            <ItemStyle CssClass="cssHidden" />
                                            <HeaderStyle CssClass="cssHidden" />
                                        </asp:BoundField>

                                        <asp:TemplateField HeaderText="通訊錄機關名稱">
                                            <ItemTemplate>
                                                <asp:Label ID="lblToUnitName" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="TO_UNIT_ALIAS" HeaderText="受文者名稱Hidden">
                                            <HeaderStyle CssClass="cssHidden" />
                                            <ItemStyle CssClass="cssHidden" />
                                        </asp:BoundField>

                                        <asp:TemplateField HeaderText="受文者名稱">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtToUnitAlias" runat="server"></asp:TextBox>
                                                <br />
                                                <asp:CustomValidator ID="cvSameToUnitAlias" runat="server" ErrorMessage="受文者名稱相同" Display="Dynamic"></asp:CustomValidator>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="TO_UNIT_NICKNAME" HeaderText="正本名稱Hidden">
                                            <HeaderStyle CssClass="cssHidden" />
                                            <ItemStyle CssClass="cssHidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="正本名稱">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtOriginalName" runat="server"></asp:TextBox>
                                                <br />
                                                <asp:CustomValidator ID="cvOriginalName" runat="server" ErrorMessage="正本名稱相同" Display="Dynamic"></asp:CustomValidator>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="USED_SEND_TYPE" HeaderText="發文方式">
                                            <ItemStyle CssClass="cssHidden" />
                                            <HeaderStyle CssClass="cssHidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderStyle-Width="100">
                                            <ItemStyle CssClass="cssCenter" />
                                            <HeaderTemplate>
                                                <asp:Label ID="lblOriginalSendType" runat="server" Text="發文方式"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlOriginalSendType" Width="100px" runat="server">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </Ede:Grid>
                            </div>
                            <asp:CustomValidator ID="cvOriginal" Display="Dynamic" ErrorMessage="" runat="server"></asp:CustomValidator>
                        </td>
                    </tr>
                </asp:Panel>
                <asp:Panel ID="pnlOtherReceiveOrg" runat="server">
                    <tr>
                        <td style="white-space: nowrap;" style="white-space: nowrap;">
                            <asp:Label ID="Label39" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            <asp:Label ID="Label40" runat="server" Text="出席者："></asp:Label>
                        </td>
                        <td>
                            <telerik:RadButton ID="btnAttendee" runat="server" OnClientClicking="btnAttendee_ClientClicking" OnClick="btnAttendee_Click" Text="新增" CausesValidation="false"></telerik:RadButton>
                            <asp:HyperLink ID="hlAttendee" NavigateUrl="#" runat="server"></asp:HyperLink>
                            <asp:CustomValidator ID="CustomValidator4" runat="server" ClientValidationFunction="CheckAttendeeNull" ErrorMessage="不允許空白"></asp:CustomValidator>
                            <div style="overflow-x: auto">
                                <Ede:Grid ID="grdAttendee" runat="server"
                                    DataKeyNames="SEND_TO_ID" AutoGenerateCheckBoxColumn="False"
                                    AutoGenerateColumns="False" EmptyDataRowStyle-CssClass="cssHidden"
                                    OnRowDataBound="grdAttendee_RowDataBound">
                                    <HeaderStyle Wrap="false" />
                                    <Columns>
                                        <asp:BoundField DataField="SEND_TO_ID" HeaderText="受文代碼Hidden">
                                            <HeaderStyle CssClass="cssHidden" />
                                            <ItemStyle CssClass="cssHidden" />
                                        </asp:BoundField>

                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDeleteAttendee" Text="刪除" runat="server" OnClientClick="return ConfirmDelete()" CausesValidation="false"
                                                    CommandName="DeleteId" CommandArgument='<%#: Eval("SEND_TO_ID") %>' OnCommand="CommandBtnDeleteAttendee_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="SEQ" HeaderText="序" ItemStyle-CssClass="cssCenter" />

                                        <asp:BoundField DataField="TO_UNIT_ID" HeaderText="通訊錄機關代碼Hidden">
                                            <HeaderStyle CssClass="cssHidden" />
                                            <ItemStyle CssClass="cssHidden" />
                                        </asp:BoundField>

                                        <asp:BoundField DataField="TO_UNIT_NAME" HeaderText="通訊錄機關名稱">
                                            <ItemStyle CssClass="cssHidden" />
                                            <HeaderStyle CssClass="cssHidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="通訊錄機關名稱">
                                            <ItemTemplate>
                                                <asp:Label ID="lblToUnitName" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="TO_UNIT_ALIAS" HeaderText="受文者名稱Hidden">
                                            <HeaderStyle CssClass="cssHidden" />
                                            <ItemStyle CssClass="cssHidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="受文者名稱">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtToUnitAlias" runat="server"></asp:TextBox>
                                                <br />
                                                <asp:CustomValidator ID="cvSameToUnitAlias" runat="server" ErrorMessage="受文者名稱相同" Display="Dynamic"></asp:CustomValidator>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="TO_UNIT_NICKNAME" HeaderText="出席者名稱Hidden">
                                            <HeaderStyle CssClass="cssHidden" />
                                            <ItemStyle CssClass="cssHidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="出席者名稱">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtAttendeeName" runat="server"></asp:TextBox>
                                                <br />
                                                <asp:CustomValidator ID="cvAttendeeName" runat="server" ErrorMessage="出席者名稱相同" Display="Dynamic"></asp:CustomValidator>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="USED_SEND_TYPE" HeaderText="發文方式">
                                            <ItemStyle CssClass="cssHidden" />
                                            <HeaderStyle CssClass="cssHidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderStyle-Width="100">
                                            <ItemStyle CssClass="cssCenter" />
                                            <HeaderTemplate>
                                                <asp:Label ID="lblAttendeeSendType" runat="server" Text="發文方式"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlAttendeeSendType" Width="100px" runat="server">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </Ede:Grid>
                            </div>
                            <asp:CustomValidator ID="cvAttendee" Display="Dynamic" ErrorMessage="" runat="server"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap;" style="white-space: nowrap;">
                            <asp:Label ID="Label41" runat="server" Text="列席者："></asp:Label>
                        </td>
                        <td>
                            <telerik:RadButton ID="btnPresent" runat="server" OnClientClicking="btnPresent_ClientClicking" OnClick="btnPresent_Click" Text="新增" CausesValidation="false"></telerik:RadButton>
                            <div style="overflow-x: auto">
                                <Ede:Grid ID="grdPresent" runat="server"
                                    DataKeyNames="SEND_TO_ID" AutoGenerateCheckBoxColumn="False"
                                    AutoGenerateColumns="False" EmptyDataRowStyle-CssClass="cssHidden"
                                    OnRowDataBound="grdPresent_RowDataBound">
                                    <HeaderStyle Wrap="false" />
                                    <Columns>
                                        <asp:BoundField DataField="SEND_TO_ID" HeaderText="受文代碼Hidden">
                                            <HeaderStyle CssClass="cssHidden" />
                                            <ItemStyle CssClass="cssHidden" />
                                        </asp:BoundField>

                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDeletePresent" Text="刪除" runat="server" OnClientClick="return ConfirmDelete()" CausesValidation="false"
                                                    CommandName="DeleteId" CommandArgument='<%#: Eval("SEND_TO_ID") %>' OnCommand="CommandBtnDeletePresent_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="SEQ" HeaderText="序" ItemStyle-CssClass="cssCenter" />

                                        <asp:BoundField DataField="TO_UNIT_ID" HeaderText="通訊錄機關代碼Hidden">
                                            <HeaderStyle CssClass="cssHidden" />
                                            <ItemStyle CssClass="cssHidden" />
                                        </asp:BoundField>

                                        <asp:BoundField DataField="TO_UNIT_NAME" HeaderText="通訊錄機關名稱">
                                            <ItemStyle CssClass="cssHidden" />
                                            <HeaderStyle CssClass="cssHidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="通訊錄機關名稱">
                                            <ItemTemplate>
                                                <asp:Label ID="lblToUnitName" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="TO_UNIT_ALIAS" HeaderText="受文者名稱Hidden">
                                            <HeaderStyle CssClass="cssHidden" />
                                            <ItemStyle CssClass="cssHidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="受文者名稱">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtToUnitAlias" runat="server"></asp:TextBox>
                                                <br />
                                                <asp:CustomValidator ID="cvSameToUnitAlias" runat="server" ErrorMessage="受文者名稱相同" Display="Dynamic"></asp:CustomValidator>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="TO_UNIT_NICKNAME" HeaderText="列席者名稱Hidden">
                                            <HeaderStyle CssClass="cssHidden" />
                                            <ItemStyle CssClass="cssHidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="列席者名稱">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtPresentName" runat="server"></asp:TextBox>
                                                <br />
                                                <asp:CustomValidator ID="cvPresentName" runat="server" ErrorMessage="列席者名稱相同" Display="Dynamic"></asp:CustomValidator>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="USED_SEND_TYPE" HeaderText="發文方式">
                                            <ItemStyle CssClass="cssHidden" />
                                            <HeaderStyle CssClass="cssHidden" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="USED_SEND_TYPE" HeaderText="發文方式">
                                            <ItemStyle CssClass="cssHidden" />
                                            <HeaderStyle CssClass="cssHidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderStyle-Width="100">
                                            <ItemStyle CssClass="cssCenter" />
                                            <HeaderTemplate>
                                                <asp:Label ID="lblPresentSendType" runat="server" Text="發文方式"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlPresentSendType" Width="100px" runat="server">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </Ede:Grid>
                            </div>
                            <asp:CustomValidator ID="cvPresent" Display="Dynamic" ErrorMessage="" runat="server"></asp:CustomValidator>
                        </td>
                    </tr>
                </asp:Panel>

                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label19" runat="server" Text="副本："></asp:Label>
                    </td>
                    <td>
                        <telerik:RadButton ID="btnDuplicate" runat="server" OnClientClicking="btnDuplicate_ClientClicking" OnClick="btnDuplicate_Click" Text="新增" CausesValidation="false"></telerik:RadButton>
                        <div style="overflow-x: auto">
                            <Ede:Grid ID="grdDuplicate" runat="server"
                                DataKeyNames="SEND_TO_ID" AutoGenerateCheckBoxColumn="False"
                                AutoGenerateColumns="False" EmptyDataRowStyle-CssClass="cssHidden"
                                OnRowDataBound="grdDuplicate_RowDataBound">
                                <HeaderStyle Wrap="false" />
                                <Columns>
                                    <asp:BoundField DataField="SEND_TO_ID" HeaderText="受文代碼Hidden">
                                        <HeaderStyle CssClass="cssHidden" />
                                        <ItemStyle CssClass="cssHidden" />
                                    </asp:BoundField>

                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnDeleteDuplicate" Text="刪除" runat="server" OnClientClick="return ConfirmDelete()" CausesValidation="false"
                                                CommandName="DeleteId" CommandArgument='<%#: Eval("SEND_TO_ID") %>' OnCommand="CommandBtnDeleteDuplicate_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="SEQ" HeaderText="序" ItemStyle-CssClass="cssCenter" />

                                    <asp:BoundField DataField="TO_UNIT_ID" HeaderText="通訊錄機關代碼Hidden">
                                        <HeaderStyle CssClass="cssHidden" />
                                        <ItemStyle CssClass="cssHidden" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="TO_UNIT_NAME" HeaderText="通訊錄機關名稱">
                                        <ItemStyle CssClass="cssHidden" />
                                        <HeaderStyle CssClass="cssHidden" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="通訊錄機關名稱">
                                        <ItemTemplate>
                                            <asp:Label ID="lblToUnitName" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="TO_UNIT_ALIAS" HeaderText="受文者名稱Hidden">
                                        <HeaderStyle CssClass="cssHidden" />
                                        <ItemStyle CssClass="cssHidden" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="受文者名稱">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtToUnitAlias" runat="server"></asp:TextBox>
                                            <br />
                                            <asp:CustomValidator ID="cvSameToUnitAlias" runat="server" ErrorMessage="受文者名稱相同" Display="Dynamic"></asp:CustomValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="TO_UNIT_NICKNAME" HeaderText="副本名稱Hidden">
                                        <HeaderStyle CssClass="cssHidden" />
                                        <ItemStyle CssClass="cssHidden" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="副本名稱">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtDuplicateName" runat="server"></asp:TextBox>
                                            <br />
                                            <asp:CustomValidator ID="cvDuplicateName" runat="server" ErrorMessage="副本名稱相同" Display="Dynamic"></asp:CustomValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="WITH_ATTACH" HeaderText="是否包含附件Hidden">
                                        <HeaderStyle CssClass="cssHidden" />
                                        <ItemStyle CssClass="cssHidden" />
                                    </asp:BoundField>

                                    <asp:TemplateField HeaderStyle-Width="80">
                                        <ItemStyle CssClass="cssCenter" />
                                        <HeaderTemplate>
                                            <input id="cbChkAll" runat="Server" type="checkbox" onclick="DoCheckAll(this)" />
                                            <asp:Label ID="Label35" runat="server" Text="附件"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cbItem" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="USED_SEND_TYPE" HeaderText="發文方式">
                                        <ItemStyle CssClass="cssHidden" />
                                        <HeaderStyle CssClass="cssHidden" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderStyle-Width="100">
                                        <ItemStyle CssClass="cssCenter" />
                                        <HeaderTemplate>
                                            <asp:Label ID="lblDuplicateSendType" runat="server" Text="發文方式"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlDuplicateSendType" Width="100px" runat="server">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>



                                </Columns>
                            </Ede:Grid>
                        </div>
                        <asp:CustomValidator ID="cvDuplicate" Display="Dynamic" ErrorMessage="" runat="server"></asp:CustomValidator>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" class="cssCenter PopTableHeader">
                        <asp:Label ID="Label20" runat="server" Text="其他"></asp:Label>
                    </td>
                </tr>
                <asp:Panel ID="pnlOtherParagraph" runat="server">
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="Label42" runat="server" Text="備註："></asp:Label>
                        </td>
                        <td>
                            <div style="width: 70em; height: 30em; border: 1px solid lightgrey; display: inline; overflow-y: auto; float: left">
                                <div style="background-color: gray; white-space: nowrap; background-color: white; display: inline-block; margin: 0.5em;">
                                    <input type="button" class="icon" value="，" onclick="InsertChar('，');" />
                                    <input type="button" class="icon" value="。" onclick="InsertChar('。');" />
                                    <input type="button" class="icon" value="、" onclick="InsertChar('、');" />
                                    <input type="button" class="icon" value="；" onclick="InsertChar('；');" />
                                    <input type="button" class="icon" value="：" onclick="InsertChar('：');" />
                                    <input type="button" class="icon" value="！" onclick="InsertChar('！');" />
                                    <input type="button" class="icon" value="？" onclick="InsertChar('？');" />
                                    <input type="button" class="icon" value="ˇ" onclick="InsertChar('ˇ');" />
                                    <input type="button" class="icon" value="─" onclick="InsertChar('─');" />
                                    <input type="button" class="icon" value="○" onclick="InsertChar('○');" />
                                    <input type="button" class="icon" value="※" onclick="InsertChar('※');" />
                                    <input type="button" class="icon" value="（" onclick="InsertChar('（');" />
                                    <input type="button" class="icon" value="）" onclick="InsertChar('）');" />
                                    <input type="button" class="icon" value="「" onclick="InsertChar('「');" />
                                    <input type="button" class="icon" value="」" onclick="InsertChar('」');" />
                                    <input type="button" class="icon" value="『" onclick="InsertChar('『');" />
                                    <input type="button" class="icon" value="』" onclick="InsertChar('』');" />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:ImageButton ID="imgbtnMeetingNoticeLeft" ImageUrl="~/Common/Images/Edoc/icon_m249.png" CausesValidation="false" OnClientClick="LeftButton_Click(); return false;" runat="server" />
                                    <asp:ImageButton ID="imgbtnMeetingNoticeRight" ImageUrl="~/Common/Images/Edoc/icon_m250.png" CausesValidation="false" OnClientClick="RightButton_Click(); return false;" runat="server" />
                                </div>
                                <div id="otherParagraphDiv" style="width: 68.8em; height: 26.0em; border: 1px solid grey; overflow-y: auto; margin: 0.5em; border-radius: 5px;"></div>
                            </div>
                        </td>
                    </tr>
                </asp:Panel>

                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label21" runat="server" Text="署名："></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSignature" runat="server" Style="width: 25%"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <asp:HiddenField ID="hfFromUnitId" runat="server" />
            <asp:HiddenField ID="hfFromUnitName" runat="server" />
            <asp:HiddenField ID="hfNumber" runat="server" />

            <asp:HiddenField ID="hfSendDocId" runat="server" />

            <asp:HiddenField ID="hfEditorContent" runat="server" />
            <asp:HiddenField ID="hfHeader" runat="server" />
            <asp:HiddenField ID="hfNodes" runat="server" />
            <asp:HiddenField ID="hfDocId" runat="server" />
            <asp:HiddenField ID="hfDocType" runat="server" />
            <asp:HiddenField ID="hfAttachFileGroupId" runat="server" />
            <asp:HiddenField ID="hfPreviewFileGroupId" runat="server" />
            <asp:HiddenField ID="hfActionType" runat="server" />
            <asp:HiddenField ID="hfUserGuid" runat="server" />

            <asp:HiddenField ID="hfTempNumberString" runat="server" />
            <asp:HiddenField ID="hfTempYear" runat="server" />
            <asp:HiddenField ID="hfTempNumber" runat="server" />
            <asp:HiddenField ID="hfTempBranchNumber" runat="server" />
            <asp:HiddenField ID="hfTempReceiveOrgs" runat="server" />

            <asp:HiddenField ID="hfDeleteSendToId" runat="server" />
            <asp:HiddenField ID="hfGridOCValid" runat="server" />
            <asp:HiddenField ID="hfGridCValid" runat="server" />
            <asp:HiddenField ID="hfGridCMValid" runat="server" />
            <asp:HiddenField ID="hfGridATValid" runat="server" />
            <asp:HiddenField ID="hfGridPRValid" runat="server" />

            <asp:Label ID="lblNoOrgName" runat="server" Text="尚未設定機關名稱，請洽電子公文管理員" Visible="false"></asp:Label>
            <asp:Label ID="lblBranchNumber" runat="server" Text="支號" Visible="false"></asp:Label>
            <asp:Label ID="lblToOrgTitle" runat="server" Text="受文機關" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblMnTimeTitle" runat="server" Text="開會時間" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblSmnTimeTitle" runat="server" Text="會勘時間" CssClass="cssHidden"></asp:Label>

            <asp:Label ID="lblGetNumber" runat="server" Text="請取號" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblGetNumberStringType" runat="server" Text="請選擇發文字號類別" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblCreateNumberString" runat="server" Text="請至「電子公文 > 管理 > 字號類別維護」中新增發文字號" CssClass="cssHidden"></asp:Label>

            <asp:Label ID="lblYear" runat="server" Text="年" Visible="false"></asp:Label>

            <asp:Label ID="lblMnSubjectHeader" runat="server" Text="開會事由：" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblSmnSubjectHeader" runat="server" Text="會勘事由：" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblSmnTimeHeader" runat="server" Text="會勘時間：" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblSmnLocationHeader" runat="server" Text="會勘地點：" CssClass="cssHidden"></asp:Label>

            <asp:Label ID="lblDialogTitle" runat="server" Text="匯入公文檔" Visible="false"></asp:Label>
            <asp:Label ID="lblContactPerson" runat="server" Text="常用聯絡人" Visible="false"></asp:Label>

            <asp:Label ID="lblOrgWasDeleted" runat="server" Text="通訊錄中無以下機關：" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblToUnitAlias" runat="server" Text="受文者名稱不可相同" Visible="false"></asp:Label>
            <asp:Label ID="lblOriginalName" runat="server" Text="正本名稱不可相同" Visible="false"></asp:Label>
            <asp:Label ID="lblDuplicateName" runat="server" Text="副本名稱不可相同" Visible="false"></asp:Label>
            <asp:Label ID="lblChairmanName" runat="server" Text="主持人名稱不可相同" Visible="false"></asp:Label>
            <asp:Label ID="lblAttendeeName" runat="server" Text="出席者名稱不可相同" Visible="false"></asp:Label>
            <asp:Label ID="lblPresentName" runat="server" Text="列席者名稱不可相同" Visible="false"></asp:Label>
            <asp:Label ID="lblDelete" runat="server" Text="確定要刪除?" Visible="false"></asp:Label>

            <asp:Label ID="lblOrgDisabled" runat="server" Text="*發文機關已被停用，請聯絡電子公文管理員" Visible="false"></asp:Label>
            <asp:Label ID="lblOrgReselect" runat="server" Text="發文機關已被停用，請重新選擇" Visible="false"></asp:Label>
            <asp:Label ID="lblOrgReselect2" runat="server" Text="發文機關已被取消權限或停用，請重新選擇" Visible="false"></asp:Label>
            <asp:Label ID="lblOrgNoAuth" runat="server" Text="您沒有任何機關的發文權限" Visible="false"></asp:Label>
            <asp:Label ID="lblReapply" runat="server" Text="發文機關已被取消權限或停用，請重新申請" Visible="false"></asp:Label>
            <asp:Label ID="lblRequired" runat="server" Text="必填" Visible="false"></asp:Label>
            <asp:Label ID="lblNumberStringNull" runat="server" Text="請選擇發文字號類別" Visible="false"></asp:Label>

            <asp:Label ID="lblMail" runat="server" Text="郵寄" Visible="false"></asp:Label>
            <asp:Label ID="lblExchange" runat="server" Text="電子交換" Visible="false"></asp:Label>

        </ContentTemplate>


    </asp:UpdatePanel>

    <script type="text/javascript">

        var m_DocEditor = null;

        function initialForm() {
            var docType = $('#<%=hfDocType.ClientID%>').val();

            if (docType === 'Letter' || docType === '') {
                m_DocEditor = new DocEditor("paragraphDiv");
            }
            else if (docType === 'MeetingNotice' || docType === 'SiteMeetingNotice') {
                m_DocEditor = new DocEditor("otherParagraphDiv");
            }

            var contentJson = $("#<%=hfEditorContent.ClientID%>").val();
            if (contentJson != '') {
                m_DocEditor.setValue(JSON.parse(contentJson));
            }
        }

        Sys.Application.add_load(function () {
            SendUnitNameChange();

            initialForm()
        });

        function InsertChar(ch) {
            m_DocEditor.insertText(ch);
        }

        function LeftButton_Click() {
            m_DocEditor.decreaseIndentation();
        }

        function RightButton_Click() {
            m_DocEditor.increaseIndentation();
        }

        // 取得編輯器的內容
        function GetEditorJson() {

            var header = m_DocEditor.getValue().header;
            var nodes = m_DocEditor.getValue().nodes;

            // header填寫後在刪掉會有回車符號，要加入判斷
            header = header.replace("\n", "");

            if (header.length == 0) {
                $("#<%=hfHeader.ClientID%>").val('');
            } else {
                $("#<%=hfHeader.ClientID%>").val(header);
            }

            if (nodes.length == 0) {
                $("#<%=hfNodes.ClientID%>").val('[]');
            } else {
                $("#<%=hfNodes.ClientID%>").val(JSON.stringify(nodes));
            }

            $('#<%=hfEditorContent.ClientID%>').val(JSON.stringify(m_DocEditor.getValue()));
        }
    </script>

</asp:Content>
