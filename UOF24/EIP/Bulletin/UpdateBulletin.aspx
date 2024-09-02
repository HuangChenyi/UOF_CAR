<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Bulletin_UpdateBulletin" Title="修改公告" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="UpdateBulletin.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>
<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc2" TagName="UC_HtmlEditor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function DisplayPrintBtn() {
            var cb = $("#<%=cbPrint.ClientID %>");
            if (cb.prop("checked")) {
                $('#divChoiceList').show();
            }
            else {
                $('#divChoiceList').hide();
            }

        }

        function DisplayExternalPrintBtn() {

            var cb = $("#<%=cbExternalPrint.ClientID %>");
            if (cb.prop("checked")) {
                $("#divExternalPrintPeople").show();
            }
            else {
                $("#divExternalPrintPeople").hide();
            }

        }
        Sys.Application.add_load
        (function () {
            resetcount();
            var LBExternalClass = $('#<%=LBExternalClass.ClientID %>');
            var hfExternalClassPath = $('#<%=hfExternalClassPath.ClientID %>');   
            ChangeExternalStatus();
            //cvChangeTab();

            if (!$("#<%= rbPublishLater.ClientID %>").is(":disabled")) {
                var PublishisChecked = $("#<%= rbPublishLater.ClientID %>").is(":checked");
                var PublishDate = $find("<%= wdcPublishDate.ClientID %>");
                var publictime = $('#<%=ddlPublishTime.ClientID%>');
                if(PublishDate != null)
                    PublishDate.set_enabled(PublishisChecked);
                if (publictime != null)
                    publictime.prop("disabled", !PublishisChecked);
            }
            if (!$("#<%= RadioButton2.ClientID %>").is(":disabled")) {
                var OffShelfisChecked = $("#<%= RadioButton2.ClientID %>").is(":checked");
                var OffShelfDate = $find("<%= RadDatePicker1.ClientID %>");
                var offtime = $('#<%=ddlOffShelfTime.ClientID%>');
                if(OffShelfDate != null)
                    OffShelfDate.set_enabled(OffShelfisChecked);
                if (offtime != null)
                    offtime.prop("disabled", !OffShelfisChecked);
            }
        });

        function ChangeExternalStatus() {
            var cbPublishExternal = $('#<%=cbPublishExternal.ClientID %>');
            if (cbPublishExternal.length > 0) {
                var wbtnExternal = $find("<%=wbtnExternal.ClientID %>");
                var btnEdit2 = $find('<%=((RadButton)clExternalPeople.FindControl("btnEdit2")).ClientID %>');
                var btnEdit3 = $find('<%=((RadButton)clExternalPrintPeople.FindControl("btnEdit2")).ClientID %>');

                var cbExternalPrint = $('#<%=cbExternalPrint.ClientID %>');
                var cbOuterBulletin = $('#<%=cbOuterBulletin.ClientID %>');
                var rbExternalMSG = $('#<%=rbExternalMSG.ClientID %>')
                var cbExternalShowUC = $('#<%=cbShowExternalReader.ClientID %>');

                var cbPublishExternalChecked = $('#<%=cbPublishExternal.ClientID %>').is(":checked");
                var cbShowReaderChecked = $('#<%=cbShowReader.ClientID %>').is(":checked");

                var cbOuterBulletinDisabled = cbShowReaderChecked && cbPublishExternalChecked;
                if (!cbOuterBulletinDisabled) {
                    cbOuterBulletin.attr('disabled', 'disabled');
                    cbOuterBulletin.prop('checked', false);
                }
                else {
                    cbOuterBulletin.removeAttr('disabled');
                }


                if (cbPublishExternal.prop("checked")) {
                    wbtnExternal.set_enabled(true);
                    btnEdit2.set_enabled(true);
                    btnEdit3.set_enabled(true);
                    cbExternalPrint.removeAttr('disabled');
                    rbExternalMSG.find('input').prop('disabled', false);
                    cbExternalShowUC.removeAttr('disabled');
                }
                else {
                    wbtnExternal.set_enabled(false);
                    btnEdit2.set_enabled(false);
                    btnEdit3.set_enabled(false);
                    cbExternalPrint.attr('disabled', 'disabled');
                    cbExternalPrint.prop('checked', false);
                    rbExternalMSG.find('input').prop('disabled', true);
                    cbExternalShowUC.attr('disabled', 'disabled');
                }
            }
        }
        
        function Button2Click() {
            return confirm('<%=msgDelconfirm.Text%>');
        }
        function Button3Click() {
            return confirm('<%=msgDelconfirm.Text%>');
        }

        function wbtnExternal_Click(oButton, oEvent) {
            oEvent.set_cancel(true);
            var hfExternalClass = $('#<%=hfExternalClass.ClientID %>');
            var hfApplicant = $('#<%=hfApplicant.ClientID %>').val();
            var classGuid = hfExternalClass.val();
            $uof.dialog.open2("~/EIP/Bulletin/ExternalClass.aspx", oButton, "", 400, 500, openDialogResult, { "Applicant": hfApplicant, "ClassGuid": classGuid });
            return false;
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == 'undefined') {
                return false;
            }
            else {
                var classID = [returnValue];
                var LBExternalClass = $('#<%=LBExternalClass.ClientID %>');
                var hfExternalClass = $('#<%=hfExternalClass.ClientID %>');
                var hfExternalClassPath = $('#<%=hfExternalClassPath.ClientID %>');
                hfExternalClass.val(classID);
                hfExternalClassPath.val($uof.pageMethod.sync("GetClassPath", classID));
                LBExternalClass.text($uof.pageMethod.sync("GetClassPath", classID));
            }
        }

        function cvCheckTopic(source, args) {
            //alert("topic");
            var topic = $('#<%=TBtopic.ClientID %>').val();
            var checkok = $('#<%=hfIfOK.ClientID %>');
            var checknum = parseInt(checkok.val());
            if (topic == null || topic == "") {
                args.IsValid = false;
                var tabStrip = $find("<%= RadTabStrip1.ClientID %>");
                var basic = tabStrip.findTabByValue("basic");
                var advance = tabStrip.findTabByValue("advance");
                var comment = tabStrip.findTabByValue("comment");
                basic.select();
                checkok.val(checknum + 1);

                return;
            }
            checkok.val(checknum);
        }

        function cvCheckPublicPeople(source, args) {
            //alert("public");
            var checkok = $('#<%=hfIfOK.ClientID %>');
            var peoplecount = $('#<%=hfPublicPeople.ClientID %>').val();
            var checknum = parseInt(checkok.val());

            if ((peoplecount == "0" || peoplecount == "")) {
                args.IsValid = false;
                if (checknum == 0) {
                    var tabStrip = $find("<%= RadTabStrip1.ClientID %>");
                    var basic = tabStrip.findTabByValue("basic");
                    var advance = tabStrip.findTabByValue("advance");
                    var comment = tabStrip.findTabByValue("comment");
                    basic.select();
                }
                checkok.val(checknum + 1);
                return;
            }
            checkok.val(checknum);
        }

        function cvCheckNoPublicDate(source, args) {
            //alert("nopublic");
            var checkok = $('#<%=hfIfOK.ClientID %>');
            var rbPublishLater = $('#<%=rbPublishLater.ClientID %>');
            var checknum = parseInt(checkok.val());
            if (rbPublishLater.prop("checked")) {
                var publicdate = $find('<%=wdcPublishDate.ClientID %>').get_selectedDate();
                if (publicdate == null) {
                    args.IsValid = false;
                    if (checknum == 0) {
                        var tabStrip = $find("<%= RadTabStrip1.ClientID %>");
                        var basic = tabStrip.findTabByValue("basic");
                        var advance = tabStrip.findTabByValue("advance");
                        var comment = tabStrip.findTabByValue("comment");
                        basic.select();
                    }
                    checkok.val(checknum + 1);
                    return;
                }
            }
            checkok.val(checknum);

        }

        function cvCheckPublicDateLate(source, args) {
            //alert("PublicDateLate");
            var checkok = $('#<%=hfIfOK.ClientID %>');
            var rbPublishLater = $('#<%=rbPublishLater.ClientID %>');
            var checknum = parseInt(checkok.val());
            if (rbPublishLater.prop("checked")) {
                var publicdate = $find('<%=wdcPublishDate.ClientID %>').get_selectedDate();
                var tday = "<%=Ede.Uof.EIP.Organization.Util.UserTime.SetZone(User.Identity.Name).GetNowForUi().Date%>"

                if (publicdate != null && publicdate < tday) {
                    args.IsValid = false;
                    if (checknum == 0) {
                        var tabStrip = $find("<%= RadTabStrip1.ClientID %>");
                        var basic = tabStrip.findTabByValue("basic");
                        var advance = tabStrip.findTabByValue("advance");
                        var comment = tabStrip.findTabByValue("comment");
                        basic.select();
                    }
                    checkok.val(checknum + 1);
                    return;
                }
            }
            checkok.val(checknum);

        }

        function cvCheckNoOffDate(source, args) {
            //alert("noOFF");
            var checkok = $('#<%=hfIfOK.ClientID %>');
            var rbOff = $('#<%=RadioButton2.ClientID %>');
            var checknum = parseInt(checkok.val());
            if (rbOff.prop("checked")) {
                var offDate = $find('<%=RadDatePicker1.ClientID %>').get_selectedDate();
                if (offDate == null) {
                    args.IsValid = false;
                    if (checknum == 0) {
                        var tabStrip = $find("<%= RadTabStrip1.ClientID %>");
                        var basic = tabStrip.findTabByValue("basic");
                        var advance = tabStrip.findTabByValue("advance");
                        var comment = tabStrip.findTabByValue("comment");
                        basic.select();
                    }
                    checkok.val(checknum + 1);
                    return;
                }
            }
            checkok.val(checknum);

        }

        function cvCheckTwoDate(source, args) {
            var checkok = $('#<%=hfIfOK.ClientID %>');
            var checknum = parseInt(checkok.val());
            var rbPublishNow = $('#<%=rbPublishNow.ClientID %>');
            var rbPublishLater = $('#<%=rbPublishLater.ClientID %>');
            var rbOff = $('#<%=RadioButton2.ClientID %>');

            var publicdate = '<%= Ede.Uof.Utility.UofTime.GetSystemNowForUi().DateTime.ToString("yyyy/MM/dd") %>';
            var timeHour = '<%= Ede.Uof.Utility.UofTime.GetSystemNowForUi().DateTime.ToString("HH") %>';
            var timeMinute = '<%= Ede.Uof.Utility.UofTime.GetSystemNowForUi().DateTime.ToString("mm") %>';
            var publictime = parseInt(timeHour) * 60 + parseInt(timeMinute);

            if (rbOff.prop("checked")) {
                if (rbPublishLater.prop("checked")) {
                    publicdate = $find('<%=wdcPublishDate.ClientID %>').get_selectedDate();
                    publictime = $('#<%=ddlPublishTime.ClientID%>').val();
                    if (publicdate != null) {
                        publicdate = publicdate.format('yyyy/MM/dd') ;
                    }
                }
                var offDate = $find('<%=RadDatePicker1.ClientID %>').get_selectedDate();
                var offtime = $('#<%=ddlOffShelfTime.ClientID%>').val();
                if (offDate != null) {
                    offDate = offDate.format('yyyy/MM/dd');
                    if ((publicdate > offDate) || ((publicdate === offDate) && (parseInt(publictime) >= parseInt(offtime)))) {

                        args.IsValid = false;
                        if (checknum == 0) {
                            var tabStrip = $find("<%= RadTabStrip1.ClientID %>");
                            var basic = tabStrip.findTabByValue("basic");
                            var advance = tabStrip.findTabByValue("advance");
                            var comment = tabStrip.findTabByValue("comment");
                            basic.select();
                        }
                        checkok.val(checknum + 1);
                        return;
                    }
                }
            }
            checkok.val(checknum);
        }

        function cvCheckPrintPeople(source, args) {
            //alert("print");
            var cbPrint = $('#<%=cbPrint.ClientID %>');
            var checkok = $('#<%=hfIfOK.ClientID %>');
            var checknum = parseInt(checkok.val());

            if (cbPrint.prop("checked")) {
                var peoplecount = $('#<%=hfPrintPeople.ClientID %>').val();
                if ((peoplecount == "0" || peoplecount == "")) {
                    args.IsValid = false;
                    if (checknum == 0) {
                        var tabStrip = $find("<%= RadTabStrip1.ClientID %>");
                        var basic = tabStrip.findTabByValue("basic");
                        var advance = tabStrip.findTabByValue("advance");
                        var comment = tabStrip.findTabByValue("comment");
                        advance.select();

                    }
                    checkok.val(checknum + 1);
                    return;
                }
            }
            checkok.val(checknum);
        }

        function cvCheckExternalClass(source, args) {
            //alert("external");
            var checkok = $('#<%=hfIfOK.ClientID %>');
            var cbPublishExternal = $('#<%=cbPublishExternal.ClientID %>');
            var checknum = parseInt(checkok.val());
            if (cbPublishExternal.prop("checked")) {
                var hfExternalClass = $('#<%=hfExternalClass.ClientID %>').val();
                if ((hfExternalClass == "")) {
                    args.IsValid = false;
                    if (checknum == 0) {
                        var tabStrip = $find("<%= RadTabStrip1.ClientID %>");
                        var basic = tabStrip.findTabByValue("basic");
                        var advance = tabStrip.findTabByValue("advance");
                        var comment = tabStrip.findTabByValue("comment");
                        advance.select();
                    }
                    checkok.val(checknum + 1);
                    return;
                }
            }
            checkok.val(checknum);
        }

        function cvCheckExternalPeople(source, args) {
            //alert("external");
            var checkok = $('#<%=hfIfOK.ClientID %>');
            var cbPublishExternal = $('#<%=cbPublishExternal.ClientID %>');
            var checknum = parseInt(checkok.val());
            if (cbPublishExternal.prop("checked")) {
                var peoplecount = $('#<%=hfExternalPeople.ClientID %>').val();
                if ((peoplecount == "0" || peoplecount == "")) {
                    args.IsValid = false;
                    if (checknum == 0) {
                        var tabStrip = $find("<%= RadTabStrip1.ClientID %>");
                        var basic = tabStrip.findTabByValue("basic");
                        var advance = tabStrip.findTabByValue("advance");
                        var comment = tabStrip.findTabByValue("comment");
                        advance.select();
                    }
                    checkok.val(checknum + 1);
                    return;
                }
            }
            checkok.val(checknum);
        }

        function cvCheckExternalNoAuth(source, args) {
            var checkok = $('#<%=hfIfOK.ClientID %>');
            var cbPublishExternal = $('#<%=cbPublishExternal.ClientID %>');
            var checknum = parseInt(checkok.val());
            if (cbPublishExternal.prop("checked")) {
                var externalclass = $('#<%=hfExternalClass.ClientID %>').val();
                if ((externalclass != "" && externalclass != null)) {
                    var data = [externalclass];
                    var ExternalNoAuth = $uof.pageMethod.sync("CheckExternalNoAuth", data);
                    if (ExternalNoAuth === "false") {
                        args.IsValid = false;
                        var tabStrip = $find("<%= RadTabStrip1.ClientID %>");
                        var basic = tabStrip.findTabByValue("basic");
                        var advance = tabStrip.findTabByValue("advance");
                        var comment = tabStrip.findTabByValue("comment");
                        advance.select();
                        checkok.val(checknum + 1);
                        return;
                    }
                }
            }
            checkok.val(checknum);
        }

        //20141017為了與公告發佈申請單一致，將驗證器拿掉
        //
        <%--function cvCheckExternalPrintPeople(source, args) {
            //alert("externalprint");
            var cbExternalPrint = $('#<%=cbExternalPrint.ClientID %>');
            var checkok = $('#<%=hfIfOK.ClientID %>');
            var checknum = parseInt(checkok.val());
            if (cbExternalPrint.prop("checked")) {
                var peoplecount = $('#<%=hfExternalPrintPeople.ClientID %>').val();
                if ((peoplecount == "0" || peoplecount == "")) {
                    args.IsValid = false;
                    if (checknum == 0) {
                        var tabStrip = $find("<%= RadTabStrip1.ClientID %>");
                        var basic = tabStrip.findTabByValue("basic");
                        var advance = tabStrip.findTabByValue("advance");
                        var comment = tabStrip.findTabByValue("comment");
                        advance.select();

                    }
                    checkok.val(checknum + 1);
                    return;
                }
            }
            checkok.val(checknum);
        }--%>

        function resetcount() {
            var checkok = $('#<%=hfIfOK.ClientID %>');
            //alert(checkok.val());
            checkok.val("0");

        }

        function cvChangeTab() {

            var hf = $('#<%=hfTabselect.ClientID %>');
            var tabStrip = $find("<%= RadTabStrip1.ClientID %>");
            var basic = tabStrip.findTabByValue("basic");
            var advance = tabStrip.findTabByValue("advance");
            var comment = tabStrip.findTabByValue("comment");
            //alert(hf.val());
            if (hf.val() == "1")
                advance.select();
            else
                basic.select();
        }

        function ButtonClick() {
            var checkok = $('#<%=hfIfOK.ClientID %>');
            checkok.val("0");
            if (Page_IsValid) {
                return confirm('<%=lblPublishMsg.Text%>');
            }
        }

        function OpenDatePicker(isOpen, dateType)
        {
            if (dateType == "Publish") {
                $find("<%= wdcPublishDate.ClientID %>").set_enabled(isOpen);
                $('#<%=ddlPublishTime.ClientID%>').prop("disabled",!isOpen);
            }
            else if (dateType == "OffShelf") {
                $find("<%= RadDatePicker1.ClientID %>").set_enabled(isOpen);
                $('#<%=ddlOffShelfTime.ClientID%>').prop("disabled", !isOpen);

            }

            if (dateType === false)
                datePicker.clear();
        }
    </script>
    <asp:UpdatePanel runat="server" ID="multiPageUpadePanel">
        <ContentTemplate>
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="無權限修改" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="無權限瀏覽" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" SelectedIndex="0" CausesValidation="false" AutoPostBack="true">
        <Tabs>
            <telerik:RadTab runat="server" Text="基本設定" Value="basic" PageViewID="pageView1" meta:resourcekey="RadTabStrip1Tab1Resource1"></telerik:RadTab>
            <telerik:RadTab runat="server" Text="進階設定" Value="advance" PageViewID="pageView2" meta:resourcekey="RadTabStrip1Tab2Resource1"></telerik:RadTab>
            <telerik:RadTab runat="server" Text="審核意見" Value="comment" PageViewID="pageView3" Visible="false" meta:resourcekey="RadTabStrip1Tab3Resource1"></telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" Width="100%">
        <telerik:RadPageView ID="pageView1" runat="server" Width="100%">
            <table class="PopTable" cellspacing="1" style="width:100%">
                <tr>
                    <td style="width: 140px; white-space: nowrap;">
                        <asp:Label ID="Label1" runat="server" Text="張貼者" meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="LBLannouncer" runat="server" meta:resourcekey="LBLannouncerResource1"></asp:Label>
                    </td>
                    <td style="width: 140px; white-space: nowrap;">
                        <asp:Label ID="Label13" runat="server" Text="張貼部門" meta:resourcekey="Label13Resource1"></asp:Label>
                    </td>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="LBDepartment" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 140px; white-space: nowrap;">
                        <asp:Label ID="Label2" runat="server" Text="分類" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:Label ID="LBLclass" runat="server" meta:resourcekey="LBLclassResource1"></asp:Label>
                        <telerik:RadButton ID="btnSetup" runat="server" Text="設定" OnClick="btnSetup_Click" meta:resourcekey="btnSetupResource1"></telerik:RadButton>


                        <input id="hideClassid" runat="server" type="hidden" />
                    </td>
                </tr>
                <tr runat="server" id="classExamineTR">
                    <td style="width: 140px; white-space: nowrap;">
                        <asp:Label ID="Label12" runat="server" Text="審核者" meta:resourcekey="Label12Resource1"></asp:Label>
                    </td>
                    <td colspan="3">
                        <uc2:UC_ChoiceList ID="UC_ChoiceListClassExamine" runat="server" IsAllowEdit="false" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 140px; white-space: nowrap;">
                        <font color="red">*</font>
                        <asp:Label ID="Label3" runat="server" Text="主題" meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="TBtopic" runat="server" Width="100%" meta:resourcekey="TBtopicResource1"
                            MaxLength="255"></asp:TextBox>
                        <asp:CustomValidator ID="cvTopic" runat="server" Display="Dynamic" ErrorMessage="請填入主題" ClientValidationFunction="cvCheckTopic"
                            meta:resourcekey="RequiredFieldValidator1Resource1"></asp:CustomValidator>

                        <asp:CheckBox ID="ckMarkquee" runat="server" Text="顯示於跑馬燈" meta:resourcekey="ckMarkqueeResource1" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 140px; white-space: nowrap;">
                        <font color="red">*</font>
                        <asp:Label ID="Label7" runat="server" Text="發佈對象" meta:resourcekey="Label7Resource1"></asp:Label>
                    </td>
                    <td colspan="3" runat="server" id="tdInernal1">
                        <uc2:UC_ChoiceList ID="UC_ChoiceList1" TreeHeight="68" runat="server" />
                        <asp:CheckBox ID="cbShowReader" runat="server" Text="瀏覽時顯示" Checked="true" meta:resourcekey="cbShowReaderResource1" />
                        <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="請選擇發佈對象"
                            Display="Dynamic" ClientValidationFunction="cvCheckPublicPeople" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
                        <asp:HiddenField ID="hfPublicPeople" runat="server" Value="0" />
                    </td>
                </tr>
                <tr runat="server" id="trSyncMSG">
                    <td style="width: 140px; white-space: nowrap;">
                        <asp:Label ID="lblSyncMSG" runat="server" Text="發佈通知" meta:resourcekey="lblSyncMSGResource1"></asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:RadioButtonList ID="rdbtnSyncMSG" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Text="所有發佈對象" Value="Y" Selected="True" meta:resourcekey="rdbtnSyncMSG1Resource1"></asp:ListItem>
                            <asp:ListItem Text="發佈對象中的訂閱者" Value="N" meta:resourcekey="rdbtnSyncMSG2Resource1"></asp:ListItem>
                            <asp:ListItem Text="不通知" Value="X" meta:resourcekey="rdbtnSyncMSG3Resource1"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:Label ID="lblMsgModify" runat="server" Text="※只有異動分類、主題、內容、附件才會發送" ForeColor="Blue" Style="display: none;" meta:resourcekey="lblMsgModifyResource1"></asp:Label>
                    </td>
                </tr>
                <tr runat="server" id="trAutoPublish">
                    <td style="width: 140px; white-space: nowrap;">
                        <asp:Label ID="Label19" runat="server" Text="上架" meta:resourcekey="Label19Resource1"></asp:Label>
                    </td>
                    <td style="white-space: nowrap;" colspan="3">
                        <table>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rbPublishNow" runat="server" GroupName="up" Text="立即上架" Checked="true"
                                        meta:resourcekey="rbPublishNowResource1" onClick="OpenDatePicker(false, 'Publish')" />
                                </td>
                                <td>&nbsp;&nbsp;
                                </td>
                                <td>
                                    <asp:RadioButton ID="rbPublishLater" runat="server" GroupName="up" Text="上架時間" meta:resourcekey="rbPublishLaterResource1"  onClick="OpenDatePicker(true, 'Publish')" />
                                </td>
                                <td>&nbsp;&nbsp;
                                </td>
                                <td>
                                    <telerik:RadDatePicker ID="wdcPublishDate" runat="server" Enabled="false">
                                    </telerik:RadDatePicker>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlPublishTime" runat="server" Enabled="false" ></asp:DropDownList>
                                </td>
                                <td>
                                    <asp:CustomValidator ID="cvNoPublishDate" runat="server" Display="Dynamic" ErrorMessage="請輸入日期"
                                        meta:resourcekey="CustomValidator2Resource1" ClientValidationFunction="cvCheckNoPublicDate"></asp:CustomValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 140px; white-space: nowrap;">
                        <asp:Label ID="Label4" runat="server" Text="下架" meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>
                    <td style="white-space: nowrap;" colspan="3">
                        <table>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="RadioButton1" runat="server" GroupName="down" Text="永不下架" meta:resourcekey="RadioButton1Resource1"  onClick="OpenDatePicker(false, 'OffShelf')"/>
                                </td>
                                <td>&nbsp;&nbsp;
                                </td>
                                <td>
                                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="down" Text="下架時間" meta:resourcekey="RadioButton2Resource1"  onClick="OpenDatePicker(true, 'OffShelf')"/>
                                </td>
                                <td>&nbsp;&nbsp;
                                </td>
                                <td>
                                    <telerik:RadDatePicker ID="RadDatePicker1" runat="server"></telerik:RadDatePicker>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlOffShelfTime" runat="server" Enabled="false" ></asp:DropDownList>
                                </td>
                                <td>
                                    <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="請輸入日期"
                                        meta:resourcekey="CustomValidator2Resource1" ClientValidationFunction="cvCheckNoOffDate"></asp:CustomValidator>
                                    <asp:CustomValidator ID="cvNotLaterThenPublish" runat="server" Display="Dynamic"
                                        ErrorMessage="下架時間需晚於上架時間" ClientValidationFunction="cvCheckTwoDate"
                                        meta:resourcekey="cvNotLaterThenPublishResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 140px; white-space: nowrap;">
                        <asp:Label ID="Label5" runat="server" Text="內容" meta:resourcekey="Label5Resource1"></asp:Label>
                    </td>
                    <td colspan="3">
                        <uc2:UC_HtmlEditor runat="server" ID="RadEditor1" Width="850px" Height="410px" ModuleName="BULLETIN" BulletinSize="true" />
                        <asp:CheckBox ID="chbUndisplayAttachment" runat="server" Visible="false" Text="瀏覽公告時附件不提供下載" meta:resourcekey="chbUndisplayAttachmentResource1" />
                        </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView ID="pageView2" runat="server" Width="100%">
            <table class="PopTable" cellspacing="1">


                <tr id='trPrint'>
                    <td style="width: 140px; white-space: nowrap;">
                        <asp:Label ID="Label8" runat="server" Text="列印控制" meta:resourcekey="Label8Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="cbPrint" runat="server" Text="只允許下列人員列印" meta:resourcekey="cbPrintResource1" />
                        <asp:Label ID="Label11" runat="server" Text="(若未勾選此項，則所有人皆可列印。)" meta:resourcekey="Label11Resource1"></asp:Label>
                        <br />
                        <div id="divChoiceList">
                            <uc2:UC_ChoiceList ID="UC_ChoiceList2" runat="server" />
                        </div>
                        <asp:HiddenField ID="hfPrintPeople" runat="server" Value="0" />
                    </td>
                </tr>
                <tr runat="server" id="trExternalPublish">
                    <td style="width: 140px; white-space: nowrap;">
                        <asp:Label ID="Label14" runat="server" Text="外部發佈" meta:resourcekey="Label14Resource1"></asp:Label>
                    </td>
                    <td>
                        <table cellspacing="0">
                            <tr>
                                <td>
                                    <asp:CheckBox ID="cbPublishExternal" runat="server" Text="同步複製到外部公告" onclick="ChangeExternalStatus();"
                                        meta:resourcekey="cbPublishExternalResource1" />
                                    &nbsp;
                                    <asp:LinkButton ID="lbtnExternalLinK" runat="server" Text="查看外部公告內容" meta:resourcekey="lbtnExternalLinKResource1" ></asp:LinkButton>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <telerik:RadButton ID="wbtnExternal" runat="server" Text="外部類別" CausesValidation="false"
                                        meta:resourcekey="wbtnExternalResource1" OnClientClicking="wbtnExternal_Click" AutoPostBack="false">
                                    </telerik:RadButton>
                                    &nbsp;
                                    <asp:Label ID="LBExternalClass" runat="server" Text=""></asp:Label>
                                    <asp:HiddenField ID="hfExternalClass" runat="server" />
                                    <asp:HiddenField ID="hfExternalClassPath" runat="server" />
                                    <asp:CustomValidator ID="CustomValidator7" Display="Dynamic" runat="server" ErrorMessage="請選擇外部類別" ClientValidationFunction="cvCheckExternalClass" meta:resourcekey="CustomValidator7Resource1"></asp:CustomValidator>
                                    <asp:CustomValidator ID="cvExternalNoAuth" runat="server" ErrorMessage="沒有權限在已選取的外部類別發佈公告，請選取其他類別" Display="Dynamic" ClientValidationFunction="cvCheckExternalNoAuth" meta:resourcekey="cvExternalNoAuthResource1"></asp:CustomValidator>
                                    <asp:CustomValidator ID="cvExternalIsNotAuth" runat="server" Display="Dynamic" ErrorMessage="無權限修改外部類別" meta:resourcekey="cvExternalIsNotAuthResource1"></asp:CustomValidator>
                                </td>

                            </tr>
                            <tr>

                                <td>
                                    <asp:CheckBox ID="cbDeleteExternal" Visible="false" runat="server" Text="同步刪除複製的公告" onclick="ChangeExternalStatus();"
                                        meta:resourcekey="cbDeleteExternalResource1" />
                                </td>
                            </tr>
                        </table>

                        <table class="PopTable" cellspacing="1">
                            <tr>
                                <td style="width: 100px;" class="PopTableLeftTD" runat="server" id="tdInernal2">
                                    <asp:Label ID="Label17" runat="server" Text="外部對象" meta:resourcekey="Label17Resource1"></asp:Label>
                                </td>
                                <td class="PopTableRightTD" runat="server" id="tdInernal3">
                                    <%--                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" >
                                            <ContentTemplate>--%>
                                    <uc2:UC_ChoiceList ID="clExternalPeople" TreeHeight="68" runat="server"></uc2:UC_ChoiceList>
                                    <asp:CheckBox ID="cbShowExternalReader" runat="server" Text="瀏覽時顯示" Checked="true" meta:resourcekey="cbShowExternalReaderResource1" /><br>
                                    <asp:CheckBox ID="cbOuterBulletin" runat="server" Text="同步顯示在內部公告中" Checked="false" meta:resourcekey="cbOuterBulletinReaderResource1" />
                                    <asp:CustomValidator ID="CustomValidator" runat="server" Display="Dynamic" ErrorMessage="請選擇發佈對象"
                                        meta:resourcekey="CustomValidator3Resource1" ClientValidationFunction="cvCheckExternalPeople"></asp:CustomValidator>
                                    <asp:HiddenField ID="hfExternalPeople" runat="server" />
                                    <%--                  </ContentTemplate>
                                        </asp:UpdatePanel>--%>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td style="width: 100px; white-space:nowrap" class="PopTableLeftTD"   runat="server" id="trExternalMSG1">
                                    <asp:Label ID="lblExternalMsg" runat="server" Text="外部發佈通知" meta:resourcekey="lblExternalMsgResource1"></asp:Label>
                                </td>
                                <td class="PopTableRightTD" runat="server" id="trExternalMSG2">
                                    <asp:RadioButtonList ID="rbExternalMSG" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Text="所有發佈對象" Value="Y" Selected="True" meta:resourcekey="rbExternalMSG1Resource1"></asp:ListItem>
                                        <asp:ListItem Text="發佈對象中的訂閱者" Value="N" meta:resourcekey="rbExternalMSG1Resource2"></asp:ListItem>
                                        <asp:ListItem Text="不通知" Value="X" meta:resourcekey="rbExternalMSG1Resource3"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr id='trExPrint'>
                                <td style="width: 100px; white-space:nowrap" class="PopTableLeftTD" runat="server" id="tdExternalPrint2">
                                    <asp:Label ID="Label15" runat="server" Text="外部列印控制" meta:resourcekey="Label15Resource2"></asp:Label>
                                </td>
                                <td class="PopTableRightTD" style="vertical-align: top;" runat="server" id="tdExternalPrint3">
                                    <asp:CheckBox ID="cbExternalPrint" runat="server" Text="只允許下列人員列印" meta:resourcekey="cbPrintResource1" />
                                    <asp:Label ID="Label16" runat="server" Text="(若未勾選此項，則所有人皆可列印)" meta:resourcekey="Label11Resource1"></asp:Label>
                                    <div id="divExternalPrintPeople">
                                        <uc2:UC_ChoiceList ID="clExternalPrintPeople" runat="server" />
                                    </div>
                                    <asp:HiddenField ID="hfExternalPrintPeople" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView ID="pageView3" runat="server" Width="100%">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <Fast:Grid ID="logGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                        AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="True"
                        DefaultSortDirection="Ascending" DefaultSortColumnName="CREATE_DATE" EmptyDataText="沒有資料"
                        EnhancePager="True" KeepSelectedRows="False" OnRowDataBound="logGrid_RowDataBound"
                        PageSize="15" Width="100%" OnPageIndexChanging="logGrid_PageIndexChanging"
                        OnSorting="logGrid_Sorting" meta:resourcekey="logGridResource1">
                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl=""
                            LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                            PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                            PreviousImageUrl="" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="審核者" meta:resourcekey="TemplateFieldResource1">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%#: Bind("CREATE_USER") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblUser" runat="server" Text='<%#: Bind("CREATE_USER") %>' meta:resourcekey="lblUserResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="150px" Wrap="false"/>
                                <ItemStyle Width="150px" Wrap="false"/>
                            </asp:TemplateField>
                            <asp:BoundField DataField="COMMENT" HeaderText="審核意見" HtmlEncode="false" meta:resourcekey="BoundFieldResource1" />
                            <asp:TemplateField HeaderText="審核時間" SortExpression="CREATE_DATE" meta:resourcekey="BoundFieldResource2">                                
                                <ItemTemplate>
                                    <asp:Label ID="lblExamineDateTime" runat="server" Text='<%#: Bind("CREATE_DATE") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="150px" Wrap="false"/>
                                <ItemStyle Width="150px" Wrap="false"/>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="審核狀態" meta:resourcekey="TemplateFieldResource2">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%#: Bind("STATUS") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%#: Bind("STATUS") %>' meta:resourcekey="lblStatusResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="80px" />
                                <HeaderStyle Width="80px" Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                    </Fast:Grid>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
    </telerik:RadMultiPage>

    <asp:Label ID="msnDelete" runat="server" Text="刪除" Visible="False" meta:resourcekey="msnDeleteResource1"></asp:Label>
    <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
    <asp:HiddenField ID="hfFileLength" runat="server" Value="0" />
    <asp:Label ID="lblBtnTitle" runat="server" Text="發佈" Visible="False" meta:resourcekey="lblBtnTitleResource1"></asp:Label>
    <asp:HiddenField ID="hidBullStatus" runat="server" />
    <asp:Label ID="lblMsgPulish" runat="server" Text="同意發佈" Visible="False" meta:resourcekey="lblMsgPulishResource1"></asp:Label>
    <asp:Label ID="lblMsgProcess" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblMsgProcessResource1"></asp:Label>
    <asp:Label ID="lblMsgDeny" runat="server" Text="發佈拒絕" Visible="False" meta:resourcekey="lblMsgDenyResource1"></asp:Label>
    <asp:Label ID="lblSystemMsg" runat="server" Text="系統直接公佈" Visible="false" meta:resourcekey="lblSystemMsgResource1"></asp:Label>
    <asp:Label ID="lblPublishMsg" runat="server" Text="公告需經過審核後才會發佈" Visible="False" meta:resourcekey="lblPublishMsgResource1"></asp:Label>
    <asp:Label ID="lblIsApprove" runat="server" Text="外部公告正在審核中，此次更新只會更新內部公告" Visible="False" meta:resourcekey="lblIsApproveResource1"></asp:Label>
    <asp:Label ID="lblbIsDeleteOuter" runat="server" Text="是否同步刪除外部公告" Visible="False" meta:resourcekey="lblbIsDeleteOuterResource1"></asp:Label>
    <asp:Label ID="lblTitlaDeleteAndExternal" runat="server" Text="刪除(含外部公告)" Visible="False" meta:resourcekey="lblTitlaDeleteAndExternalResource1"></asp:Label>
    <asp:HiddenField ID="hfOuterBulletinID" runat="server" />
    <asp:HiddenField ID="hfOuterBulletinStatus" runat="server" />
    <asp:HiddenField ID="hfTabselect" runat="server" Value="0" />
    <asp:HiddenField ID="hfIfOK" runat="server" Value="0" />
    <asp:HiddenField ID="bulletinID" runat="server" />
    <asp:HiddenField ID="hfApplicant" runat="server" Value="" />
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
