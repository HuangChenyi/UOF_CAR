<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocProperty" Title="文件屬性設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DocProperty.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc2" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     
    <style>
        .labelMutiline {
            white-space:pre-wrap;
        }

        .panelHeightLimit {
            overflow: auto;
            max-height: 80px;
        }
    </style>

    <script id="scriptblock" type="text/javascript">

        function refDocID() {
            return $("#<%=hidRefDoc.ClientID %>").val();
        }

        var arrayNodes = new Array()
        var hidClickValue;

        $(function () {
            $("#<%=txtComment.ClientID%>").removeProp("disabled");
            $("#<%=txtKeyword.ClientID%>").removeProp("disabled");

            ChangeActive();
            ChangeInvalid();

            if (typeof ($("#ChoiceList1")) != "undefined") {
                if ($('#<%=rblApplyRead.ClientID %> input:checked').val() == "AllowALL")
                $("#ChoiceList1").css('visibility', 'hidden');
            else
                $("#ChoiceList1").css('visibility', 'inherit');
            }
            
            var chkUseParentSet = $("#<%=chkUseParentSet.ClientID %>");
            // For主文件
            var chkConvertToPDF = $("#<%=chkConvertToPDF.ClientID %>");

            var chkFileSave = $("#<%=chkFileSave.ClientID %>");
            var chkFilePrint = $("#<%=chkFilePrint.ClientID %>");
            var chkFileDownload = $("#<%=chkFileDownload.ClientID %>");

            var rblFileSave = $("#<%=rblFileSave.ClientID %>");
            var rblFilePrint = $("#<%=rblFilePrint.ClientID %>");
            var rblFileDownload = $("#<%=rblFileDownload.ClientID %>");

            var dwnSecret = $("#<%=dwnSecret.ClientID %>");
            var chkCommonEdit = $("#<%=chkCommonEdit.ClientID %>");
            var rblApplyRead4 = $("#<%=rblApplyRead4.ClientID %>");
            var chkCopy = $("#<%=chkCopy.ClientID %>");
            
            // For本文
            var chkContentConvertToPDF = $("#<%=chkContentConvertToPDF.ClientID%>");
            var chkContentSave = $("#<%=chkContentSave.ClientID%>");
            var chkContentPrint = $("#<%=chkContentPrint.ClientID %>");

            var rblContentSave = $("#<%=rblContentSave.ClientID%>");
            var rblContentPrint = $("#<%=rblContentPrint.ClientID %>");

            // For附件
            var chkAttachConvertToPDF = $("#<%=chkAttachConvertToPDF.ClientID%>");
            var chkAttachSave = $("#<%=chkAttachSave.ClientID%>");
            var chkAttachPrint = $("#<%=chkAttachPrint.ClientID%>");
            var chkAttachDownload = $("#<%=chkAttachDownload.ClientID%>");

            var rblAttachSave = $("#<%=rblAttachSave.ClientID %>");
            var rblAttachPrint = $("#<%=rblAttachPrint.ClientID %>");
            var rblAttachDownload = $("#<%=rblAttachDownload.ClientID %>");

            var folderID = $("#<%= hidFolderID.ClientID %>").val();
            var docStatus = $("#<%= hidDosStatus.ClientID %>").val();

            var isauthority = false;

            if (docStatus == "Publish") {
                var data = [folderID]
                var authority = $uof.pageMethod.sync("getFolderAuthority", data);
                if (authority == "DMSAdmin" || authority == "DMSFolderMang")
                    isauthority = true;
            }

            if (chkUseParentSet != null) {

                //檔案部分
                if (rblFileSave != null) {

                    if (chkUseParentSet.prop("checked")) {

                        chkFileSave.prop("disabled", true);
                        chkFilePrint.prop("disabled", true);
                        chkFileDownload.prop("disabled", true);

                        rblFileSave.prop("disabled", true);
                        rblFilePrint.prop("disabled", true);
                        rblFileDownload.prop("disabled", true);
                    }
                    else {

                        if ($('#<%=rblFileSave.ClientID %> input:checked').val() == "AllowALL")
                            $("#divFileSave").css('visibility', 'hidden');
                        else
                            $("#divFileSave").css('visibility', 'inherit');

                        if ($('#<%=rblFilePrint.ClientID %> input:checked').val() == "AllowALL")
                            $("#divFilePrint").css('visibility', 'hidden');
                        else
                            $("#divFilePrint").css('visibility', 'inherit');

                        if ($('#<%=rblFileDownload.ClientID %> input:checked').val() == "AllowALL")
                            $("#divFileDownload").css('visibility', 'hidden');
                        else
                            $("#divFileDownload").css('visibility', 'inherit');

                        if ($('#<%=rblApplyRead4.ClientID %> input:checked').val() == "AllowALL")
                            $("#Source_ChoiceList3").css('visibility', 'hidden');
                        else
                            $("#Source_ChoiceList3").css('visibility', 'inherit');

                        let ischkUseParentSet = $("#<%=chkUseParentSet.ClientID %>").is(":checked");
                        let ischkConvertToPDF = $("#<%=chkConvertToPDF.ClientID%>").is(":checked");

                        let ischkFileSave = $("#<%=chkFileSave.ClientID%>").is(":checked");
                        let ischkFilePrint = $("#<%=chkFilePrint.ClientID%>").is(":checked");
                        let ischkDownload = $("#<%=chkFileDownload.ClientID%>").is(":checked");
                        let ischkCopy = $("#<%=chkCopy.ClientID%>").is(":checked");

                        if (ischkConvertToPDF) {
                            let isDisabled = (docStatus && !isauthority) || ischkUseParentSet;
                            $("#<%=rblFileSave.ClientID%>").find("input").prop("disabled", isDisabled || !ischkFileSave);
                            $("#<%=rblFilePrint.ClientID%>").find("input").prop("disabled", isDisabled || !ischkFilePrint);
                            $("#<%=rblFileDownload.ClientID%>").find("input").prop("disabled", isDisabled || !ischkDownload);
                            $("#<%=rblApplyRead4.ClientID%>").find("input").prop("disabled", isDisabled || !ischkCopy);
                        }
                        else {
                            $("#<%=rblFileSave.ClientID%>").find("input").prop("disabled", !ischkConvertToPDF);
                            $("#<%=rblFilePrint.ClientID%>").find("input").prop("disabled", !ischkConvertToPDF);
                            $("#<%=rblFileDownload.ClientID%>").find("input").prop("disabled", !ischkConvertToPDF);
                            $("#<%=rblApplyRead4.ClientID%>").find("input").prop("disabled", !ischkConvertToPDF);
                        }       
                    }
                }

                //本文部分
                if (rblContentSave != null) {

                    if (chkUseParentSet.prop("checked")) {

                        chkContentSave.prop("disabled", true);
                        chkContentPrint.prop("disabled", true);

                        rblContentSave.prop("disabled", true);
                        rblContentPrint.prop("disabled", true);
                    }
                    else {
                        if ($('#<%=rblContentSave.ClientID %> input:checked').val() == "AllowALL")
                            $("#divContentSave").css('visibility', 'hidden');
                        else
                            $("#divContentSave").css('visibility', 'inherit');

                        if ($('#<%=rblContentPrint.ClientID %> input:checked').val() == "AllowALL")
                            $("#divContentPrint").css('visibility', 'hidden');
                        else
                            $("#divContentPrint").css('visibility', 'inherit');

                        let ischkUseParentSet = $("#<%=chkUseParentSet.ClientID %>").is(":checked");
                        let isDisabled = (docStatus && !isauthority) || ischkUseParentSet;

                        let ischkContentConvertToPDF = $("#<%=chkContentConvertToPDF.ClientID%>").is(":checked");
                        let ischkContentSave = $("#<%=chkContentSave.ClientID%>").is(":checked");
                        let ischkContentPrint = $("#<%=chkContentPrint.ClientID%>").is(":checked");

                        $("#<%=rblContentPrint.ClientID%>").find("input").prop("disabled", isDisabled || !ischkContentPrint);

                        if (ischkContentConvertToPDF) {
                            $("#<%=rblContentSave.ClientID%>").find("input").prop("disabled", isDisabled || !ischkContentSave); 
                        }
                        else 
                            $("#<%=rblContentSave.ClientID%>").find("input").prop("disabled", !ischkContentConvertToPDF);
                    }
                }

                //附件部分
                if (rblAttachSave != null) {

                    if (chkUseParentSet.prop("checked")) {

                        chkAttachSave.prop("disabled", true);
                        chkAttachPrint.prop("disabled", true);
                        chkAttachDownload.prop("disabled", true);

                        rblAttachSave.prop("disabled", true);
                        rblAttachPrint.prop("disabled", true);
                        rblAttachDownload.prop("disabled", true);
                    }
                    else {

                        if ($('#<%=rblAttachSave.ClientID %> input:checked').val() == "AllowALL")
                            $("#divAttachSave").css('visibility', 'hidden');
                        else
                            $("#divAttachSave").css('visibility', 'inherit');

                        if ($('#<%=rblAttachPrint.ClientID %> input:checked').val() == "AllowALL")
                            $("#divAttachPrint").css('visibility', 'hidden');
                        else
                            $("#divAttachPrint").css('visibility', 'inherit');

                        if ($('#<%=rblAttachDownload.ClientID %> input:checked').val() == "AllowALL")
                            $("#divAttachDownload").css('visibility', 'hidden');
                        else
                            $("#divAttachDownload").css('visibility', 'inherit');

                        let ischkUseParentSet = $("#<%=chkUseParentSet.ClientID %>").is(":checked");
                        let ischkAttachConvertToPDF = $("#<%=chkAttachConvertToPDF.ClientID%>").is(":checked");

                        let ischkAttachSave = $("#<%=chkAttachSave.ClientID%>").is(":checked");
                        let ischkAttachPrint = $("#<%=chkAttachPrint.ClientID%>").is(":checked");
                        let ischkAttachDownload = $("#<%=chkAttachDownload.ClientID%>").is(":checked");

                        if (ischkAttachConvertToPDF) {
                            let isDisabled = (docStatus && !isauthority) || ischkUseParentSet;
                            $("#<%=rblAttachSave.ClientID%>").find("input").prop("disabled", isDisabled || !ischkAttachSave);
                            $("#<%=rblAttachPrint.ClientID%>").find("input").prop("disabled", isDisabled || !ischkAttachPrint);
                            $("#<%=rblAttachDownload.ClientID%>").find("input").prop("disabled", isDisabled || !ischkAttachDownload);
                        }
                        else {
                            $("#<%=rblAttachPrint.ClientID%>").find("input").prop("disabled", !ischkAttachConvertToPDF);
                            $("#<%=rblAttachSave.ClientID%>").find("input").prop("disabled", !ischkAttachConvertToPDF);
                            $("#<%=rblAttachDownload.ClientID%>").find("input").prop("disabled", !ischkAttachConvertToPDF);
                        }
                    }
                }
            }
        });

        function clientNodeChecked(sender, eventArgs) {
            var node = eventArgs.get_node();
            var includeParentClass = $("#<%=hidIncludeParentClass.ClientID%>").val();

            if (!node.get_checked()) {        
                var a = node.get_allNodes();
                for (var j = 0; j < a.length; j++) {
                    var childNode = a[j];
                    childNode.set_checked(false);
                }
                node.set_checked(false);         
            }
            else {
                if (includeParentClass == 'False') {
                    return;
                }
                while (node.get_parent().set_checked != null) {
                    node.get_parent().set_checked(true);

                    node = node.get_parent();
                }
            }
        }
        
        function ChangeActive() {
            var rdoActive1 = $("#<%=rdoActive1.ClientID%>");
            var datepicker = $find("<%= RadDatePicker1.ClientID %>");
            var cbActiveEqualPublish = $("#<%=cbActiveEqualPublish.ClientID%>");
            
            if (datepicker) {
                if (typeof (rdoActive1) != "undefined" && typeof (datepicker) != "undefined") {
                    if ($("#<%=rdoActive1.ClientID%>").is(":checked")) {
                datepicker.set_enabled(false);
                cbActiveEqualPublish.prop("disabled", true);
            }
                    else {
                var folderID = $("#<%= hidFolderID.ClientID %>").val();
                var docStatus = $("#<%= hidDosStatus.ClientID %>").val();

                if (docStatus == "Publish") {
                    var data = [folderID]
                    var authority = $uof.pageMethod.sync("getFolderAuthority", data);
                    if (authority != "DMSAdmin" && authority != "DMSFolderMang") {
                        datepicker.set_enabled(false);
                        cbActiveEqualPublish.prop("disabled", true);
                    }
                    else {
                        datepicker.set_enabled(true);
                        cbActiveEqualPublish.prop("disabled", false);
                    }
                }
                else {
                    datepicker.set_enabled(true);
                    cbActiveEqualPublish.prop("disabled", false);
                }
            }
                }
            }
}
        
        function ChangeInvalid() {
            var rdoInvalid1 = $("#<%=rdoInvalid1.ClientID%>");
            var datepicker = $find("<%= RadDatePicker2.ClientID %>");
        
            if (datepicker) {
                if (typeof (rdoInvalid1) != "undefined" && typeof (datepicker) != "undefined") {
                    if ($("#<%=rdoInvalid1.ClientID%>").is(":checked"))
                        datepicker.set_enabled(false);
                    else
                        datepicker.set_enabled(true);
                }
            }
        }
        
        function wibtnSelectFlow_Click(button, args) {
            var ddlUseWKFList = $("#<%=ddlUseWKFList.ClientID%>");
            var FormVersionId = $("#<%=ddlUseWKFList.ClientID %>").val().split(','); // ddlUseWKFList.options[ddlUseWKFList.selectedIndex].value.split(',');
            $uof.dialog.open2("~/WKF/Browse/ViewMasterFlow.aspx", button, '<%=lblMaintainFlow.Text%>', 900, 800, function (returnValue) { return false; }, { "formVersionId": FormVersionId[0], "flowId": FormVersionId[1] });
        }
        
        //開啟文件連結對話視窗
        function wibtnDocRefLink_ClientClick(button, args) {
        
            var docID = $uof.tool.htmlDecode($("#<%=hidDocid.ClientID%>").val());
            var refID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(SelectRefClientid, true)%>');
            $uof.dialog.open2("~/DMS/DocStore/DocRefLink.aspx", button, "", 1000, 600, OpenDialogResultRefLink, { "docID": docID, "refID": refID });
        
            return false;
        }

        function OpenDialogResultRefLink(returnValue) {

            if (typeof (returnValue) != 'undefined' || returnValue != null) {
                $("#<%=hidRefDoc.ClientID %>").val(returnValue);
                return true;
            }
            else {
                return false;
            }
        }

        //刪除以選擇的文件參考連結
        function DeleteRefDoc(docid) {
            var tmpLinkDocID;

            tmpLinkDocID = $("#<%=hidRefDoc.ClientID%>").val();

            var linksplit = tmpLinkDocID.split("$%");


            for (var i = 0 ; i < linksplit.length ; i++) {
                var s = linksplit[i].indexOf(docid + "$@");

                if (s > -1)
                    linksplit.splice(i, 1);
            }

            var tempLink;
            tempLink = linksplit.join("$%");

            $("#<%=hidRefDoc.ClientID%>").val(tempLink);
        }

        //文件類別Tree resize
        function resizeTree(X, Y) {
            var tree = $find("<%=treeClass.ClientID %>");
            if (tree != null && tree != 'undefined') {
                tree.get_element().style.height = Y - 50 + "px";
                tree.get_element().style.width = X - 126 + "px";
            }
        }

    </script>
    
    <table style="width:100%" border="0">
        <tr>
            <td class="PopTableHeader">
                <div style="text-align:center;">
                    <asp:Label ID="Label12" runat="server" Text="文件屬性修改" meta:resourcekey="Label12Resource1"></asp:Label>
                </div>
            </td>
        </tr>
    </table>

    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" BackColor="#F7F6F3" BorderColor="#999999"
        BorderWidth="1px" EnableTheming="True" BorderStyle="Solid"
        Height="92%" Width="100%" meta:resourcekey="Wizard1Resource1" OnNextButtonClick="Wizard1_NextButtonClick" OnSideBarButtonClick="Wizard1_SideBarButtonClick">
        <StepStyle VerticalAlign="Top" BackColor="White" BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="2px" />
        <SideBarStyle BackColor="White" VerticalAlign="Top" Width="120px" Font-Underline="False" ForeColor="Black" HorizontalAlign="Center" Wrap="false" />
        <NavigationButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" ForeColor="#1C5E55" />
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" Title="1.基本屬性" StepType="Start" meta:resourcekey="WizardStepResource1">
                <asp:Panel ID="panelProperty" runat="server">
                    <table class="PopTable" style="height: 381px; width: 100%" runat="server" id="PropertyTable">
                        <tr>
                            <td style="width: 104px;white-space:nowrap">
                                <asp:Label ID="Label1" runat="server" Text="存放目錄" meta:resourcekey="Label1Resource1"></asp:Label></td>
                            <td style="width: 300px" colspan="3">
                                <span style="word-break: break-all; width: 350px;">
                                    <img alt="" src="../../DMS/images/open.gif" />
                                    <asp:Label ID="lblFolderName" runat="server" meta:resourcekey="lblFolderNameResource1"></asp:Label>
                                </span>
                            </td>
                        </tr>

                        <tr>
                            <td style="width: 104px;white-space:nowrap">
                                <asp:Label ID="Label2" runat="server" Text="文件名稱" meta:resourcekey="Label2Resource1"></asp:Label></td>
                            <td colspan="3">
                                <asp:TextBox ID="txtTitle" runat="server" Width="100%" meta:resourcekey="txtTitleResource1"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 104px;white-space:nowrap">
                                <asp:Label ID="Label3" runat="server" Text="文件編號" meta:resourcekey="Label3Resource1"></asp:Label></td>
                            <td colspan="3">
                                <asp:TextBox ID="txtSerial" runat="server" Width="100%" MaxLength="100" meta:resourcekey="txtSerialResource1"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 98px;white-space:nowrap" class="PopTableLeftTD">
                                <asp:Label ID="Label22" runat="server" Text="文件速別" meta:resourcekey="Label22Resource1"></asp:Label>
                            </td>
                            <td style="width: 300px" class="PopTableRightTD" colspan="3">
                                <asp:RadioButton ID="rdoUrgencyNormal" runat="server" GroupName="Urgency" Text="普通" Checked="true" meta:resourcekey="rdoUrgencyNormalResource1" />
                                <asp:RadioButton ID="rdoUrgencyHigh" runat="server" GroupName="Urgency" Text="急" meta:resourcekey="rdoUrgencyHighResource1" />
                                <asp:RadioButton ID="rdoUrgencyExHigh" runat="server" GroupName="Urgency" Text="緊急" meta:resourcekey="rdoUrgencyExHighResource1" />
                            </td>
                        </tr>
                        <tr id="trChangeReason" style="display:none;">
                            <td>
                                <asp:Label ID="lblChangeReason" runat="server" Text="發佈/變更原因" meta:resourcekey="lblChangeReasonResource1"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="txtChangeReason" runat="server" Rows="3" TextMode="MultiLine"
                                    Width="100%" meta:resourcekey="txtChangeReasonResource1"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 104px;white-space:nowrap">
                                <asp:Label ID="Label24" runat="server" Text="發佈/變更通知" meta:resourcekey="Label24Resource1"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:CheckBoxList ID="cblPublishNotice" runat="server" RepeatDirection="Horizontal" Width="400px">
                                    <asp:ListItem Value="publishUnit" Text="發行單位" meta:resourcekey="publishUnitResource1"></asp:ListItem>
                                    <asp:ListItem Value="custodyUser" Text="保管者" meta:resourcekey="custodyUserResource1"></asp:ListItem>
                                    <asp:ListItem Value="authDep" Text="權責部門" meta:resourcekey="authDepResource1"></asp:ListItem>
                                    <asp:ListItem Value="suitableDep" Text="適用部門" meta:resourcekey="suitableDepResource1"></asp:ListItem>
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 104px;white-space:nowrap">
                                <asp:Label ID="Label4" runat="server" Text="發行單位" meta:resourcekey="Label4Resource1"></asp:Label></td>
                            <td style="width: 300px">
                                <div style="overflow: auto; width: 100%; height: 70px">
                                    <uc2:UC_ChoiceList ID="UC_ChoiceList4" runat="server" ChioceType="Group" ShowMember="false" ExpandToUser="false" />
                                </div>
                            </td>                    
                            <td style="width: 104px;white-space:nowrap">
                                <asp:Label ID="Label5" runat="server" Text="保管者" meta:resourcekey="Label5Resource1"></asp:Label></td>
                            <td style="width: 300px">
                                <div style="overflow: auto; width: 100%; height: 90px">
                                    <uc2:UC_ChoiceList ID="UC_ChoiceList5" runat="server" ChioceType="User" ShowMember="false" ExpandToUser="false" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 98px; white-space:nowrap" class="PopTableLeftTD">
                                <asp:Label ID="Label14" runat="server" Text="權責部門" meta:resourcekey="Label14Resource1"></asp:Label>
                            </td>
                            <td style="width: 300px" class="PopTableRightTD">
                                <div style="width: 100%; height: 90px; overflow: auto;">
                                    <uc1:UC_ChoiceList runat="server" ID="clAuthDep" ChioceType="Group" ShowMember="false" ExpandToUser="false"/>
                                </div>
                            </td>
                            <td style="width: 98px; white-space:nowrap" class="PopTableLeftTD">
                                <asp:Label ID="Label23" runat="server" Text="適用部門" meta:resourcekey="Label23Resource1"></asp:Label>
                            </td>
                            <td style="width: 300px" class="PopTableRightTD">
                                <div style="width: 100%; height: 90px; overflow: auto;">
                                    <uc2:UC_ChoiceList ID="clSuitableDep" runat="server" ChioceType="Group" ShowMember="false" ExpandToUser="false" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 97px; width: 104px;white-space:nowrap">
                                <asp:Label ID="Label6" runat="server" Text="摘要" meta:resourcekey="Label6Resource1"></asp:Label></td>
                            <td style="height: 97px" colspan="3">
                                <asp:TextBox ID="txtComment" runat="server" Height="134px" TextMode="MultiLine" Width="100%" meta:resourcekey="txtCommentResource1"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td style="width: 104px;white-space:nowrap">
                                <asp:Label ID="Label13" runat="server" Text="關鍵字" meta:resourceKey="LabelKeyWordResource1"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="txtKeyword" runat="server" Height="137px" meta:resourceKey="txtCommentResource1"
                                    TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>

                <asp:RadioButtonList ID="rdbtnFileType" runat="server" RepeatDirection="Horizontal"
                    Width="200px" Visible="False" meta:resourcekey="RadioButtonList1Resource1">
                    <asp:ListItem Selected="True" Value="file" meta:resourcekey="ListItemResource1" Text="電子檔"></asp:ListItem>
                    <asp:ListItem Value="paper" meta:resourcekey="ListItemResource2" Text="紙本"></asp:ListItem>
                </asp:RadioButtonList>

            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="2.保存期限" StepType="Step" meta:resourcekey="WizardStepResource2">
                <asp:Panel ID="panelStoragetime" runat="server">
                    <table class="PopTable">
                        <tr>
                            <td rowspan="2" style="width: 50px" class="PopTableLeftTD">
                                <asp:Label ID="Label7" runat="server" Text="生效設定" meta:resourcekey="Label7Resource1"></asp:Label></td>
                            <td colspan="2" class="PopTableRightTD">
                                <asp:RadioButton ID="rdoActive1" runat="server" Checked="True" Text="立即生效" GroupName="Active" meta:resourcekey="rdoActive1Resource1" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="PopTableRightTD" style="width: 63px; padding: 0px 0px 0px 0px">
                                <table >
                                    <tr>
                                        <td  style="text-align: left">
                                            <asp:RadioButton ID="rdoActive2" runat="server" Text="生效日" GroupName="Active" meta:resourcekey="rdoActive2Resource1" />
                                            <telerik:RadDatePicker ID="RadDatePicker1" runat="server" meta:resourcekey="RadDatePicker1Resource1">
                                            </telerik:RadDatePicker>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="cbActiveEqualPublish" runat="server" Text="文件公佈時，公佈日晚於生效日，以公佈日為主" meta:resourcekey="cbActiveEqualPublishResource1" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="2" style="width: 50px" class="PopTableLeftTD">
                                <asp:Label ID="Label8" runat="server" Text="過期設定" meta:resourcekey="Label8Resource1"></asp:Label></td>
                            <td colspan="2" >
                                <asp:RadioButton ID="rdoInvalid1" runat="server" Checked="True" Text="永不過期" GroupName="Invalid" meta:resourcekey="rdoInvalid1Resource1" />
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableRightTD" style="width: 80%; padding: 0px 0px 0px 0px">
                                <table style="width: 100%;">
                                    <tr>
                                        <td class="PopTableRightTD" style="width: 63px; text-align: left;">
                                            <asp:RadioButton ID="rdoInvalid2" runat="server" Text="到期日" GroupName="Invalid" meta:resourcekey="rdoInvalid2Resource1" />
                                            <telerik:RadDatePicker ID="RadDatePicker2" runat="server" meta:resourcekey="RadDatePicker2Resource1">
                                </telerik:RadDatePicker>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="保存期限設定錯誤" meta:resourcekey="CustomValidator2Resource1" Visible="False"></asp:CustomValidator>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="3.機密設定" StepType="Step" meta:resourcekey="WizardStepResource3">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table class="PopTable">
                            <tr>
                                <td style="width: 100%; text-align: left" colspan="2" class="PopTableRightTD">
                                    <asp:CheckBox ID="chkUseParentSet" runat="server" Text="使用父目錄的機密設定" AutoPostBack="True" OnCheckedChanged="chkUseParentSet_CheckedChanged" meta:resourcekey="chkUseParentSetResource1"></asp:CheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 33px" class="PopTableLeftTD">
                                    <asp:Label ID="Label9" runat="server" Text="機密等級" meta:resourcekey="Label9Resource1"></asp:Label></td>
                                <td style="width: 439px; height: 33px" class="PopTableRightTD">&nbsp;<asp:DropDownList ID="dwnSecret" runat="server" Width="100px" meta:resourcekey="dwnSecretResource1">
                                    <asp:ListItem Value="Normal" meta:resourcekey="ListItemResource3" Text="一般"></asp:ListItem>
                                    <asp:ListItem Value="Secret" meta:resourcekey="ListItemResource4" Text="密"></asp:ListItem>
                                    <asp:ListItem Value="XSecret" meta:resourcekey="ListItemResource5" Text="機密"></asp:ListItem>
                                    <asp:ListItem Value="XXSecret" meta:resourcekey="ListItemResource6" Text="極機密"></asp:ListItem>
                                    <asp:ListItem Value="TopSecret" meta:resourcekey="ListItemResource7" Text="絕對機密"></asp:ListItem>
                                </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 30px" class="PopTableLeftTD">
                                    <asp:Label ID="Label10" runat="server" Text="共同編輯" meta:resourcekey="Label10Resource1"></asp:Label></td>
                                <td style="width: 439px; height: 30px" class="PopTableRightTD">
                                    <asp:CheckBox ID="chkCommonEdit" runat="server" Text="允許作者群共同編輯" meta:resourcekey="chkCommonEditResource1" />
                                </td>
                            </tr>
                            <%-- 主文件/檔案之原稿控制 --%>
                            <tr id="OriginalManuscriptFileTR" runat="server">
                                <td class="PopTableLeftTD" runat="server">
                                    <asp:Label ID="lblFileSourceControlTitle" runat="server" Text="主文件原稿控制" meta:resourcekey="lblFileSourceControlTitleResource1"></asp:Label>
                                </td>
                                <td style="width: 439px;" class="PopTableRightTD" runat="server">
                                    <table>
                                        <tr>
                                            <td colspan="3">
                                                <asp:CheckBox ID="chkConvertToPDF" runat="server" Text="啟用線上觀看" Checked="True" meta:resourcekey="chkConvertToPDFResource1" AutoPostBack="True" OnCheckedChanged="chkConvertToPDF_CheckedChanged" />
                                                <asp:Image ID="Image3" runat="server" ImageUrl="~/DMS/images/icon/pdf.gif" meta:resourcekey="Image1Resource1" />
                                            </td>
                                        </tr>       
                                        <tr>
                                            <td style="height: 30px; vertical-align: middle">
                                                &emsp;<asp:Label ID="lblOnlineView" runat="server" Text="線上觀看檔案" meta:resourcekey="lblOnlineViewResource"></asp:Label>
                                            </td>
                                        </tr>
                                        <%-- 可另存 --%>
                                        <tr>
                                            <td style="height:25px">
                                                &emsp;&emsp;<asp:CheckBox ID="chkFileSave" runat="server" Text="可另存" AutoPostBack="True" OnCheckedChanged="chkFileSave_CheckedChanged" meta:resourcekey="chkSaveResource1" />
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="rblFileSave" runat="server" CssClass="SizeS" CellPadding="0" CellSpacing="0" AutoPostBack="True" OnSelectedIndexChanged="rblFile_SelectedIndexChanged" RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True" Value="AllowALL" meta:resourcekey="ListItemResource12" Text="允許全部人員"></asp:ListItem>
                                                    <asp:ListItem Value="AllowList" meta:resourcekey="ListItemResource13" Text="允許下列人員"></asp:ListItem>
                                                    <asp:ListItem Value="DenyList" meta:resourcekey="ListItemResource14" Text="不允許下列人員"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%" colspan="3">
                                                <div id="divFileSave" style="max-height: 100px; overflow: auto; text-align: left; margin-left:30px" runat="server">
                                                    <uc2:UC_ChoiceList ID="UC_clFileSave" runat="server" ExpandToUser="false" IsAllowEdit="true"></uc2:UC_ChoiceList>
                                                </div>
                                            </td>
                                        </tr>
                                        <%-- 可列印 --%>
                                        <tr>
                                            <td style="height:25px">                                              
                                                &emsp;&emsp;<asp:CheckBox ID="chkFilePrint" runat="server" Text="可列印" meta:resourcekey="chkFilePrintResource1" AutoPostBack="True" OnCheckedChanged="chkFilePrint_CheckedChanged" />
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="rblFilePrint" runat="server" CssClass="SizeS" CellPadding="0" CellSpacing="0" AutoPostBack="True" OnSelectedIndexChanged="rblFile_SelectedIndexChanged" RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True" Value="AllowALL" meta:resourcekey="ListItemResource12" Text="允許全部人員"></asp:ListItem>
                                                    <asp:ListItem Value="AllowList" meta:resourcekey="ListItemResource13" Text="允許下列人員"></asp:ListItem>
                                                    <asp:ListItem Value="DenyList" meta:resourcekey="ListItemResource14" Text="不允許下列人員"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%" colspan="3">
                                                <div id="divFilePrint" style="max-height: 100px; overflow: auto; text-align: left; margin-left:30px" runat="server">
                                                    <uc2:UC_ChoiceList ID="UC_clFilePrint" runat="server" ExpandToUser="false" IsAllowEdit="true"></uc2:UC_ChoiceList>
                                                </div>
                                            </td>
                                        </tr>
                                        <%-- 已不使用 --%>
                                        <tr style="display:none;">
                                            <td>
                                                <asp:CheckBox ID="chkCopy" runat="server" AutoPostBack="True" meta:resourcekey="chkCopyResource1" OnCheckedChanged="chkCopy_CheckedChanged" Text="可複製" />
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="rblApplyRead4" runat="server" AutoPostBack="True" CellPadding="0" CellSpacing="0" CssClass="SizeS" OnSelectedIndexChanged="rblFile_SelectedIndexChanged" RepeatDirection="Horizontal">
                                                    <asp:ListItem meta:resourcekey="ListItemResource12" Selected="True" Text="允許全部人員" Value="AllowALL"></asp:ListItem>
                                                    <asp:ListItem meta:resourcekey="ListItemResource13" Text="允許下列人員" Value="AllowList"></asp:ListItem>
                                                    <asp:ListItem meta:resourcekey="ListItemResource14" Text="不允許下列人員" Value="DenyList"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr style="display:none;">
                                            <td style="width: 100%" colspan="3">
                                                <div id="Source_ChoiceList3" style="max-height: 100px; overflow: auto;" runat="server">
                                                    <uc2:UC_ChoiceList ID="UC_clApplyRead4" runat="server"  ExpandToUser="false" IsAllowEdit="true"></uc2:UC_ChoiceList>
                                                </div>
                                            </td>
                                        </tr>
                                        <%-- 可下載 --%>
                                        <tr>
                                            <td colspan="3" style="height:25px; vertical-align: middle">
                                                &emsp;<asp:Label ID="lblSource" runat="server" Text="原始檔" meta:resourcekey="lblSourceResource1"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height:25px">
                                                <asp:Label ID="lblSource2" runat="server" Text="下載權限" style="display:none;" meta:resourcekey="lblSource2Resource1"></asp:Label>
                                                &emsp;&emsp;<asp:CheckBox ID="chkFileDownload" runat="server" Text="可下載" AutoPostBack="True" OnCheckedChanged="chkFileDownload_CheckedChanged" meta:resourcekey="chkDownloadResource1" />
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="rblFileDownload" runat="server" CssClass="SizeS" CellPadding="0" CellSpacing="0" AutoPostBack="True" OnSelectedIndexChanged="rblFile_SelectedIndexChanged" RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True" Value="AllowALL" meta:resourcekey="ListItemResource12" Text="允許全部人員"></asp:ListItem>
                                                    <asp:ListItem Value="AllowList" meta:resourcekey="ListItemResource13" Text="允許下列人員"></asp:ListItem>
                                                    <asp:ListItem Value="DenyList" meta:resourcekey="ListItemResource14" Text="不允許下列人員"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%" colspan="3">
                                                <div id="divFileDownload" style="max-height: 100px; overflow: auto; text-align: left; margin-left:30px" runat="server">
                                                    <uc2:UC_ChoiceList ID="UC_clFileDownload" runat="server"  ExpandToUser="false" IsAllowEdit="true"></uc2:UC_ChoiceList>
                                                </div>
                                            </td>
                                        </tr>
                                        <%-- 離線文件 --%>
                                        <tr >
                                            <td colspan="3" style="height: 30px; vertical-align: middle">
                                                &emsp;<asp:CheckBox ID="cbAllowRelease" runat="server" Text="允許產生離線文件" meta:resourcekey="cbAllowReleaseResource1" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:CustomValidator ID="cvSourceNoChoice" runat="server" ErrorMessage='請選擇""人員' Visible="False" meta:resourcekey="cvSourceNoChoiceResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <%-- 本文原稿控制 --%>
                            <tr id="OriginalManuscriptContentTR" runat="server">
                                <td class="PopTableLeftTD" runat="server">
                                    <asp:Label ID="lblContentSourceControlTitle" runat="server" Text="本文原稿控制" meta:resourcekey="lblContentTitleResource1"></asp:Label>
                                </td>
                                <td style="width: 439px;" class="PopTableRightTD" runat="server">
                                    <table>
                                        <%-- 啟用線上觀看 --%>
                                        <tr>
                                            <td colspan="3">
                                                <asp:CheckBox ID="chkContentConvertToPDF" runat="server" Text="啟用線上觀看" meta:resourcekey="chkConvertToPDFResource1" AutoPostBack="True" OnCheckedChanged="chkContentConvertToPDF_CheckedChanged" />
                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/DMS/images/icon/pdf.gif" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 30px; vertical-align: middle">
                                                &emsp;<asp:Label ID="lblOnlineView2" runat="server" Text="線上觀看檔案" meta:resourcekey="lblOnlineViewResource"></asp:Label>
                                            </td>
                                        </tr>
                                        <%-- 可另存 --%>
                                        <tr>
                                            <td style="height:25px">
                                                &emsp;&emsp;<asp:CheckBox ID="chkContentSave" runat="server" Text="可另存" meta:resourcekey="chkSaveResource1" AutoPostBack="True" OnCheckedChanged="chkContentSave_CheckedChanged" />
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="rblContentSave" runat="server" CssClass="SizeS" CellPadding="0" CellSpacing="0" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblContent_SelectedIndexChanged">
                                                    <asp:ListItem Selected="True" Value="AllowALL" meta:resourcekey="ListItemResource12" Text="允許全部人員"></asp:ListItem>
                                                    <asp:ListItem Value="AllowList" meta:resourcekey="ListItemResource13" Text="允許下列人員"></asp:ListItem>
                                                    <asp:ListItem Value="DenyList" meta:resourcekey="ListItemResource14" Text="不允許下列人員"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%;" colspan="3">
                                                <div id="divContentSave" style="max-height: 100px; overflow: auto; text-align: left; margin-left:30px" runat="server">
                                                    <uc2:UC_ChoiceList ID="UC_clContentSave" runat="server" ExpandToUser="false" IsAllowEdit="true"></uc2:UC_ChoiceList>
                                                </div>
                                            </td>
                                        </tr>
                                        <%-- 分隔線 --%>
                                        <tr>
                                            <td colspan="3">
                                                <hr />
                                            </td>
                                        </tr>
                                        <%-- 可列印 --%>
                                        <tr>            
                                            <td colspan="3" style="height:25px;" >
                                                <asp:Label ID="lblArticle" runat="server" Text="本文內容(原始內容，不包含浮水印)" meta:resourcekey="lblArticleResource"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="chkContentPrint" runat="server" Text="可列印" AutoPostBack="True" OnCheckedChanged="chkContentPrint_CheckedChanged" meta:resourcekey="chkContentPrintResource1" />
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="rblContentPrint" runat="server"
                                                    CellPadding="0" CellSpacing="0" AutoPostBack="True" CssClass="SizeS"
                                                    OnSelectedIndexChanged="rblContent_SelectedIndexChanged" RepeatDirection="Horizontal" >
                                                    <asp:ListItem Selected="True" Value="AllowALL" Text="允許全部人員" meta:resourcekey="ListItemResource12" ></asp:ListItem>
                                                    <asp:ListItem Value="AllowList" Text="允許下列人員" meta:resourcekey="ListItemResource13" ></asp:ListItem>
                                                    <asp:ListItem Value="DenyList" Text="不允許下列人員" meta:resourcekey="ListItemResource14" ></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%;" colspan="3">
                                                <div id="divContentPrint" style="max-height: 100px; overflow: auto; text-align: left; margin-left:30px;" runat="server">
                                                    <uc1:UC_ChoiceList ID="UC_clContentPrint" runat="server" ExpandToUser="false" IsAllowEdit="true"></uc1:UC_ChoiceList>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <%-- 主文件/檔案+本文之附件原稿控制 --%>
                            <tr id="OriginalManuscriptAttachTR" runat="server">
                                <td style="width: 15%;" align="right" class="PopTableLeftTD">
                                    <asp:Label ID="lblAttachTilte" runat="server" Text="附件原稿控制" meta:resourcekey="lblAttachTilteResource1"></asp:Label>
                                </td>
                                <td class="PopTableRightTD">
                                    <asp:CheckBox ID="chkAttachFromArticle" runat="server" Text="使用主文件原稿控制設定" AutoPostBack="true" OnCheckedChanged="chkAttachFromArticle_CheckedChanged" meta:resourcekey="chkAttachFromArticleResource1"/>
                                    <br id="brAttachFromArticle" runat="server" />
                                    <asp:CheckBox ID="chkAttachConvertToPDF" runat="server" Text="啟用線上觀看" AutoPostBack="True" OnCheckedChanged="chkAttachConvertToPDF_CheckedChanged" meta:resourcekey="chkConvertToPDFResource1" />
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/DMS/images/icon/pdf.gif" meta:resourcekey="Image1Resource1" />
                                    
                                    <table id="tbViewAttach" runat="server"> 
                                        <tr>
                                            <td style="height: 30px; vertical-align: middle">
                                                &emsp;<asp:Label ID="lblAttachOnlineView" runat="server" Text="線上觀看檔案" meta:resourcekey="lblOnlineViewResource"></asp:Label>
                                            </td>
                                        </tr>
                                        <%-- 可另存 --%>
                                        <tr>
                                            <td style="height:25px">
                                                &emsp;&emsp;<asp:CheckBox ID="chkAttachSave" runat="server" Text="可另存" AutoPostBack="True" OnCheckedChanged="chkAttachSave_CheckedChanged" meta:resourcekey="chkSaveResource1" />
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="rblAttachSave" runat="server"
                                                    CellPadding="0" CellSpacing="0" AutoPostBack="True" CssClass="SizeS"
                                                    OnSelectedIndexChanged="rblAttach_SelectedIndexChanged" RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True" Value="AllowALL" Text="允許全部人員" meta:resourcekey="ListItemResource12"></asp:ListItem>
                                                    <asp:ListItem Value="AllowList" Text="允許下列人員" meta:resourcekey="ListItemResource13"></asp:ListItem>
                                                    <asp:ListItem Value="DenyList" Text="不允許下列人員" meta:resourcekey="ListItemResource14"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%; text-align: left;" colspan="3">
                                                <div id="divAttachSave" style="max-height: 100px; overflow: auto; text-align: left; margin-left:30px" runat="server">
                                                    <uc1:UC_ChoiceList ID="UC_clAttachSave" runat="server" ExpandToUser="false" IsAllowEdit="true"></uc1:UC_ChoiceList>
                                                </div>
                                            </td>
                                        </tr>
                                        <%-- 可列印 --%>
                                        <tr>
                                            <td style="height:25px">
                                                &emsp;&emsp;<asp:CheckBox ID="chkAttachPrint" runat="server" Text="可列印" AutoPostBack="True" OnCheckedChanged="chkAttachPrint_CheckedChanged" meta:resourcekey="chkAttachPrintResource1" /></td>
                                            <td>
                                                <asp:RadioButtonList ID="rblAttachPrint" runat="server"
                                                    CellPadding="0" CellSpacing="0" AutoPostBack="True" CssClass="SizeS"
                                                    OnSelectedIndexChanged="rblAttach_SelectedIndexChanged" RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True" Value="AllowALL" Text="允許全部人員" meta:resourcekey="ListItemResource12"></asp:ListItem>
                                                    <asp:ListItem Value="AllowList" Text="允許下列人員" meta:resourcekey="ListItemResource13"></asp:ListItem>
                                                    <asp:ListItem Value="DenyList" Text="不允許下列人員" meta:resourcekey="ListItemResource14"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%; text-align: left;" colspan="3">
                                                <div id="divAttachPrint" style="max-height: 100px; overflow: auto; text-align: left; margin-left:30px" runat="server">
                                                    <uc1:UC_ChoiceList ID="UC_clAttachPrint" runat="server" ExpandToUser="false" IsAllowEdit="true"></uc1:UC_ChoiceList>
                                                </div>
                                            </td>
                                        </tr>      
                                        <%-- 可下載 --%>
                                        <tr>
                                            <td colspan="3" style="height: 25px; vertical-align: middle">
                                                &emsp;<asp:Label ID="lblAttachSource" runat="server" Text="原始檔" meta:resourcekey="lblSourceResource5"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &emsp;&emsp;<asp:CheckBox ID="chkAttachDownload" runat="server" Text="可下載" AutoPostBack="True" OnCheckedChanged="chkAttachDownload_CheckedChanged" meta:resourcekey="chkDownloadResource1"/>
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="rblAttachDownload" runat="server"
                                                    CellPadding="0" CellSpacing="0" AutoPostBack="True" CssClass="SizeS"
                                                    OnSelectedIndexChanged="rblAttach_SelectedIndexChanged" RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True" Value="AllowALL" Text="允許全部人員" meta:resourcekey="ListItemResource12"></asp:ListItem>
                                                    <asp:ListItem Value="AllowList" Text="允許下列人員" meta:resourcekey="ListItemResource13"></asp:ListItem>
                                                    <asp:ListItem Value="DenyList" Text="不允許下列人員" meta:resourcekey="ListItemResource14"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%; text-align: left;" colspan="3">
                                                <div id="divAttachDownload" style="max-height: 100px; overflow: auto; text-align: left; margin-left:30px" runat="server">
                                                    <uc1:UC_ChoiceList ID="UC_clAttachDownload" runat="server" ExpandToUser="false" IsAllowEdit="true"></uc1:UC_ChoiceList>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <%-- 主文件/檔案之備註 --%>
                            <tr id="OriginalManuscriptRemarksFileTR" runat="server">
                                <td style="width: 15%;" align="right" class="PopTableLeftTD">
                                    <asp:Label ID="lblRemarkFile" runat="server" Text="備註" meta:resourcekey="lblRemarkResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblRemarkMemo1" runat="server" Text="1.附件不允許產生離線文件。" CssClass="SizeMemo" meta:resourcekey="lblRemarkMemo1Resource1"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblRemarkMemo2" runat="server" Text="2.允許列印線上觀看檔案的人員需同時具有UDoc Viewer的使用權限，
                                        才可在線上觀看時進行列印；若該人員無法列印，請洽系統管理員。" CssClass="SizeMemo" meta:resourcekey="lblRemarkMemo2Resource1"></asp:Label>
                                </td>
                            </tr>
                            <%-- 本文之備註 --%>
                            <tr id="OriginalManuscriptRemarksContentTR" runat="server">
                                <td style="width: 15%; height: 100%;" align="right" class="PopTableLeftTD">
                                    <asp:Label ID="lblRemarkContent" runat="server" Text="備註" meta:resourcekey="lblRemarkResource1" ></asp:Label>
                                </td>
                                <td style="height: 100%;" class="PopTableRightTD">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td colspan="3">
                                                <asp:Label ID="lblPrintUDocMemo1" runat="server" Text="1.當本文啟用線上觀看後，允許列印本文內容的人員，需具有作者(含)以上權限才可觀看到原始內容並進行列印。" CssClass="SizeMemo" meta:resourcekey="lblPrintUDocMemo1Resource1"></asp:Label><br>
                                                <asp:Label ID="lblPrintUDocMemo2" runat="server" Text="2.允許列印附件線上觀看檔案的人員需同時具有UDoc Viewer的使用權限，才可在線上觀看時進行列印；若該人員無法列印，請洽系統管理員。" CssClass="SizeMemo" meta:resourcekey="lblPrintUDocMemo2Resource1"></asp:Label>                                          
                                           </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <asp:Panel ID="plQrCode" runat="server" Visible="false">
                                <tr>
                                    <td style="width: 15%;" align="right" class="PopTableLeftTD">
                                        <asp:Label ID="lblActiveQrCode" runat="server" Text="產生文件QR Code" meta:resourcekey="lblActiveQrCodeResource1"></asp:Label>
                                    </td>
                                    <td class="PopTableRightTD">
                                        <asp:CheckBox ID="cbActiveQrCode" runat="server" Text="啟用" meta:resourcekey="cbActiveQrCodeResource1" />
                                    </td>
                                </tr>
                            </asp:Panel>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="4.調閱權限" meta:resourcekey="WizardStepResource4">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table class="PopTable">
                            <tr>
                                <td colspan="2" class="PopTableRightTD" style="text-align: left">
                                    <asp:CheckBox ID="chkUseParentSetup" runat="server" AutoPostBack="True" OnCheckedChanged="chkUseParentSetup_CheckedChanged"
                                        Text="使用父目錄的調閱設定" meta:resourcekey="chkUseParentSetupResource1" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 93px; height: 138px; vertical-align:middle" class="PopTableLeftTD">
                                    <asp:Label ID="Label20" runat="server" Text="調閱申請" meta:resourcekey="Label20Resource1"></asp:Label>
                                </td>
                                <td style="width: 346px; height: 138px;" class="PopTableRightTD">
                                    <asp:CheckBox ID="chkBorrow" runat="server" Text="允許調閱申請" meta:resourcekey="chkBorrowResource1" Checked="True" onclick="" AutoPostBack="True" OnCheckedChanged="chkBorrow_CheckedChanged" />
                                    &nbsp;<br />
                                    <asp:RadioButtonList ID="rblApplyRead" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rblApplyRead_SelectedIndexChanged" meta:resourcekey="rblApplyReadResource1">
                                        <asp:ListItem Selected="True" Value="AllowALL" meta:resourcekey="ListItemResource12" Text="允許全部人員"></asp:ListItem>
                                        <asp:ListItem Value="AllowList" meta:resourcekey="ListItemResource13" Text="允許下列人員"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <div id="ChoiceList1" style="width: 100%; height: 80px; overflow: auto;">
                                        <uc2:UC_ChoiceList ID="UC_clApplyRead" runat="server" ExpandToUser="false" IsAllowEdit="false"  />
                                    </div>
                                    <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="請選擇調閱人員"
                                        meta:resourceKey="CustomValidator4Resource1" Visible="False"></asp:CustomValidator>
                                </td>
                            </tr>

                            <tr>

                                <td class="PopTableLeftTD">
                                    <asp:Label ID="Label16" runat="server" Text="調閱流程" meta:resourceKey="Label16Resource1"></asp:Label>
                                </td>
                                <td class="PopTableRightTD">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>

                                            <asp:RadioButtonList ID="rblReadProcedure" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rblReadProcedure_SelectedIndexChanged" meta:resourcekey="rblReadProcedureResource1">
                                                <asp:ListItem Value="DefaultFlow" Selected="True" meta:resourcekey="ListItemResource15" Text="簡易流程"></asp:ListItem>
                                                <asp:ListItem Value="WKFFlow" meta:resourcekey="ListItemResource16" Text="電子簽核"></asp:ListItem>
                                            </asp:RadioButtonList>
                                            
                                            <asp:Panel ID="pnlViewerInForm" runat="server">
                                                &#160; &#160;
                                                <asp:Label ID="lblViewerTitle" runat="server" Text="在表單中直接預覽文件內容：" meta:resourcekey="lblViewerTitleResource"></asp:Label>
                                                <asp:RadioButtonList ID="rbListViewerInForm" runat="server" RepeatDirection="Horizontal" style="display: inline;">
                                                    <asp:ListItem Value="true" Text="是" meta:resourcekey="ListItemResource17"></asp:ListItem>
                                                    <asp:ListItem Value="false" Text="否" Selected="True" meta:resourcekey="ListItemResource18"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </asp:Panel>
                                            
                                            &#160; &#160;
                                            <asp:Label ID="labApproveHelp" runat="server" ForeColor="Black" Text="由下列任一「目錄管理者」審核通過即可公佈：" meta:resourcekey="labApproveHelpResource1"></asp:Label>

                                            <div style="display: inline-flex;">
                                                <asp:Label ID="lblPath" runat="server" Visible="False" ForeColor="Blue" meta:resourcekey="lblPathResource1"></asp:Label>
                                                
                                                <asp:Panel ID="pnlReadProcedure" style="width: 100%; height: 90px; overflow: auto;" runat="server">
                                                    <uc2:UC_ChoiceList ID="UC_clReadProcedure" runat="server" ExpandToUser="false" IsAllowEdit="false" />
                                                </asp:Panel>

                                                <span id="WKFFlow">
                                                    <asp:DropDownList ID="ddlUseWKFList" runat="server" Visible="False" Width="134px" meta:resourcekey="ddlUseWKFListResource1">
                                                    </asp:DropDownList>
                                                    <telerik:RadButton ID="wibtnSelectFlow" Text="觀看流程" runat="server" OnClientClicked="wibtnSelectFlow_Click"
                                                        meta:resourcekey="wibtnSelectFlowResource1">
                                                    </telerik:RadButton>
                                                </span>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="5.文件類別" StepType="Finish" meta:resourcekey="WizardStepResource5">
                <telerik:RadTreeView runat="server" ID="treeClass" DefaultImageSrc="~/Common/Images/Icon/icon_m84.gif" CheckBoxes="true" Height="100%" EnableNodeTextHtmlEncoding="true"
                    OnClientNodeChecked="clientNodeChecked" meta:resourcekey="treeClassResource1">
                </telerik:RadTreeView>
                <asp:HiddenField ID="hidNodeTag" runat="server" Value="DMSClass" />
                <asp:HiddenField ID="hidClickValue" runat="server" />
                <asp:HiddenField ID="hidIncludeParentClass" runat="server" />
                <asp:Label runat="server" Text="文件類別" ID="labClassName" Visible="False"
                    meta:resourceKey="labClassNameResource1"></asp:Label>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep7" runat="server" Title="6.參考文件" meta:resourcekey="WizardStepResource6">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <telerik:RadButton ID="wibtnDocRefLink" runat="server" Text="加入參考文件" meta:resourcekey="wibtnDocRefLinkResource1" OnClick="wibtnDocRefLink_Click" OnClientClicked="wibtnDocRefLink_ClientClick">
                                    </telerik:RadButton>
                                </td>
                                <td>
                                    &nbsp;
                                    &nbsp;
                                    &nbsp;
                                </td>
                                <td style="vertical-align:middle">
                                    <asp:CheckBox ID="cbRefLink" runat="server" Text="參考文件只限定於目前版本" meta:resourcekey="cbRefLinkResource1" />
                                    <asp:Label ID="Label17" runat="server" Text="(不勾選則表示參考文件不受版本限制)" ForeColor="Blue" meta:resourcekey="Label17Resource1"></asp:Label>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <telerik:RadButton ID="btnEditRemark" runat="server" Text="維護參考說明"   OnClick="btnEditRemark_Click"  meta:resourcekey="btnEditRemarkResource1" >
                                    </telerik:RadButton>
                                </td>
                            </tr>
                        </table>
                        <Fast:Grid ID="gridDocRef" runat="server" AllowPaging="False" AllowSorting="True" DefaultSortColumnName="DOC_NAME" OnSorting="gridDocRef_Sorting"  Width="100%"
                            AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False" EnhancePager="True" DataKeyNames="DOC_ID" KeepSelectedRows="False"
                            OnRowDataBound="gridDocRef_RowDataBound" OnRowCommand="gridDocRef_RowCommand"  DefaultSortDirection="Ascending" EmptyDataText="No data found"  meta:resourcekey="gridDocRefResource1">
                            <EnhancePagerSettings ShowHeaderPager="True" />
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="狀態" SortExpression="DOC_STATUS" meta:resourcekey="TemplateFieldResource6">
                                        <ItemTemplate>
                                            <asp:Label ID="lblStatus" runat="server" Text='<%#: Bind("DOC_STATUS") %>' meta:resourcekey="lblStatusResource1"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>
                                <asp:TemplateField HeaderText="文件名稱" meta:resourceKey="TemplateFieldResource1" SortExpression="DOC_NAME">
                                    <ItemTemplate>
                                        <span style="word-break: break-all; width: 30%;">
                                            <asp:Image ID="imgDocIcon" runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" meta:resourcekey="imgDocIconResource1"></asp:Image>
                                            <asp:Label ID="labDLFile" onmouseover="this.className='action_over'" class="action_out" onmouseout="this.className='action_out'" runat="server" Text='<%#: Bind("DOC_NAME") %>' meta:resourceKey="labDLFileResource1"></asp:Label>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>  
                                <asp:TemplateField HeaderText="參考說明"  meta:resourcekey="TemplateFieldResource10">
                                    <ItemTemplate>
                                           <asp:TextBox ID="txtRemark" runat="server" Width="98%" Height="80px" TextMode="MultiLine" AutoPostBack="true" OnTextChanged="txtRemark_TextChanged" ></asp:TextBox>  
                                           <asp:Panel ID="plDocRefNote" runat="server" CssClass="panelHeightLimit">
                                             <asp:Label ID="lblRemark" CssClass="labelMutiline" runat="server" Width="100%"></asp:Label>
                                           </asp:Panel>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" Width="30%" />                                 
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="保管者" meta:resourcekey="TemplateFieldResource5">
                                        <ItemTemplate>
                                            <uc2:UC_ChoiceList runat="server" ID="UC_ChoiceList1" IsAllowEdit="false"></uc2:UC_ChoiceList>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" Width="20%" />
                                    </asp:TemplateField>                                    
                                <asp:TemplateField HeaderText="功能" meta:resourceKey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnRemove" runat="server" CommandName="DelRefDoc" CommandArgument='<%#: Eval("DOC_ID") %>' meta:resourceKey="lbtnRemoveResource1" Text="移除"></asp:LinkButton>
                                        <!--Lala: 因考量當參考文件加入當下版本顯示資訊會影響，先把所有資訊隱藏-->
                                        <asp:LinkButton ID="lbtnInfo" runat="server" meta:resourceKey="lbtnInfoResource1" Text="資訊" Visible="False"></asp:LinkButton>
                                        <asp:LinkButton ID="lbtnUpdate" runat="server" Text="更新" CommandName="DocUpdate" CommandArgument='<%# Eval("DOC_ID") %>' Visible ="False" meta:resourcekey="lbtnUpdateResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" Width="7%" />
                                    <ItemStyle Wrap="False"/>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="docid" Visible="False" meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDOCID" runat="server" Text='<%# Bind("DOC_ID") %>' meta:resourcekey="lblDOCIDResource2"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="SYS_VERSION" Visible="False" meta:resourcekey="TemplateFieldResource7">
                                    <ItemTemplate>
                                        <asp:Label ID="lblVersion" runat="server" Text='<%# Bind("SYS_VERSION") %>' meta:resourcekey="lblVersionResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="SYNC_STATUS" Visible="False" meta:resourcekey="TemplateFieldResource8">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSync" runat="server" Text='<%# Bind("SYNC_STATUS") %>' meta:resourcekey="lblSyncResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SOURCE" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSource" runat="server" Text='<%# Bind("SOURCE") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                        <asp:HiddenField ID="hideSelectRef" runat="server"></asp:HiddenField>
                        <asp:HiddenField ID="hfRemarkUI" Value="false" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:WizardStep>
        </WizardSteps>
        <SideBarButtonStyle ForeColor="White" />
        <HeaderStyle BackColor="Silver" BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="2px" Font-Bold="False" ForeColor="Black" HorizontalAlign="Center" />
        <StartNavigationTemplate>
        </StartNavigationTemplate>
        <StepNavigationTemplate>
        </StepNavigationTemplate>
        <SideBarTemplate>
            <asp:DataList ID="SideBarList" runat="server" HorizontalAlign="Left" OnItemDataBound="SideBarList_ItemDataBound" meta:resourcekey="SideBarListResource1">
                <SelectedItemStyle Font-Bold="True" />
                <ItemTemplate>
                    &nbsp;&nbsp;<asp:Image ID="imgSideBar" runat="server" meta:resourcekey="imgSideBarResource1" />
                    <asp:LinkButton ID="SideBarButton" runat="server" BackColor="Transparent" Font-Names="Verdana"
                        ForeColor="Black" meta:resourcekey="SideBarButtonResource1"></asp:LinkButton>&nbsp;
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
        </SideBarTemplate>
        <FinishNavigationTemplate>
        </FinishNavigationTemplate>
    </asp:Wizard>
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="修改文件屬性失敗" meta:resourcekey="CustomValidator1Resource1" Visible="False"></asp:CustomValidator>
    <asp:Label ID="lblModifyError" runat="server" meta:resourcekey="lblModifyErrorResource1"
        Text="修改文件屬性失敗" Visible="False"></asp:Label>
    <asp:Label ID="labDefApprove" runat="server" Text="由下列任一「目錄管理者」審核通過即可公佈：" Visible="False" meta:resourcekey="labDefApproveResource1"></asp:Label>
    <asp:HiddenField ID="hidRefDoc" runat="server" />
    <asp:HiddenField ID="hidDocid" runat="server" />
    <asp:Label ID="labUseWKF" runat="server" Text="使用電子簽核，請選擇簽核流程：" Visible="False" meta:resourcekey="labUseWKFResource1"></asp:Label>
    <asp:Label ID="lanNoApprove" runat="server" Text="此目錄無設定目錄管理者，無法進行審核設定" Visible="False" meta:resourcekey="lanNoApproveResource1"></asp:Label>
    <asp:Label ID="labDocStore" runat="server" meta:resourcekey="labDocStoreResource1"
        Text="文件庫" Visible="False"></asp:Label>
    <asp:Label ID="lblFolderPath" runat="server" Text="引用目錄：" Visible="False" meta:resourcekey="lblFolderPathResource1"></asp:Label>
    <asp:HiddenField ID="hidDosStatus" runat="server" />
    <asp:HiddenField ID="hidPDFError" runat="server" />
    <asp:HiddenField ID="hidFolderID" runat="server" />
    <asp:Label ID="lblNoWKFFlow" runat="server" Text="電子簽核沒有流程，請選擇簡易流程" Visible="False" meta:resourcekey="lblNoWKFFlowResource1"></asp:Label>
    <asp:Label ID="lblNameNotBlank" runat="server" Text="文件名稱不允許空白" Visible="False" meta:resourcekey="lblNameNotBlankResource1"></asp:Label>
    <asp:Label ID="lblSerialRepeat" runat="server" Text="文件編號已被使用" Visible="False" meta:resourcekey="lblSerialRepeatResource1"></asp:Label>
    <asp:Label ID="lblNameRepeat" runat="server" Text="文件名稱在此目錄已被使用" Visible="False" meta:resourcekey="lblNameRepeatResource1"></asp:Label>
    <asp:CustomValidator ID="cvPropertyLimit" runat="server" ErrorMessage="不可空白或沒選人員" Display="Dynamic" Visible="False" meta:resourcekey="cvPropertyLimitResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="cvPropertyLimit2" runat="server" ErrorMessage="必須勾選文件類別" Display="Dynamic" Visible="False" meta:resourcekey="cvPropertyLimit2Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="cvPropertyLimit3" runat="server" ErrorMessage="必須加入參考文件" Display="Dynamic" Visible="False" meta:resourcekey="cvPropertyLimit3Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="cvPropertyLimit4" runat="server" ErrorMessage="不可空白" Display="Dynamic" Visible="False" meta:resourcekey="cvPropertyLimit4Resource1"></asp:CustomValidator>
    <asp:Label ID="lblSelectMsg" runat="server" Text="請選擇以下人員：" Visible="False" meta:resourcekey="lblSelectMsgResource1"></asp:Label>
    <asp:Label ID="lblSelectMem" runat="server" Text="人員" Visible="False" meta:resourcekey="lblSelectMemResource1"></asp:Label>
    <asp:Label ID="lblAutoSerial" runat="server" Text="＊文件自動編號" Visible="False" meta:resourcekey="lblAutoSerialResource1"></asp:Label>
    <asp:Label ID="lblMaintainFlow" runat="server" Text="維護流程" Visible="False" meta:resourcekey="lblMaintainFlowResource1" ></asp:Label>
    <asp:Label ID="lblDraft" runat="server" Text="草稿" Visible="False" meta:resourcekey="lblDraftResource1"></asp:Label>
    <asp:Label ID="lblCheckin" runat="server" Text="已存回" Visible="False" meta:resourcekey="lblCheckinResource1"></asp:Label>
    <asp:Label ID="lblCheckOut" runat="server" Text="已取出" Visible="False" meta:resourcekey="lblCheckOutResource1"></asp:Label>
    <asp:Label ID="lblApproval" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblApprovalResource1"></asp:Label>
    <asp:Label ID="lblPublish" runat="server" Text="已公佈" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
    <asp:Label ID="lblInactive" runat="server" Text="已失效" Visible="False" meta:resourcekey="lblInactiveResource1"></asp:Label>
    <asp:Label ID="lblVoid" runat="server" Text="已作廢" Visible="False" meta:resourcekey="lblVoidResource1"></asp:Label>
    <asp:Label ID="lblTempInact" runat="server" Text="已下架" Visible="False" meta:resourcekey="lblTempInactResource1"></asp:Label>
    <asp:Label ID="lblOldVer" runat="server" Text="舊版本" Visible="False" meta:resourcekey="lblOldVerResource1"></asp:Label>
    <asp:Label ID="lblReAct" runat="server" Text="已上架" Visible="False" meta:resourcekey="lblReActResource1"></asp:Label>
    <asp:Label ID="labVersion" runat="server" Text="版本：" Visible="False" meta:resourcekey="labVersionResource1"></asp:Label>
    <asp:Label ID="labDocDeny" runat="server" Text="發佈拒絕" Visible="False" meta:resourcekey="labDocDenyResource1"></asp:Label>
    <asp:Label ID="lblVioding" runat="server" Text="(作廢審核中)" Visible="False" meta:resourcekey="lblViodingResource1"></asp:Label>
    <asp:Label ID="lblUpdating" runat="server" Text="改版中" Visible="False" meta:resourcekey="lblUpdatingResource1"></asp:Label>
    <asp:Label ID="labNoActive" runat="server" meta:resourcekey="labNoActiveResource1" Text="未生效" Visible="False"></asp:Label>
    <asp:Label ID="lblChoiceBtntxt" runat="server" Text="選取部門" Visible="False" meta:resourcekey="lblChoiceBtntxtResource1"></asp:Label>
    <asp:Label ID="lblcvNonEmpty" runat="server" Text="不可空白" Visible="False" meta:resourcekey="lblcvNonEmptyResource1"></asp:Label>
    <asp:Label ID="lblSourceControl" runat="server" Text="主文件" meta:resourcekey="lblSourceControlResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblAttachControl" runat="server" Text="附件" meta:resourcekey="lblAttachControlResource1" Visible="False"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hidOldInvalid" runat="server" />
</asp:Content>

