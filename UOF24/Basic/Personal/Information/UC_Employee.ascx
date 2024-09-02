<%@ Register Src="../../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc3" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
<%@ Control Language="C#" AutoEventWireup="true" Inherits="Basic_Personal_Information_UC_Employee" Codebehind="UC_Employee.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<script src="../../../Common/javascript/jQuery/plugin/jquery.qrcode.min.js"></script>

<script type="text/javascript" id="telerikClientEvents1">
//<![CDATA[

	function Infomation_Employee_RadToolBar1_ButtonClicking(sender,args)
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

	function OpenDialogResult(returnValue) {

	    if (typeof (returnValue) == "undefined" || returnValue == null) {
	        return false;
	    }
	    else {
	        return true;
	    }
	}
//]]>
</script>


<script type="text/javascript">

    Sys.Application.add_load(function () {
    //目的:判斷是否alert訊息提示使用者修改個人資料
        var result = $uof.pageMethod.syncUc("Basic/Personal/Information/UC_Employee.ascx", "IsUpdate", []);
        if (result == "true") {
            var msgResult = $uof.pageMethod.syncUc("Basic/Personal/Information/UC_Employee.ascx", "CheckShowMsg", []);
            {
                if (msgResult == "") {
                    if (confirm('<%=lblAlertUpdateMsg.Text %>')) {
                        $uof.pageMethod.syncUc("Basic/Personal/Information/UC_Employee.ascx", "UpdatePersionalInfo", []);
                    }
                    else {
                        $uof.pageMethod.syncUc("Basic/Personal/Information/UC_Employee.ascx", "UpdatePersionalInfo", []);
                        window.location.href = '<%=ResolveUrl("~/Homepage.aspx")%>';
                    }
                }
                else {
                    if (confirm(msgResult)) {
                        $uof.pageMethod.syncUc("Basic/Personal/Information/UC_Employee.ascx", "UpdatePersionalInfo", []);
                    }
                    else {
                        $uof.pageMethod.syncUc("Basic/Personal/Information/UC_Employee.ascx", "UpdatePersionalInfo", []);
                        window.location.href = '<%=ResolveUrl("~/Homepage.aspx")%>';
                    }
                }                
            }
        }

        var text = '<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hidQRcodeInfo.Value,true)%>';
                
        $('#qrcode').text("").qrcode({
            width: 120
            , height: 120
            , text: $uof.tool.htmlDecode(text)
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
         if (confirm("<%=lbConfirmDelete.Text%>"))
         {
             args.set_cancel(false);
         }
         else
         {
             args.set_cancel(true);
         }
    }
</script>
<asp:CustomValidator ID="cvValidatorEmail" runat="server" ErrorMessage="E-Mail格式不正確" Display="Dynamic" OnServerValidate="cvValidatorEmail_ServerValidate" meta:resourcekey="cvValidatorEmailResource1"></asp:CustomValidator>
<asp:CustomValidator ID="cvSaveComplete" runat="server" ErrorMessage="已順利完成" style="color:blue;" Display="Dynamic" meta:resourcekey="cvSaveCompleteResource1"></asp:CustomValidator>
<input type="password" autocomplete="off" style="display: none"/>
<input type="password" autocomplete="off" style="display: none"/> 
<table width="100%" class="PopTable" cellspacing="1">
    <tr>
        <td style="white-space: nowrap;vertical-align:middle;">
            <asp:Label ID="Label1" runat="server" Text="帳號" meta:resourcekey="Label1Resource1"></asp:Label>
        </td>
        <td style="vertical-align:middle;">
            <asp:Label ID="lblAccount" runat="server" meta:resourcekey="lblAccountResource1"></asp:Label>
            &nbsp;
            <telerik:RadButton ID="rbtnChangePW" Text="變更密碼" runat="server" meta:resourcekey="btnChangePWResource1" style="position: relative;">
            </telerik:RadButton>
        </td>
        <td style="white-space: nowrap;vertical-align:middle;width:19%">
            <asp:Label ID="Label18" runat="server" Text="照片" meta:resourcekey="Label18Resource1"></asp:Label>
        </td>
        <td style="white-space: nowrap;width:31%">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Image ID="imgBigPicture" runat="server" Height="100px" Width="100px" meta:resourcekey="imgBigPictureResource2" />
                    <br />
                    <telerik:RadButton ID="btnEdit" runat="server" Text="編輯" OnClientClicking="OnClientClicking" OnClick="btnEdit_Click" meta:resourcekey="btnEditResource1"></telerik:RadButton>&nbsp;
                    <telerik:RadButton ID="btnDelete" runat="server" Text="刪除" OnClientClicking="bigPictureDelete" OnClick="btnDelete_Click" meta:resourcekey="btnDeleteResource2"  ></telerik:RadButton>
                    <asp:HiddenField ID="hideFileGroupID" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>                
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label2" runat="server" Text="名稱" meta:resourcekey="Label2Resource1"></asp:Label></td>
        <td>
            <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label></td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label42" runat="server" Text="身分證字號" meta:resourcekey="Label42Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblSid" runat="server" meta:resourcekey="lblSidResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap;vertical-align:middle;">
            <asp:Label ID="Label26" runat="server" Text="部門" meta:resourcekey="Label26Resource1"></asp:Label></td>
        <td style="word-wrap: break-word; vertical-align:middle;" colspan="3">
            <asp:Label ID="LBLGroup" runat="server" meta:resourcekey="LBLGroupResource1"></asp:Label>        
    </tr>    
    <tr id="trProxy" runat="server">
        <td style="white-space: nowrap;vertical-align:middle;">
            <asp:Label ID="lblProxy" runat="server" Text="Proxy設定" meta:resourcekey="Label49Resource1"></asp:Label></td>
        <td colspan="3">
            <asp:DropDownList ID="ddlProxy" runat="server" meta:resourcekey="ddlProxyResource1">
            </asp:DropDownList><br />
            <asp:Label ID="lblProxyMsg" runat="server" ForeColor="Blue" Text="變更proxy設定,需重新登入系統方能生效" meta:resourcekey="lblProxyMsgResource1"></asp:Label>
            <br />
            <asp:CustomValidator ID="cvProxy" runat="server" ErrorMessage="此Proxy已停用" Display="Dynamic" ForeColor="Red" meta:resourcekey="cvProxyResource1"></asp:CustomValidator>
        </td>
    </tr>
    <tr>        
        <td style="white-space: nowrap;vertical-align:middle;width:19%">
            <asp:Label ID="Label22" runat="server" Text="頁面主題" meta:resourcekey="Label22Resource1"></asp:Label>
        </td>
        <td id="tdTheme" runat="server" style="width:31%">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td>&nbsp;<asp:DropDownList ID="dwnTheme" meta:resourcekey="dwnThemeResource1" runat="server" OnSelectedIndexChanged="dwnTheme_SelectedIndexChanged" AutoPostBack="True">
                            </asp:DropDownList>
                            </td>
                            <td style="WIDTH: 99px">
                                <asp:Image ID="imgThumbnails" runat="server" Visible="False" ImageUrl="~/App_Themes/DefaultTheme/images/thumbnails.gif" meta:resourcekey="imgThumbnailsResource1"></asp:Image>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Label ID="Label20" runat="server" ForeColor="Blue" meta:resourcekey="Label20Resource1" Text="系統組態設定於儲存後，需重新登錄系統方始生效"></asp:Label>
        </td>
        <asp:Panel runat="server" ID="Panel_QRCode" Visible="False" meta:resourcekey="Panel_QRCodeResource1">
            <td style="white-space: nowrap;vertical-align:middle;">
                <asp:Label ID="lblQRcode" runat="server" Text="行動條碼" meta:resourcekey="lblQRcodeResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle;padding:10px;">
                <div id="qrcode"></div>
            </td>
        </asp:Panel>
    </tr>
    <tr>
        <td style="white-space: nowrap;vertical-align:middle;">
            <asp:Label ID="Label5" runat="server" Text="接收系統訊息語系" meta:resourcekey="Label5Resource1"></asp:Label>
        </td>
        <td style="vertical-align:middle;" colspan="3">
            <asp:DropDownList ID="dwnLanguage" runat="server" meta:resourcekey="dwnLanguageResource1"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="lblnickName" runat="server" Text="討論區暱稱" meta:resourcekey="lblnickNameResource1"></asp:Label>
        </td>
        <td id="tdnickName" runat="server">
            <asp:TextBox ID="txtnickName" runat="server" meta:resourcekey="txtnickNameResource1"></asp:TextBox>
        </td>
        <asp:Panel runat="server" ID="Panel_DisplayTimeZone" Visible="False" meta:resourcekey="Panel_DisplayTimeZoneResource1">
        <td style="white-space: nowrap">
            <asp:Label ID="Label31" runat="server" Text="顯示時區" meta:resourcekey="Label31Resource1"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlTimeZone" runat="server" meta:resourcekey="ddlTimeZoneResource1"></asp:DropDownList>
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
            <asp:Label ID="Label3" runat="server" Text="性別" meta:resourcekey="Label3Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblSex" runat="server" meta:resourcekey="lblSexResource1"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label4" runat="server" Text="生日" meta:resourcekey="Label4Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblBirth" runat="server" meta:resourcekey="lblBirthResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label12" runat="server" Text="行動電話" meta:resourcekey="Label12Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtMobile" runat="server" Columns="30" MaxLength="255" meta:resourcekey="txtMobileResource1"></asp:TextBox>
            <asp:Label ID="lblMoblie" runat="server" meta:resourcekey="lblMoblieResource1"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label6" runat="server" Text="到職日" meta:resourcekey="Label6Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblArrive" runat="server" meta:resourcekey="lblArriveResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label16" runat="server" Text="學歷" meta:resourcekey="Label16Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblEducation" runat="server" meta:resourcekey="lblEducationResource1"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label15" runat="server" Text="地址" meta:resourcekey="Label15Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtAddress" runat="server" Columns="30" MaxLength="255" meta:resourcekey="txtAddressResource1"></asp:TextBox>
            <asp:Label ID="lblAddress" runat="server" meta:resourcekey="lblAddressResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">&nbsp;<asp:Label ID="Label7" runat="server" Text="電子郵件" meta:resourcekey="Label7Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtEmail" runat="server" Columns="30" MaxLength="255" meta:resourcekey="txtEmailResource1"></asp:TextBox>
            <asp:Label ID="lblEmail" runat="server" meta:resourcekey="lblEmailResource1"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label21" runat="server" Text="電子郵件1" meta:resourcekey="Label21Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtEmailA" runat="server" Columns="30" MaxLength="255" meta:resourcekey="txtEmailAResource1"></asp:TextBox>
            <asp:Label ID="lblEmailA" runat="server" meta:resourcekey="lblEmailAResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label24" runat="server" Text="電子郵件2" meta:resourcekey="Label24Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtEmailB" runat="server" Columns="30" MaxLength="255" meta:resourcekey="txtEmailBResource1"></asp:TextBox>
            <asp:Label ID="lblEmailB" runat="server" meta:resourcekey="lblEmailBResource1"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label25" runat="server" Text="電子郵件3" meta:resourcekey="Label25Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtEmailC" runat="server" Columns="30" MaxLength="255" meta:resourcekey="txtEmailCResource1"></asp:TextBox>
            <asp:Label ID="lblEmailC" runat="server" meta:resourcekey="lblEmailCResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label27" runat="server" Text="電子郵件4" meta:resourcekey="Label27Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtEmailD" runat="server" Columns="30" MaxLength="255" meta:resourcekey="txtEmailDResource1"></asp:TextBox>
            <asp:Label ID="lblEmailD" runat="server" meta:resourcekey="lblEmailDResource1"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label8" runat="server" CssClass="HiddenUserUnusedColumn" Text="MSN信箱" meta:resourcekey="Label8Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtMsn" runat="server" CssClass="HiddenUserUnusedColumn" Columns="30" MaxLength="255" meta:resourcekey="txtMsnResource1"></asp:TextBox>
            <asp:Label ID="lblMsn" runat="server" CssClass="HiddenUserUnusedColumn" meta:resourcekey="lblMsnResource1"></asp:Label>
        </td>
    </tr>
    <tr class="HiddenUserUnusedColumn">
        <td>
            <asp:Label ID="Label9" runat="server" Text="QQ" meta:resourcekey="Label9Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtQQ" runat="server" Columns="30" MaxLength="255" meta:resourcekey="txtQQResource1"></asp:TextBox>
            <asp:Label ID="lblQQ" runat="server" meta:resourcekey="lblQQResource1"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label11" runat="server" Text="Yahoo即時通" meta:resourcekey="Label11Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtYahoo" runat="server" Columns="30" MaxLength="255" meta:resourcekey="txtYahooResource1"></asp:TextBox>
            <asp:Label ID="lblYahoo" runat="server" meta:resourcekey="lblYahooResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label10" runat="server" Text="BLOG" meta:resourcekey="Label10Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtBlog" runat="server" Columns="30" MaxLength="255" meta:resourcekey="txtBlogResource1"></asp:TextBox>
            <asp:Label ID="lblBlog" runat="server" meta:resourcekey="lblBlogResource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="Label23" runat="server" Text="SKYPE" meta:resourcekey="Label23Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtSKYPE" runat="server" MaxLength="255" Columns="30" meta:resourcekey="txtSKYPEResource1"></asp:TextBox>
            <asp:Label ID="lblSKYPE" runat="server" meta:resourcekey="lblSKYPEResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="Label13" runat="server" Text="緊急電話" meta:resourcekey="Label13Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtTel" runat="server" Columns="30" MaxLength="255" meta:resourcekey="txtTelResource1"></asp:TextBox>
            <asp:Label ID="lblTel" runat="server" meta:resourcekey="lblTelResource1"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label14" runat="server" Text="分機" meta:resourcekey="Label14Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtExt" runat="server" Columns="30" MaxLength="10" meta:resourcekey="txtExtResource1"></asp:TextBox>
            <asp:Label ID="lblExt" runat="server" meta:resourcekey="lblExtResource1"></asp:Label>
        </td>
    </tr>
    <tr id="trWebphone" runat="server">
        <td style="white-space: nowrap">
            <asp:Label ID="Label29" runat="server" Text="網路分機1" meta:resourcekey="Label29Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtWebphone1" runat="server" Columns="30" MaxLength="255" meta:resourcekey="txtWebphone1Resource1"></asp:TextBox>
            <asp:Label ID="lblWebphone1" runat="server" meta:resourcekey="lblWebphone1Resource1"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="Label30" runat="server" Text="網路分機2" meta:resourcekey="Label30Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtWebphone2" runat="server" Columns="30" MaxLength="255"
                meta:resourcekey="txtWebphone2Resource1"></asp:TextBox>
            <asp:Label ID="lblWebphone2" runat="server"
                meta:resourcekey="lblWebphone2Resource1"></asp:Label>
        </td>
    </tr>
    <tr id="trWebMail" runat="server">
        <td style="white-space: nowrap">
            <asp:Label ID="lblWebMailAccount" runat="server" Text="WebMail帳號" meta:resourcekey="lblWebMailAccountResource1"></asp:Label>
        </td>
        <td valign="top">
            <asp:TextBox ID="txtWebMailAccount" runat="server" MaxLength="50" autocomplete="new-password" AutoCompleteType="Disabled" meta:resourcekey="txtWebMailAccountResource1"></asp:TextBox>
            <asp:Label ID="lblWebMailAccount1" runat="server" meta:resourcekey="lblWebMailAccount1Resource1"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="lblWebMailPWD" runat="server" Text="WebMail密碼" meta:resourcekey="lblWebMailPWDResource1"></asp:Label>
        </td>
        <td valign="top">
            <asp:TextBox ID="txtWebMailPWD" runat="server" TextMode="Password" autocomplete="new-password" AutoCompleteType="Disabled" MaxLength="128" meta:resourcekey="txtWebMailPWDResource1"></asp:TextBox>
            <asp:Label ID="lblWebMailPWD1" runat="server" meta:resourcekey="lblWebMailPWD1Resource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap;vertical-align:middle;">
            <asp:Label ID="Label17" runat="server" Text="專長" meta:resourcekey="Label17Resource1"></asp:Label>
        </td>
        <td style="vertical-align:middle;">
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </td>
        <td style="white-space: nowrap;vertical-align:middle;">
            <asp:Label ID="Label19" runat="server" Text="討論區簽名" meta:resourcekey="Label19Resource1"></asp:Label>
        </td>
        <td style="vertical-align:middle;">
            <asp:TextBox ID="txtSign" runat="server" TextMode="MultiLine" Height="200px" Width="100%" meta:resourcekey="txtSignResource1"></asp:TextBox>
            <asp:Label ID="lblSign" runat="server" meta:resourcekey="lblSignResource1"></asp:Label>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="CheckSignLength" Display="Dynamic"
                ControlToValidate="txtSign" ErrorMessage="字串長度超過255" ForeColor="Red" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap;vertical-align:middle;">
            <asp:Label ID="Label28" runat="server" Text="電子簽章" meta:resourcekey="Label28Resource1"></asp:Label></td>
        <td>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table width="100%">
                        <tr>
                            <td>
                                <telerik:RadToolBar ID="RadToolBar1" runat="server" SingleClick="None" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="Infomation_Employee_RadToolBar1_ButtonClicking" Width="100%" meta:resourcekey="RadToolBar1Resource1">
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" Value="Insert" Text="新增"
                                                                        DisabledImageUrl="~/Common/Images/Icon/icon_m71.png" HoveredImageUrl="~/Common/Images/Icon/icon_m71.png"
                                                                        ImageUrl="~/Common/Images/Icon/icon_m71.png"
                                                                        CheckedImageUrl="~/Common/Images/Icon/icon_m71.png" meta:resourcekey="RadToolBarButtonResource1">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
                                                                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.png" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
                                                                        ImageUrl="~/Common/Images/Icon/icon_m03.png"
                                                                        CheckedImageUrl="~/Common/Images/Icon/icon_m03.png" meta:resourcekey="RadToolBarButtonResource3">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server"  Text="取消預設" Value="Cancel"
                                                                        DisabledImageUrl="~/Common/Images/Icon/icon_m03_g.png" HoveredImageUrl="~/Common/Images/Icon/icon_m03_g.png"
                                                                        ImageUrl="~/Common/Images/Icon/icon_m03_g.png"
                                                                        CheckedImageUrl="~/Common/Images/Icon/icon_m03_g.png" meta:resourcekey="RadToolBarButtonResource5">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6">
                                        </telerik:RadToolBarButton>
                                    </Items>
                                </telerik:RadToolBar>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="True"
                                    AutoGenerateColumns="False"
                                    Width="500px"
                                    DataKeyOnClientWithCheckBox="False"
                                    PageSize="5"
                                    EnhancePager="True" DataKeyNames="SIGN_GUID"
                                    OnRowDataBound="Grid1_RowDataBound" AllowSorting="True"
                                    OnRowCommand="Grid1_RowCommand" DefaultSortDirection="Ascending"
                                     EmptyDataText="沒有資料"
                                    KeepSelectedRows="False" meta:resourcekey="Grid1Resource3" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""  >
                                    <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>

                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="預設" meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChecked" runat="server"
                                                    meta:resourcekey="lblCheckedResource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="電子簽章" meta:resourcekey="TemplateFieldResource2">
                                            <ItemTemplate>
                                                <asp:Image ID="imgElecSign" runat="server" Height="75px" Width="75px"
                                                    meta:resourcekey="imgElecSignResource1" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="建立時間" meta:resourcekey="TemplateFieldResource3">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCreateDate" runat="server" Text='<%#: Eval("CREATE_DATE") %>'
                                                    meta:resourcekey="lblCreateDateResource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField HeaderText="動作" SelectText="設為預設值" ShowSelectButton="True"
                                            meta:resourcekey="CommandFieldResource1" />
                                        <asp:TemplateField HeaderText="SIGN_GUID" Visible="False"
                                            meta:resourcekey="TemplateFieldResource4">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSignGuid" runat="server" Text='<%#: Eval("SIGN_GUID") %>'
                                                    meta:resourcekey="lblSignGuidResource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DEFAULT_SIGN" Visible="False"
                                            meta:resourcekey="TemplateFieldResource5">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDefaultSign" runat="server"
                                                    meta:resourcekey="lblDefaultSignResource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="IS_SAVE" Visible="False"
                                            meta:resourcekey="TemplateFieldResource6">
                                            <ItemTemplate>
                                                <asp:Label ID="lblIsSave" runat="server" Text='<%#: Eval("IS_SAVE") %>'
                                                    meta:resourcekey="lblIsSaveResource1"></asp:Label>
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
        <td style="white-space: nowrap;vertical-align:middle;">
            <asp:Label ID="Label32" runat="server" Text="私人訊息簽名" meta:resourcekey="Label32Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtMessageSign" runat="server" TextMode="MultiLine" Height="200px" Width="100%" meta:resourcekey="txtMessageSignResource1"></asp:TextBox>
            <asp:Label ID="lblMessageSign" runat="server" meta:resourcekey="lblMessageSignResource1"></asp:Label>
            <asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="CheckSignLength" Display="Dynamic"
                ControlToValidate="txtMessageSign" ErrorMessage="字串長度超過255" ForeColor="Red" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="lblOption1Name" runat="server" Text="其它1"
                meta:resourcekey="lblOption1NameResource1"></asp:Label></td>
        <td valign="top">
            <asp:TextBox ID="txtOption1Value" runat="server" MaxLength="50"
                meta:resourcekey="txtOption1ValueResource1"></asp:TextBox>
            <asp:Label ID="lblOption1Value" runat="server"
                meta:resourcekey="lblOption1ValueResource1"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="lblOption2Name" runat="server" Text="其它2"
                meta:resourcekey="lblOption2NameResource1"></asp:Label></td>
        <td valign="top">
            <asp:TextBox ID="txtOption2Value" runat="server" MaxLength="50"
                meta:resourcekey="txtOption2ValueResource1"></asp:TextBox>
            <asp:Label ID="lblOption2Value" runat="server"
                meta:resourcekey="lblOption2ValueResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="lblOption3Name" runat="server" Text="其它3"
                meta:resourcekey="lblOption3NameResource1"></asp:Label></td>
        <td valign="top">
            <asp:TextBox ID="txtOption3Value" runat="server" MaxLength="50"
                meta:resourcekey="txtOption3ValueResource1"></asp:TextBox>
            <asp:Label ID="lblOption3Value" runat="server"
                meta:resourcekey="lblOption3ValueResource1"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="lblOption4Name" runat="server" Text="其它4"
                meta:resourcekey="lblOption4NameResource1"></asp:Label></td>
        <td valign="top">
            <asp:TextBox ID="txtOption4Value" runat="server" MaxLength="50"
                meta:resourcekey="txtOption4ValueResource1"></asp:TextBox>
            <asp:Label ID="lblOption4Value" runat="server"
                meta:resourcekey="lblOption4ValueResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="lblOption5Name" runat="server" Text="其它5"
                meta:resourcekey="lblOption5NameResource1"></asp:Label></td>
        <td valign="top">
            <asp:TextBox ID="txtOption5Value" runat="server" MaxLength="50"
                meta:resourcekey="txtOption5ValueResource1"></asp:TextBox>
            <asp:Label ID="lblOption5Value" runat="server"
                meta:resourcekey="lblOption5ValueResource1"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:Label ID="lblOption6Name" runat="server" Text="其它6"
                meta:resourcekey="lblOption6NameResource1"></asp:Label></td>
        <td valign="top">
            <asp:TextBox ID="txtOption6Value" runat="server" MaxLength="50"
                meta:resourcekey="txtOption6ValueResource1"></asp:TextBox>
            <asp:Label ID="lblOption6Value" runat="server"
                meta:resourcekey="lblOption6ValueResource1"></asp:Label>
        </td>
    </tr>

    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="lblPersonal1Name" runat="server" Text="個人資料1" meta:resourcekey="lblPersonal1NameResource1"></asp:Label></td>
        <td valign="top">
            <asp:TextBox ID="txtPersonal1Value" runat="server" MaxLength="50" meta:resourcekey="txtPersonal1ValueResource1"></asp:TextBox></td>
        <td style="white-space: nowrap">
            <asp:Label ID="lblPersonal2Name" runat="server" Text="個人資料2" meta:resourcekey="lblPersonal2NameResource1"></asp:Label></td>
        <td valign="top">
            <asp:TextBox ID="txtPersonal2Value" runat="server" MaxLength="50" meta:resourcekey="txtPersonal2ValueResource1"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="lblPersonal3Name" runat="server" Text="個人資料3" meta:resourcekey="lblPersonal3NameResource1"></asp:Label></td>
        <td valign="top">
            <asp:TextBox ID="txtPersonal3Value" runat="server" MaxLength="50" meta:resourcekey="txtPersonal3ValueResource1"></asp:TextBox></td>
        <td style="white-space: nowrap">
            <asp:Label ID="lblPersonal4Name" runat="server" Text="個人資料4" meta:resourcekey="lblPersonal4NameResource1"></asp:Label></td>
        <td valign="top">
            <asp:TextBox ID="txtPersonal4Value" runat="server" MaxLength="50" meta:resourcekey="txtPersonal4ValueResource1"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <asp:Label ID="lblPersonal5Name" runat="server" Text="個人資料5" meta:resourcekey="lblPersonal5NameResource1"></asp:Label></td>
        <td valign="top">
            <asp:TextBox ID="txtPersonal5Value" runat="server" MaxLength="50" meta:resourcekey="txtPersonal5ValueResource1"></asp:TextBox></td>
        <td style="white-space: nowrap">
            <asp:Label ID="lblPersonal6Name" runat="server" Text="個人資料6" meta:resourcekey="lblPersonal6NameResource1"></asp:Label></td>
        <td valign="top">
            <asp:TextBox ID="txtPersonal6Value" runat="server" MaxLength="50" meta:resourcekey="txtPersonal6ValueResource1"></asp:TextBox></td>
    </tr>


    <tr>
        <td colspan="4" style="text-align: center;">
            <telerik:RadButton ID="rbtnSave" runat="server" Text="儲存"
                OnClick="rbtnSave_Click" meta:resourcekey="rbtnSaveResource1" style="position: relative;">
            </telerik:RadButton>
        </td>
    </tr>
</table>
<asp:Label ID="lblSelect" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectResource1"></asp:Label>
<asp:Label ID="msgFemale" runat="server" Text="女" Visible="False" meta:resourcekey="msgFemaleResource1"></asp:Label>
<asp:Label ID="msgMale" runat="server" Text="男" Visible="False" meta:resourcekey="msgMaleResource1"></asp:Label>
<asp:Label ID="msgMaster" runat="server" Text="主要 : " Visible="False" meta:resourcekey="msgMasterResource1"></asp:Label>
<asp:Label ID="msgGroup1" runat="server" Text="兼任一 : " Visible="False" meta:resourcekey="msgGroup1Resource1"></asp:Label>
<asp:Label ID="msgGroup2" runat="server" Text="兼任二 : " Visible="False" meta:resourcekey="msgGroup2Resource1"></asp:Label>
<asp:Label ID="msgGroup3" runat="server" Text="兼任三 : " Visible="False" meta:resourcekey="msgGroup3Resource1"></asp:Label>
<asp:Label ID="msgGroup4" runat="server" Text="兼任四 : " Visible="False" meta:resourcekey="msgGroup4Resource1"></asp:Label>
<asp:Label ID="msgGroup5" runat="server" Text="兼任五 : " Visible="False" meta:resourcekey="msgGroup5Resource1"></asp:Label>
<asp:Label ID="msgGroup6" runat="server" Text="兼任六 : " Visible="False" meta:resourcekey="msgGroup6Resource1"></asp:Label>
<asp:Label ID="msgGroup7" runat="server" Text="兼任七 : " Visible="False" meta:resourcekey="msgGroup7Resource1"></asp:Label>
<asp:Label ID="msgGroup8" runat="server" Text="兼任八 : " Visible="False" meta:resourcekey="msgGroup8Resource1"></asp:Label>
<asp:Label ID="msgGroup9" runat="server" Text="兼任九 : " Visible="False" meta:resourcekey="msgGroup9Resource1"></asp:Label>
<asp:Label ID="msgChangepw" runat="server" Text="變更密碼" Visible="False" meta:resourcekey="msgChangepwResource1"></asp:Label>
<asp:Label ID="msgSave" runat="server" meta:resourcekey="msgSaveResource1" Text="儲存" Visible="False"></asp:Label>
<asp:Label ID="msgFileGroupId" runat="server" Visible="False" meta:resourcekey="msgFileGroupIdResource1"></asp:Label>
<asp:Label ID="msgTitle" runat="server" Text="職級 : " Visible="False" meta:resourcekey="msgTitleResource1"></asp:Label>
<asp:Label ID="msgFunction" runat="server" Text="職務 : " Visible="False" meta:resourcekey="msgFunctionResource1"></asp:Label>
<asp:Label runat="server" ID="lbConfirmDelete" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
<asp:Label ID="lblNoProxy" runat="server" Text="不使用" Visible="False" meta:resourcekey="lblNoProxyResource1"></asp:Label>
<asp:Label ID="lblAlertUpdateMsg" runat="server" Text="系統已啟用個人資料更新功能，請您立即進行個人資料更新，謝謝!" Visible="False" meta:resourcekey="lblAlertUpdateMsgResource1"></asp:Label>
<asp:HiddenField ID="hidQRcodeInfo" runat="server" />
<asp:HiddenField ID="hfCurrentUser" runat="server" />