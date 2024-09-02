<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Member_Add" Title="新增會員" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Add.aspx.cs" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
    function btImportAD_Click(sender, args) {
        if ($("#<%= txtAccount.ClientID %>").val() == "" ) {
            alert($("#<%= lblBeforeCheckAD.ClientID %>").text());
            args.set_cancel(true);
        }
        else
            $("#<%= txtName.ClientID%>").val($("#<%= txtAccount.ClientID %>").val());
    }
    </script>
    <script type="text/javascript">
    function RemindResetPW() {
        var chAD = $("#<%=cbADAuth.ClientID %>").prop("checked");
        var hideAD = $("#<%=hideAD.ClientID %>").val();
        var btnResetPW = $("#<%=btnResetPW.ClientID %>");
        if (btnResetPW.length && btnResetPW.is(":hidden") && !chAD && hideAD != chAD)
        {
            alert('<%=lblConfirmResetPW.Text %>');
            }
        }
        function RemindADPW() {
            var chAD = $("#<%=cbADAuth.ClientID %>").prop("checked");
            if (chAD) {
                alert('<%= lblAdPWMsg.Text %>');
            }
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

        function memClientNodeClicked(sender, args) {
            var currentNode = args.get_node();
            currentNode.set_checked(!currentNode.get_checked());            
        }
    </script>
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="已順利完成"
        ForeColor="Blue" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <table class="PopTable" cellspacing="1">
        <tr>
            <td colspan="4" align="center" class="PopTableHeader" style="white-space: nowrap">
                <center>
                    <asp:Label ID="Label9" runat="server" Text="帳號資訊" meta:resourcekey="Label9Resource2"></asp:Label>
                </center>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <font color="red">*</font>
                <asp:Label ID="Label1" runat="server" Text="帳號" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtAccount" runat="server" MaxLength="50" meta:resourcekey="txtAccountResource1"></asp:TextBox>&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAccount"
                    Display="Dynamic" SetFocusOnError="True" ErrorMessage="不允許空白!" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvalidAccount" runat="server" Display="Dynamic" ErrorMessage="帳號已存在"
                    meta:resourcekey="cvalidAccountResource1"></asp:CustomValidator>
                <br />
                <asp:Label ID="lblAccMsg" runat="server" CssClass="SizeMemo" Text="若帳號有與AD整合請勿使用@字元"
                    meta:resourcekey="lblAccMsgResource1"></asp:Label>
            </td>
            <td style="white-space: nowrap"></td>
            <td>
                <telerik:RadButton ID="btnClearPW" runat="server" meta:resourcekey="btnClearPWResource1"
                    Visible="False" OnClick="btnClearPW_Click" style="position: relative;">
                </telerik:RadButton>
                <telerik:RadButton ID="btnResetPW" runat="server" Text="重設密碼" AutoPostBack="False"
                    meta:resourcekey="btnResetPWResource1" style="position: relative;">
                </telerik:RadButton>
                <asp:Panel ID="panSendPW" runat="server" meta:resourcekey="panSendPWResource1">
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
                <td style="white-space: nowrap">
                    <asp:Label ID="lblADAuth" runat="server" Text="使用AD驗證" meta:resourcekey="lblADAuthResource1"></asp:Label>
                </td>
                <td>
                    <asp:CheckBox ID="cbADAuth" runat="server" AutoPostBack="True" OnCheckedChanged="cbADAuth_CheckedChanged"
                        onclick="RemindResetPW()" meta:resourcekey="cbADAuthResource1" />
                    <telerik:RadButton ID="btImportAD" runat="server" Text="匯入AD資訊" meta:resourcekey="btImportADResource1"
                        OnClientClicking="btImportAD_Click" OnClick="btImportAD_Click" CausesValidation="False">
                    </telerik:RadButton>
                    <asp:CustomValidator ID="cvADServer" runat="server" Display="Dynamic" ErrorMessage="找不到AD Server"
                        OnServerValidate="cvADServer_ServerValidate" meta:resourcekey="cvADServerResource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="cvADAccountExist" runat="server" Display="Dynamic" ErrorMessage="AD無此帳號"
                        OnServerValidate="cvADAccountExist_ServerValidate" meta:resourcekey="cvADAccountExistResource1"></asp:CustomValidator>
                </td>
                <td style="white-space: nowrap"></td>
                <td></td>
            </tr>
        </asp:Panel>
        <asp:Panel ID="PanelUsbKey" runat="server" meta:resourcekey="PanelUsbKeyResource1">
            <tr>
                <td background="/images/po_06.gif" style="white-space: nowrap">
                    <asp:Label ID="lblUsbKey" runat="server" Text="使用USB KEY驗證" meta:resourcekey="lblUsbKeyResource1"></asp:Label>
                </td>
                <td>
                    <asp:CheckBox ID="cbUsbKey" runat="server" OnCheckedChanged="cbUsbKey_CheckedChanged"
                        meta:resourceKey="cbUsbKeyResource1" />
                </td>
                <td background="/images/po_06.gif" style="white-space: nowrap">
                    <asp:Label ID="lblUsbSerial" runat="server" Text="USB序號:" meta:resourcekey="lblUsbSerialResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUsbSerial" runat="server" Columns="10" ReadOnly="True" meta:resourceKey="txtUsbSerialResource1"></asp:TextBox>
                    <telerik:RadButton ID="btnReadUsb" runat="server" Text="讀取" meta:resourcekey="btnReadUsbResource1"
                        OnClick="btnReadUsb_Click">
                    </telerik:RadButton>
                    <asp:RequiredFieldValidator ID="rfvUsbKey" runat="server" ErrorMessage="請輸入USB序號"
                        ControlToValidate="txtUsbSerial" Display="Dynamic" EnableClientScript="False"
                        meta:resourcekey="rfvUsbKeyResource1"></asp:RequiredFieldValidator>&nbsp;
                </td>
            </tr>
        </asp:Panel>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label2" runat="server" Text="預設語系" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="dwnLangeage" runat="server" meta:resourcekey="dwnLangeageResource1">
                </asp:DropDownList>
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="Label31" runat="server" Text="頁面主題" meta:resourcekey="Label31Resource1"></asp:Label>
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>&nbsp;<asp:DropDownList ID="dwnTheme" runat="server" AutoPostBack="True" meta:resourcekey="dwnThemeResource1"
                                    OnSelectedIndexChanged="dwnTheme_SelectedIndexChanged">
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
                <td style="white-space: nowrap">
                    <asp:Label ID="Label5" runat="server" Text="最後解除鎖定日" meta:resourcekey="Label5Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLastactivity" runat="server" meta:resourcekey="lblLastactivityResource1"></asp:Label>
                </td>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label6" runat="server" Text="最後鎖定日期" meta:resourcekey="Label6Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLastlock" runat="server" meta:resourcekey="lblLastlockResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label7" runat="server" Text="最後登入日期" meta:resourcekey="Label7Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLastlogin" runat="server" meta:resourcekey="lblLastloginResource1"></asp:Label>
                </td>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label8" runat="server" Text="最後密碼修改日" meta:resourcekey="Label8Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblPasswordchange" runat="server" meta:resourcekey="lblPasswordchangeResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label40" runat="server" Text="最後停用日期" meta:resourcekey="Label40Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLastSuspendedTime" runat="server" meta:resourceKey="lblLastSuspendedTimeResource1"></asp:Label>
                </td>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label41" runat="server" Text="停用帳號" meta:resourcekey="Label41Resource1"></asp:Label>
                </td>
                <td>
                    <asp:CheckBox ID="cbSuspendedUser" runat="server" meta:resourceKey="cbSuspendedUserResource1" />
                </td>
            </tr>
        </asp:Panel>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label3" runat="server" Text="鎖定帳號" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="chkLock" runat="server" meta:resourcekey="chkLockResource1" />
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="Label4" runat="server" Text="帳號到期日" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadDatePicker ID="chooserExpire" runat="server" meta:resourcekey="chooserExpireResource1"
                    SkinID="AllowEmpty" Culture="zh-TW">
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
        <tr>
            <td colspan="4" align="center" class="PopTableHeader" style="white-space: nowrap">
                <center>
                    <asp:Label ID="Label34" runat="server" Text="類別資訊" meta:resourcekey="Label34Resource2"></asp:Label>
                </center>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label33" runat="server" Text="會員類別" meta:resourcekey="Label33Resource2"></asp:Label>
            </td>
            <td colspan="3">
                <telerik:RadTreeView ID="RadTreeViewMember" CheckBoxes="true" AllowNodeEditing="false" EnableDragAndDrop="false" runat="server"
                                     OnClientNodeClicked="memClientNodeClicked"></telerik:RadTreeView>
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center" class="PopTableHeader" style="white-space: nowrap">
                <center>
                    <asp:Label ID="Label12" runat="server" Text="成員資訊" meta:resourcekey="Label12Resource2"></asp:Label>
                </center>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <font color="red">*</font>
                <asp:Label ID="Label13" runat="server" Text="姓名" meta:resourcekey="Label13Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" MaxLength="50" meta:resourcekey="txtNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName"
                    Display="Dynamic" SetFocusOnError="True" ErrorMessage="不允許空白!" meta:resourcekey="RequiredFieldValidator2Resource2"></asp:RequiredFieldValidator>
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="Label42" runat="server" Text="身分證字號" meta:resourcekey="Label42Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSid" runat="server" meta:resourcekey="txtSidResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label11" runat="server" Text="公司名稱" meta:resourcekey="Label11Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCompname" runat="server" MaxLength="50" meta:resourcekey="txtCompnameResource1"></asp:TextBox>
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="Label14" runat="server" Text="性別" meta:resourcekey="Label14Resource1"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rblSex" runat="server" RepeatDirection="Horizontal" meta:resourcekey="rblSexResource1">
                    <asp:ListItem Value="M" Text="男" meta:resourcekey="ListItemResource1"></asp:ListItem>
                    <asp:ListItem Value="F" Text="女" meta:resourcekey="ListItemResource2"></asp:ListItem>
                </asp:RadioButtonList>
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
            <td style="white-space: nowrap">
                <asp:Label ID="Label15" runat="server" Text="電子郵件" meta:resourcekey="Label15Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" MaxLength="255" meta:resourcekey="txtEmailResource1"></asp:TextBox>
                <asp:CustomValidator ID="cvValidatorEmail" runat="server" ErrorMessage="格式不正確" Display="Dynamic" OnServerValidate="cvValidatorEmail_ServerValidate" meta:resourcekey="cvValidatorEmailResource1"></asp:CustomValidator>
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="Label25" runat="server" Text="電子郵件1" meta:resourcekey="Label25Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmailA" runat="server" meta:resourcekey="txtEmailAResource1"></asp:TextBox>
                <asp:CustomValidator ID="cvValidatorEmailA" runat="server" ErrorMessage="格式不正確" Display="Dynamic" OnServerValidate="cvValidatorEmailA_ServerValidate" meta:resourcekey="cvValidatorEmailAResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label27" runat="server" Text="電子郵件2" meta:resourcekey="Label27Resource1"></asp:Label>
            </t>
            <td>
                <asp:TextBox ID="txtEmailB" runat="server" meta:resourcekey="txtEmailBResource1"></asp:TextBox>
                <asp:CustomValidator ID="cvValidatorEmailB" runat="server" ErrorMessage="格式不正確" Display="Dynamic" OnServerValidate="cvValidatorEmailB_ServerValidate" meta:resourcekey="cvValidatorEmailBResource1"></asp:CustomValidator>
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="Label28" runat="server" Text="電子郵件3" meta:resourcekey="Label28Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmailC" runat="server" meta:resourcekey="txtEmailCResource1"></asp:TextBox>
                <asp:CustomValidator ID="cvValidatorEmailC" runat="server" ErrorMessage="格式不正確" Display="Dynamic" OnServerValidate="cvValidatorEmailC_ServerValidate" meta:resourcekey="cvValidatorEmailCResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label32" runat="server" Text="電子郵件4" meta:resourcekey="Label32Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmailD" runat="server" meta:resourcekey="txtEmailDResource1"></asp:TextBox>
                <asp:CustomValidator ID="cvValidatorEmailD" runat="server" ErrorMessage="格式不正確" Display="Dynamic" OnServerValidate="cvValidatorEmailD_ServerValidate" meta:resourcekey="cvValidatorEmailDResource1"></asp:CustomValidator>
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="Label16" runat="server" Text="生日" meta:resourcekey="Label16Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadDatePicker ID="chooserBirth" runat="server" meta:resourcekey="chooserBirthResource1"
                    SkinID="AllowEmpty" Culture="zh-TW">
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
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label17" runat="server" Text="公司電話" meta:resourcekey="Label17Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTel" runat="server" MaxLength="50" meta:resourcekey="txtTelResource1"></asp:TextBox>
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="Label18" runat="server" Text="分機" meta:resourcekey="Label18Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtExtension" runat="server" MaxLength="50" meta:resourcekey="txtExtensionResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label19" runat="server" Text="統一編號" meta:resourcekey="Label19Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNumber" runat="server" MaxLength="50" meta:resourcekey="txtNumberResource1"></asp:TextBox>
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="Label20" runat="server" Text="公司傳真" meta:resourcekey="Label20Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFax" runat="server" MaxLength="50" meta:resourcekey="txtFaxResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label21" runat="server" Text="SKYPE" meta:resourcekey="Label21Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSKYPE" runat="server" MaxLength="255" meta:resourcekey="txtSKYPEResource1"></asp:TextBox>
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="Label22" runat="server" CssClass="HiddenUserUnusedColumn" Text="MSN" meta:resourcekey="Label22Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMSN" runat="server" CssClass="HiddenUserUnusedColumn" MaxLength="50" meta:resourcekey="txtMSNResource1"></asp:TextBox>
            </td>
        </tr>
        <tr class="HiddenUserUnusedColumn">
            <td style="white-space: nowrap">
                <asp:Label ID="Label23" runat="server" Text="Yahoo即時通" meta:resourcekey="Label23Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtYahoo" runat="server" MaxLength="50" meta:resourcekey="txtYahooResource1"></asp:TextBox>
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="Label24" runat="server" Text="QQ" meta:resourcekey="Label24Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtQQ" runat="server" MaxLength="50" meta:resourcekey="txtQQResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label10" runat="server" Text="群組" meta:resourcekey="Label10Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblGroup" runat="server" meta:resourcekey="lblGroupResource1"></asp:Label>
                <telerik:RadButton ID="btnGroup" runat="server" Text="RadButton" CausesValidation="False"
                    OnClick="btnGroup_Click" meta:resourcekey="btnGroupResource1" style="position: relative;">
                </telerik:RadButton>
                <asp:HiddenField ID="hideGroup" runat="server" />
            </td>
            <td>
                <asp:Label ID="Label43" runat="server" Text="行動電話" meta:resourcekey="Label43Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMobile" runat="server" MaxLength="255" meta:resourcekey="txtMobileResource1"></asp:TextBox>
            </td>
        </tr>
        <tr runat="server" id="trDisplayTimeZone">
            <td style="white-space: nowrap">
                <asp:Label ID="lblDisplayTimeZone" runat="server" Text="顯示時區" meta:resourcekey="lblDisplayTimeZoneResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" colspan="3">
                <asp:DropDownList ID="ddlDisplayTimeZone" runat="server" meta:resourcekey="ddlDisplayTimeZoneResource1"></asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblTimeZoneMsg" runat="server" Text="當時區不同時，是否顯示資料來源時區。" meta:resourcekey="lblTimeZoneMsgResource1"></asp:Label>
                <asp:RadioButtonList ID="rdbtnTimeZoneTextDisplayControl" runat="server" meta:resourcekey="rdbtnTimeZoneTextDisplayControlResource1">
                    <asp:ListItem meta:resourcekey="SYSTEMListItemResource1" Selected="True" Text="依系統設定" Value="SYSTEM"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="DISPLAYListItemResource1" Text="顯示 ex:2016/08/31 20:00 (08:00 +8)" Value="DISPLAY"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="NON_DISPLAYListItemResource1" Text="隱藏 ex:2016/08/31 20:00" Value="NON_DISPLAY"></asp:ListItem>
                </asp:RadioButtonList>
            </td>            
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label26" runat="server" Text="地址" meta:resourcekey="Label26Resource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtAddress" runat="server" Width="100%" MaxLength="255" meta:resourcekey="txtAddressResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label29" runat="server" Text="照片" meta:resourcekey="Label29Resource1"></asp:Label>
            </td>
            <td>                
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Image ID="imgBigPicture" runat="server" Width="100px" Height="100px" Visible="false" meta:resourcekey="imgBigPictureResource1" />
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
            <td style="white-space: nowrap">
                <asp:Label ID="Label30" runat="server" Text="簽名" meta:resourcekey="Label30Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSign" runat="server" TextMode="MultiLine" MaxLength="255" Width="100%"
                    meta:resourcekey="txtSignResource1" Height="85px"></asp:TextBox>
                <br />
                <asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="CheckSignLength"
                    ControlToValidate="txtSign" ErrorMessage="字串長度超過255" meta:resourcekey="CustomValidator2Resource1"
                    Text="*"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="lblOption1Name" runat="server" Text="欄位1" meta:resourcekey="lblOption1NameResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOption1Value" runat="server" MaxLength="50" meta:resourcekey="txtOption1ValueResource1"></asp:TextBox>
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="lblOption2Name" runat="server" Text="欄位2" meta:resourcekey="lblOption2NameResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOption2Value" runat="server" MaxLength="50" meta:resourcekey="txtOption2ValueResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="lblOption3Name" runat="server" Text="欄位3" meta:resourcekey="lblOption3NameResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOption3Value" runat="server" MaxLength="50" meta:resourcekey="txtOption3ValueResource1"></asp:TextBox>
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="lblOption4Name" runat="server" Text="欄位4" meta:resourcekey="lblOption4NameResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOption4Value" runat="server" MaxLength="50" meta:resourcekey="txtOption4ValueResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="lblOption5Name" runat="server" Text="欄位5" meta:resourcekey="lblOption5NameResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOption5Value" runat="server" MaxLength="50" meta:resourcekey="txtOption5ValueResource1"></asp:TextBox>
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="lblOption6Name" runat="server" Text="欄位6" meta:resourcekey="lblOption6NameResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOption6Value" runat="server" MaxLength="50" meta:resourcekey="txtOption6ValueResource1"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblSelectGroupTitle" runat="server" Text="選取群組" Visible="False" meta:resourcekey="lblSelectGroupTitleResource1"></asp:Label>
    <asp:HiddenField ID="hfIsManagerment" runat="server" />
    <asp:Label runat="server" ID="lbConfirmDelete" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lbClearSuccess" runat="server" Text="清除成功" Visible="False" meta:resourcekey="lbClearSuccessResource1"></asp:Label>
    <asp:Label ID="lbIdFormatError" runat="server" Text="帳號格式不正確" Visible="False" meta:resourcekey="lbIdFormatErrorResource1"></asp:Label>
    <asp:Label ID="lbSet" runat="server" Text="設定" Visible="False" meta:resourcekey="lbSetResource1"></asp:Label>
    <asp:Label ID="lbRemove" runat="server" Text="移除" Visible="False" meta:resourcekey="lbRemoveResource1"></asp:Label>
    <asp:Label ID="lbClearPwd" runat="server" Text="清除密碼" Visible="False" meta:resourcekey="lbClearPwdResource1"></asp:Label>
    <asp:Label ID="lblAdPWMsg" runat="server" Text="當使用AD驗證時，此功能無作用" Visible="False" meta:resourcekey="lblAdPWMsgResource1"></asp:Label>
    <asp:Label ID="lblConfirmResetPW" runat="server" Text="已改變驗證方式，請重設密碼" Visible="False" meta:resourcekey="lblConfirmResetPWResource1"></asp:Label>
    <asp:Label ID="lblBeforeCheckAD" runat="server" Text="請先輸入帳號" style="display:none" meta:resourcekey="lblBeforeCheckADResource1"></asp:Label>
    <asp:Label ID="lblSelect" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectResource1"></asp:Label>
    <asp:HiddenField ID="hideClass" runat="server" />
    <asp:HiddenField ID="hideAD" runat="server" />
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <script language="javascript">
        function CheckSignLength(s, a) {
            if (a.Value.length > 255) {
                a.IsValid = false;
            }
        }
    </script>
</asp:Content>
