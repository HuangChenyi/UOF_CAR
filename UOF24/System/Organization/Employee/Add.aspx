<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Employee_Add" Title="新增人員"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Add.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function btImportAD_Click(sender, args) {
           if ($("#<%= txtAccount.ClientID %>").val() == "" || $("#<%= ddlDomain.ClientID %> option:selected").val()=="")
            {
                alert($("#<%= lblBeforeCheckAD.ClientID %>").text());
                args.set_cancel(true);
            }
            else
                $("#<%= txtName.ClientID%>").val($("#<%= txtAccount.ClientID %>").val());
        }

        function RemindResetPW() {
            var chAD = $("#<%=cbADAuth.ClientID %>").prop("checked");
            var hideAD = $("#<%=hideAD.ClientID %>").val();
            var btnResetPW = $("#<%=btnResetPW.ClientID %>");
            if (btnResetPW.length && btnResetPW.is(":hidden") && !chAD && hideAD != chAD) {
                alert('<%=lblConfirmResetPW.Text %>');
            }
        }
        function RemindADPW() {
            var chAD = $("#<%=cbADAuth.ClientID %>").prop("checked");;
            if (chAD) {
                alert('<%=lblAdPWMsg.Text%>');
            }
        }

        function cancelEvent() {
            return confirm("<%=lbConfirmDelete.Text%>");
        }

        function RemoveImage() {
            $("#<%=imgBigPicture.ClientID %>").attr('src', '').hide();
        }

        function OnClientClicking(sender, args) {
            var fid = $("#<%=hideFileGroupID.ClientID %>").val();
            $uof.dialog.open2("~/Basic/Personal/Information/EditPhoto.aspx", sender,
          "", 685, 590, OpenDialogResult, { 'filegroupid': fid });
            args.set_cancel(true);
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

        function RdbtnToolbar_Employee_Add_Clicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "AddPlus":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/System/Organization/Employee/SelectTitle.aspx", args.get_item(), '', 700, 600, Employee_Add_OpenDialogResult);

                    break;
            }
        }

        function Employee_Add_OpenDialogResult(returnValue) {
            if (returnValue === '' || returnValue === null || typeof (returnValue) === "undefined")
                return false;
            else
                return true;
        }

        function signtureToolBarButtonClicking(sender, args)
	    {
	    //Add JavaScript handler code here
	    var keyValue = args.get_item().get_value();
	    switch (keyValue) {
	        case "Insert":
	            args.set_cancel(true);
	            $uof.dialog.open2("~/Basic/Personal/Information/FileCenterDialog.aspx", args.get_item(), "", 685, 590, OpenDialogResult, { "AllowMultiUpload": "false" });
	            break;
            case "Delete":
                args.set_cancel(!confirm("<%=lbConfirmDelete.Text%>"));
                break;

	    }
	}

   
    </script>
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="已順利完成"
        ForeColor="Blue" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <input type="password" autocomplete="off" style="display: none"/>
    <input type="password" autocomplete="off" style="display: none"/> 
    <table class="PopTable" cellspacing="1" style="width: 100%">
        <colgroup style="width:20%"></colgroup>
        <colgroup style="width:30%"></colgroup>
        <colgroup style="width:20%"></colgroup>
        <colgroup style="width:30%"></colgroup>
        <tr>
            <td colspan="4" align="center" class="PopTableHeader">
                <center>
                    <asp:Label ID="Label32" runat="server" meta:resourcekey="Label32Resource1" Text="帳號資訊"></asp:Label>
                </center>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <font color="red"></font><span style="color: #ff0000">*</span><asp:Label ID="Label1"
                    runat="server" Text="帳號" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtAccount" runat="server" MaxLength="50" meta:resourcekey="txtAccountResource1"></asp:TextBox><br />
                                <asp:Label ID="lblAccMsg" runat="server"  CssClass="SizeMemo" Text="若帳號有與AD整合請勿使用@字元"
                    meta:resourcekey="lblAccMsgResource1"></asp:Label><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAccount"
                    Display="Dynamic" SetFocusOnError="True" ErrorMessage="不允許空白!" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvalidAccount" runat="server" Display="Dynamic" ErrorMessage="帳號已存在"
                    meta:resourcekey="cvalidAccountResource1"></asp:CustomValidator>

            </td>
            <td style="white-space:nowrap"></td>
            <td >
                <telerik:RadButton ID="btnClearPW" runat="server" OnClick="btnClearPW_Click" meta:resourcekey="btnClearPWResource1"
                    CausesValidation="False" style="position: relative;">
                </telerik:RadButton>
                <telerik:RadButton ID="btnResetPW" runat="server" Text="重設密碼"
                    meta:resourcekey="btnResetPWResource1" style="position: relative;">
                </telerik:RadButton>
                <asp:Panel ID="panSendPW" runat="server" meta:resourcekey="panSendPWResource2">
                    <asp:CheckBox ID="cbSendPW" runat="server" Text="帳號建立後立即發送密碼通知函給該使用者" Checked="True"
                        meta:resourcekey="cbSendPWResource1" />
                    <br />
                    <asp:Label ID="Label39" runat="server" CssClass="SizeMemo" Text="若不勾選，亦可於帳號建立後到主畫面點選批次發送密碼函"
                        meta:resourcekey="Label39Resource1"></asp:Label>
                </asp:Panel>
            </td>
        </tr>
        <asp:Panel ID="Panel_ad" runat="server" meta:resourcekey="Panel_adResource1">
            <tr>
                <td style="white-space:nowrap">
                    <font color="red"></font><span style="color: #ff0000">*</span>
                    <asp:Label ID="lblDomain" runat="server" Text="網域" meta:resourcekey="lblDomainResource1"></asp:Label>
                </td>
                <td >
                    <asp:DropDownList ID="ddlDomain" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDomain_SelectedIndexChanged" meta:resourcekey="ddlDomainResource1">
                    </asp:DropDownList>
                </td>
                <td ></td>
                <td ></td>
            </tr>
            <tr>
                <td style="white-space:nowrap;">
                    <asp:Label ID="lblADAuth" runat="server" Text="使用AD驗證" meta:resourcekey="lblADAuthResource1"></asp:Label>
                </td>
                <td>
                    <asp:CheckBox ID="cbADAuth" runat="server" AutoPostBack="True" OnCheckedChanged="cbADAuth_CheckedChanged"
                        onclick="RemindResetPW()" meta:resourcekey="cbADAuthResource1" />
                    <telerik:RadButton ID="btImportAD" runat="server" meta:resourcekey="btImportADResource1" OnClientClicking="btImportAD_Click"
                        OnClick="btImportAD_Click" Text="匯入AD資訊" CausesValidation="False">
                    </telerik:RadButton>
                    &nbsp;<asp:CustomValidator ID="cvADServer" runat="server" ErrorMessage="找不到AD Server"
                        Display="Dynamic" OnServerValidate="cvADServer_ServerValidate" meta:resourcekey="cvADServerResource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="cvADAccountExist" runat="server" ErrorMessage="AD無此帳號" Display="Dynamic"
                        OnServerValidate="cvADAccountExist_ServerValidate" meta:resourcekey="cvADAccountExistResource1"></asp:CustomValidator>
                </td>
                <td>
                    <asp:Label ID="lblADaccountTitle" runat="server" Text="AD帳號" meta:resourcekey="lblADaccountTitleResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAccountMapping" runat="server" MaxLength="50" meta:resourcekey="txtAccountMappingResource1"></asp:TextBox><br />
                    <asp:CustomValidator ID="cvCheckAccountMapping" runat="server" ErrorMessage="帳號已存在" Display="Dynamic" meta:resourcekey="cvCheckAccountMappingResource1"></asp:CustomValidator>
                </td>
            </tr>
        </asp:Panel>
        <asp:Panel ID="PanelUsbKey" runat="server" meta:resourcekey="PanelUsbKeyResource2">
            <tr>
                <td style="white-space:nowrap">
                    <asp:Label ID="lblUsbKey" runat="server" Text="使用USB KEY驗證" meta:resourcekey="lblUsbKeyResource1"></asp:Label>
                <td>
                    <asp:CheckBox ID="cbUsbKey" runat="server" OnCheckedChanged="cbUsbKey_CheckedChanged"
                        meta:resourcekey="cbUsbKeyResource2" />
                </td>
                <td style="white-space:nowrap">
                    <asp:Label ID="lblUsbSerial" runat="server" Text="USB序號:" meta:resourcekey="lblUsbSerialResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUsbSerial" runat="server" Columns="10" ReadOnly="True" meta:resourcekey="txtUsbSerialResource2"></asp:TextBox>
                    <telerik:RadButton ID="btnReadUsb" runat="server" Text="讀取" OnClick="btnReadUsb_Click"
                        meta:resourcekey="btnReadUsbResource1">
                    </telerik:RadButton>
                    <asp:RequiredFieldValidator ID="rfvUsbKey" runat="server" ErrorMessage="請輸入USB序號"
                        ControlToValidate="txtUsbSerial" Display="Dynamic" EnableClientScript="False"
                        meta:resourcekey="rfvUsbKeyResource1"></asp:RequiredFieldValidator>&nbsp;
                </td>
            </tr>
        </asp:Panel>
        <asp:Panel ID="PanelCa" runat="server" meta:resourcekey="PanelCaResource1">
            <tr>
                <td style="white-space:nowrap">
                    <asp:Label ID="Label50" runat="server" Text="用戶端憑證序號" meta:resourcekey="Label50Resource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCaSerialNum" runat="server" MaxLength="50" Width="200px" meta:resourcekey="txtCaSerialNumResource1"></asp:TextBox>
                </td>
                <td></td>
                <td></td>
            </tr>
        </asp:Panel>
        <tr>
            <td style="white-space:nowrap"><asp:Label ID="Label2" runat="server" Text="預設語系" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="dwnLangeage" runat="server" meta:resourcekey="dwnLangeageResource1">
                </asp:DropDownList>
            </td>
            <td style="white-space:nowrap"><asp:Label ID="Label31" runat="server" Text="頁面主題" meta:resourcekey="Label31Resource1"></asp:Label>
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>&nbsp;<asp:DropDownList ID="dwnTheme" runat="server" meta:resourcekey="dwnThemeResource1"
                                    AutoPostBack="True" OnSelectedIndexChanged="dwnTheme_SelectedIndexChanged">
                                </asp:DropDownList>
                                </td>
                                <td style="width: 99px">
                                    <asp:Image ID="imgThumbnails" runat="server" ImageUrl="~/App_Themes/DefaultTheme/images/thumbnails.gif"
                                        Visible="False" meta:resourcekey="imgThumbnailsResource1" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1">
            <tr>
                <td style="white-space:nowrap">
                    <asp:Label ID="Label5" runat="server" Text="最後解除鎖定日" meta:resourcekey="Label5Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLastactivity" runat="server" Text="Label" meta:resourcekey="lblLastactivityResource1"></asp:Label>
                </td>
                <td style="white-space:nowrap">
                    <asp:Label ID="Label6" runat="server" Text="最後鎖定日期" meta:resourcekey="Label6Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLastlock" runat="server" Text="Label" meta:resourcekey="lblLastlockResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="white-space:nowrap">
                    <asp:Label ID="Label7" runat="server" Text="最後登入日期" meta:resourcekey="Label7Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLastlogin" runat="server" Text="Label" meta:resourcekey="lblLastloginResource1"></asp:Label>
                </td>
                <td style="white-space:nowrap">
                    <asp:Label ID="Label8" runat="server" Text="最後密碼修改日" meta:resourcekey="Label8Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblPasswordchange" runat="server" Text="Label" meta:resourcekey="lblPasswordchangeResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="white-space:nowrap">
                    <asp:Label ID="Label40" runat="server" Text="最後停用日期" meta:resourcekey="Label40Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLastSuspendedTime" runat="server" meta:resourcekey="lblLastSuspendedTimeResource2"></asp:Label>
                </td>
                <td style="white-space:nowrap">
                    <asp:Label ID="Label41" runat="server" Text="停用帳號" meta:resourcekey="Label41Resource1"></asp:Label>
                </td>
                <td>
                    <asp:CheckBox ID="cbSuspendedUser" runat="server" meta:resourcekey="cbSuspendedUserResource2" />
                </td>
            </tr>
        </asp:Panel>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label3" runat="server" Text="鎖定帳號" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="chkLock" runat="server" meta:resourcekey="chkLockResource1" />
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="Label4" runat="server" Text="帳號到期日" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadDatePicker ID="chooserExpire" runat="server" SkinID="AllowEmpty" meta:resourcekey="chooserExpireResource2">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

<DateInput DisplayDateFormat="yyyy/M/d" DateFormat="yyyy/M/d" LabelWidth="64px" Width="">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                </telerik:RadDatePicker>
            </td>
        </tr>
        <asp:Panel ID="Panel_proxy" runat="server" meta:resourcekey="Panel_proxyResource1">
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="lblProxy" runat="server" Text="Proxy設定" meta:resourcekey="Label49Resource1"></asp:Label>
                </td>
                <td colspan="3" class="PopTableRightTD">
                    <asp:DropDownList ID="ddlProxy" runat="server" meta:resourcekey="ddlProxyResource1">
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="lblProxyMsg" runat="server" CssClass="SizeMemo" Text="變更proxy設定,需重新登入系統方能生效"
                        meta:resourcekey="lblProxyMsgResource1"></asp:Label>
                    <br />
                    <asp:CustomValidator ID="cvProxy" runat="server" ErrorMessage="此Proxy已停用" Display="Dynamic"
                        meta:resourcekey="cvProxyResource1"></asp:CustomValidator>
                </td>

            </tr>
        </asp:Panel>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="lblLocationTitle" runat="server" Text="歸屬地點" meta:resourcekey="lblLocationTitleResource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:DropDownList ID="ddlUserLocation" runat="server" meta:resourcekey="ddlUserLocationResource1"></asp:DropDownList>
            </td>
        </tr>
        <asp:Panel runat="server" ID="Panel_DisplayTimeZone" meta:resourcekey="Panel_DisplayTimeZoneResource1">
            <tr>
                <td>
                    <asp:Label ID="lblDisplayTimeZone" runat="server" Text="顯示時區" meta:resourcekey="lblDisplayTimeZoneResource1"></asp:Label>
                </td>
                <td colspan="3">
                    <asp:DropDownList ID="ddlDisplayTimeZone" runat="server" meta:resourcekey="ddlDisplayTimeZoneResource1"></asp:DropDownList>
                    <br /><br />
                    <asp:Label ID="lblTimeZoneMsg" runat="server" Text="當時區不同時，是否顯示資料來源時區。" meta:resourcekey="lblTimeZoneMsgResource1"></asp:Label>
                    <asp:RadioButtonList ID="rdbtnTimeZoneTextDisplayControl" runat="server" meta:resourcekey="rdbtnTimeZoneTextDisplayControlResource1">
                        <asp:ListItem meta:resourcekey="SYSTEMListItemResource1" Selected="True" Text="依系統設定" Value="SYSTEM"></asp:ListItem>
                        <asp:ListItem meta:resourcekey="DISPLAYListItemResource1" Text="顯示 ex:2016/08/31 20:00 (08:00 +8)" Value="DISPLAY"></asp:ListItem>
                        <asp:ListItem meta:resourcekey="NON_DISPLAYListItemResource1" Text="隱藏 ex:2016/08/31 20:00" Value="NON_DISPLAY"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </asp:Panel>
        <tr>
            <td colspan="4" align="center" class="PopTableHeader" style="white-space:nowrap">
                <center>
                    <asp:Label ID="Label33" runat="server" meta:resourcekey="Label33Resource1" Text="部門職級"></asp:Label>
                </center>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="padding: 0 0 0 0">
                <telerik:RadToolBar ID="rdbtnToolbarEmployeePlus" runat="server" Width="100%" OnClientButtonClicking="RdbtnToolbar_Employee_Add_Clicking" OnButtonClick="rdbtnToolbarEmployeePlus_ButtonClick" meta:resourcekey="rdbtnToolbarEmployeePlusResource1" SingleClick="None">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Text="新增兼任" Value="AddPlus" CausesValidation="false"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m22.png"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m22.png"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m22.png"
                            ImageUrl="~/Common/Images/Icon/icon_m22.png" meta:resourcekey="rdbtnToolbarEmployeePlusItemResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
                        <telerik:RadToolBarButton CausesValidation="false" meta:resourcekey="RadToolBarButtonResource2">
                            <ItemTemplate>
                                <asp:Label ID="lblPlusMemo" runat="server" Text="可新增至兼任9" ForeColor="Blue" meta:resourcekey="lblPlusMemoResource1"></asp:Label>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
                <asp:Panel ID="Panel2" runat="server" meta:resourcekey="Panel2Resource1">
                <table class="NormalPopTable" width="100%">
                    <tr runat="server" id="plusTR0">
                        <td class="PopTableLeftTD" runat="server" >
                            <asp:Label ID="Label9" runat="server" Text="主要" meta:resourcekey="Label9Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" style="border-top-style: none; text-align: left; background-color: White; width: 50%;" runat="server">
                            <asp:Label ID="lblMaster" runat="server" meta:resourcekey="lblMasterResource1"></asp:Label>
                        </td>
                        <td valign="top" align="left" class="PopTableRightTD" style="border-top-style: none; border-right-style: none; background-color: White;width:30%" runat="server">
                            <telerik:RadButton ID="btnMaster" runat="server" CausesValidation="False" OnClick="btnMaster_Click"
                                meta:resourcekey="btnMasterResource1">
                            </telerik:RadButton>
                            <br />
                            <asp:CustomValidator ID="cvalidMaster" runat="server" Display="Dynamic" ErrorMessage="部門重複"
                                meta:resourcekey="cvalidMasterResource1" Text="部門重複" OnServerValidate="cvalidMaster_ServerValidate"></asp:CustomValidator>
                            <asp:HiddenField ID="hideMaster" runat="server" />
                            <asp:HiddenField ID="hideOldMaster" runat="server" />
                        </td>
                    </tr>
                    <tr runat="server" id="plusTR1">
                        <td class="PopTableLeftTD" style="border-left-style: none; white-space:nowrap;" runat="server">
                            <asp:Label ID="Label10" runat="server" Text="兼任1" meta:resourcekey="Label10Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" style="text-align: left; background-color: White;" runat="server">
                            <asp:Label ID="lblPlus1" runat="server" meta:resourcekey="lblPlus1Resource1"></asp:Label>
                        </td>
                        <td valign="top" align="left" class="PopTableRightTD" style="padding-bottom: 5px; background-color: White;" runat="server">
                            <telerik:RadButton ID="btnPlus1" runat="server" CausesValidation="False" OnClick="btnPlus1_Click"
                                meta:resourcekey="btnPlus1Resource1">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnClearPlus1" runat="server" CausesValidation="False"
                                OnClick="btnClearPlus1_Click" meta:resourcekey="btnClearPlus1Resource1">
                            </telerik:RadButton>
                            <br />
                            <asp:CustomValidator ID="cvalidPlus1" runat="server" Display="Dynamic" ErrorMessage="兼任1部門重複"
                                meta:resourcekey="cvalidPlus1Resource1" Text="兼任1部門重複" OnServerValidate="cvalidPlus1_ServerValidate"></asp:CustomValidator>
                            <asp:HiddenField ID="hidePlus1" runat="server" />
                            <asp:HiddenField ID="hideOldPlus1" runat="server" />

                        </td>
                    </tr>
                    <tr runat="server" id="plusTR2">
                        <td class="PopTableLeftTD" style="border-left-style: none; white-space:nowrap;" runat="server">
                            <asp:Label ID="Label11" runat="server" Text="兼任2" meta:resourcekey="Label11Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" style="text-align: left; background-color: White;" runat="server">
                            <asp:Label ID="lblPlus2" runat="server" meta:resourcekey="lblPlus2Resource1"></asp:Label>
                        </td>
                        <td valign="top" align="left" class="PopTableRightTD" style="padding-bottom: 5px; background-color: White;" runat="server">
                            <telerik:RadButton ID="btnPlus2" runat="server" CausesValidation="False" OnClick="btnPlus2_Click"
                                meta:resourcekey="btnPlus2Resource1">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnClearPlus2" runat="server" CausesValidation="False"
                                OnClick="btnClearPlus2_Click" meta:resourcekey="btnClearPlus2Resource1">
                            </telerik:RadButton>
                            <br />
                            <asp:CustomValidator ID="cvalidPlus2" runat="server" Display="Dynamic" ErrorMessage="兼任2部門重複"
                                meta:resourcekey="cvalidPlus2Resource1" Text="兼任2部門重複" OnServerValidate="cvalidPlus2_ServerValidate"></asp:CustomValidator>
                            <asp:HiddenField ID="hidePlus2" runat="server" />
                            <asp:HiddenField ID="hideOldPlus2" runat="server" />

                        </td>
                    </tr>
                    <tr runat="server" id="plusTR3">
                        <td class="PopTableLeftTD" style="border-left-style: none; border-bottom-style: none; white-space:nowrap;" runat="server">
                            <asp:Label ID="Label12" runat="server" Text="兼任3" meta:resourcekey="Label12Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" style="border-bottom-style: none; text-align: left; background-color: White;" runat="server">
                            <asp:Label ID="lblPlus3" runat="server" meta:resourcekey="lblPlus3Resource1"></asp:Label>
                        </td>
                        <td valign="top" align="left" class="PopTableRightTD" style="border-bottom-style: none; padding-bottom: 5px; background-color: White;" runat="server">
                            <telerik:RadButton ID="btnPlus3" runat="server" CausesValidation="False" OnClick="btnPlus3_Click"
                                meta:resourcekey="btnPlus3Resource1">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnClearPlus3" runat="server" CausesValidation="False"
                                OnClick="btnClearPlus3_Click" meta:resourcekey="btnClearPlus3Resource1">
                            </telerik:RadButton>
                            <br />
                            <asp:CustomValidator ID="cvalidPlus3" runat="server" Display="Dynamic" ErrorMessage="兼任3部門重複"
                                meta:resourcekey="cvalidPlus3Resource1" Text="兼任3部門重複" OnServerValidate="cvalidPlus3_ServerValidate"></asp:CustomValidator>
                            <asp:HiddenField ID="hidePlus3" runat="server" />
                            <asp:HiddenField ID="hideOldPlus3" runat="server" />

                        </td>
                    </tr>
                    <tr runat="server" id="plusTR4" visible="False">
                        <td class="PopTableLeftTD" style="border-left-style: none; border-bottom-style: none; white-space:nowrap;" runat="server">
                            <asp:Label ID="Label56" runat="server" Text="兼任4" meta:resourcekey="Label56Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" style="border-bottom-style: none; text-align: left; background-color: White;" runat="server">
                            <asp:Label ID="lblPlus4" runat="server" meta:resourcekey="lblPlus4Resource1"></asp:Label>
                        </td>
                        <td valign="top" align="left" class="PopTableRightTD" style="border-bottom-style: none; padding-bottom: 5px; background-color: White;" runat="server">
                            <telerik:RadButton ID="btnPlus4" runat="server" CausesValidation="False" meta:resourcekey="btnPlus4Resource1" OnClick="btnPlus4_Click">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnClearPlus4" runat="server" CausesValidation="False" meta:resourcekey="btnClearPlus4Resource1" OnClick="btnClearPlus4_Click">
                            </telerik:RadButton>
                            <br />
                            <asp:CustomValidator ID="cvalidPlus4" runat="server" Display="Dynamic" ErrorMessage="兼任4部門重複" meta:resourcekey="cvalidPlus4Resource1" OnServerValidate="cvalidPlus4_ServerValidate" ></asp:CustomValidator>
                            <asp:HiddenField ID="hidePlus4" runat="server" />
                            <asp:HiddenField ID="hideOldPlus4" runat="server" />

                        </td>
                    </tr>
                    <tr runat="server" id="plusTR5" visible="False">
                        <td class="PopTableLeftTD" style="border-left-style: none; border-bottom-style: none; white-space:nowrap;" runat="server">
                            <asp:Label ID="Label51" runat="server" Text="兼任5" meta:resourcekey="Label51Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" style="border-bottom-style: none; text-align: left; background-color: White;" runat="server">
                            <asp:Label ID="lblPlus5" runat="server" meta:resourcekey="lblPlus5Resource1"></asp:Label>
                        </td>
                        <td valign="top" align="left" class="PopTableRightTD" style="border-bottom-style: none; padding-bottom: 5px; background-color: White;" runat="server">
                            <telerik:RadButton ID="btnPlus5" runat="server" CausesValidation="False" meta:resourcekey="btnPlus5Resource1" OnClick="btnPlus5_Click">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnClearPlus5" runat="server" CausesValidation="False" meta:resourcekey="btnClearPlus5Resource1" OnClick="btnClearPlus5_Click">
                            </telerik:RadButton>
                            <br />
                            <asp:CustomValidator ID="cvalidPlus5" runat="server" Display="Dynamic" ErrorMessage="兼任5部門重複" meta:resourcekey="cvalidPlus5Resource1" OnServerValidate="cvalidPlus5_ServerValidate"></asp:CustomValidator>
                            <asp:HiddenField ID="hidePlus5" runat="server" />
                            <asp:HiddenField ID="hideOldPlus5" runat="server" />

                        </td>
                    </tr>
                    <tr runat="server" id="plusTR6" visible="False">
                        <td class="PopTableLeftTD" style="border-left-style: none; border-bottom-style: none; white-space:nowrap;width: 15%" runat="server">
                            <asp:Label ID="Label52" runat="server" Text="兼任6" meta:resourcekey="Label52Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" style="border-bottom-style: none; text-align: left; background-color: White;" runat="server">
                            <asp:Label ID="lblPlus6" runat="server" meta:resourcekey="lblPlus6Resource1"></asp:Label>
                        </td>
                        <td valign="top" align="left" class="PopTableRightTD" style="border-bottom-style: none; padding-bottom: 5px; background-color: White;" runat="server">
                            <telerik:RadButton ID="btnPlus6" runat="server" CausesValidation="False" meta:resourcekey="btnPlus6Resource1" OnClick="btnPlus6_Click">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnClearPlus6" runat="server" CausesValidation="False" meta:resourcekey="btnClearPlus6Resource1" OnClick="btnClearPlus6_Click">
                            </telerik:RadButton>
                            <br />
                            <asp:CustomValidator ID="cvalidPlus6" runat="server" Display="Dynamic" ErrorMessage="兼任6部門重複" meta:resourcekey="cvalidPlus6Resource1" OnServerValidate="cvalidPlus6_ServerValidate"></asp:CustomValidator>
                            <asp:HiddenField ID="hidePlus6" runat="server" />
                            <asp:HiddenField ID="hideOldPlus6" runat="server" />

                        </td>
                    </tr>
                    <tr runat="server" id="plusTR7" visible="False">
                        <td class="PopTableLeftTD" style="border-left-style: none; border-bottom-style: none; white-space:nowrap;" runat="server">
                            <asp:Label ID="Label53" runat="server" Text="兼任7" meta:resourcekey="Label53Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" style="border-bottom-style: none; text-align: left; background-color: White;" runat="server">
                            <asp:Label ID="lblPlus7" runat="server" meta:resourcekey="lblPlus7Resource1"></asp:Label>
                        </td>
                        <td valign="top" align="left" class="PopTableRightTD" style="border-bottom-style: none; padding-bottom: 5px; background-color: White;" runat="server">
                            <telerik:RadButton ID="btnPlus7" runat="server" CausesValidation="False" meta:resourcekey="btnPlus7Resource1" OnClick="btnPlus7_Click">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnClearPlus7" runat="server" CausesValidation="False" meta:resourcekey="btnClearPlus7Resource1" OnClick="btnClearPlus7_Click">
                            </telerik:RadButton>
                            <br />
                            <asp:CustomValidator ID="cvalidPlus7" runat="server" Display="Dynamic" ErrorMessage="兼任7部門重複" meta:resourcekey="cvalidPlus7Resource1" OnServerValidate="cvalidPlus7_ServerValidate"></asp:CustomValidator>
                            <asp:HiddenField ID="hidePlus7" runat="server" />
                            <asp:HiddenField ID="hideOldPlus7" runat="server" />

                        </td>
                    </tr>
                    <tr runat="server" id="plusTR8" visible="False">
                        <td class="PopTableLeftTD" style="border-left-style: none; border-bottom-style: none; white-space:nowrap;" runat="server">
                            <asp:Label ID="Label54" runat="server" Text="兼任8" meta:resourcekey="Label54Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" style="border-bottom-style: none; text-align: left; background-color: White;" runat="server">
                            <asp:Label ID="lblPlus8" runat="server" meta:resourcekey="lblPlus8Resource1"></asp:Label>
                        </td>
                        <td valign="top" align="left" class="PopTableRightTD" style="border-bottom-style: none; padding-bottom: 5px; background-color: White;" runat="server">
                            <telerik:RadButton ID="btnPlus8" runat="server" CausesValidation="False" meta:resourcekey="btnPlus8Resource1" OnClick="btnPlus8_Click">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnClearPlus8" runat="server" CausesValidation="False" meta:resourcekey="btnClearPlus8Resource1" OnClick="btnClearPlus8_Click">
                            </telerik:RadButton>
                            <br />
                            <asp:CustomValidator ID="cvalidPlus8" runat="server" Display="Dynamic" ErrorMessage="兼任8部門重複" meta:resourcekey="cvalidPlus8Resource1" OnServerValidate="cvalidPlus8_ServerValidate"></asp:CustomValidator>
                            <asp:HiddenField ID="hidePlus8" runat="server" />
                            <asp:HiddenField ID="hideOldPlus8" runat="server" />

                        </td>
                    </tr>
                    <tr runat="server" id="plusTR9" visible="False">
                        <td class="PopTableLeftTD" style="border-left-style: none; border-bottom-style: none; white-space:nowrap;" runat="server">
                            <asp:Label ID="Label55" runat="server" Text="兼任9" meta:resourcekey="Label55Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" style="border-bottom-style: none; text-align: left; background-color: White;" runat="server">
                            <asp:Label ID="lblPlus9" runat="server" meta:resourcekey="lblPlus9Resource1"></asp:Label>
                        </td>
                        <td valign="top" align="left" class="PopTableRightTD" style="border-bottom-style: none; padding-bottom: 5px; background-color: White;" runat="server">
                            <telerik:RadButton ID="btnPlus9" runat="server" CausesValidation="False" meta:resourcekey="btnPlus9Resource1" OnClick="btnPlus9_Click">
                            </telerik:RadButton>
                            <telerik:RadButton ID="btnClearPlus9" runat="server" CausesValidation="False" meta:resourcekey="btnClearPlus9Resource1" OnClick="btnClearPlus9_Click">
                            </telerik:RadButton>
                            <br />
                            <asp:CustomValidator ID="cvalidPlus9" runat="server" Display="Dynamic" ErrorMessage="兼任9部門重複" meta:resourcekey="cvalidPlus9Resource1" OnServerValidate="cvalidPlus9_ServerValidate"></asp:CustomValidator>
                            <asp:HiddenField ID="hidePlus9" runat="server" />
                            <asp:HiddenField ID="hideOldPlus9" runat="server" />

                        </td>
                    </tr>
                </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center" class="PopTableHeader" style="white-space:nowrap">
                <center>
                    <asp:Label ID="Label34" runat="server" meta:resourcekey="Label34Resource1" Text="人員資訊"></asp:Label></center>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <font color="red">*</font>
                <asp:Label ID="Label13" runat="server" Text="姓名" meta:resourcekey="Label13Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" MaxLength="50" meta:resourcekey="txtNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName"
                    Display="Dynamic" SetFocusOnError="True" ErrorMessage="不允許空白!" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="Label42" runat="server" Text="身分證字號" meta:resourcekey="Label42Resource2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSid" runat="server" meta:resourcekey="txtSidResource2"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label14" runat="server" Text="性別" meta:resourcekey="Label14Resource1"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rblSex" runat="server" RepeatDirection="Horizontal" meta:resourcekey="rblSexResource1">
                    <asp:ListItem Value="M" Text="男" meta:resourcekey="ListItemResource1"></asp:ListItem>
                    <asp:ListItem Value="F" Text="女" meta:resourcekey="ListItemResource2"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="Label15" runat="server" Text="生日" meta:resourcekey="Label15Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadDatePicker ID="chooserBirth" runat="server" SkinID="AllowEmpty" meta:resourcekey="chooserBirthResource2">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

<DateInput DisplayDateFormat="yyyy/M/d" DateFormat="yyyy/M/d" LabelWidth="64px" Width="">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                </telerik:RadDatePicker>
            </td>
        </tr>
        <tr style="display: none">
            <td style="white-space:nowrap">
                <asp:Label ID="Label44" runat="server" Text="英文姓名" meta:resourcekey="Label44Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEngName" runat="server" meta:resourcekey="txtEngNameResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label23" runat="server" Text="行動電話" meta:resourcekey="Label23Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMobile" runat="server" MaxLength="255" meta:resourcekey="txtMobileResource1"></asp:TextBox>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="Label16" runat="server" Text="到職日" meta:resourcekey="Label16Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadDatePicker ID="chooserArrive" runat="server" SkinID="AllowEmpty" meta:resourcekey="chooserArriveResource2">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

<DateInput DisplayDateFormat="yyyy/M/d" DateFormat="yyyy/M/d" LabelWidth="64px" Width="">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                </telerik:RadDatePicker>
            </td>
        </tr>
        <asp:Panel runat="server" ID="Panel_104HRModel" Visible="false" meta:resourcekey="Panel_104HRModelResource1">
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="lblComponyNo" runat="server" Text="公司別代碼" meta:resourcekey="lblComponyNoResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtComponyNo" runat="server" MaxLength="10" meta:resourcekey="txtComponyNoResource1"></asp:TextBox>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="lblcomponyUnifiedId" runat="server" Text="公司統編" meta:resourcekey="lblcomponyUnifiedIdResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtcomponyUnifiedId" runat="server" MaxLength="8" meta:resourcekey="txtcomponyUnifiedIdResource1"></asp:TextBox>
            </td>
        </tr>
        </asp:Panel>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label17" runat="server" Text="電子郵件" meta:resourcekey="Label17Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" MaxLength="255" meta:resourcekey="txtEmailResource1"></asp:TextBox>
                <asp:CustomValidator ID="cvValidatorEmail" runat="server" ErrorMessage="格式不正確" Display="Dynamic" OnServerValidate="cvValidatorEmail_ServerValidate" meta:resourcekey="cvValidatorEmailResource1"></asp:CustomValidator>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="Label18" runat="server" CssClass="HiddenUserUnusedColumn" Text="MSN信箱" meta:resourcekey="Label18Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMsn" runat="server" CssClass="HiddenUserUnusedColumn" MaxLength="255" meta:resourcekey="txtMsnResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label35" runat="server" Text="電子郵件1" meta:resourcekey="Label35Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmailA" runat="server" meta:resourcekey="txtEmailAResource1"></asp:TextBox>
                <asp:CustomValidator ID="cvValidatorEmailA" runat="server" ErrorMessage="格式不正確" Display="Dynamic" OnServerValidate="cvValidatorEmailA_ServerValidate" meta:resourcekey="cvValidatorEmailAResource1"></asp:CustomValidator>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="Label36" runat="server" Text="電子郵件2" meta:resourcekey="Label36Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmailB" runat="server" meta:resourcekey="txtEmailBResource1"></asp:TextBox>
                <asp:CustomValidator ID="cvValidatorEmailB" runat="server" ErrorMessage="格式不正確" Display="Dynamic" OnServerValidate="cvValidatorEmailB_ServerValidate" meta:resourcekey="cvValidatorEmailBResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label37" runat="server" Text="電子郵件3" meta:resourcekey="Label37Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmailC" runat="server" meta:resourcekey="txtEmailCResource1"></asp:TextBox>
                <asp:CustomValidator ID="cvValidatorEmailC" runat="server" ErrorMessage="格式不正確" Display="Dynamic" OnServerValidate="cvValidatorEmailC_ServerValidate" meta:resourcekey="cvValidatorEmailCResource1"></asp:CustomValidator>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="Label38" runat="server" Text="電子郵件4" meta:resourcekey="Label38Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmailD" runat="server" meta:resourcekey="txtEmailDResource1"></asp:TextBox>
                <asp:CustomValidator ID="cvValidatorEmailD" runat="server" ErrorMessage="格式不正確" Display="Dynamic" OnServerValidate="cvValidatorEmailD_ServerValidate" meta:resourcekey="cvValidatorEmailDResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr class="HiddenUserUnusedColumn">
            <td style="white-space:nowrap">
                <asp:Label ID="Label19" runat="server" Text="QQ" meta:resourcekey="Label19Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtQQ" runat="server" MaxLength="255" meta:resourcekey="txtQQResource1"></asp:TextBox>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="Label20" runat="server" Text="Yahoo即時通" meta:resourcekey="Label20Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtYahoo" runat="server" MaxLength="255" meta:resourcekey="txtYahooResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label21" runat="server" Text="BLOG" meta:resourcekey="Label21Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtBlog" runat="server" MaxLength="255" meta:resourcekey="txtBlogResource1"></asp:TextBox>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="Label22" runat="server" Text="SKYPE" meta:resourcekey="Label22Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSkype" runat="server" MaxLength="255" meta:resourcekey="txtSkypeResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label24" runat="server" Text="緊急電話" meta:resourcekey="Label24Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmergency" runat="server" MaxLength="255" meta:resourcekey="txtEmergencyResource1"></asp:TextBox>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="Label25" runat="server" Text="分機" meta:resourcekey="Label25Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtExtension" runat="server" MaxLength="10" meta:resourcekey="txtExtensionResource1"></asp:TextBox>
            </td>
        </tr>
        <tr id="trWebphone" runat="server">
            <td style="white-space:nowrap">
                <asp:Label ID="Label45" runat="server" Text="網路分機1" meta:resourcekey="Label45Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtWebphone1" runat="server" MaxLength="255" meta:resourcekey="txtWebphone1Resource1"></asp:TextBox>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="Label46" runat="server" Text="網路分機2" meta:resourcekey="Label46Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtWebphone2" runat="server" MaxLength="255" meta:resourcekey="txtWebphone2Resource1"></asp:TextBox>
            </td>
        </tr>
        <tr id="trWebMail" runat="server">
            <td style="white-space:nowrap">
                <asp:Label ID="lblWebMailAccount" runat="server" Text="WebMail帳號" meta:resourcekey="lblWebMailAccountResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtWebMailAccount" runat="server" MaxLength="50" autocomplete="new-password" AutoCompleteType="Disabled" meta:resourcekey="txtWebMailAccountResource1"></asp:TextBox>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="lblWebMailPWD" runat="server" Text="WebMail密碼" meta:resourcekey="lblWebMailPWDResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtWebMailPWD" runat="server" TextMode="Password" autocomplete="new-password" AutoCompleteType="Disabled" MaxLength="128" meta:resourcekey="txtWebMailPWDResource2"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label26" runat="server" Text="地址" meta:resourcekey="Label26Resource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtAddress" runat="server" Width="100%" MaxLength="255" meta:resourcekey="txtAddressResource1"></asp:TextBox>
            </td>
        </tr>
        <tr style="display: none">
            <td style="white-space:nowrap">
                <asp:Label ID="Label27" runat="server" Text="學歷" meta:resourcekey="Label27Resource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
            </td>
        </tr>
        <tr style="display: none">
            <td style="white-space:nowrap">
                <asp:Label ID="Label28" runat="server" Text="專長" meta:resourcekey="Label28Resource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label29" runat="server" Text="照片" meta:resourcekey="Label29Resource1"></asp:Label>
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Image ID="imgBigPicture" runat="server" Height="100px" Width="100px" Visible="false" meta:resourcekey="imgBigPictureResource1" />
                        <br />
                        <telerik:RadButton ID="btnEdit" runat="server" Text="編輯" OnClientClicking="OnClientClicking" OnClick="btnEdit_Click" CausesValidation="False" meta:resourcekey="btnEditResource1"></telerik:RadButton>
                        &nbsp;
                    <telerik:RadButton ID="btnDelete" runat="server" Text="刪除" OnClientClicking="bigPictureDelete" OnClick="btnDelete_Click" CausesValidation="False" Enabled="false" meta:resourcekey="btnDeleteResource2"></telerik:RadButton>
                        <asp:HiddenField ID="hideFileGroupID" runat="server" />
                        <asp:HiddenField ID="hfOldBigPictureID" runat="server" />
                        <asp:HiddenField ID="hfDeleteBigPictureID" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="Label30" runat="server" Text="討論區簽名" meta:resourcekey="Label30Resource1"></asp:Label>
            </td>
            <td style="height: 80px;">
                <asp:TextBox ID="txtSign" runat="server" TextMode="MultiLine" MaxLength="255" Width="100%"
                    meta:resourcekey="txtSignResource1" Height="100%"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="CheckSignLength"
                    Display="Dynamic" ControlToValidate="txtSign" ErrorMessage="字串長度超過255" Text="字串長度超過255"
                    meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td id="htmSign" runat="server" style="white-space:nowrap">
                <asp:Label ID="Label43" runat="server" Text="電子簽章" meta:resourcekey="Label43Resource2"></asp:Label>
            </td>
            <td id="htmSign2" runat="server" >
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <table width="100%">
                            <tr>
                                <telerik:RadToolBar ID="signtureToolBar" runat="server" SingleClick="None" OnButtonClick="signtureToolBar_ButtonClick" OnClientButtonClicking="signtureToolBarButtonClicking" Width="100%" meta:resourcekey="signtureToolBarResource1">
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" Value="Insert" Text="新增"
                                                                        DisabledImageUrl="~/Common/Images/Icon/icon_m71.png" HoveredImageUrl="~/Common/Images/Icon/icon_m71.png"
                                                                        ImageUrl="~/Common/Images/Icon/icon_m71.png"
                                                                        CheckedImageUrl="~/Common/Images/Icon/icon_m71.png" meta:resourcekey="signtureToolBarButtonResource1">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="signtureToolBarButtonResource2">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
                                                                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.png" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
                                                                        ImageUrl="~/Common/Images/Icon/icon_m03.png"
                                                                        CheckedImageUrl="~/Common/Images/Icon/icon_m03.png" meta:resourcekey="signtureToolBarButtonResource3">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="signtureToolBarButtonResource4">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server"  Text="取消預設" Value="Cancel"
                                                                        DisabledImageUrl="~/Common/Images/Icon/icon_m03_g.png" HoveredImageUrl="~/Common/Images/Icon/icon_m03_g.png"
                                                                        ImageUrl="~/Common/Images/Icon/icon_m03_g.png"
                                                                        CheckedImageUrl="~/Common/Images/Icon/icon_m03_g.png" meta:resourcekey="signtureToolBarButtonResource5">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="signtureToolBarButtonResource6">
                                        </telerik:RadToolBarButton>
                                    </Items>
                                </telerik:RadToolBar>
                            </tr>
                            <tr>
                                <td>
                                    <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
                                        Width="100%" DataKeyOnClientWithCheckBox="False" PageSize="5" EnhancePager="True"
                                        DataKeyNames="SIGN_GUID" OnRowDataBound="Grid1_RowDataBound" AllowSorting="True"
                                        OnRowCommand="Grid1_RowCommand" DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False" meta:resourcekey="Grid1Resource3" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>
                                        <ExportExcelSettings AllowExportToExcel="False" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="預設" meta:resourcekey="TemplateFieldResource7">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblChecked" runat="server" meta:resourcekey="lblCheckedResource2"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="電子簽章" meta:resourcekey="TemplateFieldResource8">
                                                <ItemTemplate>
                                                    <asp:Image ID="imgElecSign" runat="server" Height="100px" Width="100px" meta:resourcekey="imgElecSignResource2" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="建立時間" meta:resourcekey="TemplateFieldResource9">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCreateDate" runat="server" Text='<%# Eval("CREATE_DATE") %>' meta:resourcekey="lblCreateDateResource2"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField HeaderText="動作" SelectText="設為預設值" ShowSelectButton="True" meta:resourcekey="CommandFieldResource2" />
                                            <asp:TemplateField HeaderText="SIGN_GUID" Visible="False" meta:resourcekey="TemplateFieldResource10">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSignGuid" runat="server" Text='<%# Eval("SIGN_GUID") %>' meta:resourcekey="lblSignGuidResource2"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DEFAULT_SIGN" Visible="False" meta:resourcekey="TemplateFieldResource11">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDefaultSign" runat="server" meta:resourcekey="lblDefaultSignResource2"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="IS_SAVE" Visible="False" meta:resourcekey="TemplateFieldResource12">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIsSave" runat="server" Text='<%# Eval("IS_SAVE") %>' meta:resourcekey="lblIsSaveResource2"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <SelectedRowStyle BackColor="#FFC0C0" />
                                    </Fast:Grid>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="Label57" runat="server" Text="私人訊息簽名" meta:resourcekey="Label57Resource1"></asp:Label>
            </td>
            <td id="messageSign" runat="server" style="height: 80px;">
                <asp:TextBox ID="txtMessageSign" runat="server" TextMode="MultiLine" Height="200px" Width="100%" meta:resourcekey="txtMessageSignResource1"></asp:TextBox>
                <asp:Label ID="lblMessageSign" runat="server" meta:resourcekey="lblMessageSignResource1"></asp:Label>
                <asp:CustomValidator ID="CustomValidator3" runat="server" ClientValidationFunction="CheckSignLength" Display="Dynamic"
                    ControlToValidate="txtMessageSign" ErrorMessage="字串長度超過255" ForeColor="Red" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr style="display: none">
            <td style="white-space:nowrap">
                <asp:Label ID="lblOption1Name" runat="server" Text="其它1" meta:resourcekey="lblOption1NameResource2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOption1Value" runat="server" MaxLength="50" meta:resourcekey="txtOption1ValueResource2"></asp:TextBox>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="lblOption2Name" runat="server" Text="其它2" meta:resourcekey="lblOption2NameResource2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOption2Value" runat="server" MaxLength="50" meta:resourcekey="txtOption2ValueResource2"></asp:TextBox>
            </td>
        </tr>
        <tr style="display: none">
            <td style="white-space:nowrap">
                <asp:Label ID="lblOption3Name" runat="server" Text="其它3" meta:resourcekey="lblOption3NameResource2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOption3Value" runat="server" MaxLength="50" meta:resourcekey="txtOption3ValueResource2"></asp:TextBox>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="lblOption4Name" runat="server" Text="其它4" meta:resourcekey="lblOption4NameResource2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOption4Value" runat="server" MaxLength="50" meta:resourcekey="txtOption4ValueResource2"></asp:TextBox>
            </td>
        </tr>
        <tr style="display: none">
            <td style="white-space:nowrap">
                <asp:Label ID="lblOption5Name" runat="server" Text="其它5" meta:resourcekey="lblOption5NameResource2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOption5Value" runat="server" MaxLength="50" meta:resourcekey="txtOption5ValueResource2"></asp:TextBox>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="lblOption6Name" runat="server" Text="其它6" meta:resourcekey="lblOption6NameResource2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOption6Value" runat="server" MaxLength="50" meta:resourcekey="txtOption6ValueResource2"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label47" runat="server" Text="公事包容量設定" meta:resourcekey="Label47Resource1"></asp:Label>
            </td>
            <td colspan="3">
                <table>
                    <tr>
                        <td>
                            <asp:RadioButton ID="rbByPersonal" runat="server" Text="依個人設定" GroupName="FILE_TYPE"
                                meta:resourcekey="rbByPersonalResource1" />
                        </td>
                        <td>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <telerik:RadNumericTextBox ID="wnumMaxSize" DataType="System.String" NumberFormat-DecimalDigits="0" runat="server" Width="60px" MaxValue="2000" MinValue="0" Culture="zh-TW" DbValueFactor="1" LabelWidth="24px" meta:resourcekey="wnumMaxSizeResource2">
                                        </telerik:RadNumericTextBox>
                                        <asp:Label ID="Label48" runat="server" Text="MB(0~2000MB)" meta:resourcekey="Label48Resource1"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:RangeValidator ID="RangeValidator1" runat="server" meta:resourcekey="RangeValidator1Resource1"
                                            ErrorMessage="容量設定不正確,請重新輸入" Display="Dynamic" ControlToValidate="wnumMaxSize"
                                            Type="Integer" MaximumValue="2000" MinimumValue="0"></asp:RangeValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <asp:RadioButton ID="rbBySystem" runat="server" Text="依職級設定" Checked="True" GroupName="FILE_TYPE"
                                meta:resourcekey="rbBySystemResource1" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="lbDept" runat="server" Text="部門" Visible="False" meta:resourcekey="lbDeptResource1"></asp:Label>
    <asp:Label ID="lbTitle" runat="server" Text="職級" Visible="False" meta:resourcekey="lbTitleResource1"></asp:Label>
    <asp:Label ID="lbFunc" runat="server" Text="職務" Visible="False" meta:resourcekey="lbFuncResource1"></asp:Label>
    <asp:Label ID="lbIdFormatError" runat="server" Text="帳號格式不正確" Visible="False" meta:resourcekey="lbIdFormatErrorResource1"></asp:Label>
    <asp:Label ID="lbClearSuccess" runat="server" Text="清除成功" Visible="False" meta:resourcekey="lbClearSuccessResource1"></asp:Label>
    <asp:Label ID="lbSet" runat="server" Text="設定" Visible="False" meta:resourcekey="lbSetResource1"></asp:Label>
    <asp:Label ID="lbRemove" runat="server" Text="移除" Visible="False" meta:resourcekey="lbRemoveResource1"></asp:Label>
    <asp:Label ID="lbClearPwd" runat="server" Text="清除密碼" Visible="False" meta:resourcekey="lbClearPwdResource1"></asp:Label>
    <asp:Label ID="lblAdPWMsg" runat="server" Text="當使用AD驗證時，此功能無作用" Visible="False" meta:resourcekey="lblAdPWMsgResource1"></asp:Label>
    <asp:Label ID="lblConfirmResetPW" runat="server" Text="已改變驗證方式，請重設密碼" Visible="False" meta:resourcekey="lblConfirmResetPWResource1"></asp:Label>
    <asp:Label ID="msgFileGroupId" runat="server" Visible="False" meta:resourcekey="msgFileGroupIdResource2"></asp:Label>
    <asp:Label runat="server" ID="lbConfirmDelete" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblNoProxy" runat="server" Text="不使用" Visible="False" meta:resourcekey="lblNoProxyResource1"></asp:Label>
    <asp:Label ID="lblBeforeCheckAD" runat="server" Text="請先輸入帳號並選擇正確的網域" style="display:none" meta:resourcekey="lblBeforeCheckADResource1"></asp:Label>
    <asp:Label ID="lblSelect" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectResource1"></asp:Label>
    <asp:HiddenField ID="hideAD" runat="server" />
    <asp:HiddenField ID="hfEmployeeId" runat="server" />
    <asp:HiddenField ID="hfGroupId" runat="server" />
    <asp:HiddenField ID="hfGroupName" runat="server" />
    <asp:HiddenField ID="hfExpSus" runat="server" />
    <script language="javascript">
        function CheckSignLength(s, a) {
            if (a.Value.length > 255) {
                a.IsValid = false;
                a.visable = true;
            }
        }
    </script>
    <asp:HiddenField ID="hidSelect" runat="server" />
    <asp:HiddenField ID="fullyDomainName" runat="server" />
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:Label ID="lblLogMsg1" runat="server" Text="內部員工維護修改" Visible="False" meta:resourcekey="lblLogMsg1Resource1"></asp:Label>
    <asp:Label ID="lblLogMsg2" runat="server" Text="人員" Visible="False" meta:resourcekey="lblLogMsg2Resource1"></asp:Label>
    <asp:Label ID="lblLogMsg3" runat="server" Text="舊辦公地點" Visible="False" meta:resourcekey="lblLogMsg3Resource1"></asp:Label>
    <asp:Label ID="lblLogMsg4" runat="server" Text="新辦公地點" Visible="False" meta:resourcekey="lblLogMsg4Resource1"></asp:Label>
    <asp:Label ID="lblLogMsg5" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblLogMsg5Resource1"></asp:Label>
</asp:Content>
