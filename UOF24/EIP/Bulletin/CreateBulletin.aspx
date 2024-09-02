<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Bulletin_CreateBulletin" Title="新增公告" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CreateBulletin.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>
<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc2" TagName="UC_HtmlEditor" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function DisplayPrintBtn() {
            var cb = $("#<%=cbPrint.ClientID %>");
            if (cb.prop("checked")) {
                $("#divChoiceList").show();
            }
            else {
                $("#divChoiceList").hide();
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
            var hfExternalClassPath = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hfExternalClassPath.Value,true)%>');
            LBExternalClass.text(hfExternalClassPath);          
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
                var OffShelfDate = $find("<%= OffShelfDate.ClientID %>");
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
                var cbExternalShowUC = $('#<%=cbShowExternalReader.ClientID %>');
                var cbOuterBulletin = $('#<%=cbOuterBulletin.ClientID %>');

                var cbPublishExternalChecked = $('#<%=cbPublishExternal.ClientID %>').is(":checked");
                var cbShowReaderChecked = $('#<%=cbShowReader.ClientID %>').is(":checked");

                var cbOuterBulletinDisabled = cbShowReaderChecked && cbPublishExternalChecked;
                if (!cbOuterBulletinDisabled) {
                    cbOuterBulletin.attr('disabled','disabled');
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
                    cbExternalShowUC.removeAttr('disabled');
                }
                else {
                    wbtnExternal.set_enabled(false);
                    btnEdit2.set_enabled(false);
                    btnEdit3.set_enabled(false);
                    cbExternalPrint.attr('disabled', 'disabled');
                    cbExternalPrint.prop('checked', false);                  
                    cbExternalShowUC.attr('disabled', 'disabled');
                    cbExternalShowUC.prop('checked', true);                   
                }
            }
        }
        function ButtonClick() {
            var checkok = $('#<%=hfIfOK.ClientID %>');            
            checkok.val("0");
            if (Page_IsValid) {
                return confirm('<%=lblPublishMsg.Text%>');
            }
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
            if (typeof (returnValue) == 'undefined')
                return false;
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
            var checkok =  $('#<%=hfIfOK.ClientID %>');
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
                alert(publicdate);
                alert(tday);
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
                var offDate = $find('<%=OffShelfDate.ClientID %>').get_selectedDate();
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
                var offDate = $find('<%=OffShelfDate.ClientID %>').get_selectedDate();
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

        //20141017為了與公告發佈申請單一致，將驗證器拿掉
        //
        <%--function cvCheckPrintPeople(source, args) {
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
        } --%>

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

        function cvCheckExternalPrintPeople(source, args) {
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
        }

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
            if (hf.val() == "1")
                advance.select();
            else
                basic.select();
        }

        function OpenDatePicker(isOpen, dateType)
        {
            if (dateType == "Publish") {
                $find("<%= wdcPublishDate.ClientID %>").set_enabled(isOpen);
                $('#<%=ddlPublishTime.ClientID%>').prop("disabled",!isOpen);
            }
            else if (dateType == "OffShelf") {                
                $find("<%= OffShelfDate.ClientID %>").set_enabled(isOpen);     
                $('#<%=ddlOffShelfTime.ClientID%>').prop("disabled", !isOpen);
            }

            if (dateType === false)
                datePicker.clear();
        }

    </script>
    <asp:UpdatePanel runat="server" ID ="multiPageUpdatePanel">
        <ContentTemplate>
            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="無張貼公告權限" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" SelectedIndex="0" CausesValidation="false" AutoPostBack="true">
                <Tabs>
                    <telerik:RadTab runat="server" Text="基本設定" Value="basic" PageViewID="pageView1" meta:resourcekey="RadTabStrip1Tab1Resource1"></telerik:RadTab>
                    <telerik:RadTab runat="server" Text="進階設定" Value="advance" PageViewID="pageView2" meta:resourcekey="RadTabStrip1Tab2Resource1"></telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" Width="100%">       
                <telerik:RadPageView ID="pageView1" runat="server" Width="100%">
                    <table class="PopTable" cellspacing="1">
                        <tr>
                            <td style="width: 140px; white-space: nowrap;">
                                <asp:Label ID="Label1" runat="server" Text="張貼者" meta:resourcekey="Label1Resource1"></asp:Label>
                            </td>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="LBLannouncer" runat="server" meta:resourcekey="LBLannouncerResource1"></asp:Label>
                            </td>
                            <td style="width: 140px; white-space: nowrap;">
                                <asp:Label ID="Label10" runat="server" Text="張貼部門" meta:resourcekey="Label10Resource1"></asp:Label>
                            </td>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="LBDepartment" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 140px; white-space: nowrap;">
                                <asp:Label ID="Label2" runat="server" Text="分類" meta:resourcekey="Label2Resource1"></asp:Label>
                            </td>
                            <td colspan="3" style="white-space: nowrap;">
                                <asp:Label ID="LBLclass" runat="server" meta:resourcekey="LBLclassResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr runat="server" id="classExamineTR">
                            <td style="width: 140px; white-space: nowrap;">
                                <asp:Label ID="Label12" runat="server" Text="審核者" meta:resourcekey="Label12Resource1"></asp:Label>
                            </td>
                            <td colspan="3" style="white-space: nowrap;">
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


                                <asp:CheckBox ID="ckMarkquee" runat="server" Text="顯示於跑馬燈"  meta:resourcekey="ckMarkqueeResource1" />
                            </td>

                        </tr>
                        <tr runat="server" id="trSyncMSG">
                            <td style="width: 140px; white-space: nowrap;">
                                <asp:Label ID="Label7" runat="server" Text="發佈對象" meta:resourcekey="Label7Resource1"></asp:Label>
                            </td>
                            <td colspan="3">
                                <uc2:UC_ChoiceList ID="UC_ChoiceList1" TreeHeight="68" runat="server"></uc2:UC_ChoiceList>
                                <asp:CheckBox ID="cbShowReader" runat="server" Text="瀏覽時顯示" Checked="true" onclick="ChangeExternalStatus();" meta:resourcekey="cbShowReaderResource1" />
                                <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="請選擇發佈對象" ClientValidationFunction="cvCheckPublicPeople"
                                    meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
                                <asp:HiddenField ID="hfPublicPeople" runat="server" Value="0" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 140px; white-space: nowrap;">
                                <asp:Label ID="lblSyncMSG" runat="server" Text="發佈通知" meta:resourcekey="lblSyncMSGResource1"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:RadioButtonList ID="rdbtnSyncMSG" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="所有發佈對象" Value="Y" Selected="True" meta:resourcekey="rdbtnSyncMSG1Resource1"></asp:ListItem>
                                    <asp:ListItem Text="發佈對象中的訂閱者" Value="N" meta:resourcekey="rdbtnSyncMSG2Resource1"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>

                        <tr>
                            <td style="width: 140px; white-space: nowrap;">
                                <asp:Label ID="Label17" runat="server" Text="上架" meta:resourcekey="Label17Resource1"></asp:Label>
                            </td>
                            <td style="white-space: nowrap;" colspan="3">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rbPublishNow" runat="server" GroupName="up" Text="立即上架" Checked="true"
                                                meta:resourcekey="rbPublishNowResource1" onClick="OpenDatePicker(false, 'Publish');"/>
                                        </td>
                                        <td>&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rbPublishLater" runat="server" GroupName="up" Text="上架時間" meta:resourcekey="rbPublishLaterResource1" onClick="OpenDatePicker(true, 'Publish');" />
                                        </td>
                                        <td>&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <telerik:RadDatePicker ID="wdcPublishDate" runat="server">
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlPublishTime" runat="server"  ></asp:DropDownList>
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
                                <font color="red">*</font>
                                <asp:Label ID="Label4" runat="server" Text="下架" meta:resourcekey="Label4Resource1"></asp:Label>
                            </td>
                            <td style="white-space: nowrap;" colspan="3">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="down" Text="永不下架" meta:resourcekey="RadioButton1Resource1" onClick="OpenDatePicker(false, 'OffShelf');"/>
                                        </td>
                                        <td>&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="down" Checked="true" Text="下架時間" meta:resourcekey="RadioButton2Resource1" onClick="OpenDatePicker(true, 'OffShelf');"/>
                                        </td>
                                        <td>&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <telerik:RadDatePicker ID="OffShelfDate" runat="server" meta:resourcekey="WebDateChooser1Resource1">
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlOffShelfTime" runat="server" ></asp:DropDownList>
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
                                <uc2:UC_HtmlEditor runat="server" ID="reContent" Width="850px" Height="450px" ModuleName="BULLETIN" BulletinSize="true"  />
                            </td>
                        </tr>
                        <tr style=" display:none;">
                            <td style="width: 140px; white-space: nowrap;">
                                <asp:Label ID="Label6" runat="server" Text="附件" meta:resourcekey="Label6Resource1"></asp:Label>
                            </td>
                            <td  colspan="3">
                                <asp:CheckBox ID="chbUndisplayAttachment" runat="server" Text="瀏覽公告時附件不提供下載"
                                    meta:resourcekey="chbUndisplayAttachmentResource1" />
                                <asp:Label ID="Label9" runat="server" Text="如無勾選，則公告的訊息通知以一般組態設定中的設定為主。" ForeColor="Blue" Visible="false"
                                    meta:resourcekey="Label9Resource1"></asp:Label>                       
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
                                <asp:Label ID="Label11" runat="server" Text="(若未勾選此項，則所有人皆可列印)" meta:resourcekey="Label11Resource1"></asp:Label>
                                <div id="divChoiceList">
                                    <uc2:UC_ChoiceList ID="UC_ChoiceList2" runat="server" />
                                </div>
                                <asp:HiddenField ID="hfPrintPeople" runat="server" Value="0" />
                            </td>
                        </tr>
                        <tr runat="server" id="trExternalPublish">
                            <td style="width: 140px; white-space: nowrap;">
                                <asp:Label ID="Label13" runat="server" Text="外部發佈" meta:resourcekey="Label13Resource1"></asp:Label>
                            </td>
                            <td>
                                <table cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="cbPublishExternal" runat="server" Text="同步複製到外部公告" onclick="ChangeExternalStatus();"
                                                meta:resourcekey="cbPublishExternalResource1" />
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
                                            <asp:CustomValidator ID="CustomValidator7" Display="Dynamic" runat="server" ErrorMessage="請選擇外部類別"
                                                ClientValidationFunction="cvCheckExternalClass" meta:resourcekey="CustomValidator7Resource1"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                </table>

                                <div style="margin-bottom: 5px;">
                                    <table class="PopTable" cellspacing="1">
                                        <tr>
                                            <td style="width: 100px;" class="PopTableLeftTD" runat="server" id="tdInernal2">
                                                <asp:Label ID="Label14" runat="server" Text="外部對象" meta:resourcekey="Label14Resource1"></asp:Label>
                                            </td>
                                            <td class="PopTableRightTD" runat="server" id="tdInernal3">
                                                <%--                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>--%>
                                                <uc2:UC_ChoiceList ID="clExternalPeople" TreeHeight="68" runat="server"></uc2:UC_ChoiceList>
                                                <asp:CheckBox ID="cbShowExternalReader" runat="server" Text="瀏覽時顯示" Checked="true" meta:resourcekey="cbShowExternalReaderResource1" /><br>
                                                 <asp:CheckBox ID="cbOuterBulletin" runat="server" Text="同步顯示在內部公告中" Checked="false" meta:resourcekey="cbOuterBulletinReaderResource1" />
                                                <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic" ErrorMessage="請選擇發佈對象"
                                                    meta:resourcekey="CustomValidator3Resource1" ClientValidationFunction="cvCheckExternalPeople"></asp:CustomValidator>
                                                <asp:HiddenField ID="hfExternalPeople" runat="server" />
                                                <%--                                    </ContentTemplate>
                                        </asp:UpdatePanel>--%>
                                            </td>
                                        </tr>
                                        <tr id='trExPrint'>
                                            <td style="width: 100px; white-space:nowrap" class="PopTableLeftTD" runat="server" id="tdExternalPrint2">
                                                <asp:Label ID="Label15" runat="server" Text="外部列印控制" meta:resourcekey="Label15Resource1"></asp:Label>
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
                                </div>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
            <asp:HiddenField ID="hfTabselect" runat="server" Value="0" />
            <asp:HiddenField ID="hfIfOK" runat="server" Value="0" />
            <asp:HiddenField ID="hfClassid" runat="server" />
            <asp:HiddenField ID="hfApplicant" runat="server" />
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
       </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblBtnTitle" runat="server" Text="發佈" Visible="False" meta:resourcekey="lblBtnTitleResource1"></asp:Label>
    <asp:Label ID="lblPublishMsg" runat="server" Text="公告需經過審核後才會發佈" Visible="False" meta:resourcekey="lblPublishMsgResource1"></asp:Label>
</asp:Content>
