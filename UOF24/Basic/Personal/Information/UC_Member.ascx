<%@ Register Src="../../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc3" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<script src="../../../Common/javascript/jQuery/plugin/jquery.qrcode.min.js"></script>

<%@ Control Language="C#" AutoEventWireup="true" Inherits="Basic_Personal_Information_UC_Member" Codebehind="UC_Member.ascx.cs" %>

<script type="text/javascript">   
    Sys.Application.add_load(function () {
        //目的:判斷是否alert訊息提示使用者修改個人資料
        var result = $uof.pageMethod.syncUc("Basic/Personal/Information/UC_Member.ascx", "IsUpdate", []);        
        if (result == "true") {
            var msgResult = $uof.pageMethod.syncUc("Basic/Personal/Information/UC_Member.ascx", "CheckShowMsg", []);
            if (msgResult == "") {
                if (confirm('<%=lblAlertUpdateMsg.Text %>')) {
                    $uof.pageMethod.syncUc("Basic/Personal/Information/UC_Member.ascx", "UpdatePersionalInfo", []);
                }
                else {
                    $uof.pageMethod.syncUc("Basic/Personal/Information/UC_Member.ascx", "UpdatePersionalInfo", []);
                    window.location.href = '<%=ResolveUrl("~/Homepage.aspx")%>';
                }
            }
            else {
                if (confirm(msgResult)) {
                    $uof.pageMethod.syncUc("Basic/Personal/Information/UC_Member.ascx", "UpdatePersionalInfo", []);
                }
                else {
                    $uof.pageMethod.syncUc("Basic/Personal/Information/UC_Member.ascx", "UpdatePersionalInfo", []);
                    window.location.href = '<%=ResolveUrl("~/Homepage.aspx")%>';
                }
            }
        }

        var text = '<%=hidQRcodeInfo.Value%>';
        $('#qrcode').text("").qrcode({
            width: 100
          , height: 100
          , text: text
        });
    });
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
</script>
<asp:CustomValidator ID="cvValidatorEmail" runat="server" ErrorMessage="E-Mail格式不正確" Display="Dynamic" OnServerValidate="cvValidatorEmail_ServerValidate" meta:resourcekey="cvValidatorEmailResource1"></asp:CustomValidator>
<asp:CustomValidator ID="cvSaveComplete" runat="server" ErrorMessage="已順利完成" style="color:blue;" Display="Dynamic" meta:resourcekey="cvSaveCompleteResource1"></asp:CustomValidator>
<table width="100%" class="PopTable" cellspacing="1">
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label20" runat="server" Text="帳號" meta:resourcekey="Label20Resource1"></asp:Label></td>
        <td>
            <asp:Label ID="lblAccount2" runat="server" meta:resourcekey="lblAccount2Resource1"></asp:Label>&nbsp;
            <telerik:RadButton ID="btnChangePW2" Text="變更密碼" runat="server"
                meta:resourcekey="btnChangePW2Resource1" style="position: relative;">
            </telerik:RadButton>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label6" runat="server" Text="會員類別" meta:resourcekey="Label6Resource1"></asp:Label></td>
        <td>
            <asp:Label ID="lblClass" runat="server" meta:resourcekey="lblClassResource1"></asp:Label></td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label28" runat="server" Text="姓名" meta:resourcekey="Label28Resource1"></asp:Label></td>
        <td style="width: 245px">
            <asp:Label ID="lblName2" runat="server" meta:resourcekey="lblName2Resource1"></asp:Label></td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label42" runat="server" Text="身分證字號"
                meta:resourcekey="Label42Resource1"></asp:Label></td>
        <td>
            <asp:Label ID="lblSid" runat="server" meta:resourcekey="lblSidResource1"></asp:Label></td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label38" runat="server" Text="群組" meta:resourcekey="Label38Resource1"></asp:Label></td>
        <td style="width:25%">
            <asp:Label ID="lblGroup2" runat="server" meta:resourcekey="lblGroup2Resource1"></asp:Label></td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label40" runat="server" Text="照片" meta:resourcekey="Label40Resource1"></asp:Label></td>
        <td style="white-space: nowrap;width:25%">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Image ID="imgBigPicture" runat="server" Height="100px" Width="100px" meta:resourcekey="imgBigPictureResource3" />
                     <br />
                    <telerik:RadButton ID="btnEdit" runat="server" Text="編輯" OnClientClicking="OnClientClicking" OnClick="btnEdit_Click" meta:resourcekey="btnEditResource1" ></telerik:RadButton>
                    <telerik:RadButton ID="btnDelete" runat="server" Text="刪除" OnClientClicking="bigPictureDelete" OnClick="btnDelete_Click" meta:resourcekey="btnDeleteResource1"  ></telerik:RadButton>
                    <asp:HiddenField ID="hideFileGroupID" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
    </tr>
    <tr>

        <td style="white-space: nowrap">
            <asp:Label ID="Label31" runat="server" Text="頁面主題" meta:resourcekey="Label31Resource1"></asp:Label></td>
        <td id="tdTheme" runat="server" >
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td>&nbsp;<asp:DropDownList ID="dwnTheme2" meta:resourcekey="dwnThemeResource1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dwnTheme2_SelectedIndexChanged"></asp:DropDownList>
                            </td>
                            <td style="WIDTH: 99px">
                                <asp:Image ID="imgThumbnails" runat="server" Visible="False" ImageUrl="~/App_Themes/DefaultTheme/images/thumbnails.gif" meta:resourcekey="imgThumbnailsResource1"></asp:Image></td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Label ID="Label4" runat="server" ForeColor="Blue" meta:resourcekey="Label4Resource1"
                Text="系統組態設定於儲存後，需重新登錄系統方始生效"></asp:Label></td>
        <asp:Panel runat="server" ID="Panel_QRCode" Visible="False" meta:resourcekey="Panel_QRCodeResource1">
            <td style="white-space: nowrap;vertical-align:middle;width:19%">
                <asp:Label ID="lblQRcode" runat="server" Text="行動條碼" meta:resourcekey="lblQRcodeResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle;padding:10px;">
                <div id="qrcode"></div>
            </td>
        </asp:Panel>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label21" runat="server" Text="接收系統訊息語系" meta:resourcekey="Label21Resource1"></asp:Label>
        </td>
        <td colspan="3">
            <asp:DropDownList ID="dwnLanguage2" runat="server" meta:resourcekey="dwnLanguage2Resource1">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label29" runat="server" Text="性別" meta:resourcekey="Label29Resource1"></asp:Label></td>
        <td>
            <asp:RadioButtonList ID="rboSex2" runat="server" RepeatDirection="Horizontal" meta:resourcekey="rboSex2Resource1">
                <asp:ListItem Value="M" meta:resourcekey="ListItemResource1" Text="男"></asp:ListItem>
                <asp:ListItem Value="F" meta:resourcekey="ListItemResource2" Text="女"></asp:ListItem>
            </asp:RadioButtonList>
            <asp:Label ID="lblSex" runat="server" meta:resourcekey="lblSexResource3"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label32" runat="server" Text="生日" meta:resourcekey="Label32Resource1"></asp:Label></td>
        <td>
            <telerik:RadDatePicker ID="rdpChooserbirth" runat="server" meta:resourcekey="rdpChooserbirthResource3">
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
            <asp:Label ID="lblBirth2" runat="server" meta:resourcekey="lblBirth2Resource3"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label30" runat="server" Text="電子郵件" meta:resourcekey="Label30Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtEmail2" runat="server" MaxLength="255" Columns="30" meta:resourcekey="txtEmail2Resource1"></asp:TextBox>
            <asp:Label ID="lblEmail2" runat="server" meta:resourcekey="lblEmail2Resource3"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label1" runat="server" Text="電子郵件1" meta:resourcekey="Label1Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtEmail2A" runat="server" MaxLength="255" Columns="30" meta:resourcekey="txtEmail2AResource1"></asp:TextBox>
            <asp:Label ID="lblEmail2A" runat="server" meta:resourcekey="lblEmail2AResource3"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label2" runat="server" Text="電子郵件2" meta:resourcekey="Label2Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtEmail2B" runat="server" MaxLength="255" Columns="30" meta:resourcekey="txtEmail2BResource1"></asp:TextBox>
            <asp:Label ID="lblEmail2B" runat="server" meta:resourcekey="lblEmail2BResource3"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label3" runat="server" Text="電子郵件3" meta:resourcekey="Label3Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtEmail2C" runat="server" MaxLength="255" Columns="30" meta:resourcekey="txtEmail2CResource1"></asp:TextBox>
            <asp:Label ID="lblEmail2C" runat="server" meta:resourcekey="lblEmail2CResource3"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label5" runat="server" Text="電子郵件4" meta:resourcekey="Label5Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtEmail2D" runat="server" MaxLength="255" Columns="30" meta:resourcekey="txtEmail2DResource1"></asp:TextBox>
            <asp:Label ID="lblEmail2D" runat="server" meta:resourcekey="lblEmail2DResource3"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label24" runat="server" Text="SKYPE" meta:resourcekey="Label24Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtSKYPE3" runat="server" MaxLength="255" Columns="30" meta:resourcekey="txtSKYPE3Resource1"></asp:TextBox>
            <asp:Label ID="lblSKYPE3" runat="server" meta:resourcekey="lblSKYPE3Resource3"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label12" runat="server" Text="行動電話"
                meta:resourcekey="Label12Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtMobile" runat="server" Columns="30" MaxLength="255" meta:resourcekey="txtMobileResource1"></asp:TextBox>
            <asp:Label ID="lblMoblie" runat="server" meta:resourcekey="lblMoblieResource3"></asp:Label>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label39" runat="server" Text="公司名稱" meta:resourcekey="Label39Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtCompname" runat="server" MaxLength="50" Columns="30" meta:resourcekey="txtCompnameResource1"></asp:TextBox>
            <asp:Label ID="lblCompname" runat="server" meta:resourcekey="lblCompnameResource3"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label34" runat="server" Text="分機" meta:resourcekey="Label34Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtExtension" runat="server" MaxLength="50" Columns="30" meta:resourcekey="txtExtensionResource1"></asp:TextBox>
            <asp:Label ID="lblExtension" runat="server" meta:resourcekey="lblExtensionResource3"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label33" runat="server" Text="公司電話" meta:resourcekey="Label33Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtTel2" runat="server" MaxLength="50" Columns="30" meta:resourcekey="txtTel2Resource1"></asp:TextBox>
            <asp:Label ID="lblTel2" runat="server" meta:resourcekey="lblTel2Resource3"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label36" runat="server" Text="公司傳真" meta:resourcekey="Label36Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtFax" runat="server" MaxLength="50" Columns="30" meta:resourcekey="txtFaxResource1"></asp:TextBox>
            <asp:Label ID="lblFax" runat="server" meta:resourcekey="lblFaxResource3"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label35" runat="server" Text="統一編號" meta:resourcekey="Label35Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtNumber" runat="server" MaxLength="50" Columns="30" meta:resourcekey="txtNumberResource1"></asp:TextBox>
            <asp:Label ID="lblNumber" runat="server" meta:resourcekey="lblNumberResource3"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label37" runat="server" Text="地址" meta:resourcekey="Label37Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtAddress2" runat="server" Columns="30" MaxLength="255" meta:resourcekey="txtAddress2Resource1"></asp:TextBox>
            <asp:Label ID="lblAddress2" runat="server" meta:resourcekey="lblAddress2Resource3"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label41" runat="server" Text="簽名" meta:resourcekey="Label41Resource1"></asp:Label></td>
        <td colspan="3">
            <asp:TextBox ID="txtSign2" runat="server" TextMode="MultiLine" Width="100%"
                Height="100px" meta:resourcekey="txtSign2Resource1"></asp:TextBox>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="CheckSignLength" Display="Dynamic"
                ControlToValidate="txtSign2" ErrorMessage="字串長度超過255" ForeColor="Red" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            <asp:Label ID="lblSign2" runat="server" meta:resourcekey="lblSign2Resource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="lblnickName" runat="server" Text="討論區暱稱" meta:resourcekey="lblnickNameResource3"></asp:Label></td>
        <td runat="server" id="tdnickName">
            <asp:TextBox ID="txtnickName" runat="server" meta:resourcekey="txtnickNameResource3"></asp:TextBox></td>
        <asp:Panel runat="server" ID="Panel_DisplayTimeZone" meta:resourcekey="Panel_DisplayTimeZoneResource1">
            <td style="white-space: nowrap">
                <asp:Label ID="Label43" runat="server" Text="顯示時區" meta:resourcekey="Label43Resource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlTimeZone" runat="server" meta:resourcekey="ddlTimeZoneResource1">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblTimeZoneMsg" runat="server" Text="當時區不同時，是否顯示資料來源時區。" meta:resourcekey="lblTimeZoneMsgResource1"></asp:Label>
                <asp:RadioButtonList ID="rdbtnTimeZoneTextDisplayControl" runat="server" meta:resourcekey="rdbtnTimeZoneTextDisplayControlResource1">
                    <asp:ListItem meta:resourcekey="SYSTEMListItemResource1" Selected="True" Text="依系統設定" Value="SYSTEM"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="DISPLAYListItemResource1" Text="顯示 ex:2015/08/31 20:00 (08:00 +8)" Value="DISPLAY"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="NON_DISPLAYListItemResource1" Text="隱藏 ex:2015/08/31 20:00" Value="NON_DISPLAY"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </asp:Panel>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="lblOption1Name" runat="server" Text="其它1"
                meta:resourcekey="lblOption1NameResource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtOption1Value" runat="server" MaxLength="50"
                meta:resourcekey="txtOption1ValueResource1"></asp:TextBox>
            <asp:Label ID="lblOption1Value" runat="server" meta:resourcekey="lblOption1ValueResource3"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="lblOption2Name" runat="server" Text="其它2"
                meta:resourcekey="lblOption2NameResource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtOption2Value" runat="server" MaxLength="50"
                meta:resourcekey="txtOption2ValueResource1"></asp:TextBox>
            <asp:Label ID="lblOption2Value" runat="server" meta:resourcekey="lblOption2ValueResource3"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="lblOption3Name" runat="server" Text="其它3"
                meta:resourcekey="lblOption3NameResource1"></asp:Label></td>
        <td valign="top">
            <asp:TextBox ID="txtOption3Value" runat="server" MaxLength="50"
                meta:resourcekey="txtOption3ValueResource1"></asp:TextBox>
            <asp:Label ID="lblOption3Value" runat="server" meta:resourcekey="lblOption3ValueResource3"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="lblOption4Name" runat="server" Text="其它4"
                meta:resourcekey="lblOption4NameResource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtOption4Value" runat="server" MaxLength="50"
                meta:resourcekey="txtOption4ValueResource1"></asp:TextBox>
            <asp:Label ID="lblOption4Value" runat="server" meta:resourcekey="lblOption4ValueResource3"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="lblOption5Name" runat="server" Text="其它5"
                meta:resourcekey="lblOption5NameResource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtOption5Value" runat="server" MaxLength="50"
                meta:resourcekey="txtOption5ValueResource1"></asp:TextBox>
            <asp:Label ID="lblOption5Value" runat="server" meta:resourcekey="lblOption5ValueResource3"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="lblOption6Name" runat="server" Text="其它6"
                meta:resourcekey="lblOption6NameResource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtOption6Value" runat="server" MaxLength="50"
                meta:resourcekey="txtOption6ValueResource1"></asp:TextBox>
            <asp:Label ID="lblOption6Value" runat="server" meta:resourcekey="lblOption6ValueResource3"></asp:Label>
        </td>
    </tr>

    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="lblPersonal1Name" runat="server" Text="個人資料1" meta:resourcekey="lblPersonal1NameResource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtPersonal1Value" runat="server" MaxLength="50" meta:resourcekey="txtPersonal1ValueResource1"></asp:TextBox></td>
        <td style="white-space: nowrap">
            <asp:Label ID="lblPersonal2Name" runat="server" Text="個人資料2" meta:resourcekey="lblPersonal2NameResource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtPersonal2Value" runat="server" MaxLength="50" meta:resourcekey="txtPersonal2ValueResource1"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="lblPersonal3Name" runat="server" Text="個人資料3" meta:resourcekey="lblPersonal3NameResource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtPersonal3Value" runat="server" MaxLength="50" meta:resourcekey="txtPersonal3ValueResource1"></asp:TextBox></td>
        <td style="white-space: nowrap">
            <asp:Label ID="lblPersonal4Name" runat="server" Text="個人資料4" meta:resourcekey="lblPersonal4NameResource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtPersonal4Value" runat="server" MaxLength="50" meta:resourcekey="txtPersonal4ValueResource1"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="lblPersonal5Name" runat="server" Text="個人資料5" meta:resourcekey="lblPersonal5NameResource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtPersonal5Value" runat="server" MaxLength="50" meta:resourcekey="txtPersonal5ValueResource1"></asp:TextBox></td>
        <td style="white-space: nowrap">
            <asp:Label ID="lblPersonal6Name" runat="server" Text="個人資料6" meta:resourcekey="lblPersonal6NameResource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtPersonal6Value" runat="server" MaxLength="50" meta:resourcekey="txtPersonal6ValueResource1"></asp:TextBox></td>
    </tr>

    <tr>
        <td colspan="4" style="text-align: center;">
            <telerik:RadButton ID="btnSave2" runat="server" Text="儲存"
                OnClick="btnSave_Click" meta:resourcekey="btnSave2Resource1" style="position: relative;">
            </telerik:RadButton>

        </td>
    </tr>
</table>
<asp:Label ID="msgChangepw" runat="server" meta:resourcekey="msgChangepwResource1" Text="變更密碼" Visible="False"></asp:Label>
<asp:Label ID="msgSave" runat="server" meta:resourcekey="msgSaveResource1" Text="儲存" Visible="False"></asp:Label>
<asp:Label runat="server" ID="lbConfirmDelete" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
<asp:Label ID="lblAlertUpdateMsg" runat="server" Text="系統已啟用個人資料更新功能，請您立即進行個人資料更新，謝謝!" Visible="False" meta:resourcekey="lblAlertUpdateMsgResource1"></asp:Label>
<asp:Label ID="lblSelect" runat="server" Text="請選擇" meta:resourcekey="lblSelectResource1" Visible="False"></asp:Label>
<asp:HiddenField ID="hfCurrentUser" runat="server" />
<asp:HiddenField ID="hidQRcodeInfo" runat="server" />