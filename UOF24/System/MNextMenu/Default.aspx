<%@ Page Title="功能設定" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="System_MNextMenu_Default" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <script type="text/javascript"> 

        Sys.Application.add_load(function () {
            chkActive104EPayEnvelope_OnClientClick();
        });

        function UChatKeepDayChanging(sender, args) {
            if (args.get_newValue() == "" || isNaN(args.get_newValue())) {
                args.set_newValue(30);
            }
        }

        function UChatKeepFileDayChanging(sender, args) {
            if (args.get_newValue() == "" || isNaN(args.get_newValue())) {
                args.set_newValue(14);
            }
        }

        function ReserveDayChanging(sender, args) {
            if (args.get_newValue() == "") {
                args.set_newValue(365);
            }
        }

        function OnClientClicking(sender, args) {
            var fid = $("#<%=hideFileGroupID.ClientID %>").val();
            $uof.dialog.open2("~/System/MNextMenu/AppLogoEdit.aspx", sender, "", 510, 450, OpenDialogResult, { 'filegroupid': fid });
        }

        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined")
                return false;
            else
                return true;
        }

        function bigPictureDelete(sender, args) {
            if (confirm("<%=lbConfirmDelete.Text%>")) {
                args.set_cancel(false);
            }
            else {
                args.set_cancel(true);
            }
        }
        
        function RadToolNavigationPage_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            if (value == "Insert") {
                $uof.dialog.open2("~/System/MNextMenu/NavigationEdit.aspx", args.get_item(), '<%=lbldialogTitle.Text %>', 600, 320, OpenDialogResult);
            }
            else if (value == "Delete") {
                args.set_cancel(!confirm('<%=lbConfirmDelete.Text %>'));
            }
        }

        function RadToolBarDeclarationPage_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            if (value == "Delete") {
                args.set_cancel(!confirm('<%=lblConfirmDeleteDeclarationRecord.Text %>'));
            }
        }

        function AppDeviceCountChanging(sender, args) {
            if (args.get_newValue() == "" || isNaN(args.get_newValue())) {
                args.set_newValue(1);
            }
        }

        function ConfirmForceLogout(sender, args) {
            if (confirm('<%=lblConfirmForceLogout.Text %>')) {
                args.set_cancel(false);
            }
            else {
                args.set_cancel(true);
            }
        }

        function chkActive104EPayEnvelope_OnClientClick() {

            var chkActive104EPayEnvelope = $('#<%=chkActive104EPayEnvelope.ClientID%>');
            var txtPayEnvelopeSiteUrl = $('#<%=txtPayEnvelopeSiteUrl.ClientID%>');

            if (chkActive104EPayEnvelope.is(":checked"))
                txtPayEnvelopeSiteUrl.prop("disabled", false);
            else
                txtPayEnvelopeSiteUrl.prop("disabled", true);
        }

        function CheckTxtPayEnvelopeSiteUrl(sender, args) {

            var chkActive104EPayEnvelope = $('#<%=chkActive104EPayEnvelope.ClientID%>');
            var txtPayEnvelopeSiteUrl = $('#<%=txtPayEnvelopeSiteUrl.ClientID%>');

            if (chkActive104EPayEnvelope.is(":checked") && txtPayEnvelopeSiteUrl.val() === '')
                args.IsValid = false;
            else
                args.IsValid = true;
        }

        function rtbFilterKeywordClicking(sender, args) {
            var key = args.get_item().get_value();

            switch (key) {
                case "Insert":
                    let grdRowsCount = $('#<%=hfGrdFilterKeywordRowsCount.ClientID%>').val();

                    args.set_cancel(true);

                    $uof.dialog.open2("~/Basic/Personal/Information/PushFilterKeywordSettingDialog.aspx", args.get_item(), '<%=lblPushFilterKeywordDialogAddTitle.Text%>', 750, 400, openDialogResult, { 'seq': parseInt(grdRowsCount) + 1 });
                    break;

                case "Delete":
                    //先判斷是否有勾選任一筆以上資料
                    var checkedData = $uof.fastGrid.getChecked('<%= grdFilterKeyword.ClientID %>');

                    if (checkedData === '') {
                        alert('<%=lblDelRemind.Text %>');
                        args.set_cancel(true);
                        return;
                    }

                    if (!confirm('<%=lblDelConfirm.Text %>'))
                        args.set_cancel(true);
                    break;
            }
        }

        function openDialogResult(returnValue) {
            if (returnValue === '' || returnValue === null)
                return false;
            else
                return true;
        }

    </script>

    <style type="text/css">
        .lbtnUpPadding {
            padding-left : 5px;
            width : 65px;
        }
    </style>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadTabStrip ID="RadTabStrip1" MultiPageID="RadMultiPage1" runat="server" SelectedIndex="0" OnTabClick="RadTabStrip1_TabClick" meta:resourcekey="RadTabStrip1Resource1" BackColor="Black">
                <Tabs>
                    <telerik:RadTab Text="功能選單設定" Value="FuncMenuSet" meta:resourcekey="RadTabResource1" Selected="True" runat="server"></telerik:RadTab>
                    <telerik:RadTab Text="基本設定" Value="BasicSet" meta:resourcekey="RadTabResource2" runat="server"></telerik:RadTab>
                    <telerik:RadTab Text="模組設定" Value="ModuleSet" meta:resourcekey="RadTabResource5" runat="server"></telerik:RadTab>
                    <telerik:RadTab Text="導覽頁設定" Value="NavigationPageSet" meta:resourcekey="RadTabResource3" runat="server"></telerik:RadTab>
                    <telerik:RadTab Text="聲明頁設定" Value="DeclarationPageSet" meta:resourcekey="RadTabResource4" runat="server"></telerik:RadTab>
                    <telerik:RadTab Text="104設定" Value="HR104Set" meta:resourcekey="RadTabResource6" runat="server"></telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" meta:resourcekey="RadMultiPage1Resource1">
                <telerik:RadPageView ID="FuncMenuSet" runat="server" meta:resourcekey="FuncMenuSetResource1" Selected="True">
                    <Ede:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" Width="50%" OnRowDataBound="Grid1_RowDataBound" meta:resourcekey="Grid1Resource1">
                        <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                        <Columns>
                            <asp:TemplateField HeaderText="群組" HeaderStyle-Width="15%" HeaderStyle-Wrap="False" meta:resourcekey="TemplateFieldResource3">
                                <ItemTemplate>
                                    <asp:Label ID="lblGroupName" runat="server" meta:resourcekey="lblGroupNameResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" Width="15%"></HeaderStyle>
                                <ItemStyle Wrap="False" Width="15%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="選單名稱" meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:Label ID="lblMenuName" runat="server" Text='<%# Bind("MENU_RESOURCE_NAME") %>' meta:resourcekey="lblMenuNameResource2"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="內部啟用" HeaderStyle-Width="10%" HeaderStyle-Wrap="False" meta:resourcekey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbEnable" AutoPostBack="True" Checked='<%# Eval("EMPLOYEE_ENABLE") %>' MENU_ID='<%# Eval("MENU_ID") %>' runat="server" OnCheckedChanged="cbEnable_CheckedChanged" meta:resourcekey="cbEnableResource1" />
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" Width="10%"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="外部啟用" HeaderStyle-Width="10%" HeaderStyle-Wrap="False" meta:resourcekey="MemberEnabledResource1">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbMemberEnable" runat="server" AutoPostBack="True" Checked='<%# Eval("MEMBER_ENABLE") %>' MENU_ID='<%# Eval("MENU_ID") %>' OnCheckedChanged="cbMemberEnable_CheckedChanged" meta:resourcekey="cbMemberEnableResource1" />
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" Width="10%"></HeaderStyle>
                            </asp:TemplateField>                           
                        </Columns>
                    </Ede:Grid>
                    <asp:Label ID="lblNotSupport" runat="server" Text="核選方塊無法維護，代表行動裝置尚不支援或未啟用授權" CssClass="SizeMemo" meta:resourcekey="lblNotSupportResource1"></asp:Label>
                    <asp:Label ID="lblMobileIsMovieDownload" runat="server" Text="(如啟用此功能，檔案可能會被下載到使用者的行動裝置)" Visible="False" meta:resourcekey="lblMobileIsMovieDownloadResource1"></asp:Label>
                    <asp:Label ID="lblPunch" runat="server" Text="線上刷卡" Visible="False" meta:resourcekey="lblPunchResource1"></asp:Label>
                    <asp:Label ID="lblNoLicense" runat="server" Text="(需購買授權，才能使用)" Visible="False" meta:resourcekey="lblNoLicenseResource1"></asp:Label>
                    <asp:HiddenField ID="hfUserGuid" runat="server" />
                    <asp:HiddenField ID="hfMNextTabCtrlItem" runat="server" />

                    <asp:Label runat="server" ID="lblMNextTabGroup" Text="個人資訊平台" Visible="False" meta:resourcekey="lblMNextTabGroupResource1"></asp:Label>
                    <asp:Label runat="server" ID="lblItemMessage" Text="私人訊息" Visible="False" meta:resourcekey="lblItemMessageResource1"></asp:Label>
                    <asp:Label runat="server" ID="lblItemCalendar" Text="行事曆" Visible="False" meta:resourcekey="lblItemCalendarResource1"></asp:Label>
                    <asp:Label runat="server" ID="lblItemUMii" Text="UMii" Visible="False" meta:resourcekey="lblItemUMiiResource1"></asp:Label>                        
                </telerik:RadPageView>
                <telerik:RadPageView ID="BasicSet" runat="server" meta:resourcekey="BasicSetResource1">
                    <telerik:RadToolBar ID="RadToolBarBasicSet" runat="server" SingleClick="None" Width="100%" OnButtonClick="RadToolBarBasicSet_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="儲存" Value="Save" meta:resourcekey="RadToolBarButtonResource9"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m66.png" DisabledImageUrl="~/Common/Images/Icon/icon_m66.png"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m66.png" ImageUrl="~/Common/Images/Icon/icon_m66.png">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Value="Msg" meta:resourcekey="RadToolBarButtonResource3">
                                <ItemTemplate>
                                    <asp:Label ID="lblIsSave" runat="server" Text="已儲存" ForeColor="Blue" Visible="False" meta:resourcekey="lblIsSaveResource1"></asp:Label>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>

                    <table border="0" class="PopTable" style="width: 100%">
                        <tr>
                            <td class="PopTableHeader" colspan="2">
                                <asp:Label ID="lblLoginSet" runat="server" Text="登入設定" meta:resourcekey="lblLoginSetResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 13%; word-break: break-all; white-space: nowrap" class="PopTableLeftTD">
                                <asp:Label ID="lblmobilevaild" runat="server" Text="行動裝置驗證" meta:resourcekey="lblmobilevaildResource1"></asp:Label>
                            </td>
                            <td style="width: 87%; word-break: break-all" class="PopTableRightTD">
                                <asp:UpdatePanel ID="UpdatePanel21" runat="server">
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbEnableCaptcha" runat="server" Text="啟用(預設會以E-mail發送認證碼給使用者)" AutoPostBack="True" OnCheckedChanged="cbEnableCaptcha_CheckedChanged" meta:resourcekey="cbEnableCaptchaResource1" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbSendSMS" runat="server" Text="同步使用簡訊發送認證碼" Enabled="False" meta:resourcekey="cbSendSMSResource1" />
                                                </td>
                                            </tr>
                                            <asp:Panel ID="plLoginException" runat="server" Visible="False" meta:resourcekey="plLoginExceptionResource1">
                                                <tr>
                                                    <td colspan="3">
                                                        <table>
                                                            <tr>
                                                                <td style="width: 5%; white-space: nowrap; padding-top: 10px;">
                                                                    <asp:Label ID="lblException" runat="server" Text="例外人員" meta:resourcekey="lblExceptionResource1"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <uc1:UC_ChoiceList runat="server" ID="UC_ChoiseList_LoginException" ExpandToUser="false" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </asp:Panel>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblCaptchaMsg" runat="server" CssClass="SizeMemo" Text="1.若點選啟用，使用者在新裝置上首次登入App需同時輸入密碼及認證碼" meta:resourcekey="lblCaptchaMsgResource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblCaptchaMsg2" runat="server" CssClass="SizeMemo" Text="2.啟用後可設定例外人員，此人員不受行動裝置驗證限制" meta:resourcekey="lblCaptchaMsg2Resource1"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 13%; word-break: break-all; white-space: nowrap" class="PopTableLeftTD">
                                <asp:Label ID="lblAppDeviceCountLimit" runat="server" Text="裝置數量限制" meta:resourcekey="lblAppDeviceCountLimitResource1"></asp:Label>
                            </td>
                            <td style="width: 87%; word-break: break-all" class="PopTableRightTD">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblAppDeviceCountTitle" runat="server" Text="單一帳號可綁定行動裝置數量：" meta:resourcekey="lblAppDeviceCountTitleResource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RadioButton runat="server" ID="rbtnAppDeviceCountUnlimit" Text="不限制" GroupName="appDeviceCountSetting" AutoPostBack="True" OnCheckedChanged="rbtnAppDeviceCount_CheckedChanged" meta:resourcekey="rbtnAppDeviceCountUnlimitResource1" />&nbsp;&nbsp;&nbsp;
                                                    <asp:RadioButton runat="server" ID="rbtnAppDeviceCountLimit" Text="限制綁定數量：" GroupName="appDeviceCountSetting" AutoPostBack="True" OnCheckedChanged="rbtnAppDeviceCount_CheckedChanged" meta:resourcekey="rbtnAppDeviceCountLimitResource1" />
                                                    <telerik:RadNumericTextBox ID="RadNumAppDeviceCount" MaxLength="1" MinValue="1" Enabled="False"
                                                        Width="40px" Height="20px" runat="server" DataType="System.Decimal"
                                                        DbValueFactor="1" LabelCssClass="" LabelWidth="64px"
                                                        meta:resourcekey="RadNumAppDeviceCountResource1" Culture="zh-TW">
                                                        <NegativeStyle Resize="None" />
                                                        <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                                        <ClientEvents OnValueChanging="AppDeviceCountChanging" />
                                                        <EmptyMessageStyle Resize="None" />
                                                        <ReadOnlyStyle Resize="None" />
                                                        <FocusedStyle Resize="None" />
                                                        <DisabledStyle Resize="None" />
                                                        <InvalidStyle Resize="None" />
                                                        <HoveredStyle Resize="None" />
                                                        <EnabledStyle Resize="None" />
                                                    </telerik:RadNumericTextBox>
                                                    <asp:Label ID="lblAppDeviceCountMemo" runat="server" Text="*輸入範圍為1~9" CssClass="SizeMemo" meta:resourcekey="lblAppDeviceCountMemoResource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <asp:Panel ID="PanelAppDeviceExceptUsers" runat="server" Visible="False" meta:resourcekey="PanelAppDeviceExceptUsersResource1">
                                            <tr>
                                                <td colspan="3">
                                                    <table>
                                                        <tr>
                                                            <td style="width: 5%; white-space: nowrap; padding-top: 10px;">
                                                                <asp:Label ID="Label1" runat="server" Text="例外人員" meta:resourcekey="lblExceptionResource1"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList_AppDeviceCountExceptUsers" ExpandToUser="false" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            </asp:Panel>
                                        </table>
                                        <asp:Label ID="lblAppDeviceCountLimitMemo1" runat="server" Text="1.設定為1時，使用者只能綁定1台行動裝置來登入App，其他行動裝置即使帳密正確也無法登入。" CssClass="SizeMemo" meta:resourcekey="lblAppDeviceCountLimitMemo1Resource1"></asp:Label>
                                        <br />
                                        <asp:Label ID="lblAppDeviceCountLimitMemo2" runat="server" Text="2.限制綁定數量時可設定例外人員，此人員不受行動裝置數量限制。" CssClass="SizeMemo" meta:resourcekey="lblAppDeviceCountLimitMemo2Resource1"></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableHeader" colspan="2">
                                <asp:Label ID="lblLogoutSet" runat="server" Text="登出設定" meta:resourcekey="lblLogoutSetResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 13%; word-break: break-all; white-space: nowrap" class="PopTableLeftTD">
                                <asp:Label ID="lblForceLogout" runat="server" Text="強制登出" meta:resourcekey="lblForceLogoutResource1"></asp:Label>
                            </td>
                            <td style="width: 87%; word-break: break-all; vertical-align: top;" class="PopTableRightTD">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <telerik:RadButton ID="RadBtnForceLogout" runat="server" Height="100%" Text="登出" OnClientClicking="ConfirmForceLogout" OnClick="RadBtnForceLogout_Click" CausesValidation="False" meta:resourcekey="RadBtnForceLogoutResource1"></telerik:RadButton>
                                        <br />
                                        <asp:Label ID="lblForceLogoutMemo" runat="server" Text="點按後，可將所有登入中的App使用者強制登出。" CssClass="SizeMemo" meta:resourcekey="lblForceLogoutMemoResource1"></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>                                
                            </td>
                        </tr>                       
                        <tr>
                            <td colspan="2" class="PopTableHeader" style="text-align: left">
                                <asp:Label ID="lblPushinfo" runat="server" Text="推播通知" meta:resourcekey="lblPushinfoResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 13%; word-break: break-all; white-space: nowrap" class="PopTableLeftTD">
                                <asp:Label ID="lblPushsetting" runat="server" Text="推播設定" meta:resourcekey="lblPushsettingResource1"></asp:Label>
                            </td>
                            <td style="width: 87%; word-break: break-all; vertical-align: top" class="PopTableRightTD">
                                <asp:UpdatePanel ID="UpdatePanel12" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <table style="width: 100%" border="0">
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbPushCenter" runat="server" Text="啟用Push Center" OnCheckedChanged="cbPushCenter_CheckedChanged" AutoPostBack="True" Height="100%" meta:resourcekey="cbPushCenterResource1" />
                                                    <telerik:RadButton ID="btnRegister" runat="server" Text="註冊" Visible="False" Height="100%" OnClick="btnRegister_Click" BackColor="Blue" meta:resourcekey="btnRegisterResource1"></telerik:RadButton>
                                                    <asp:Label ID="lblLicenseInvalid" runat="server" Text="非正式版UOF，註冊失敗。" ForeColor="Red" Visible="False" meta:resourcekey="lblLicenseInvalidResource1"></asp:Label>
                                                    <asp:Label ID="lblRegisterOK" runat="server" Text="註冊成功" Visible="False" ForeColor="Red" meta:resourcekey="lblRegisterOKResource1"></asp:Label>
                                                    <asp:Label ID="lblRegisterFail" runat="server" ForeColor="Red" meta:resourcekey="lblRegisterFailResource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbPushNoDisturb" runat="server" Text="勿擾時段" OnCheckedChanged="cbPushNoDisturb_CheckedChanged" AutoPostBack="True" meta:resourcekey="cbPushNoDisturbResource1" />
                                                    <asp:CustomValidator ID="cvPushNoDisturb" runat="server" ErrorMessage="請設定時段" Display="Dynamic" OnServerValidate="cvPushNoDisturb_ServerValidate" meta:resourcekey="cvPushNoDisturbResource1"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 15px;">
                                                    <table>
                                                        <tr style="padding-bottom: 5px;">
                                                            <td style="white-space: nowrap; width: 100px; height: 25px;"></td>
                                                            <td style="white-space: nowrap; width: 100px;">
                                                                <asp:Label ID="lblPushNoDisturbStarttime" runat="server" Text="開始時間" meta:resourcekey="lblPushNoDisturbStarttimeResource1"></asp:Label>
                                                            </td>
                                                            <td style="white-space: nowrap; width: 100px;">
                                                                <asp:Label ID="lblPushNoDisturbEndtime" runat="server" Text="結束時間" meta:resourcekey="lblPushNoDisturbEndtimeResource1"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; height: 30px;">
                                                                <asp:CheckBox ID="cbSunday" runat="server" Text="星期日" meta:resourcekey="cbSundayResource1" />
                                                            </td>
                                                            <td style="white-space: nowrap;">
                                                                <telerik:RadTimePicker runat="server" ID="rtpNoPushSunStart"></telerik:RadTimePicker>
                                                            </td>
                                                            <td style="white-space: nowrap;">
                                                                <telerik:RadTimePicker runat="server" ID="rtpNoPushSunEnd"></telerik:RadTimePicker>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; height: 30px;">
                                                                <asp:CheckBox ID="cbMonday" runat="server" Text="星期一" meta:resourcekey="cbMondayResource1" />
                                                            </td>
                                                            <td style="white-space: nowrap;">
                                                                <telerik:RadTimePicker runat="server" ID="rtpNoPushMonStart"></telerik:RadTimePicker>
                                                            </td>
                                                            <td style="white-space: nowrap;">
                                                                <telerik:RadTimePicker runat="server" ID="rtpNoPushMonEnd"></telerik:RadTimePicker>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; height: 30px;">
                                                                <asp:CheckBox ID="cbTuesday" runat="server" Text="星期二" meta:resourcekey="cbTuesdayResource1" />
                                                            </td>
                                                            <td style="white-space: nowrap;">
                                                                <telerik:RadTimePicker runat="server" ID="rtpNoPushTuesStart"></telerik:RadTimePicker>
                                                            </td>
                                                            <td style="white-space: nowrap;">
                                                                <telerik:RadTimePicker runat="server" ID="rtpNoPushTuesEnd"></telerik:RadTimePicker>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; height: 30px;">
                                                                <asp:CheckBox ID="cbWednesday" runat="server" Text="星期三" meta:resourcekey="cbWednesdayResource1" />
                                                            </td>
                                                            <td style="white-space: nowrap;">
                                                                <telerik:RadTimePicker runat="server" ID="rtpNoPushWednesStart"></telerik:RadTimePicker>
                                                            </td>
                                                            <td style="white-space: nowrap;">
                                                                <telerik:RadTimePicker runat="server" ID="rtpNoPushWednesEnd"></telerik:RadTimePicker>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; height: 30px;">
                                                                <asp:CheckBox ID="cbThurday" runat="server" Text="星期四" meta:resourcekey="cbThurdayResource1" />
                                                            </td>
                                                            <td style="white-space: nowrap;">
                                                                <telerik:RadTimePicker runat="server" ID="rtpNoPushThurStart"></telerik:RadTimePicker>
                                                            </td>
                                                            <td style="white-space: nowrap;">
                                                                <telerik:RadTimePicker runat="server" ID="rtpNoPushThurEnd"></telerik:RadTimePicker>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; height: 30px;">
                                                                <asp:CheckBox ID="cbFriday" runat="server" Text="星期五" meta:resourcekey="cbFridayResource1" />
                                                            </td>
                                                            <td style="white-space: nowrap;">
                                                                <telerik:RadTimePicker runat="server" ID="rtpNoPushFriStart"></telerik:RadTimePicker>
                                                            </td>
                                                            <td style="white-space: nowrap;">
                                                                <telerik:RadTimePicker runat="server" ID="rtpNoPushFriEnd"></telerik:RadTimePicker>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; height: 30px;">
                                                                <asp:CheckBox ID="cbSatday" runat="server" Text="星期六" meta:resourcekey="cbSatday" />
                                                            </td>
                                                            <td style="white-space: nowrap;">
                                                                <telerik:RadTimePicker runat="server" ID="rtpNoPushSatStart"></telerik:RadTimePicker>
                                                            </td>
                                                            <td style="white-space: nowrap;">
                                                                <telerik:RadTimePicker runat="server" ID="rtpNoPushSatEnd"></telerik:RadTimePicker>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3">
                                                                <table>
                                                                    <tr>
                                                                        <td style="width: 5%; white-space: nowrap; padding-top: 10px;">
                                                                            <asp:Label ID="lblPushNoDisturbExpUser" runat="server" Text="例外人員" meta:resourcekey="lblPushNoDisturbExpUserResource1"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <uc1:UC_ChoiceList runat="server" ID="UC_ChoiseList_PushNoDisturbExpUser" ExpandToUser="false" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                                <br />
                                <asp:Label ID="lblPushNoDisturbDesc" runat="server" Text="設定星期一18:00~08:00為勿擾時段，則星期一18:00至星期二08:00使用者將不會收到推播，例外人員則不在此限。" CssClass="SizeMemo" meta:resourcekey="lblPushNoDisturbDescResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 13%; word-break: break-all; white-space: nowrap" class="PopTableLeftTD">
                                <asp:Label ID="lblPushFilterKeyword" runat="server" Text="過濾關鍵字設定" meta:resourcekey="lblPushFilterKeywordResource1" ></asp:Label>
                            </td>
                            <td>
                                <telerik:RadToolBar ID="rtbFilterKeyword" runat="server" OnButtonClick="rtbFilterKeyword_ButtonClick" OnClientButtonClicking="rtbFilterKeywordClicking" Width="100%" meta:resourcekey="rtbFilterKeywordResource1" SingleClick="None" >
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" Value="Insert" Text="新增" meta:resourcekey="TBarButtonResource1"
                                            ClickedImageUrl="~/Common/Images/Icon/icon_m71.png" DisabledImageUrl="~/Common/Images/Icon/icon_m71.png"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_m71.png" ImageUrl="~/Common/Images/Icon/icon_m71.png" >
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" ></telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" Value="Delete" Text="刪除" meta:resourcekey="TBarButtonResource2"
                                            DisabledImageUrl="~/Common/Images/Icon/icon_m03.png" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
                                            ImageUrl="~/Common/Images/Icon/icon_m03.png" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" ></telerik:RadToolBarButton>
                                    </Items>
                                </telerik:RadToolBar>

                                <Ede:Grid ID="grdFilterKeyword" runat="server"
                                    AutoGenerateCheckBoxColumn="True" 
                                    AutoGenerateColumns="False" 
                                    CustomDropDownListPage="False" 
                                    DataKeyNames="SEQ"
                                    DataKeyOnClientWithCheckBox="False" 
                                    DefaultSortDirection="Ascending"
                                    EmptyDataText="沒有資料" 
                                    meta:resourcekey="grdFilterKeywordResource1"
                                    EnhancePager="True" 
                                    KeepSelectedRows="False" 
                                    OnRowDataBound="grdFilterKeyword_RowDataBound"
                                    PageSize="15"
                                    Width="100%" >
                                    <EnhancePagerSettings ShowHeaderPager="True" ></EnhancePagerSettings>
                                    <ExportExcelSettings AllowExportToExcel="False" ></ExportExcelSettings>
                                    <Columns>
                                        <asp:TemplateField HeaderText="繁體中文" AccessibleHeaderText="zh-TW" >
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnChinese" runat="server" ></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="True" />
                                        </asp:TemplateField>
                                    </Columns>
                                </Ede:Grid>
                                <br />
                                <asp:Label ID="lblFilterKeywordTip" runat="server" Text="設定後，私人訊息主旨符合關鍵字時將不會發送推播，最多可設定10組。" ForeColor="Blue" meta:resourcekey="lblFilterKeywordTipResource1" />
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableHeader" colspan="2">
                                <asp:Label ID="lblAppLogo" runat="server" Text="登入頁LOGO圖示" meta:resourcekey="lblAppLogoResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 13%; word-break: break-all; white-space: nowrap" class="PopTableLeftTD">
                                <asp:Label ID="lblLogoIconPath" runat="server" Text="LOGO圖示" meta:resourcekey="lblLogoIconPathResource1"></asp:Label>
                            </td>
                            <td style="width: 90%; word-break: break-all" class="PopTableRightTD" colspan="3">
                                <asp:UpdatePanel ID="UpdatePanel14" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Image ID="imgLogo" runat="server" Height="47px" Width="145px" meta:resourcekey="imgLogoResource1" />
                                        <br />
                                        <telerik:RadButton ID="btnEdit" runat="server" Text="編輯" OnClientClicking="OnClientClicking" CausesValidation="False" meta:resourcekey="btnEditResource1"></telerik:RadButton>
                                        <telerik:RadButton ID="btnDelete" runat="server" Text="刪除" OnClientClicking="bigPictureDelete" CausesValidation="False" OnClick="btnDelete_Click" meta:resourcekey="btnDeleteResource1"></telerik:RadButton>
                                        <br />
                                        <asp:Label ID="lbllogoSizeRemind" runat="server" Text="建議圖片大小： 460(w)*160(h)" meta:resourcekey="lbllogoSizeRemindResource1" ForeColor="Blue"></asp:Label>
                                        <asp:HiddenField ID="hideFileGroupID" runat="server" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnEdit" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>    
                        <tr>
                            <td class="PopTableHeader" colspan="2">
                                <asp:Label ID="lblSecurityTitle" runat="server" Text="資料安全性" meta:resourcekey="lblSecurityTitleResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 13%; word-break: break-all; white-space: nowrap" class="PopTableLeftTD">
                                <asp:Label ID="lblScreenGuardTitle" runat="server" Text="畫面擷取偵測" meta:resourcekey="lblScreenGuardTitleResource1"></asp:Label>
                            </td>
                            <td style="width: 87%; word-break: break-all" class="PopTableRightTD">
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbScreenGuardEnable" runat="server" Text="啟用" AutoPostBack="True" OnCheckedChanged="cbScreenGuardEnable_CheckedChanged" meta:resourcekey="cbScreenGuardEnableResource1" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" style="padding-left: 15px;">
                                                    <table>
                                                        <tr>
                                                            <td style="width: 5%; white-space: nowrap; padding-top: 10px;">
                                                                <asp:Label ID="lblScreenGuardExcept" runat="server" Text="例外人員" meta:resourcekey="lblScreenGuardExceptResource1"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList_ScreenGuardExcept" ExpandToUser="false" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblScreenGuardMemo" runat="server" CssClass="SizeMemo" Text="*啟用後，Android系統可完全禁止畫面擷取，iOS系統則僅會顯示提示訊息，並另外記錄使用者所擷取資訊。" meta:resourcekey="lblScreenGuardMemoResource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" style="padding-left: 15px;">
                                                    <asp:CheckBox ID="cbScreenGuardSendMsg" runat="server" Text="iOS使用者擷取畫面時，發送通知給系統管理員" meta:resourcekey="cbScreenGuardSendMsgResource1" />
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView ID="ModuleSet" runat="server" meta:resourcekey="ModuleSetResource1">
                    <telerik:RadToolBar ID="RadToolBarModuleSet" runat="server" SingleClick="None" Width="100%" OnButtonClick="RadToolBarModuleSet_ButtonClick" meta:resourcekey="RadToolBarModuleSetResource1">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="儲存" Value="Save" meta:resourcekey="RadToolBarButtonResource9"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m66.png" DisabledImageUrl="~/Common/Images/Icon/icon_m66.png"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m66.png" ImageUrl="~/Common/Images/Icon/icon_m66.png">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Value="Msg" meta:resourcekey="RadToolBarButtonResource3">
                                <ItemTemplate>
                                    <asp:Label ID="lblIsSave" runat="server" Text="已儲存" ForeColor="Blue" Visible="False" meta:resourcekey="lblIsSaveResource1"></asp:Label>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>

                    <table border="0" class="PopTable" style="width: 100%">
                        <tr>
                            <td class="PopTableHeader" colspan="2">
                                <asp:Label ID="lblBPM" runat="server" Text="電子表單" meta:resourcekey="lblBPMResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 13%; word-break: break-all; white-space: nowrap" class="PopTableLeftTD">
                                <asp:Label ID="lblToBeSignForm" runat="server" Text="待處理表單" meta:resourcekey="lblToBeSignFormResource1"></asp:Label>
                            </td>
                            <td style="width: 90%; word-break: break-all" class="PopTableRightTD" colspan="3">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="text-align: left">
                                            <asp:Label ID="lblRange" runat="server" Text="顯示範圍" meta:resourcekey="lblRangeResource1"></asp:Label> <br />
                                            <asp:RadioButtonList ID="rblToBeSignForm" runat="server" meta:resourcekey="rblToBeSignFormResource1">
                                                <asp:ListItem Value="all" Text="顯示所有待簽表單" Selected="True"  meta:resourcekey="rblItem1Resource1"></asp:ListItem>
                                                <asp:ListItem Value="appEnabled" Text="僅顯示允許行動裝置簽核的表單"  meta:resourcekey="rblItem2Resource1"></asp:ListItem>
                                            </asp:RadioButtonList><br />
                                            <asp:Label ID="lblAPPTasksOrder" runat="server" Text="顯示順序" meta:resourcekey="lblAPPTasksOrderResource1"></asp:Label> <br />
                                            <asp:RadioButtonList ID="rbAPPTasksOrder" runat="server" meta:resourcekey="rbAPPTasksOrderResource1">
                                                <asp:ListItem Text="依時間由舊到新排序" Value="ASC" meta:resourcekey="ListItemResource1" ></asp:ListItem>
                                                <asp:ListItem Text="依時間由新到舊排序" Value="DESC" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                            </asp:RadioButtonList>

                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableHeader" colspan="2">
                                <asp:Label ID="lblAppBulletin" runat="server" Text="公告" meta:resourcekey="lblAppBulletinResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 13%; word-break: break-all; white-space: nowrap" class="PopTableLeftTD">
                                <asp:Label ID="lblMarquee" runat="server" Text="跑馬燈" meta:resourcekey="lblMarqueeResource1"></asp:Label>
                            </td>
                            <td style="width: 90%; word-break: break-all" class="PopTableRightTD" colspan="3">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="text-align: left">
                                            <asp:CheckBox ID="ckMarquee" runat="server" meta:resourcekey="ckMarqueeResource1" OnCheckedChanged="ckMarquee_CheckedChanged" AutoPostBack="True" />
                                            <asp:Label ID="lblEnableMarquee" runat="server" meta:resourcekey="lblEnableMarqueeResource1" Text="啟用"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%; white-space: nowrap; text-align: left;padding-left: 18px;">
                                            <asp:Label ID="lblBulletinDirection" runat="server" meta:resourcekey="lblBulletinDirectionResource1" Text="播放方式"></asp:Label>
                                            <asp:RadioButtonList ID="rblBulletinDirection" runat="server" meta:resourcekey="rblBulletinDirectionResource1" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                <asp:ListItem meta:resourcekey="VerticalListItemResource" Selected="True" Text="垂直輪播" Value="Vertical"></asp:ListItem>
                                                <asp:ListItem meta:resourcekey="HorizontalListItemResource" Text="水平播放" Value="Horizontal"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                         <tr>
                            <td class="PopTableHeader" colspan="2">
                                <asp:Label ID="lblAppEventBoardTitle" runat="server" Text="活動看板" meta:resourcekey="lblAppEventBoardTitleResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 13%; word-break: break-all; white-space: nowrap" class="PopTableLeftTD">
                                <asp:Label ID="lblAppEventBoardefeild" runat="server" Text="活動看板" meta:resourcekey="lblAppEventBoardefeildResource1"></asp:Label>
                            </td>
                            <td style="width: 90%; word-break: break-all" class="PopTableRightTD" colspan="3">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="text-align: left">
                                            <asp:CheckBox ID="chkAppEventBoardEnable" runat="server" meta:resourcekey="chkAppEventBoardEnableResource1" />
                                            <asp:Label ID="lblAppEventBoardEnable" runat="server" meta:resourcekey="lblAppEventBoardEnableResource1" Text="啟用"></asp:Label>
                                             <asp:HyperLink runat="server" ID="hlRedrectEventBoard" Text="前往設定" NavigateUrl="~/System/MNextMenu/EventsboardDefault.aspx" meta:resourcekey="hlRedrectEventBoardResource1"></asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%; white-space: nowrap; text-align: left;">
                                            <asp:Label ID="lblAppEventBoardInfo1" runat="server" Text="1.活動看板管理員可於「系統管理\行動裝置活動看板」中設定要在活動看板上顯示的內容。" meta:resourcekey="lblAppEventBoardInfo1Resource1" ForeColor="Blue"></asp:Label>
                                            <br><asp:Label ID="lblAppEventBoardInfo2" runat="server" Text="2.啟用後，App個人首頁會顯示活動看板面板並輪流播放設定的圖片。" meta:resourcekey="lblAppEventBoardInfo2Resource1" ForeColor="Blue"></asp:Label>                                         
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableHeader" colspan="2">
                                <asp:Label ID="lblUChatSetting" runat="server" Text="UChat設定" meta:resourcekey="lblUChatSettingResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width: 13%; word-break: break-all; white-space: nowrap">
                                <asp:Label ID="lblUChatKeepDay" runat="server" Text="聊天內容觀看期限" meta:resourcekey="lblUChatKeepDayResource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD" style="width: 87%; word-break: break-all; vertical-align: top">
                                <telerik:RadNumericTextBox ID="RadNumUChatKeepDay" MaxLength="3" MinValue="1"
                                    Width="40px" runat="server" DataType="System.Decimal"
                                    DbValueFactor="1" LabelCssClass="" LabelWidth="64px"
                                    meta:resourcekey="RadNumUChatKeepDayResource1" Culture="zh-TW">
                                    <NegativeStyle Resize="None" />
                                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                    <ClientEvents OnValueChanging="UChatKeepDayChanging" />
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadNumericTextBox>
                                <asp:Label ID="lblday" runat="server" Text="天" meta:resourcekey="lbldayResource1"></asp:Label>
                                <br />
                                <asp:Label ID="lblUChatKeepDayMemo" runat="server" CssClass="SizeMemo" meta:resourcekey="lblUChatKeepDayMemoResource1" Text="使用者可觀看期限內的聊天內容"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width: 13%; word-break: break-all; white-space: nowrap">
                                <asp:Label ID="lblUChatKeepFileDay" runat="server" Text="檔案保留期限" meta:resourcekey="lblUChatKeepFileDayResource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD" style="width: 87%; word-break: break-all; vertical-align: top">
                                <telerik:RadNumericTextBox ID="RadNumUChatKeepFileDay" MaxLength="3" MinValue="1"
                                    Width="40px" runat="server" DataType="System.Decimal"
                                    DbValueFactor="1" LabelCssClass="" LabelWidth="64px"
                                    meta:resourcekey="RadNumUChatKeepFileDayResource1" Culture="zh-TW">
                                    <NegativeStyle Resize="None" />
                                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                    <ClientEvents OnValueChanging="UChatKeepFileDayChanging" />
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadNumericTextBox>
                                <asp:Label ID="lblday1" runat="server" Text="天" meta:resourcekey="lblday1Resource1"></asp:Label>
                                <br />
                                <asp:Label ID="lblUChatKeepFileDayMemo" runat="server" CssClass="SizeMemo" meta:resourcekey="lblUChatKeepFileDayMemoResource1" Text="聊天內容中的所有檔案只可在保留天數內觀看或下載"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="width: 13%; word-break: break-all; white-space: nowrap">
                                <asp:Label ID="lblUChatKeepHistoryDay" runat="server" Text="聊天記錄保留期限" meta:resourcekey="lblUChatKeepHistoryDayResource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD" style="width: 87%; word-break: break-all; vertical-align: top">
                                <telerik:RadNumericTextBox ID="RadNumUChatKeepHistoryDay" MaxLength="3" MinValue="1"
                                    Width="40px" runat="server" DataType="System.Decimal"
                                    DbValueFactor="1" LabelCssClass="" LabelWidth="64px"
                                    meta:resourcekey="RadNumUChatKeepHistoryDayResource1" Culture="zh-TW">
                                    <NegativeStyle Resize="None" />
                                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadNumericTextBox>
                                <asp:Label ID="lblday3" runat="server" Text="天" meta:resourcekey="lblday3Resource1"></asp:Label>
                                <asp:CustomValidator ID="cvUChatKeepHistoryDay" runat="server" Display="Dynamic"
                                    ErrorMessage="聊天記錄保留期限需大於聊天內容觀看期限與檔案保留期限" meta:resourcekey="cvUChatKeepHistoryDayResource1"
                                    OnServerValidate="cvUChatKeepHistoryDay_ServerValidate"></asp:CustomValidator>
                                <br />
                                <asp:Label ID="lblUChatKeepHistoryDayMemo" runat="server" CssClass="SizeMemo" meta:resourcekey="lblUChatKeepHistoryDayMemoResource1" Text="系統會自動清除所有超過保留天數的聊天記錄"></asp:Label>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td class="PopTableLeftTD" style="width: 13%; word-break: break-all; white-space: nowrap">
                                <asp:Label ID="lblChatReserveDay" runat="server" meta:resourcekey="lblChatReserveDayResource1" Text="聊天室對話保留期限"></asp:Label>
                            </td>
                            <td class="PopTableRightTD"
                                style="width: 87%; word-break: break-all; vertical-align: top">
                                <telerik:RadNumericTextBox ID="rnChatReserveDay" MaxLength="3" MinValue="1"
                                    Width="40px" runat="server" DataType="System.Decimal"
                                    DbValueFactor="1" LabelCssClass="" LabelWidth="64px"
                                    meta:resourcekey="rnChatReserveDayResource1" Culture="zh-TW">
                                    <NegativeStyle Resize="None" />
                                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                    <ClientEvents OnValueChanging="ReserveDayChanging" />
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadNumericTextBox>
                                <asp:Label ID="lblday5" runat="server" meta:resourcekey="lblday5Resource1" Text="天"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="PopTableHeader" style="text-align: left">
                                <asp:Label ID="lblUMiiAgent" runat="server" Text="智慧助理服務" meta:resourcekey="lblUMiiAgentResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 13%; word-break: break-all; white-space: nowrap" class="PopTableLeftTD">
                                <asp:Label ID="lblUMiiService" runat="server" Text="服務設定" meta:resourcekey="lblUMiiServiceResource1"></asp:Label>
                            </td>
                            <td style="width: 87%; word-break: break-all; vertical-align: top" class="PopTableRightTD">
                                <asp:UpdatePanel ID="UpdatePanel26" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <table style="width: 100%" border="0">
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbUMiiService" runat="server" Text="啟用" AutoPostBack="True" Checked="false" OnCheckedChanged="cbServiceSetting_CheckedChanged" Height="100%" meta:resourcekey="cbUMiiServiceResource1" />
                                                    <telerik:RadButton ID="RadBtnUMiiService" runat="server" Text="註冊" Visible="False" OnClick="RadBtnUMiiService_Click" Height="100%" BackColor="Blue" meta:resourcekey="RadBtnUMiiServiceResource1"></telerik:RadButton>
                                                    <asp:Label ID="lblUMiiServiceSuccess" runat="server" Text="註冊成功" ForeColor="Blue" Visible="False" meta:resourcekey="lblUMiiServiceSuccessResource1"></asp:Label>
                                                    <asp:Label ID="lblUMiiServiceFail" runat="server" Text="註冊失敗" Visible="False" ForeColor="Red" meta:resourcekey="lblUMiiServiceFailResource1"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <%--導覽頁設定--%>
                <telerik:RadPageView ID="NavigationPageSet" runat="server" meta:resourcekey="navigationPageSetResource1">
                       <table style="width:100%">
                    <tr>
                        <td>
                        <telerik:RadToolBar ID="RadToolNavigationPage" runat="server" Width="100%" OnButtonClick="RadToolNavigationPage_ButtonClick" OnClientButtonClicking="RadToolNavigationPage_ButtonClicking" meta:resourcekey="RadToolBarNavigationPageResource1" SingleClick="None">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Value="Insert" Text="新增" meta:resourcekey="TBarButtonResource1"
                                    ClickedImageUrl="~/Common/Images/Icon/icon_m71.png" DisabledImageUrl="~/Common/Images/Icon/icon_m71.png"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m71.png" ImageUrl="~/Common/Images/Icon/icon_m71.png" >
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="Delete" Text="刪除" meta:resourcekey="TBarButtonResource2"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m03.png" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
                                    ImageUrl="~/Common/Images/Icon/icon_m03.png" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="NavigationInfo" meta:resourcekey="NavigationInfoResource1">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:HyperLink ID="hyImgInfo" runat="server" NavigateUrl="~/System/MNextMenu/Image/NavigationInfo.jpg" Text="製圖說明" Target="_blank" meta:resourcekey="hyImgInfoResource1"></asp:HyperLink>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource5"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="IsActive" meta:resourcekey="RadToolBarButtonResource6">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbIsActive" runat="server" Text="啟用" AutoPostBack="True" OnCheckedChanged="cbIsActive_CheckedChanged" meta:resourcekey="cbIsActiveResource1" />
                                </ItemTemplate>
                                </telerik:RadToolBarButton>
                                 <telerik:RadToolBarButton runat="server" Value="Info" meta:resourcekey="RadToolBarButtonResource7">
                                <ItemTemplate>
                                    <asp:Label ID="lblInfo" runat="server" Text="*最多可設定三頁，勾選啟用後，使用者首次登入App時才會播放設定的導覽頁" ForeColor="Blue" meta:resourcekey="lblInfoResource1" />
                                </ItemTemplate>
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left ; white-space: nowrap"">
                            <Ede:Grid ID="grdNavigationPage" runat="server" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" CustomDropDownListPage="False" 
                                DataKeyOnClientWithCheckBox="False" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" DataKeyNames="NAVIGATION_GUID" OnRowDataBound="grdNavigationPage_RowDataBound"
                                 width="650px" meta:resourcekey="grdNavigationPageResource1" AllowSorting="True" DefaultSortDirection="Ascending" PageSize="15" SelectedRowColor="" UnSelectedRowColor="">
                                <EnhancePagerSettings ShowHeaderPager="False"></EnhancePagerSettings>
                                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                                    <Columns>
                                        <asp:TemplateField HeaderText="名稱" meta:resourcekey="navigationNameResource1">
                                            <ItemTemplate>
                                                <table style="max-width: 150px;white-space: normal;">
                                                    <tr>
                                                        <td style="max-width: 150px;word-break: break-all;">
                                                            <asp:LinkButton runat="server" ID="lbtnNavigationName" OnClick="lbtnNavigationName_Click"></asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                             <HeaderStyle Wrap="False" Width="150px" HorizontalAlign="Center"/>
                                        </asp:TemplateField> 
                                        <asp:TemplateField HeaderText="內容" meta:resourcekey="navigationPageInfoResource1">
                                            <ItemTemplate>
                                                <asp:Image ID="imgInfo" runat="server" style="max-height: 300px;max-width: 300px;"/>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" Width="320px" HorizontalAlign="Center"/>
                                            <ItemStyle Wrap="False" Width="320px" HorizontalAlign="Center"/>
                                         </asp:TemplateField>     
                                          <asp:TemplateField HeaderText="播放順序" meta:resourcekey="navigationOrderResource1">
                                            <ItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <div class="lbtnUpPadding" >
                                                               <asp:Image ID="imgup" ImageUrl="~/Common/Images/Icon/icon_m113.gif" runat="server"/>
                                                                <asp:LinkButton ID="lbtnup" Text="上移" OnClick="btnup_Click" runat="server"></asp:LinkButton>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div>
                                                               <asp:Image ID="imgdown" ImageUrl="~/Common/Images/Icon/icon_m114.gif" runat="server"/>
                                                                <asp:LinkButton ID="lbtndown" Text="下移" OnClick="btndown_Click" runat="server"></asp:LinkButton>
                                                            </div>
                                                        </td>
                                                     </tr>
                                                </table>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" Width="150px" HorizontalAlign="Center"/>
                                            <ItemStyle Wrap="False" Width="150px" />
                                          </asp:TemplateField>    
                                    </Columns>
                                </Ede:Grid>
                            <br />
                        </td>
                    </tr>
                    </table>
                 <asp:HiddenField ID="hfOrderCount" runat="server" />
                </telerik:RadPageView>
                 <%--聲明頁設定--%>
                <telerik:RadPageView ID="DeclarationPageSet" runat="server" meta:resourcekey="declarationPageSetResource1">
                    <telerik:RadToolBar ID="radToolBarDeclarationSet" runat="server" SingleClick="None" Width="100%" OnClientButtonClicking="RadToolBarDeclarationPage_ButtonClicking" OnButtonClick="radToolBarDeclarationSet_ButtonClick" meta:resourcekey="radToolBarDeclarationSetResource1">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="儲存" Value="Save" meta:resourcekey="radToolBarResource9"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m66.png" DisabledImageUrl="~/Common/Images/Icon/icon_m66.png"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m66.png" ImageUrl="~/Common/Images/Icon/icon_m66.png">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource8"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="刪除同意記錄" Value="Delete" meta:resourcekey="radToolBarResource10"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m03.png" DisabledImageUrl="~/Common/Images/Icon/icon_m03.png"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m03.png" ImageUrl="~/Common/Images/Icon/icon_m03.png">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource10"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Value="Msg" meta:resourcekey="radToolBarSaveBtnResource1">
                                <ItemTemplate>
                                    <asp:Label ID="lblIsSave" runat="server" Text="已儲存" ForeColor="Blue" Visible="False" meta:resourcekey="lblIsSaveResource2"></asp:Label>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>

                    <table border="0" class="PopTable">
                        <tr>
                            <td class="PopTableHeader" colspan="2">
                                <asp:Label ID="lblBasicSetting" runat="server" meta:resourcekey="lblBasicSettingResource1" Text="基本設定"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 13%; word-break: break-all; white-space: nowrap" class="PopTableLeftTD">
                                <asp:Label ID="lblDeclarationPage" runat="server" meta:resourcekey="lblDeclarationPageResource1" Text="聲明頁"></asp:Label>
                            </td>
                            <td style="width: 87%; word-break: break-all" class="PopTableRightTD">
                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                    <ContentTemplate>
                                        <asp:CheckBox ID="chkActiveDeclarationPage" runat="server" meta:resourcekey="chkActiveDeclarationPageResource1" Text="啟用" />
                                        <br>
                                        <asp:Label ID="lblDeclarationPageMsg1" runat="server" ForeColor="Blue" meta:resourcekey="lblDeclarationPageMsg1Resource1" Text="1.勾選後，使用者登入時需同意聲明事項才可使用App。" Visible="True"></asp:Label>
                                        <br>
                                        <asp:Label ID="lblDeclarationPageMsg2" runat="server" ForeColor="Blue" meta:resourcekey="lblDeclarationPageMsg2Resource1" Text="2.修改聲明事項後，若要使用者下次登入時重新同意內容，儲存後請刪除同意記錄。" Visible="True"></asp:Label>
                                        <br>
                                        <asp:Label ID="lblDeclarationPageMsg3" runat="server" ForeColor="Blue" meta:resourcekey="lblDeclarationPageMsg3Resource1" Text="3.刪除同意記錄時，會同步將全部人員登出App。" Visible="True"></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableHeader" colspan="2">
                                <asp:Label ID="lblDeclarationNotice" runat="server" meta:resourcekey="lblDeclarationNoticeResource1" Text="聲明事項維護"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 13%; word-break: break-all; white-space: nowrap" class="PopTableLeftTD">
                                <asp:Label ID="lblStar" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblStarResource1"></asp:Label>
                                <asp:Label ID="lblDeclarationTitle" runat="server" meta:resourcekey="lblDeclarationTitleResource1" Text="標題"></asp:Label>
                            </td>
                            <td style="width: 87%; word-break: break-all" class="PopTableRightTD">
                                <asp:TextBox ID="txtDeclarationTitle" runat="server" MaxLength="20" Width="370px" meta:resourcekey="txtDeclarationTitleResource1"></asp:TextBox>
                                <asp:Label ID="lbltxtVaildInfo" runat="server" meta:resourcekey="lbltxtVaildInfoResource1" Text="*最多可輸入20個字" ForeColor="Blue"></asp:Label>
                                <asp:CustomValidator ID="cvDeclarationTitle" runat="server" ErrorMessage="不允許空白" meta:resourcekey="cvDeclarationTitleResource1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 13%; word-break: break-all; white-space: nowrap" class="PopTableLeftTD">
                                <asp:Label ID="lblStar2" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblStar2Resource1"></asp:Label>
                                <asp:Label ID="lblDeclarationContent" runat="server" meta:resourcekey="lblDeclarationContentResource1" Text="內容"></asp:Label>
                            </td>
                            <td style="width: 87%; word-break: break-all" class="PopTableRightTD">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtDeclarationContent" runat="server" TextMode="MultiLine" Width="370px" Height="475px" meta:resourcekey="txtDeclarationContentResource1"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:CustomValidator ID="cvDeclarationContent" runat="server" ErrorMessage="不允許空白" meta:resourcekey="cvDeclarationContentResource1"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <%-- 104設定 --%>
                <telerik:RadPageView ID="HR104Set" runat="server" meta:resourcekey="HR104SetResource1">
                    <telerik:RadToolBar ID="RadToolBarHR104Set" runat="server" SingleClick="None" Width="100%" OnButtonClick="RadToolBarHR104Set_ButtonClick" meta:resourcekey="radToolBarHR104SetResource1">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="儲存" Value="Save" meta:resourcekey="radToolBarResource9"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m66.png" DisabledImageUrl="~/Common/Images/Icon/icon_m66.png"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m66.png" ImageUrl="~/Common/Images/Icon/icon_m66.png">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource11"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Value="Msg" meta:resourcekey="radToolBarSaveBtnResource1">
                                <ItemTemplate>
                                    <asp:Label ID="lblIsSave" runat="server" Text="已儲存" ForeColor="Blue" Visible="False" meta:resourcekey="lblIsSaveResource2"></asp:Label>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>

                    <table border="0" class="PopTable">
                        <tr>
                            <td class="PopTableHeader" colspan="2">
                                <asp:Label ID="lbl104MobilePayEnvelopeTitle" Text="104行動版電子薪資袋" runat="server" meta:resourcekey="lbl104MobilePayEnvelopeTitleResource1" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 13%; word-break: break-all; white-space: nowrap" class="PopTableLeftTD">
                                <asp:Label ID="lblEPayEnvelopeTitle" Text="電子薪資袋" runat="server" meta:resourcekey="lblEPayEnvelopeTitleResource1" ></asp:Label>
                            </td>
                            <td style="width: 87%; word-break: break-all" class="PopTableRightTD">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:CheckBox ID="chkActive104EPayEnvelope" Text="允許使用者查詢個人電子薪資袋" runat="server"  meta:resourcekey="chkActive104EPayEnvelopeResource1" OnClick="chkActive104EPayEnvelope_OnClientClick()" />
                                        <asp:Label ID="lbl104PayEnvelopeErrorMessage" runat="server" ForeColor="Red" Visible="False" ></asp:Label>                                
                                        <br />
                                        <asp:Label ID="lbl104PayEnvelopeSiteUrl" Text="104薪資袋站台網址" runat="server" meta:resourcekey="lbl104PayEnvelopeSiteUrlResource1" ></asp:Label>
                                        <asp:TextBox ID="txtPayEnvelopeSiteUrl" Width="500px" runat="server" meta:resourcekey="txtPayEnvelopeSiteUrlResource1"></asp:TextBox>
                                        <asp:CustomValidator ID="cvPayEnvelopeSiteUrl" ClientValidationFunction="CheckTxtPayEnvelopeSiteUrl" ForeColor="Red" Display="Dynamic" ErrorMessage="請輸入網址" 
                                            runat="server" meta:resourcekey="cvPayEnvelopeSiteUrlResource1"></asp:CustomValidator>
                                        <br />
                                        <asp:Label ID="lblPayEnvelopeRemark1" Text="1.此功能需向104額外購置後才能使用，詳情請洽104業務。" runat="server" ForeColor="Blue" meta:resourcekey="lblPayEnvelopeRemark1Resource1" ></asp:Label>
                                        <br />
                                        <asp:Label ID="lblPayEnvelopeRemark2" Text="2.啟用前請在上方輸入104薪資袋站台網址" runat="server" ForeColor="Blue" meta:resourcekey="lblPayEnvelopeRemark2Resource1" ></asp:Label>
                                        <br />
                                        <asp:Label ID="lblPayEnvelopeRemark2_1" Text="範例：http://My104PortalSite/wfmobileweb" runat="server" ForeColor="Blue" meta:resourcekey="lblPayEnvelopeRemark2_1Resource1" ></asp:Label>
                                        <br />
                                        <asp:Label ID="lblPayEnvelopeRemark2_2" Text="勾選後，在行動裝置的個人面板才會顯示[104電子薪資袋]面板，可查詢個人薪資袋內容。" runat="server" ForeColor="Blue" meta:resourcekey="lblPayEnvelopeRemark2_2Resource1" ></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>    
                    </table>
                </telerik:RadPageView>
            </telerik:RadMultiPage>

            <asp:Label runat="server" ID="lblMail" Text="Mail" Visible="False" meta:resourcekey="lblMailResource2"></asp:Label>
            <asp:Label runat="server" ID="lblSMS" Text="SMS" Visible="False" meta:resourcekey="lblSMSResource2"></asp:Label>
            <asp:Label ID="lblArgumentErr" runat="server" Text="註冊失敗：參數錯誤" Visible="False" meta:resourcekey="lblArgumentErrResource1"></asp:Label>
            <asp:Label ID="lblUofIsLocked" runat="server" Text="註冊失敗：UOF 被 PushCenter 鎖定, 無法工作" Visible="False" meta:resourcekey="lblUofIsLockedResource1"></asp:Label>
            <asp:Label ID="lblProcessFail" runat="server" Text="註冊失敗：處理失敗, 通常這是因為 PushCenter 內部錯誤所引起" Visible="False" meta:resourcekey="lblProcessFailResource1"></asp:Label>
            <asp:Label ID="lblFuncMenuSet" runat="server" Text="功能選單設定" Visible="False" meta:resourcekey="lblFuncMenuSetResource1"></asp:Label>
            <asp:Label ID="lblBasicSet" runat="server" Text="一般設定" Visible="False" meta:resourcekey="lblBasicSetResource1"></asp:Label> 
            <asp:Label ID="lblNavigationPageSet" runat="server" Text="導覽頁設定" Visible="False" meta:resourcekey="lblNavigationPageSetResource1"></asp:Label>  
            <asp:Label ID="lbldialogTitle" runat="server" Text="新增/維護導覽頁" Visible="False" meta:resourcekey="lbldialogTitleResource1"></asp:Label>
            <asp:Label ID="lbConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
            <asp:Label ID="lblConfirmForceLogout" runat="server" Text="確定將所有登入中的App使用者全部登出?" Visible="False" meta:resourcekey="lblConfirmForceLogoutResource1"></asp:Label>
            <asp:Label ID="lblConfirmDeleteDeclarationRecord" runat="server" Text="刪除同意記錄後，使用者下次登入時需重新同意聲明事項才可使用App，確定刪除?" Visible="False" meta:resourcekey="lblConfirmDeleteDeclarationRecordResource1"></asp:Label>
               
            <asp:Label ID="lblPushFilterKeywordDialogAddTitle" runat="server" Text="新增關鍵字" Visible="False" meta:resourcekey="lblPushFilterKeywordDialogAddTitleResource1"></asp:Label>
            <asp:Label ID="lblPushFilterKeywordDialogEditTitle" runat="server" Text="維護關鍵字" Visible="False" meta:resourcekey="lblPushFilterKeywordDialogEditTitleResource1"></asp:Label>
            <asp:Label ID="lblDelConfirm" runat="server" Text="確定要刪除選取的項目嗎？" Visible="False" meta:resourcekey="lblDelConfirmResource1"></asp:Label>
            <asp:Label ID="lblDelRemind" runat="server" Text="請選擇要刪除的項目" Visible="False" meta:resourcekey="lblDelRemindResource1"></asp:Label>

            <asp:HiddenField ID="hfGrdFilterKeywordRowsCount" runat="server" />

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
