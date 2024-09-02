<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BulletinUpdateFieldUC.ascx.cs" Inherits="Ede.Uof.Web.EIP.Bulletin.WKFOptionalFields.BulletinUpdateFieldUC" EnableTheming="true" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>
<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc1" TagName="UC_HtmlEditor" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>




<telerik:RadScriptBlock runat="server">
     <script type="text/javascript">

         Sys.Application.add_load(function () {
             DisplayPrintBtn();
             DisplayExternalPrintBtn();
             DisplayExternalBtn();

             if (!$("#<%= rbPublishDate.ClientID %>").is(":disabled")) {
                var PublishisChecked = $("#<%= rbPublishDate.ClientID %>").is(":checked");
                 var publishDate = $find("<%= RadDatePublish.ClientID %>");
                 var publictime = $('#<%=ddlPublishTime.ClientID%>');
                 if (publishDate != null)
                     publishDate.set_enabled(PublishisChecked);
                 if (publictime != null)
                     publictime.prop("disabled", !PublishisChecked);
            }
            if (!$("#<%= rbCloseDate.ClientID %>").is(":disabled")) {
                 var OffShelfisChecked = $("#<%= rbCloseDate.ClientID %>").is(":checked");
                var offShelfDate = $find("<%= RadDateClose.ClientID %>");
                var offtime = $('#<%=ddlOffShelfTime.ClientID%>');
                if (offShelfDate != null)
                    offShelfDate.set_enabled(OffShelfisChecked);
                if (offtime != null)
                    offtime.prop("disabled", !OffShelfisChecked);
             }
         });

         //列印控制
         function DisplayPrintBtn() {

             var cb = $("#<%=cbPrint.ClientID %>");
            var btnEditIn = $find('<%=((RadButton)UC_ChoiceListPrint.FindControl("btnEdit2")).ClientID %>');
            if (btnEditIn != null) {
                if (cb.prop("checked")) {
                    btnEditIn.set_enabled(true);
                }
                else {
                    btnEditIn.set_enabled(false);
                }
            }
         }
         //外部列印控制
         function DisplayExternalPrintBtn() {
             var cbExternal = $("#<%=cbExternalPrint.ClientID %>");
            var btnEditIn = $find('<%=((RadButton)UC_ChoiceListExternalPrint.FindControl("btnEdit2")).ClientID %>');

            if (btnEditIn != null) {
                if (cbExternal.prop("checked")) {
                    btnEditIn.set_enabled(true);
                }
                else {
                    btnEditIn.set_enabled(false);
                }
            }
         }
         //外部發佈控制
         function DisplayExternalBtn() {
            var cbPublishExternal = $("#<%=cbPublishExternal.ClientID %>");
            var pnlSyncOuter = $("#<%=pnlSyncOuter.ClientID %>");

            var cbPublishExternal = $("#<%=cbPublishExternal.ClientID %>");
            var pnlSyncOuter = $("#<%=pnlSyncOuter.ClientID %>");
            var cbPublishExternalChecked = $('#<%=cbPublishExternal.ClientID %>').is(":checked");
            var cbShowReaderChecked = $('#<%=cbShowReader.ClientID %>').is(":checked");
            var cbOuterBulletin = $('#<%=cbOuterBulletin.ClientID %>');
            var cbOuterBulletinDisabled = cbShowReaderChecked && cbPublishExternalChecked;

            if (!cbOuterBulletinDisabled) {
                cbOuterBulletin.attr('disabled', 'disabled');
                cbOuterBulletin.prop('checked', false);
            }
            else {
                cbOuterBulletin.removeAttr('disabled');
            }



            if (cbPublishExternal.prop("checked")) {
                pnlSyncOuter.show();
            } else {
                pnlSyncOuter.hide();
            }
         }

         //變更公告類別
         function cvCheckBulletinClass(source, args) {
             var hfBulletinClass = $('#<%=hfBulletinClass.ClientID %>');
             if (hfBulletinClass.val() == null || hfBulletinClass.val() == "") {
                 args.IsValid = false;
                 return;
             }
         }

         //發佈對象控制
         function cvCheckPublicPeople(source, args) {
             var hfPublish = $('#<%=hfPublish.ClientID %>').val();
             if ((hfPublish == "0" || hfPublish == "")) {
                 args.IsValid = false;
                 return;
             }
         }
         //列印控制
         function cvCheckPrint(source, args) {
             var cb = $("#<%=cbPrint.ClientID %>");
            var hfPrintPeople = $('#<%=hfPrintPeople.ClientID %>').val();
            if (cb.prop("checked")) {
                if ((hfPrintPeople == "0" || hfPrintPeople == "")) {
                    args.IsValid = false;
                    return;
                }
            }

         }
         //外部對象控制
         function cvCheckExternalPeople(source, args) {
             var cb = $("#<%=cbPublishExternal.ClientID %>");
            var hfExternalPeople = $('#<%=hfExternalPeople.ClientID %>').val();
            if (cb.prop("checked")) {
                if ((hfExternalPeople == "0" || hfExternalPeople == "")) {
                    args.IsValid = false;
                    return;
                }
            }

         }
         //外部列印控制
         function cvCheckExternalPrint(source, args) {
             var cb = $("#<%=cbExternalPrint.ClientID %>");
            var hfExternalPrintPeople = $('#<%=hfExternalPrintPeople.ClientID %>').val();
            if (cb.prop("checked")) {
                if ((hfExternalPrintPeople == "0" || hfExternalPrintPeople == "")) {
                    args.IsValid = false;
                    return;
                }
            }

         }
         //外部類別控制
         function cvCheckExternalClass(source, args) {
             var cb = $("#<%=cbPublishExternal.ClientID %>");
            if (cb.prop("checked")) {
                var Class = $('#<%=hfExternalClass.ClientID %>').val();
                if (Class == "") {
                    args.IsValid = false;
                    return;
                }
            }
         }
         //下架日期輸入控制
         function cvCheckNoOffDate(source, args) {
             var rbOff = $('#<%=rbCloseDate.ClientID %>');
            if (rbOff.prop("checked")) {
                var offDate = $find('<%=RadDateClose.ClientID %>').get_selectedDate();
                if (offDate == null) {
                    args.IsValid = false;
                    return;
                }
            }
         }
         //下架日期驗證
         function cvCheckOffDate(source, args) {
             var rbOff = $('#<%=rbCloseDate.ClientID %>');
            if (rbOff.prop("checked")) {
                var offDate = $find('<%=RadDateClose.ClientID %>').get_selectedDate();
            var offtime = $('#<%=ddlOffShelfTime.ClientID%>').val();
            offDate.setMinutes(parseInt(offtime));
            offDate = offDate.format('yyyy/MM/dd HH:mm');
            var data = [offDate];
            var result = $uof.pageMethod.syncUc("EIP/Bulletin/WKFOptionalFields/BulletinUpdateFieldUC.ascx", "CheckLargeThanToday", data);
            if (result == "false") {
                args.IsValid = false;
                return;
            }

            }
         }
         //上架日期輸入控制
         function cvCheckNoPublicDate(source, args) {
             var rbPublic = $('#<%=rbPublishDate.ClientID %>');
        if (rbPublic.prop("checked")) {
            var publicDate = $find('<%=RadDatePublish.ClientID%>').get_selectedDate();
             if (publicDate == null) {
                 args.IsValid = false;
                 return;
             }
         }
         }
         //上架日期驗證
         function cvCheckPublicDate(source, args) {
             var rbPublic = $('#<%=rbPublishDate.ClientID %>');
        if (rbPublic.prop("checked")) {
            var publicDate = $find('<%=RadDatePublish.ClientID%>').get_selectedDate();
            var publictime = $('#<%=ddlPublishTime.ClientID%>').val();
            publicDate.setMinutes(parseInt(publictime));
            publicDate = publicDate.format('yyyy/MM/dd HH:mm');
            var data = [publicDate];
            var result = $uof.pageMethod.syncUc("EIP/Bulletin/WKFOptionalFields/BulletinUpdateFieldUC.ascx", "CheckLargeThanToday", data);

            if (result == "false") {
                args.IsValid = false;
                return;
            }
         }
         }

         //驗證下架日期先後 (下架日期需晚於上架日期)
    function cvCheckTwoDate(source, args) {
        var rbPublishNow = $('#<%=rbPubishNow.ClientID %>');
        var rbPublishLater = $('#<%=rbPublishDate.ClientID %>');
        var rbOff = $('#<%=rbCloseDate.ClientID %>');

        var publicdate = '<%= Ede.Uof.Utility.UofTime.GetSystemNowForUi().DateTime.ToString("yyyy/MM/dd") %>';
        var timeHour = '<%= Ede.Uof.Utility.UofTime.GetSystemNowForUi().DateTime.ToString("HH") %>';
        var timeMinute = '<%= Ede.Uof.Utility.UofTime.GetSystemNowForUi().DateTime.ToString("mm") %>';
        var publictime = parseInt(timeHour) * 60 + parseInt(timeMinute);

        if (rbOff.prop("checked")) {
            if (rbPublishLater.prop("checked")) {
                publicdate = $find('<%=RadDatePublish.ClientID %>').get_selectedDate();
                publictime = $('#<%=ddlPublishTime.ClientID%>').val();
                if (publicdate != null) {
                    publicdate = publicdate.format('yyyy/MM/dd');
                }
            }
            var offDate = $find('<%=RadDateClose.ClientID %>').get_selectedDate();
            var offtime = $('#<%=ddlOffShelfTime.ClientID%>').val();
            if (offDate != null) {
                offDate = offDate.format('yyyy/MM/dd');
                if ((publicdate > offDate) || ((publicdate === offDate) && (parseInt(publictime) >= parseInt(offtime)))) {
                    args.IsValid = false;
                    return;
                }
            }
        }
    }
         //外部類別權限控制
         function cvCheckClassAuthority(source, args) {
             var changeMode = $('#<%=rblMode.ClientID%>').find(":checked").val();
        var cbMode = $('#<%=cbDelExternal.ClientID %>');
         var cbExternal = $("#<%=cbPublishExternal.ClientID %>");
         var hfOuterBulletinGuid = $('#<%=hfOuterBulletinGuid.ClientID%>').val();
         if (hfOuterBulletinGuid != null && hfOuterBulletinGuid != "") {
             if ((changeMode == "delete" && cbMode.prop("checked")) || (changeMode == "update" && cbExternal.prop("checked"))) {
                 var data = [hfOuterBulletinGuid];
                 var result = $uof.pageMethod.syncUc("/EIP/Bulletin/WKFOptionalFields/BulletinUpdateFieldUC.ascx", "CheckClassAuthority", data);
                 if (result != "true") {
                     args.IsValid = false;
                     return;
                 }
             }

         }
         }
         //外部類別審核中驗證
         function cvCheckExternalProcessing(source, args) {
             var cbExternal = $("#<%=cbPublishExternal.ClientID %>");
        var changeMode = $('#<%=rblMode.ClientID%>').find(":checked").val();
         var hfExternalProcessing = $('#<%=hfExternalProcessing.ClientID%>').val();
         if (cbExternal.prop("checked") && changeMode == "update") {
             if (hfExternalProcessing == "Processing") {
                 args.IsValid = false;
                 return;
             }
         }
         }
         //刪除外部公告驗證
         function cvCheckDelExternalProcessing(source, args) {
             var changeMode = $('#<%=rblMode.ClientID%>').find(":checked").val();
        var cbDelExternal = $('#<%=cbDelExternal.ClientID%>')
         var hfExternalProcessing = $('#<%=hfExternalProcessing.ClientID%>').val();
         if (cbDelExternal.prop("checked") && changeMode == "delete") {
             if (hfExternalProcessing == "Processing") {
                 args.IsValid = false;
                 return;
             }
         }
         }

         function OpenDatePicker(isOpen, dateType) {
             if (dateType == "Publish") {
                 $find("<%= RadDatePublish.ClientID %>").set_enabled(isOpen);
                $('#<%=ddlPublishTime.ClientID%>').prop("disabled", !isOpen);
            }
            else if (dateType == "OffShelf") {
                $find("<%= RadDateClose.ClientID %>").set_enabled(isOpen);
                $('#<%=ddlOffShelfTime.ClientID%>').prop("disabled", !isOpen);
             }

             if (dateType === false)
                 datePicker.clear();
         }
         function CheckSupportMobile(e, args) {
             var mobileUi = "<%=_MobileUI%>";
             if (mobileUi == "true") {
                 args.IsValid = false;
             }
         }
    </script>
</telerik:RadScriptBlock>
    <style type="text/css">
    div.JustAddBorder span.JustAddBorder table tr td {
        border-width: 1px;
        border-style: solid;
    }
</style>


<%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>--%>
<div>
    <asp:Label ID="lblNotSupport" runat="server" Text="此欄位不允許在App編輯" Visible="False" ForeColor="Red" meta:resourcekey="lblNotSupportResource1"></asp:Label>
    <asp:CustomValidator ID="cvCheckSupportMobile" runat="server" ForeColor="Red" ErrorMessage="此欄位不允許在App編輯" Display="Dynamic"
                            ClientValidationFunction="CheckSupportMobile" meta:resourcekey="cvCheckSupportMobileResource1"></asp:CustomValidator>
</div>
<table style="width: 1000px" class="PopTable">
    <tr>
        <td style="width: 140px; white-space: nowrap;">
            <asp:Label ID="Label1" runat="server" Text="變更模式" meta:resourcekey="Label1Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblMode" runat="server" meta:resourcekey="lblModeResource1"></asp:Label>
            <asp:RadioButtonList ID="rblMode" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rblMode_SelectedIndexChanged" meta:resourcekey="rblModeResource1">
                <asp:ListItem Value="update" Text="更新" Selected="True" meta:resourcekey="ListItemResource1"></asp:ListItem>
                <asp:ListItem Value="delete" Text="刪除" meta:resourcekey="ListItemResource2"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr runat="server" id="trClass">
        <td style="width: 140px; white-space: nowrap;">
            <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label5Resource1"></asp:Label>
            <asp:Label ID="Label4" runat="server" Text="公告" meta:resourcekey="Label4Resource1"></asp:Label>
        </td>
        <td>

            <telerik:RadButton ID="btnBulletinClass" runat="server" Text="選擇公告" CausesValidation="False" OnClick="btnBulletinClass_Click" meta:resourcekey="btnBulletinClassResource1" Style="position: relative;"></telerik:RadButton>
            <asp:HiddenField ID="hfBulletinClass" runat="server" />
            <asp:HiddenField ID="hfBulletinGuid" runat="server" />
            <asp:CustomValidator ID="cvBulletinClass" runat="server" ErrorMessage="請選擇公告類別" Display="Dynamic"
                ClientValidationFunction="cvCheckBulletinClass" meta:resourcekey="cvBulletinClassResource1"></asp:CustomValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 140px; white-space: nowrap;">
            <asp:Label ID="Label23" runat="server" Text="類別" meta:resourcekey="Label23Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblBulletinClass" runat="server" meta:resourcekey="lblBulletinClassResource1"></asp:Label>
            <telerik:RadButton ID="btnChangeBulletinClass" runat="server" Text="變更類別" AutoPostBack="False" CausesValidation="False" OnClick="btnChangeBulletinClass_Click" meta:resourcekey="btnChangeBulletinClassResource1" Style="position: relative;"></telerik:RadButton>
        </td>
    </tr>
    <tr runat="server" id="trDelMode">
        <td style="width: 140px; white-space: nowrap;">
            <asp:Label ID="Label22" runat="server" Text="刪除外部公告" meta:resourcekey="Label22Resource1"></asp:Label>
        </td>
        <td style="white-space: nowrap;">
            <asp:CheckBox ID="cbDelExternal" runat="server" meta:resourcekey="cbDelExternalResource1" />
            <asp:Label ID="lblDelMode" runat="server" meta:resourcekey="lblDelModeResource1"></asp:Label>
            <asp:CustomValidator ID="cbCheckDelIsApprove" runat="server" ErrorMessage="外部公告正在審核中，不允許異動外部公告"
                ClientValidationFunction="cvCheckDelExternalProcessing" Display="Dynamic" meta:resourcekey="cvIsApproveResource1"></asp:CustomValidator>
            <asp:CustomValidator ID="cvCheckDelAuthority" runat="server" Display="Dynamic" ErrorMessage="無該外部類別發佈權限，請重新選擇" ClientValidationFunction="cvCheckClassAuthority" meta:resourcekey="cvCheckDelAuthorityResource1"></asp:CustomValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 140px; white-space: nowrap;">
            <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label6Resource1"></asp:Label>
            <asp:Label ID="Label7" runat="server" Text="主題" meta:resourcekey="Label7Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblSubject" runat="server" meta:resourcekey="lblSubjectResource1"></asp:Label>
            <asp:TextBox ID="txtSubject" runat="server" Width="100%" meta:resourcekey="txtSubjectResource1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="cvCheckSubject" runat="server" ErrorMessage="請輸入主題" Display="Dynamic"
                ControlToValidate="txtSubject" meta:resourcekey="cvCheckSubjectResource1"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 140px; white-space: nowrap;">
            <asp:Label ID="Label2" runat="server" Text="張貼者" meta:resourcekey="Label2Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblPublisher" runat="server" meta:resourcekey="lblPublisherResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 140px; white-space: nowrap;">
            <asp:Label ID="Label3" runat="server" Text="張貼者部門" meta:resourcekey="Label3Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblPublishDept" runat="server" meta:resourcekey="lblPublishDeptResource1"></asp:Label>
        </td>
    </tr>
    <tr runat="server" id="RunHorseLightTR">
        <td style="width: 140px; white-space: nowrap;">
            <asp:Label ID="Label8" runat="server" Text="跑馬燈" meta:resourcekey="Label8Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbRunHorseLight" runat="server" Text="顯示於跑馬燈" meta:resourcekey="cbRunHorseLightResource1" />
            <asp:Label ID="lblRunHorseLight" runat="server" meta:resourcekey="lblRunHorseLightResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 140px; white-space: nowrap;">
            <asp:Label ID="Label19" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label19Resource1"></asp:Label>
            <asp:Label ID="Label9" runat="server" Text="發佈對象" meta:resourcekey="Label9Resource1"></asp:Label>
        </td>
        <td>
            <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceListPublish"  TreeHeight="68" ExpandToUser="false" ShowMember="false" OnEditButtonOnClick="UC_ChoiceListPublish_EditButtonOnClick" />            
            <asp:Label ID="lblShowReader" runat="server" meta:resourcekey="lblShowReaderResource1"></asp:Label>
            <asp:CheckBox ID="cbShowReader" runat="server" Text="瀏覽時顯示" onclick="DisplayExternalBtn();" meta:resourcekey="cbShowReaderResource1" />
            <asp:HiddenField ID="hfPublish" runat="server" />
            <asp:CustomValidator ID="cvCheckPublicPeople" runat="server" ErrorMessage="請選擇發佈對象"
                ClientValidationFunction="cvCheckPublicPeople" Display="Dynamic" meta:resourcekey="cvCheckPublicPeopleResource1"></asp:CustomValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 140px; white-space: nowrap;">
            <asp:Label ID="Label13" runat="server" Text="發佈通知" meta:resourcekey="Label13Resource1"></asp:Label>
        </td>
        <td>
            <asp:RadioButtonList ID="rbSyncMSG" runat="server" RepeatDirection="Horizontal" meta:resourcekey="rbSyncMSGResource1">
                <asp:ListItem Value="Y" Text="所有發佈對象" Selected="True" meta:resourcekey="ListItemResource3"></asp:ListItem>
                <asp:ListItem Value="N" Text="發佈對象中的訂閱者" meta:resourcekey="ListItemResource4"></asp:ListItem>
                <asp:ListItem Value="X" Text="不通知" meta:resourcekey="ListItemResource5"></asp:ListItem>
            </asp:RadioButtonList>
            <asp:Label ID="lblMessageTo" runat="server" meta:resourcekey="lblMessageToResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 140px; white-space: nowrap;">
            <asp:Label ID="Label10" runat="server" Text="上架" meta:resourcekey="Label10Resource1"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:RadioButton ID="rbPubishNow" runat="server" GroupName="Publish" Text="立即上架" Checked="True" meta:resourcekey="rbPubishNowResource1"  onClick="OpenDatePicker(false, 'Publish')"/>
            <asp:RadioButton ID="rbPublishDate" runat="server" GroupName="Publish" Text="上架時間" meta:resourcekey="rbPublishDateResource1"  onClick="OpenDatePicker(true, 'Publish')"/>
            <telerik:RadDatePicker ID="RadDatePublish" runat="server" meta:resourcekey="RadDatePublishResource1">
            </telerik:RadDatePicker>
            <asp:DropDownList ID="ddlPublishTime" runat="server" ></asp:DropDownList>
            <asp:CustomValidator ID="cvNoPublicDate" runat="server" Display="Dynamic" ErrorMessage="請輸入日期" ClientValidationFunction="cvCheckNoPublicDate" meta:resourcekey="cvNoPublicDateResource1"></asp:CustomValidator>
            <asp:Label runat="server" ID="lblPublishTime" meta:resourcekey="lblPublishTimeResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 140px; white-space: nowrap;">
            <asp:Label ID="Label11" runat="server" Text="下架" meta:resourcekey="Label11Resource1"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:RadioButton ID="rbNeverClose" runat="server" GroupName="Close" Text="永不下架" Checked="True" meta:resourcekey="rbNeverCloseResource1"  onClick="OpenDatePicker(false, 'OffShelf')"/>
            <asp:RadioButton ID="rbCloseDate" runat="server" GroupName="Close" Text="下架時間" meta:resourcekey="rbCloseDateResource1"  onClick="OpenDatePicker(true, 'OffShelf')"/>
            <telerik:RadDatePicker ID="RadDateClose" runat="server" meta:resourcekey="RadDateCloseResource1">
                </telerik:RadDatePicker>
            <asp:DropDownList ID="ddlOffShelfTime" runat="server" ></asp:DropDownList>
            <asp:CustomValidator ID="cvNoOffDate" runat="server" Display="Dynamic" ErrorMessage="請輸入日期"
                ClientValidationFunction="cvCheckNoOffDate" meta:resourcekey="cvNoOffDateResource1"></asp:CustomValidator>
            <asp:CustomValidator ID="cvCheckOffDate" runat="server" Display="Dynamic" ErrorMessage="下架時間需晚於上架時間" ClientValidationFunction="cvCheckTwoDate" meta:resourcekey="cvCheckOffDateResource1"></asp:CustomValidator>
            <asp:Label runat="server" ID="lblCloseTime" meta:resourcekey="lblCloseTimeResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 140px; white-space: nowrap;">
            <asp:Label ID="Label12" runat="server" Text="內容" meta:resourcekey="Label12Resource1"></asp:Label>
        </td>
        <td style="vertical-align: baseline" >
            <uc1:UC_HtmlEditor runat="server" ID="UC_HtmlEditor" Width="850px" BulletinSize="true" ModuleName="WKF" SubFolder="BULLETIN" />
            <asp:Panel ID="pnlContent" runat="server" ScrollBars="Auto" Class="editorcontentstyle JustAddBorder" meta:resourcekey="pnlContentResource1">
            <asp:Label runat="server" ID="lblHtmlEditor" CssClass="editorcontentstyle JustAddBorder" meta:resourcekey="lblHtmlEditorResource1"></asp:Label>
            </asp:Panel>

            <asp:HiddenField ID="hfFileGroupID" runat="server" />
        </td>
    </tr>
    <tr runat="server" id="attatchmentTR">
        <td style="width: 140px; white-space: nowrap;">
            <asp:Label ID="Label14" runat="server" Text="附件" meta:resourcekey="Label14Resource1"></asp:Label>
        </td>
        <td>
            <uc2:UC_FileCenter runat="server" ID="UC_FileCenter" Editable="false" UploadEnabled="false" ModuleName="WKF" ProxyEnabled="false" />
        </td>
    </tr>
    <tr runat="server" id="trPrint">
        <td style="width: 140px; white-space: nowrap;">
            <asp:Label ID="Label15" runat="server" Text="列印控制" meta:resourcekey="Label15Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbPrint" runat="server" Text="只允許下列人員列印 (若未勾選此項則所有人皆可列印)" meta:resourcekey="cbPrintResource1" />
            <asp:Label ID="lblAllowPrint" runat="server" meta:resourcekey="lblAllowPrintResource1"></asp:Label>
            <asp:Panel runat="server" ID="pnlPrint" meta:resourcekey="pnlPrintResource1">
                <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceListPrint" ExpandToUser="false" ShowEmployee="false" OnEditButtonOnClick="UC_ChoiceListPrint_EditButtonOnClick1" />
            </asp:Panel>
            <asp:HiddenField ID="hfPrintPeople" runat="server" />
            <asp:CustomValidator ID="cvCheckPrint" runat="server" ErrorMessage="請選擇列印對象"
                ClientValidationFunction="cvCheckPrint" Display="Dynamic" meta:resourcekey="cvCheckPrintResource1"></asp:CustomValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 140px; white-space: nowrap;">
            <asp:Label ID="Label16" runat="server" Text="外部發佈" meta:resourcekey="Label16Resource1"></asp:Label>
        </td>
        <td>
            <table>
                <tr>
                    <td>
                        <asp:CheckBox ID="cbPublishExternal" runat="server" Text="同步複製到外部公告 (公告類別為內部公告方可啟用)" Enabled="False" onclick="DisplayExternalBtn();" meta:resourcekey="cbPublishExternalResource1" />
                        <asp:Label ID="lblIfSync" runat="server" meta:resourcekey="lblIfSyncResource1"></asp:Label>
                        &nbsp;
                        <asp:LinkButton ID="lbtnExternalLinK" runat="server" Text="查看外部公告內容" Visible="false" meta:resourcekey="lbtnExternalLinKResource1" ></asp:LinkButton>     
                    </td>
                </tr>
            </table>

            <asp:Panel ID="pnlSyncOuter" runat="server" meta:resourcekey="pnlSyncOuterResource1">
                <table class="PopTable" cellspacing="1">
                    <tr>
                        <td style="width: 100px;" class="PopTableLeftTD" runat="server" id="td1">
                            <asp:Label ID="Label20" runat="server" Text="外部類別" meta:resourcekey="Label20Resource1"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblExternalClass" runat="server" meta:resourcekey="lblExternalClassResource1"></asp:Label>
                            <telerik:RadButton ID="btnExternalBulletinClass" runat="server" Text="選擇類別" AutoPostBack="False" CausesValidation="False" OnClick="btnExternalBulletinClass_Click" meta:resourcekey="btnExternalBulletinClassResource1"></telerik:RadButton>                           
                            <asp:HiddenField ID="hfExternalClass" runat="server" />
                            <asp:CustomValidator ID="cvSyncAuthority" runat="server" Display="Dynamic" ErrorMessage="無該外部類別發佈權限，請重新選擇" ClientValidationFunction="cvCheckClassAuthority" meta:resourcekey="cvSyncAuthorityResource1"></asp:CustomValidator>
                            <asp:CustomValidator ID="cvCheckExternalClass" runat="server" ErrorMessage="請選擇類別"
                                ClientValidationFunction="cvCheckExternalClass" Display="Dynamic" meta:resourcekey="cvCheckExternalClassResource1"></asp:CustomValidator>
                            <asp:CustomValidator ID="cvIsApprove" runat="server" ErrorMessage="外部公告正在審核中，不允許異動外部公告"
                                ClientValidationFunction="cvCheckExternalProcessing" Display="Dynamic" meta:resourcekey="cvIsApproveResource1"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px;" class="PopTableLeftTD" runat="server" id="tdInernal2">
                            <asp:Label ID="Label17" runat="server" Text="外部對象" meta:resourcekey="Label17Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" runat="server" id="tdInernal3">
                            <uc1:UC_ChoiceList ID="UC_ChoiceListExternalPeople" TreeHeight="68" runat="server" ExpandToUser="false" ShowEmployee="false" OnEditButtonOnClick="UC_ChoiceListExternalPeople_EditButtonOnClick"></uc1:UC_ChoiceList>
                            <asp:Label ID="lblShowExternalReader" runat="server" Text=""></asp:Label>
                            <asp:CheckBox ID="cbShowExternalReader" runat="server" Text="瀏覽時顯示" meta:resourcekey="cbShowExternalReaderResource1" /><br>
                             <asp:Label ID="lblOuterBulletin" runat="server" Text=""></asp:Label>
                             <asp:CheckBox ID="cbOuterBulletin" runat="server" Text="同步顯示在內部公告中" Checked="false" meta:resourcekey="cbOuterBulletinReaderResource1" />                                                                                                                
                            <asp:HiddenField ID="hfExternalPeople" runat="server" />
                            <asp:CustomValidator ID="cvCheckExternalPeople" runat="server" ErrorMessage="請選擇發佈對象"
                                ClientValidationFunction="cvCheckExternalPeople" Display="Dynamic" meta:resourcekey="cvCheckExternalPeopleResource1"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; white-space:nowrap" class="PopTableLeftTD">
                            <asp:Label ID="Label21" runat="server" Text="外部發佈通知" meta:resourcekey="Label21Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" runat="server">
                            <asp:RadioButtonList ID="rbExternalMSG" runat="server" RepeatDirection="Horizontal" meta:resourcekey="rbExternalMSGResource1">
                                <asp:ListItem Value="Y" Text="所有發佈對象" Selected="True" meta:resourcekey="ListItemResource6"></asp:ListItem>
                                <asp:ListItem Value="N" Text="發佈對象中的訂閱者" meta:resourcekey="ListItemResource7"></asp:ListItem>
                                <asp:ListItem Value="X" Text="不通知" meta:resourcekey="ListItemResource8"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:Label ID="lblExternalMSG" runat="server" meta:resourcekey="lblExternalMSGResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr id="trExternalPrint" runat="server">
                        <td style="width: 100px;" class="PopTableLeftTD" runat="server" id="tdExternalPrint2">
                            <asp:Label ID="Label18" runat="server" Text="外部列印控制"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" style="vertical-align: top;" runat="server" id="tdExternalPrint3">&nbsp;
                            <asp:CheckBox ID="cbExternalPrint" runat="server" Text="只允許下列人員列印 (若未勾選此項，則所有人皆可列印)" meta:resourcekey="cbExternalPrintResource1"/>
                            <asp:Label ID="lblPrintOuter" runat="server"></asp:Label>
                            <uc1:UC_ChoiceList ID="UC_ChoiceListExternalPrint" runat="server" ExpandToUser="false" ShowEmployee="false" ShowMember="true" OnEditButtonOnClick="UC_ChoiceListExternalPrint_EditButtonOnClick" />
                            <asp:HiddenField ID="hfExternalPrintPeople" runat="server" />
                            <asp:CustomValidator ID="cvCheckExternalPrint" runat="server" ErrorMessage="請選擇列印對象"
                                ClientValidationFunction="cvCheckExternalPrint" Display="Dynamic"></asp:CustomValidator>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
</table>


<asp:HiddenField ID="hfIsInner" runat="server" />
<asp:HiddenField ID="hfSyncOuter" runat="server" />
<asp:HiddenField ID="hfOuterBulletinGuid" runat="server" />
<asp:HiddenField ID="hfChangedClassGuid" runat="server" />
<asp:HiddenField ID="hfExternalProcessing" runat="server" />
<asp:HiddenField ID="hfFieldValue" runat="server" />
<asp:HiddenField ID="hfBeforeClass" runat="server" Value="變更前公告類別" />
<asp:HiddenField ID="hfAfterClass" runat="server" Value="變更後公告類別" />
<asp:HiddenField ID="hfInnerStatus" runat="server" Value="" />
<asp:HiddenField ID="hfOuterStatus" runat="server" Value="" />
<asp:HiddenField ID="hfIsAudit" runat="server" Value="" />

<%--    </ContentTemplate>
</asp:UpdatePanel>--%>

<asp:Label ID="lblOuterBulletinGuid" runat="server" Text="" Visible="False" meta:resourcekey="lblOuterBulletinGuidResource1"></asp:Label>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblMarqueeOn" runat="server" Text="顯示於跑馬燈" Visible="False" meta:resourcekey="lblMarqueeOnResource1"></asp:Label>
<asp:Label ID="lblMarqueeOff" runat="server" Text="不顯示於跑馬燈" Visible="False" meta:resourcekey="lblMarqueeOffResource1"></asp:Label>
<asp:Label ID="lblAllowDownload" runat="server" Text="瀏覽公告時顯示附件供觀看者下載" Visible="False" meta:resourcekey="lblAllowDownloadResource1"></asp:Label>
<asp:Label ID="lblAllowAnyPrint" runat="server" Text="允許所有人員列印" Visible="False" meta:resourcekey="lblAllowAnyPrintResource1"></asp:Label>
<asp:Label ID="lblAllowSomePrint" runat="server" Text="只允許下列人員列印" Visible="False" meta:resourcekey="lblAllowSomePrintResource1"></asp:Label>
<asp:Label ID="lblAllowNonePrint" runat="server" Text="不允許所有人員列印" Visible="False" meta:resourcekey="lblAllowNonePrintResource1"></asp:Label>
<asp:Label ID="lblSyncOuter" runat="server" Text="同步複製到外部公告" Visible="False" meta:resourcekey="lblSyncOuterResource1"></asp:Label>
<asp:Label ID="lblDontSync" runat="server" Text="不同步複製到外部公告" Visible="False" meta:resourcekey="lblDontSyncResource1"></asp:Label>
<asp:Label ID="lblDelTrue" runat="server" Text="是" Visible="False" meta:resourcekey="lblDelTrueResource1"></asp:Label>
<asp:Label ID="lblDelFalse" runat="server" Text="否" Visible="False" meta:resourcekey="lblDelFalseResource1"></asp:Label>
<asp:Label ID="lblBulletinTitle" runat="server" Text="選擇公告類別" Visible="False" meta:resourcekey="lblBulletinTitleResource1"></asp:Label>
<asp:Label ID="lblIsApprove" runat="server" Text="外部公告正在審核中，此次更新只會更新內部公告" Style="display: none;" meta:resourcekey="lblIsApproveResource1"></asp:Label>
<asp:Label ID="lblShowReaderOn" runat="server" Text="瀏覽時顯示" Visible="false" meta:resourcekey="lblShowReaderOnResource1"></asp:Label>
<asp:Label ID="lblShowReaderOff" runat="server" Text="瀏覽時不顯示此欄位" Visible="false" meta:resourcekey="lblShowReaderOffResource1"></asp:Label>
<asp:Label ID="lblOuterBulletinTrue" runat="server" Text="同步顯示在內部公告中" Visible="false" meta:resourcekey="lblOuterBulletinTrueResource1"></asp:Label>
<asp:Label ID="lblOuterBulletinFalse" runat="server" Text="不同步顯示在內部公告中" Visible="false"  meta:resourcekey="lblOuterBulletinFalseResource1"></asp:Label>