<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Bulletin_WKFOptionalFields_BulletinFieldUC" Codebehind="BulletinFieldUC.ascx.cs" EnableTheming="true"%>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>
<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc1" TagName="UC_HtmlEditor" %>




<script type="text/javascript">

    Sys.Application.add_load(function () {
        ConvertPublishClass();
        ChangeExternalStatus();
        DisplayPrintBtn();
        DisplayExternalPrintBtn();

         if (!$("#<%= rbPublishDate.ClientID %>").is(":disabled")) {
             var PublishisChecked = $("#<%= rbPublishDate.ClientID %>").is(":checked");
             var PublishDate = $find("<%= RadDatePublish.ClientID %>");
             var publictime = $('#<%=ddlPublishTime.ClientID%>');
             if(PublishDate != null)
                 PublishDate.set_enabled(PublishisChecked);
             if (publictime != null)
                 publictime.prop("disabled", !PublishisChecked);
            }
            if (!$("#<%= rbCloseDate.ClientID %>").is(":disabled")) {
                var OffShelfisChecked = $("#<%= rbCloseDate.ClientID %>").is(":checked");
                var OffShelfDate = $find("<%= RadDateClose.ClientID %>");
                var offtime = $('#<%=ddlOffShelfTime.ClientID%>');
                if(OffShelfDate != null)
                    OffShelfDate.set_enabled(OffShelfisChecked);
                if (offtime != null)
                    offtime.prop("disabled", !OffShelfisChecked);
            }
    });

    //將公告類別guid轉為完整路徑 (含外部)
    function ConvertPublishClass() {
        var hfBulletinClass = $('#<%=hfBulletinClass.ClientID%>');
        var hfExternalClass = $('#<%=hfExternalClass.ClientID%>');
        var pnlPublishIn = $('#<%=pnlPublishIn.ClientID %>');
        var pnlPublishOut = $('#<%=pnlPublishOut.ClientID %>');
        var pnlPrintIn = $('#<%=pnlPrintIn.ClientID %>');
        var pnlPrintOut = $('#<%=pnlPrintOut.ClientID %>');
        if (hfBulletinClass.val() != null && hfBulletinClass.val() != '') {
            var data = [hfBulletinClass.val()];
            var lblBulletinClass = $('#<%=lblBulletinClass.ClientID%>');
            var className = $uof.pageMethod.syncUc("EIP/Bulletin/WKFOptionalFields/BulletinFieldUC.ascx", "GetClassPath", data).split(',');
            lblBulletinClass.text(className[0]);
            if (className[1] == "Inner") {
                $('#<%=cbPublishExternal.ClientID%>').prop('disabled', false);
                pnlPublishIn.show();
                pnlPublishOut.hide();
                pnlPrintIn.show();
                pnlPrintOut.hide();
            }
            else {
                $('#<%=cbPublishExternal.ClientID%>').prop('checked', false);
                $('#<%=cbPublishExternal.ClientID%>').prop('disabled', true);
                $('#<%=hfSyncOuter.ClientID%>').val('False');
                pnlPublishIn.hide();
                pnlPublishOut.show();
                pnlPrintIn.hide();
                pnlPrintOut.show();
            }
        }
        if ($('#<%=hfIsInner.ClientID%>').val() == "") {
            pnlPublishIn.show();
            pnlPublishOut.hide();
            pnlPrintIn.show();
            pnlPrintOut.hide();
        }
        if (hfExternalClass.val() != null && hfExternalClass.val() != '') {
            var data = [hfExternalClass.val()];
            var LBExternalClass = $('#<%=LBExternalClass.ClientID%>');
            LBExternalClass.text($uof.pageMethod.syncUc("EIP/Bulletin/WKFOptionalFields/BulletinFieldUC.ascx", "GetClassPath", data).split(',')[0]);
        }
    }

    //顯示列印控制按鈕
    function DisplayPrintBtn() {
        var cb = $("#<%=cbPrint.ClientID %>");
        var btnEditIn = $find('<%=((RadButton)UC_ChoiceListPrintInner.FindControl("btnEdit2")).ClientID %>');
        var btnEditOut = $find('<%=((RadButton)UC_ChoiceListPrintOuter.FindControl("btnEdit2")).ClientID %>');
        if (btnEditIn != null) {
            if (cb.prop("checked")) {
                btnEditIn.set_enabled(true);
                btnEditOut.set_enabled(true);
            }
            else {
                btnEditIn.set_enabled(false);
                btnEditOut.set_enabled(false);
            }
        }
    }

    //顯示外部列印控制按鈕
    function DisplayExternalPrintBtn() {
        var cb = $("#<%=cbExternalPrint.ClientID %>");
        var btnEdit2 = $find('<%=((RadButton)clExternalPrintPeople.FindControl("btnEdit2")).ClientID %>');
        if (btnEdit2 != null) {
            if (cb.prop("checked")) {
                btnEdit2.set_enabled(true);
            }
            else {
                btnEdit2.set_enabled(false);
            }
        }
    }


    //變更外部發佈狀態
    function ChangeExternalStatus() {
        var cbPublishExternal = $('#<%=cbPublishExternal.ClientID %>');
        var lblIfSync = $('#<%=lblIfSync.ClientID%>').text();
        var lblDontSync = '<%=lblDontSync.Text%>';
        var cbPublishExternalChecked = $('#<%=cbPublishExternal.ClientID %>').is(":checked");
        var cbShowReaderChecked = $('#<%=cbShowReader.ClientID %>').is(":checked");
        var cbOuterBulletin = $('#<%=cbOuterBulletin.ClientID %>');
         var cbOuterBulletinDisabled = cbShowReaderChecked && cbPublishExternalChecked;
         if (!cbOuterBulletinDisabled){
             cbOuterBulletin.attr('disabled', 'disabled');
             cbOuterBulletin.prop('checked', false);
         }
         else {
             cbOuterBulletin.removeAttr('disabled');
         }

        if (cbPublishExternal.length > 0) {
            if (cbPublishExternal.prop("checked")) {
                $('#<%=pnlSyncOuter.ClientID%>').show();
                $('#<%=hfSyncOuter.ClientID%>').val('True');
            }
            else {
                $('#<%=pnlSyncOuter.ClientID%>').hide();
                $('#<%=hfSyncOuter.ClientID%>').val('False');
            }
        }
        else if (cbPublishExternal.length == 0) {
            if (lblIfSync == lblDontSync) {
                $('#<%=pnlSyncOuter.ClientID%>').hide();
                $('#<%=hfSyncOuter.ClientID%>').val('False');
            }
            else {
                $('#<%=pnlSyncOuter.ClientID%>').show();
                $('#<%=hfSyncOuter.ClientID%>').val('True');
            }
        }
    }

    //公告類別
    function postClass_Click(oButton, oEvent) {
        var hfBulletinClass = $('#<%=hfBulletinClass.ClientID %>');
        var classGuid = hfBulletinClass.val();
        var applicant = '<%=base.ApplicantGuid%>';
        $uof.dialog.open2("~/EIP/Bulletin/WKFOptionalFields/SelectPublishDept.aspx", "", "", 400, 500, function DialogResult(returnValue) {
            if (typeof (returnValue) != "undefined") {
                var btnEditIn = $('#<%=pnlPublishIn.ClientID %>');
                var btnEditOut = $('#<%=pnlPublishOut.ClientID %>');
                var btnPrintIn = $('#<%=pnlPrintIn.ClientID %>');
                var btnPrintOut = $('#<%=pnlPrintOut.ClientID %>');
                var hfBulletinClass = $('#<%=hfBulletinClass.ClientID %>');
                var classID = [returnValue];
                var lblBulletinClass = $('#<%=lblBulletinClass.ClientID %>');
                className = $uof.pageMethod.syncUc("EIP/Bulletin/WKFOptionalFields/BulletinFieldUC.ascx", "GetClassPath", classID)
                lblBulletinClass.text(className.split(',')[0]);
                if (className.split(',')[1] == "Inner") {
                    $('#<%=cbPublishExternal.ClientID%>').prop('disabled', false);
                    btnEditIn.show();
                    btnEditOut.hide();
                    btnPrintIn.show();
                    btnPrintOut.hide();
                }
                else {
                    $('#<%=cbPublishExternal.ClientID%>').prop('disabled', true);
                    $('#<%=cbPublishExternal.ClientID%>').prop('checked', false);
                    $('#<%=hfSyncOuter.ClientID%>').val('False');
                    btnEditIn.hide();
                    btnEditOut.show();
                    btnPrintIn.hide();
                    btnPrintOut.show();
                }
                $('#<%=hfIsInner.ClientID%>').val(className.split(',')[1]);
                ChangeExternalStatus();
                hfBulletinClass.val(classID);
            }
            return false;
        }, { "ClassGuid": classGuid, "Applicant": applicant });
    }

    //外部發佈
    function wbtnExternal_Click(oButton, oEvent) {
        var hfExternalClass = $('#<%=hfExternalClass.ClientID %>');
        var classGuid = hfExternalClass.val();
        var applicant = '<%=base.ApplicantGuid%>';
        $uof.dialog.open2("~/EIP/Bulletin/WKFOptionalFields/SelectPublishDept.aspx", "", "", 400, 500, function openDialogResultOuter(returnValue) {
            if (typeof (returnValue) != "undefined") {
                var classID = [returnValue];
                var LBExternalClass = $('#<%=LBExternalClass.ClientID %>');
                var className = $uof.pageMethod.syncUc("EIP/Bulletin/WKFOptionalFields/BulletinFieldUC.ascx", "GetClassPath", classID)
                LBExternalClass.text(className.split(',')[0]);
                hfExternalClass.val(classID);
            }
            return false;
        }, { "ClassGuid": classGuid, "Applicant": applicant,"OuterClass":"true" });
    }

    //驗證有無公告類別 (請選擇公告類別)
    function cvCheckBulletinClass(source, args) {
        var bulletinClass = $("#<%=hfBulletinClass.ClientID%>");
        if (bulletinClass.val() == null || bulletinClass.val() == "") {
            args.IsValid = false;
            return;
        }
    }

    //驗證有無發佈對象 (請選擇發佈對象)
    function cvCheckPublicPeople(source, args) {
        var checkok = $('#<%=hfIfOK.ClientID %>');
        var innerCount = $('#<%=hfPublishToInner.ClientID %>').val();
        var outerCount = $('#<%=hfPublishToOuter.ClientID %>').val();
        var isInner = $('#<%=hfIsInner.ClientID%>').val();
        var checknum = parseInt(checkok.val());
        if (isInner == "Inner") {
            if ((innerCount == "0" || innerCount == "")) {
                args.IsValid = false;
                checkok.val(checknum + 1);
                return;
            }
        }
        else if (isInner == "Outer") {
            if ((outerCount == "0" || outerCount == "")) {
                args.IsValid = false;
                checkok.val(checknum + 1);
                return;
            }
        }
        checkok.val(checknum);
    }

    //驗證有無外部公告類別  (請選擇外部類別)
    function cvCheckExternalClass(source, args) {
        var checkok = $('#<%=hfIfOK.ClientID %>');
        var cbPublishExternal = $('#<%=cbPublishExternal.ClientID %>');
        var checknum = parseInt(checkok.val());
        if (cbPublishExternal.prop("checked")) {
            var hfExternalClass = $('#<%=hfExternalClass.ClientID %>').val();
            if ((hfExternalClass == "")) {
                args.IsValid = false;
                checkok.val(checknum + 1);
                return;
            }
        }
        checkok.val(checknum);
    }

    //驗證有無外部發佈對象  (請選擇發佈對象)
    function cvCheckExternalPeople(source, args) {
        var checkok = $('#<%=hfIfOK.ClientID %>');
        var cbPublishExternal = $('#<%=cbPublishExternal.ClientID %>');
        var checknum = parseInt(checkok.val());
        if (cbPublishExternal.prop("checked")) {
            var peoplecount = $('#<%=hfExternalPeople.ClientID %>').val();
                    if ((peoplecount == "0" || peoplecount == "")) {
                        args.IsValid = false;
                        checkok.val(checknum + 1);
                        return;
                    }
                }
                checkok.val(checknum);
            }

    //驗證下架日期先後 (下架日期需晚於上架日期)
    function cvCheckTwoDate(source, args) {
        var checkok = $('#<%=hfIfOK.ClientID %>');
        var checknum = parseInt(checkok.val());
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
                    checkok.val(checknum + 1);
                    return;
                }
            }
        }
        checkok.val(checknum);
    }



    //驗證有無上架日期
    function cvCheckNoPublicDate(source, args) {
        var checkok = $('#<%=hfIfOK.ClientID %>');
        var rbPublishLater = $('#<%=rbPublishDate.ClientID %>');
        var checknum = parseInt(checkok.val());
        if (rbPublishLater.prop("checked")) {
            var publicdate = $find('<%=RadDatePublish.ClientID %>').get_selectedDate();
            if (publicdate == null) {
                args.IsValid = false;
                checkok.val(checknum + 1);
                return;
            }
        }
        checkok.val(checknum);
    }


    //驗證有無下架日期
    function cvCheckNoOffDate(source, args) {
        //alert("noOFF");
        var checkok = $('#<%=hfIfOK.ClientID %>');
        var rbOff = $('#<%=rbCloseDate.ClientID %>');
        var checknum = parseInt(checkok.val());
        if (rbOff.prop("checked")) {
            var offDate = $find('<%=RadDateClose.ClientID %>').get_selectedDate();
            if (offDate == null) {
                args.IsValid = false;
                checkok.val(checknum + 1);
                return;
            }
        }
        checkok.val(checknum);
    }

    //驗證上架日期先後 (上架日期需晚於或等於今日)
    function cvCheckPublicDateLate(source, args) {
        var checkok = $('#<%=hfIfOK.ClientID %>');
        var rbPublishLater = $('#<%=rbPublishDate.ClientID %>');
        var checknum = parseInt(checkok.val());
        if (rbPublishLater.prop("checked")) {
            var publicdate = $find('<%=RadDatePublish.ClientID %>').get_selectedDate();
            var tday = new Date();
            tday = new Date(tday.getFullYear(), tday.getMonth(), tday.getDate());
            if (publicdate != null && publicdate < tday) {
                args.IsValid = false;
                checkok.val(checknum + 1);
                return;
            }
        }
        checkok.val(checknum);
    }

    function OpenDatePicker(isOpen, dateType)
        {
            if (dateType == "Publish") {
                $find("<%= RadDatePublish.ClientID %>").set_enabled(isOpen);
                $('#<%=ddlPublishTime.ClientID%>').prop("disabled",!isOpen);
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

<style type="text/css">
    div.JustAddBorder span.JustAddBorder table tr td {
        border-width: 1px;
        border-style: solid;
    }
</style>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div>
            <asp:Label ID="lblNotSupport" runat="server" Text="此欄位不允許在App編輯" Visible="False" ForeColor="Red" meta:resourcekey="lblNotSupportResource1"></asp:Label>
            <asp:CustomValidator ID="cvCheckSupportMobile" runat="server" ForeColor="Red" ErrorMessage="此欄位不允許在App編輯" Display="Dynamic"
                                    ClientValidationFunction="CheckSupportMobile" meta:resourcekey="cvCheckSupportMobileResource1"></asp:CustomValidator>
        </div>
        <table style="width:1000px">
            <tr>
                <td>
                    <table class="PopTable" cellspacing="0" width="100%">
                        <tr>
                            <td style="width: 140px; white-space: nowrap;" >
                            <asp:Label ID="Label14" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label14Resource1"></asp:Label>
                                <asp:Label ID="Label4" runat="server" Text="公告類別" meta:resourcekey="Label4Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblBulletinClass" runat="server" meta:resourcekey="lblBulletinClassResource1"></asp:Label>
                                <telerik:RadButton ID="btnBulletinClass" runat="server" Text="選擇公告類別" AutoPostBack="false"
                                    CausesValidation="false" OnClientClicking="postClass_Click" meta:resourcekey="btnBulletinClassResource1"></telerik:RadButton>
                                <asp:CustomValidator ID="cvBulletinClass" runat="server" ErrorMessage="請選擇公告類別" Display="Dynamic"
                                     ClientValidationFunction="cvCheckBulletinClass" meta:resourcekey="cvBulletinClassResource1"></asp:CustomValidator>
                                <asp:HiddenField ID="hfBulletinClass" runat="server" />
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 140px; white-space: nowrap;">
                                <asp:Label ID="Label11" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label11Resource1"></asp:Label>
                                <asp:Label ID="Label8" runat="server" Text="主題" meta:resourcekey="Label8Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblSubject" runat="server" meta:resourcekey="lblSubjectResource1"></asp:Label>
                                <asp:TextBox ID="txtSubject" runat="server" Width="100%" meta:resourcekey="txtSubjectResource1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="cvCheckSubject" runat="server" ErrorMessage="請輸入主題" Display="Dynamic"
                                     ControlToValidate="txtSubject" meta:resourcekey="cvCheckSubjectResource1" ></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 140px; white-space: nowrap;">
                                <asp:Label ID="Label2" runat="server" Text="跑馬燈" meta:resourcekey="Label2Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:CheckBox ID="cbRunHorseLight" runat="server" Text="顯示於跑馬燈" meta:resourcekey="cbRunHorseLightResource1" />
                                <asp:Label ID="lblRunHorseLight" runat="server" meta:resourcekey="lblRunHorseLightResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 140px; white-space: nowrap;" >
                                <asp:Label ID="Label19" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label19Resource1"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text="發佈對象" meta:resourcekey="Label5Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Panel runat="server" ID="pnlPublishIn" meta:resourcekey="pnlPublishInResource1">
                                    <uc1:UC_ChoiceList runat="server" ID="clPublishToInner" TreeHeight="68" ExpandToUser="false" ShowMember="false" OnEditButtonOnClick="clPublishToInner_EditButtonOnClick" />
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlPublishOut" meta:resourcekey="pnlPublishOutResource1">
                                    <uc1:UC_ChoiceList runat="server" ID="clPublishToOuter" TreeHeight="68" ExpandToUser="false" ShowEmployee="false" OnEditButtonOnClick="clPublishToOuter_EditButtonOnClick" />
                                </asp:Panel>
                                <asp:Label ID="lblShowReader" runat="server" meta:resourcekey="lblShowReaderResource1"></asp:Label>
                                <asp:CheckBox ID="cbShowReader" runat="server" Text="瀏覽時顯示" Checked="true" onclick="ChangeExternalStatus();" meta:resourcekey="cbShowReaderResource1" />
                                <asp:HiddenField ID="hfPublishToInner" runat="server" />
                                <asp:HiddenField ID="hfPublishToOuter" runat="server" />
                                <asp:CustomValidator ID="cvCheckPublicPeople" runat="server" ErrorMessage="請選擇發佈對象" 
                                     ClientValidationFunction="cvCheckPublicPeople" Display="Dynamic" meta:resourcekey="cvCheckPublicPeopleResource1"></asp:CustomValidator>
                            </td>                            
                        </tr>
                        <tr>
                            <td style="width: 140px; white-space: nowrap;" >
                                <asp:Label ID="Label13" runat="server" Text="發佈通知" meta:resourcekey="Label13Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:RadioButton ID="rbAllUser" runat="server" GroupName="Message" Text="所有發佈對象" Checked="true" meta:resourcekey="rbAllUserResource1"/>
                                <asp:RadioButton ID="rbSubscribeOnly" runat="server" GroupName="Message" Text="發佈對象中的訂閱者" meta:resourcekey="rbSubscribeOnlyResource1" />
                                <asp:Label ID="lblMessageTo" runat="server" meta:resourcekey="lblMessageToResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 140px; white-space: nowrap;">
                                <asp:Label ID="Label10" runat="server" Text="上架" meta:resourcekey="Label10Resource1"></asp:Label>
                            </td>
                            <td style="white-space: nowrap;">
                                <asp:RadioButton ID="rbPubishNow" runat="server" GroupName="Publish" Text="立即上架" Checked="true" meta:resourcekey="rbPubishNowResource1"  onClick="OpenDatePicker(false, 'Publish')" />
                                <asp:RadioButton ID="rbPublishDate" runat="server" GroupName="Publish" Text="上架時間" meta:resourcekey="rbPublishDateResource1"  onClick="OpenDatePicker(true, 'Publish')" />
                                <telerik:RadDatePicker ID="RadDatePublish" runat="server" meta:resourcekey="RadDatePublishResource1">
                                </telerik:RadDatePicker>
                                <asp:DropDownList ID="ddlPublishTime" runat="server" ></asp:DropDownList>
                                <asp:CustomValidator ID="cvNoPublishDate" runat="server" Display="Dynamic" ErrorMessage="請輸入日期"
                                        ClientValidationFunction="cvCheckNoPublicDate" meta:resourcekey="cvNoPublishDateResource1"></asp:CustomValidator>
                                <asp:Label runat="server" ID="lblPublishTime" meta:resourcekey="lblPublishTimeResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 140px; white-space: nowrap;">
                                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label11Resource1"></asp:Label>
                                <asp:Label ID="Label3" runat="server" Text="下架" meta:resourcekey="Label3Resource1"></asp:Label>
                            </td>
                            <td style="white-space: nowrap;">
                                <asp:RadioButton ID="rbNeverClose" runat="server" GroupName="Close" Text="永不下架" meta:resourcekey="rbNeverCloseResource1"  onClick="OpenDatePicker(false, 'OffShelf')" />
                                <asp:RadioButton ID="rbCloseDate" runat="server" GroupName="Close" Text="下架時間" Checked="true" meta:resourcekey="rbCloseDateResource1"  onClick="OpenDatePicker(true, 'OffShelf')" />
                                <telerik:RadDatePicker ID="RadDateClose" runat="server" meta:resourcekey="RadDateCloseResource1">
                                </telerik:RadDatePicker> 
                                <asp:DropDownList ID="ddlOffShelfTime" runat="server" ></asp:DropDownList>
                                <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="請輸入日期"
                                        ClientValidationFunction="cvCheckNoOffDate" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                                <asp:CustomValidator ID="cvNotLaterThenPublish" runat="server" Display="Dynamic"
                                        ErrorMessage="下架時間需晚於上架時間" ClientValidationFunction="cvCheckTwoDate" meta:resourcekey="cvNotLaterThenPublishResource1"></asp:CustomValidator>
                                <asp:Label runat="server" ID="lblCloseTime" meta:resourcekey="lblCloseTimeResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 140px; white-space: nowrap;" >
                                <asp:Label ID="Label6" runat="server" Text="內容" meta:resourcekey="Label6Resource1"></asp:Label>
                            </td>
                            <td style="vertical-align:baseline">
                                <uc1:UC_HtmlEditor runat="server" ID="radEditorContext" Width="850px" BulletinSize="true" ModuleName="WKF" SubFolder="BULLETIN"/>
                                <asp:Panel ID="pnlContent" runat="server" ScrollBars="Auto"  CssClass="editorcontentstyle JustAddBorder" meta:resourcekey="pnlContentResource1">
                                    <asp:Label ID="lblHtml" runat="server"  CssClass="editorcontentstyle JustAddBorder" meta:resourcekey="lblHtmlResource1"></asp:Label>
                                </asp:Panel>
                            </td>                            
                        </tr>
                        <tr runat="server" id="attatchmentTR">
                            <td style="width: 140px; white-space: nowrap;" >
                                <asp:Label ID="Label7" runat="server" Text="附件" meta:resourcekey="Label7Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:CheckBox ID="cbNoDownload" runat="server" Text="瀏覽公告時不顯示附件供觀看者下載" Visible="false" meta:resourcekey="cbNoDownloadResource1" />
                                <asp:Label runat="server" ID="lblNoDownload" meta:resourcekey="lblNoDownloadResource1" Visible="false"></asp:Label>
                                <asp:LinkButton ID="lbtnFileCenter" runat="server" ForeColor="OliveDrab" CausesValidation="False" Visible="false" Text="檔案操作" meta:resourcekey="lbtnFileCenterResource1"></asp:LinkButton>
                                <uc2:UC_FileCenter runat="server" ID="UC_FileCenter1" Editable="false" UploadEnabled="false" ModuleName="WKF" ProxyEnabled="false"/>
                            </td>                            
                        </tr>
                        <tr runat="server" id="trPrint">
                            <td style="width: 140px; white-space: nowrap;" >
                                <asp:Label ID="Label9" runat="server" Text="列印控制" meta:resourcekey="Label9Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:CheckBox ID="cbPrint" runat="server" Text="只允許下列人員列印 (若未勾選此項則所有人皆可列印)" meta:resourcekey="cbPrintResource1" />
                                <asp:Label ID="lblAllowInnerPrint" runat="server" meta:resourcekey="lblAllowInnerPrintResource1"></asp:Label>
                                <asp:Panel runat="server" ID="pnlPrintIn" meta:resourcekey="pnlPrintInResource1">
                                    <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceListPrintInner" ExpandToUser="false" ShowMember="false" OnEditButtonOnClick="UC_ChoiceListPrint_EditButtonOnClick" />
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlPrintOut" meta:resourcekey="pnlPrintOutResource1">
                                    <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceListPrintOuter" ExpandToUser="false" ShowEmployee="false" OnEditButtonOnClick="UC_ChoiceListPrint_EditButtonOnClick" />
                                </asp:Panel>
                                <asp:HiddenField ID="hfPrintPeople" runat="server" />
                            </td>
                        </tr>
                        <tr>                    
                            <td style="width: 140px; white-space: nowrap;">
                                <asp:Label ID="Label15" runat="server" Text="外部發佈" meta:resourcekey="Label15Resource1"></asp:Label>
                            </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="cbPublishExternal" runat="server" Text="同步複製到外部公告 (公告類別為內部公告方可啟用)" onclick="ChangeExternalStatus();" Enabled="false" meta:resourcekey="cbPublishExternalResource1"/>
                                    <asp:Label ID="lblIfSync" runat="server" meta:resourcekey="lblIfSyncResource1"></asp:Label>
                                </td>
                            </tr>

                        </table>

                        <div style="margin-bottom: 2px;">
                            <asp:Panel ID="pnlSyncOuter" runat="server" meta:resourcekey="pnlSyncOuterResource1">
                            <table class="PopTable" cellspacing="1">
                                <tr>
                                    <td style="width: 100px;" class="PopTableLeftTD" runat="server" id="td1">
                                        <asp:Label ID="Label20" runat="server" Text="外部類別" meta:resourcekey="Label20Resource1" ></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="LBExternalClass" runat="server" meta:resourcekey="LBExternalClassResource1"></asp:Label>
                                        &nbsp;
                                        <telerik:RadButton ID="wbtnExternal" runat="server" Text="外部公告類別" CausesValidation="false" 
                                            OnClientClicking="wbtnExternal_Click" AutoPostBack="False" meta:resourcekey="wbtnExternalResource1"></telerik:RadButton>
                                        <asp:HiddenField ID="hfExternalClass" runat="server" />
                                        <asp:CustomValidator ID="CustomValidator7" Display="Dynamic" runat="server" ErrorMessage="請選擇外部類別"
                                            ClientValidationFunction="cvCheckExternalClass" meta:resourcekey="CustomValidator7Resource1"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px;" class="PopTableLeftTD" runat="server" id="tdInernal2">
                                        <asp:Label ID="Label16" runat="server" Text="外部對象" meta:resourcekey="Label16Resource1" ></asp:Label>
                                    </td>
                                    <td class="PopTableRightTD" runat="server" id="tdInernal3">
                                        <uc1:UC_ChoiceList ID="clExternalPeople" runat="server" TreeHeight="68" ExpandToUser="false" ShowEmployee="false" OnEditButtonOnClick="clExternalPeople_EditButtonOnClick"></uc1:UC_ChoiceList>
                                        <asp:Label ID="lblShowExternalReader" runat="server" Text=""></asp:Label>
                                        <asp:CheckBox ID="cbShowExternalReader" runat="server" Text="瀏覽時顯示" Checked="true" meta:resourcekey="cbShowExternalReaderResource1" /><br>
                                        <asp:Label ID="lblOuterBulletin" runat="server" Text=""></asp:Label>
                                        <asp:CheckBox ID="cbOuterBulletin" runat="server" Text="同步顯示在內部公告中" Checked="false" meta:resourcekey="cbOuterBulletinReaderResource1" />                                                                         
                                        <asp:HiddenField ID="hfExternalPeople" runat="server" />
                                        <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic" ErrorMessage="請選擇發佈對象"
                                            ClientValidationFunction="cvCheckExternalPeople" meta:resourcekey="CustomValidator5Resource1"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr id='trExPrint' runat="server">
                                    <td style="width: 100px; white-space:nowrap" class="PopTableLeftTD" runat="server" id="tdExternalPrint2">
                                        <asp:Label ID="Label17" runat="server" Text="外部列印控制" meta:resourcekey="Label17Resource1" ></asp:Label>
                                    </td>
                                    <td class="PopTableRightTD" style="vertical-align: top;" runat="server" id="tdExternalPrint3">
                                        &nbsp;
                                        <asp:CheckBox ID="cbExternalPrint" runat="server" Text="只允許下列人員列印 (若未勾選此項，則所有人皆可列印)" meta:resourcekey="cbExternalPrintResource1" />
                                        <asp:Label ID="lblPrintOuter" runat="server" meta:resourcekey="lblPrintOuterResource1"></asp:Label>
                                            <uc1:UC_ChoiceList ID="clExternalPrintPeople" runat="server" ExpandToUser="false" ShowEmployee="false" OnEditButtonOnClick="clExternalPrintPeople_EditButtonOnClick" />
                                        <asp:HiddenField ID="hfExternalPrintPeople" runat="server" />
                                    </td>
                                </tr>
                            </table>
                            </asp:Panel>
                        </div>
                    </td>                       
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:HiddenField ID="hfIfOK" runat="server" Value="0" />
<asp:HiddenField ID="hfIsInner" runat="server" />
<asp:HiddenField ID="hfSyncOuter" runat="server" />
<asp:Label ID="hfFileGroupID" runat="server" Visible="false"></asp:Label>
<asp:Label ID="lblFieldValue" runat="server" Visible="false" meta:resourcekey="lblFieldValueResource1"></asp:Label>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="false" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="false" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="false" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="false" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="false" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblMarqueeOn" runat="server" Text="顯示於跑馬燈" Visible="false" meta:resourcekey="lblMarqueeOnResource1"></asp:Label>
<asp:Label ID="lblMarqueeOff" runat="server" Text="不顯示於跑馬燈" Visible="false" meta:resourcekey="lblMarqueeOffResource1"></asp:Label>
<asp:Label ID="lblAllowDownload" runat="server" Text="瀏覽公告時顯示附件供觀看者下載" Visible="false" meta:resourcekey="lblAllowDownloadResource1"></asp:Label>
<asp:Label ID="lblAllowAnyPrint" runat="server" Text="允許所有人員列印" Visible="false" meta:resourcekey="lblAllowAnyPrintResource1"></asp:Label>
<asp:Label ID="lblAllowSomePrint" runat="server" Text="只允許下列人員列印" Visible="false" meta:resourcekey="lblAllowSomePrintResource1"></asp:Label>
<asp:Label ID="lblAllowNonePrint" runat="server" Text="不允許所有人員列印" Visible="false" meta:resourcekey="lblAllowNonePrintResource1"></asp:Label>
<asp:Label ID="lblSyncOuter" runat="server" Text="同步複製到外部公告" Visible="false" meta:resourcekey="lblSyncOuterResource1"></asp:Label>
<asp:Label ID="lblDontSync" runat="server" Text="不同步複製到外部公告" Visible="false" meta:resourcekey="lblDontSyncResource1"></asp:Label>
<asp:Label ID="lblShowReaderOn" runat="server" Text="瀏覽時顯示" Visible="false" meta:resourcekey="lblShowReaderOnResource1"></asp:Label>
<asp:Label ID="lblShowReaderOff" runat="server" Text="瀏覽時不顯示" Visible="false"  meta:resourcekey="lblShowReaderOffResource1"></asp:Label>
<asp:Label ID="lblOuterBulletinTrue" runat="server" Text="同步顯示在內部公告中" Visible="false" meta:resourcekey="lblOuterBulletinTrueResource1"></asp:Label>
<asp:Label ID="lblOuterBulletinFalse" runat="server" Text="不同步顯示在內部公告中" Visible="false"  meta:resourcekey="lblOuterBulletinFalseResource1"></asp:Label>