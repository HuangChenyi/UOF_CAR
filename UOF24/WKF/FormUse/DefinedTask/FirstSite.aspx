<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_DefinedTask_FirstSite" Title="表單申請" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Trace="False" CodeBehind="FirstSite.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc3" %>

<%@ Register Src="../FormIQY/UC_QueryIqySingle.ascx" TagName="UC_QueryIqySingle" TagPrefix="uc4" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc7" TagName="UC_FileCenter" %>
<%@ Register Src="~/WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollectionUsing.ascx" TagPrefix="uc2" TagName="UC_VersionFieldCollectionUsing" %>
<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx" TagPrefix="uc2" TagName="VersionFieldCollectionUsingUC" %>
<%@ Register Src="~/WKF/Common/UC_FileOnlinePreview.ascx" TagPrefix="uc9" TagName="UC_FileOnlinePreview" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" id="telerikClientEvents1">

        function HideValidatorLabel() {
            $('#<%=lblValidatorScriptName.ClientID%>').hide();
        }
        function CheckJobTitle(e, args) {

            var UserDept = $('#<%=this.ddlUserDept.ClientID%>').val();
            var data = [UserDept, $uof.tool.htmlDecode('<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(applicantUserGUID,true)%>')];
            var checkTitle = $uof.pageMethod.sync("CheckJobTitle", data);
            if (checkTitle == "false") {
                args.IsValid = false;
            } else {
                args.IsValid = true;
            }
        }

        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            var formVersionId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId,true)%>');
            var dialogTitleName = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(dialogTitleName,true)%>');
            var flowId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(flowId,true)%>');

            if (value == "ShowFlow") {
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/Browse/ViewMasterFlow.aspx", args.get_item(), dialogTitleName, 1280, 1080, openDialogResult,
                    { "formVersionId": formVersionId, "flowId": flowId });
            }

            if (value == "SimulationFlow") {


            }

            if (value == "ForOpinion") {
                var UserGUID = "<%=Ede.Uof.EIP.SystemInfo.Current.UserGUID%>";
                var ScriptID = $uof.tool.htmlDecode('<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hiddenScriptId.Value,true)%>');
                var UserDept = $uof.tool.htmlDecode('<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hiddenUserDept.Value,true)%>');
                var IsScriptIQY = 1;
                var agentUserGuid = $uof.tool.htmlDecode('<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["selectUserGUID"],true) %>');
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormUse/FormIQY/IssueIQY.aspx", args.get_item(), "", 850, 700, openDialogResult,
                    { "USER_GUID": UserGUID, "TASK_ID": ScriptID, "IS_SCRIPT_IQY": IsScriptIQY, "USER_DEPT": UserDept, "AGENT_USER_GUID": agentUserGuid });
            }


            if (value == "ForOpinionProposal") {
                var ScriptID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hiddenScriptId.Value,true)%>');
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormUse/FormIQY/SetProposalForOpinion.aspx", args.get_item(), "<%=lblSetProposalForOpinion.Text%>", 430, 320, function () { return false; }, { "ScriptID": ScriptID });
            }

            if (value == "SignComment") {
                var ScriptID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hiddenScriptId.Value,true)%>');
                var IsScript = "Y";
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormUse/AddSignComment.aspx", args.get_item(), "<%=lblAddSignComment.Text%>", 600, 480, openDialogResult, { "ScriptID": ScriptID, "IsScript": IsScript });
            }

            if (value == "PreAdditionalSign") {

            }

            if (value == "FormDescription") {
                args.set_cancel(true);
                var w = $uof.tool.computeScreenSize('w', 1024);
                var h = $uof.tool.computeScreenSize('h', 768);
                var url = '../../FormManagement/EditFormDescription.aspx?formVersionId=' + formVersionId +'&type=View&culture=<%=Ede.Uof.EIP.SystemInfo.Current.Culture%>';
                $uof.window.open(url, w, h, true);
            }
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }


    </script>

    <script id="FirstSitejs" type="text/javascript">

        function saveScrollPosition() {
            $("#<%=this.HiddenField1.ClientID%>").val($("#<%=this.Panel1.ClientID%>").scrollTop());

        }

        function setScrollPosition() {
            $("#<%=this.Panel1.ClientID%>").scrollTop($("#<%=this.HiddenField1.ClientID%>").val());
        }

        Sys.Application.add_load(function () {
            //表單計算欄位
            try {
                //隱藏所有欄位的填寫者Label
                $('.FillerVisible').hide();
                calculate();
                SetDivZero();
            }
            catch (e) {
            }

            try {
                setScrollPosition();
                var validateMsg = $uof.tool.htmlDecode($('#<%=hfValidateMsg.ClientID%>').val());
                var actionMode = $uof.tool.htmlDecode($('#<%=hiddenActionMode.ClientID%>').val());
                var url = $uof.tool.htmlDecode('<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(confirmWinUrl,true)%>');
                var title = $uof.tool.htmlDecode('<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(dialogTitleName,true)%>');

                if (actionMode == "Send" && url !== '') {
                    $uof.dialog.open2(url, '', title, '<%=confirmWinWidth%>', '<%=confirmWinHeight%>',
                        function signDialogResult(returnValue) {
                            if (typeof (returnValue) == "undefined") {
                                //若表單未送出，將模式改回Init
                                $('#<%=hiddenActionMode.ClientID%>').val("Init");
                                return false;
                            }
                            else {
                                $uof.dialog.set_returnValue(returnValue);
                                $uof.dialog.close();
                                return true;
                            }
                        });
                }
                if (actionMode == "noPass") {
                    alert("<%=lblNoPassMsg.Text%>" + validateMsg);
                    //出現過錯誤訊息後也要將模式改回Init
                    $('#<%=hiddenActionMode.ClientID%>').val("Init");
                }
            }
            catch (e) {
                alert("<%=lblnewWindowMsg.Text%>");
            }
        });

    </script>

    <head>
        <style type="text/css">
            .formTitle {
                background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif);
                text-align: center;
                height: 20px
            }

            .formInfo {
                background-color: White;
                vertical-align: top
            }

            .applicantInfo {
                table-layout: fixed;
                white-space: nowrap;
                height: inherit;
            }

                .applicantInfo > tbody {
                    display: block;
                    height: inherit;
                    white-space: nowrap;
                    padding-left: 5px;
                }
        </style>
    </head>
    
    <table width="100%" cellpadding="0" cellpadding="0" border="0" height="100%">
        <tr>
            <td  style="background-image: url(<%=themePath %>/images/wf_bg.gif);vertical-align:top">
                <center>
                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td style="background-image:url(<%=themePath %>/images/wf_a01.gif);background-position:0% 100%;height:15px;width:15px"></td>
                                  <td style="background-image:url(<%=themePath %>/images/wf_a09.gif);background-position:0% 100%;background-repeat:repeat-x;height:15px"></td>
                                  <td style="background-image:url(<%=themePath %>/images/wf_a02.gif);background-position:0% 100%;height:15px;width:15px"></td>
                                </tr>
                                <tr>
                                  <td style="background-image: url(<%=themePath %>/images/wf_a03.gif)"></td>
                                  <td style="background-image: url(<%=themePath %>/images/wf_a04.gif)">
                                      <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <telerik:RadToolBar ID="RadToolBar1" runat="server" CausesValidation="false" Width="100%" OnClientButtonClicking="RadToolBar1_ButtonClicking" meta:resourcekey="UltraWebToolbar1Resource1" OnButtonClick="RadToolBar1_ButtonClick">
                                                    <Items>
                                                        <telerik:RadToolBarButton runat="server"
                                                            ImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                            Value="ShowFlow" CausesValidation="false"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                            CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                            Text="表單流程" meta:resourcekey="TBarButtonResource7">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="spShowFlow">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" CausesValidation="false"
                                                            ImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                            Value="SimulationFlow"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                            CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                            Text="模擬流程" meta:resourcekey="TBarButtonResource11">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="spSimulation">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" CausesValidation="false"
                                                            ImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                            Value="PreAdditionalSign"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                            CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                            Text="進階加簽" meta:resourcekey="TBarButtonResource12">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton Value="PreAdd" runat="server" IsSeparator="True">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server"
                                                            Value="ForOpinion" Text="發出徵詢" CausesValidation="false"
                                                            DisabledImageUrl="~/Common/Images/Icon/icon_m180.gif"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m180.gif"
                                                            ImageUrl="~/Common/Images/Icon/icon_m180.gif"
                                                            CheckedImageUrl="~/Common/Images/Icon/icon_m180.gif" meta:resourcekey="TBarButtonResource8">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" Value="Separator2" IsSeparator="True" Text="Button 9" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource5">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server"
                                                            Text="建議徵詢人員設定" CausesValidation="false"
                                                            Value="ForOpinionProposal"
                                                            DisabledImageUrl="~/Common/Images/Icon/icon_m27.gif"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m27.gif"
                                                            ImageUrl="~/Common/Images/Icon/icon_m27.gif"
                                                            CheckedImageUrl="~/Common/Images/Icon/icon_m27.gif"
                                                            meta:resourcekey="TBarButtonResource9">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" Value="Separator3" IsSeparator="True" Text="Button 11" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource6">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" CausesValidation="false"
                                                            Value="SignComment"
                                                            Text="罐頭意見" 
                                                            DisabledImageUrl="~/Common/Images/Icon/icon_m180.gif"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m180.gif"
                                                            ImageUrl="~/Common/Images/Icon/icon_m180.gif"
                                                            CheckedImageUrl="~/Common/Images/Icon/icon_m180.gif" meta:resourcekey="TBarButtonResource10">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" Value="Separator4" IsSeparator="True" Text="Button 13" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource7">
                                                        </telerik:RadToolBarButton>
                                                         <telerik:RadToolBarButton runat="server"
                                                                                        CausesValidation="false"
                                                                                        CheckedImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                                                        DisabledImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                                                        HoveredImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                                                        ImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                                                        Text="表單說明" Value="FormDescription"  meta:resourcekey="RadToolBarButtonResource9">
                                                                                    </telerik:RadToolBarButton>
                                                                                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="SeparatorbyDescription" meta:resourcekey="RadToolBarButtonResource12">
                                                                                    </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" Text="" Value="TBLabel1" meta:resourcekey="RadToolBarButtonResource8">
                                                            <ItemTemplate>
                                                                <div id="divTip" style="padding-top: 5px">
                                                                <asp:Label ID="lblTB" runat="server" Text="表單儲存後，方可徵詢他人意見。" meta:resourcekey="TBLabelResource3"></asp:Label>
                                                            </div>
                                                                    </ItemTemplate>
                                                        </telerik:RadToolBarButton>
                                                       
                                                    </Items>

                                                </telerik:RadToolBar>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                      </table>
                                      <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 25%; height: 100%; margin: 0; padding: 0; padding-right: 3px;" valign="top">
                                                <table class="PopTable" style="height: 140px;" width="100%">
                                                    <tr style="vertical-align: top;">
                                                        <td align="center" class="PopTableHeader" height="20px" style="text-align: center;">
                                                            <center>
                                                            <asp:Label ID="Label4" runat="server" Text="申請資訊" meta:resourcekey="Label4Resource1"></asp:Label>
                                                            </center>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background-color: white; height: 100%; margin: 0; padding: 0" valign="top">
                                                            <asp:Panel ID="pnlAppInfo" runat="server" Height="140px" ScrollBars="Auto">
                                                                <table cellpadding="0" cellspacing="0" width="100%" id="TABLE1" runat="server" style="margin: 0; padding: 0" class="applicantInfo">
                                                                    <tr>
                                                                        <td align="right" style="width: 26%;" nowrap="nowrap">
                                                                            <asp:Label ID="Label1" runat="server" Text="申請者：" meta:resourcekey="Label1Resource1"></asp:Label>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td style="text-align: left">
                                                                            <asp:Label ID="lblApplicant" runat="server" meta:resourcekey="lblApplicantResource1"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="trApplicantDept" runat="server">
                                                                        <td align="right" style="width: 26%;" nowrap="nowrap">
                                                                            <asp:Label ID="Label2" runat="server" Text="申請部門：" meta:resourcekey="Label2Resource1"></asp:Label>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td style="text-align: left">&nbsp;<asp:DropDownList ID="ddlUserDept" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlUserDept_SelectedIndexChanged" meta:resourcekey="ddlUserDeptResource1"></asp:DropDownList>
                                                                            <asp:CustomValidator ID="cvCheckJobTitle" runat="server" Display="Dynamic" meta:resourcekey="cvCheckJobTitleResource1"
                                                                                ClientValidationFunction="CheckJobTitle" ErrorMessage="申請者部門已變更！請關閉並重新申請。"></asp:CustomValidator>
                                                                            <asp:Label ID="lblMsgNoSettingJobTitle" runat="server" Text="無設定申請者職級" Visible="False" ForeColor="Red" meta:resourcekey="lblMsgNoSettingJobTitleResource1"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" style="width: 26%;" nowrap="nowrap">
                                                                            <asp:Label ID="Label7" runat="server" Text="申請時間：" meta:resourcekey="Label7Resource1"></asp:Label>
                                                                            &nbsp;
                                                                        </td>
                                                                            
                                                                        <td style="text-align: left">
                                                                            <asp:Label ID="lblApplyTime" runat="server" meta:resourcekey="lblApplyTimeResource1"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" style="width: 26%;" nowrap="nowrap">
                                                                            <asp:Label ID="lbeFormStatusTitle" runat="server" Text="緊急程度：" meta:resourcekey="lbeFormStatusTitleResource1"></asp:Label>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td style="text-align: left" align="left">
                                                                            <asp:RadioButtonList ID="rblFormType" runat="server" RepeatDirection="Horizontal" meta:resourcekey="rblFormTypeResource1">
                                                                                <asp:ListItem Value="0" meta:resourcekey="ListItemResource1" Text="緊急"></asp:ListItem>
                                                                                <asp:ListItem Value="1" meta:resourcekey="ListItemResource2" Text="急"></asp:ListItem>
                                                                                <asp:ListItem Selected="True" Value="2" meta:resourcekey="ListItemResource3" Text="普通"></asp:ListItem>
                                                                            </asp:RadioButtonList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="agentLableDisplayTR" runat="server">
                                                                        <td style="width: 26%; text-align: right" nowrap="nowrap">
                                                                            <asp:Label ID="lblAgentApplicant" runat="server" Text="代理填寫者：" meta:resourcekey="lblAgentApplicantResource1"></asp:Label>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td style="text-align: left">
                                                                            <asp:Label ID="lblAgentUser" runat="server" meta:resourcekey="lblAgentUserResource1"></asp:Label></td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="width: 25%; height: 100%; padding-left: 0; padding-right: 3px; margin: 0; padding-bottom: 0; padding-top: 0;" valign="top">
                                                <table cellspacing="0" class="PopTable" style="height: 160px; margin: 0; padding: 0" width="100%">
                                                    <tr style="vertical-align: top;">
                                                        <td align="center" class="PopTableHeader" style="text-align: center; height: 20px">
                                                            <center>
                                                            <asp:Label ID="Label6" runat="server" Text="意見" meta:resourcekey="Label6Resource1"></asp:Label>
                                                            </center>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background-color: white; height: 140px; margin: 0; padding-bottom: 0; padding-top: 0;" valign="top" align="left">
                                                            <asp:TextBox ID="tbxComment" runat="server" Height="100%" Width="100%" TextMode="MultiLine" meta:resourcekey="tbxCommentResource1"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td id="AttachmentsByForm" runat="server" style="width: 25%; height: 100%; margin: 0; padding: 0; padding-right: 3px;" valign="top">
                                                <table cellspacing="0" class="PopTable" style="height: 160px; margin: 0; padding: 0;table-layout:fixed;word-wrap:break-word" width="100%">
                                                    <tr style="vertical-align: top;">
                                                        <td align="center" class="PopTableHeader" height="20px" style="text-align: center;">
                                                            <center>
                                                            <asp:Label ID="lblFormAttach" runat="server" Text="相關附件(表單)" meta:resourcekey="lblFormAttachResource1"></asp:Label>
                                                        </center>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background-color: white; height: 140px; margin: 0; padding: 0; width: 100%; vertical-align: top; text-align: center">
                                                            <div align="center" style="height: 135px; overflow: auto; width: 100%; margin: 0; padding: 0">
                                                                <asp:LinkButton ID="lbtnFileCenter" runat="server" ForeColor="OliveDrab" CausesValidation="False" Text="檔案操作" meta:resourcekey="lbtnRemoteFileCenterResource1" OnClick="lbtnFileCenter_Click"></asp:LinkButton>
                                                                <div id="divFC" runat="server" style="text-align:left">
                                                                    <uc7:UC_FileCenter runat="server" id="UC_FileCenter1" ModuleName="WKF" Editable="false" ProxyEnabled="true"/>
                                                                </div>
                                                                <div id="divFOP" runat="server" style="text-align:left;">
                                                                    <uc9:UC_FileOnlinePreview runat="server" ID="UC_FileOnlinePreview" />
                                                                </div>
                                                                <asp:Label ID="lblFileGroupId" runat="server" Visible="False" meta:resourcekey="lblRemoteFileGroupIdResource1"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td id="AttachmentsBySite" runat="server" style="width: 25%; height: 100%; margin: 0; padding: 0" valign="top">
                                                <table cellspacing="0" class="PopTable" style="height: 160px; margin: 0; padding: 0;table-layout:fixed;word-wrap:break-word" width="100%">
                                                    <tr style="vertical-align: top;">
                                                        <td align="center" class="PopTableHeader" height="20px" style="text-align: center;">
                                                            <center>
                                                        <asp:Label ID="Label8" runat="server" Text="個人附件(站點)" meta:resourcekey="lblPersonalAttachResource1"></asp:Label>
                                                        </center>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" style="background-color: white; height: 140px; margin: 0; padding: 0; width: 100%" valign="top">
                                                            <div align="center" style="height: 135px; overflow: auto; width: 100%; margin: 0; padding: 0">
                                                                <asp:LinkButton ID="lbtnPersonalFileCenter" runat="server" ForeColor="OliveDrab" meta:resourcekey="LinkButton1Resource1" CausesValidation="False" Text="檔案操作" OnClick="lbtnPersonalFileCenter_Click"></asp:LinkButton>
                                                                <div id="divFCPersonal" runat="server"  style="text-align:left">
                                                                    <uc7:UC_FileCenter runat="server" id="UC_PersonalFileCenter" Editable="false" ModuleName="WKF" ProxyEnabled="true"/>
                                                                </div>
                                                                <div id="divFOPPersonal" runat="server" style="text-align:left;">
                                                                    <uc9:UC_FileOnlinePreview runat="server" ID="UC_FileOnlinePreviewPersonal" />
                                                                </div>
                                                                <asp:Label ID="lblPersonalFileGroupId" runat="server" Visible="False" meta:resourcekey="lblPersonalRemoteFileGroupIdResource1"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                      </table>
                                  </td>
                                  <td style="background-image: url(<%=themePath %>/images/wf_a05.gif)"></td>
                                </tr>
                                <tr>
                                  <td style="background-image:url(<%=themePath %>/images/wf_a06.gif);background-position:0% 0%;height:20px;width:15px"></td>
                                  <td style="background-image:url(<%=themePath %>/images/wf_a07.gif);background-position:0% 0%;height:20px"></td>
                                  <td style="background-image:url(<%=themePath %>/images/wf_a08.gif);background-position:0% 0%;height:20px;width:15px"></td>
                                </tr>
                            </table>
                        </td>
                      </tr>
                    </table>
                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="blank8"></td>
                        </tr>
                    </table>
                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="min-width:120px;width:120px">
                                            <img src="<%=themePath %>/images/wf_icon01.jpg" width="120" height="65"></td>
                                        <td style="background-image: url(<%=themePath %>/images/wf_a01.jpg);background-repeat:repeat-x;height:65px;background-position: 0% 100%;">
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="bigT" style="vertical-align: middle;text-align:left; height: 65px">
                                                        <asp:Label ID="lblFormName" runat="server" meta:resourcekey="lblFormNameResource1"></asp:Label>
                                                    </td>
                                                    <td style="vertical-align: middle; height: 65px;text-align:right">
                                                        <asp:Panel ID="ScriptNamePanel" runat="server" meta:resourcekey="ScriptNamePanelResource1">
                                                            <table style="text-align:right;width:100%">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="＊" meta:resourcekey="Label3Resource1"></asp:Label>
                                                                        <asp:Label ID="lblScriptName" runat="server" Text="草稿名稱" meta:resourcekey="lblScriptNameResource1" CssClass="h"></asp:Label>
                                                                        ：
                                                                        <asp:TextBox ID="tbxScriptName" runat="server" Width="200px" meta:resourcekey="tbxScriptNameResource1"></asp:TextBox>
                                                                        <asp:Label ID="lblValidatorScriptName" runat="server" Text="請輸入草稿名稱" ForeColor="Red" Visible="false" meta:resourcekey="lblValidatorScriptNameResource1"></asp:Label>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorScriptName" runat="server" ControlToValidate="tbxScriptName" Display="Dynamic" ErrorMessage="請輸入草稿名稱" meta:resourcekey="RequiredFieldValidatorScriptNameResource1"></asp:RequiredFieldValidator>
                                                                        <asp:CheckBox ID="cbxSendNeedSave" runat="server" Checked="True" Text="送出後儲存副本至草稿匣" meta:resourcekey="cbxSendNeedSaveResource1" CssClass="h" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="26">
                                            <img src="<%=themePath %>/images/wf_a02.jpg" width="26" height="65"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="15" height="8" style="background-image: url(<%=themePath %>/images/wf_a03.gif)">
                                            <img src="<%=themePath %>/images/wf_a03.gif" width="15" height="8"></td>
                                        <td height="8" style="background-image: url(<%=themePath %>/images/wf_a04.gif)"></td>
                                        <td width="15" height="8" style="background-image: url(<%=themePath %>/images/wf_a05.gif)">
                                            <img src="<%=themePath %>/images/wf_a05.gif" width="15" height="8"></td>
                                    </tr>
                                    <tr>
                                        <td style="background-image: url(<%=themePath %>/images/wf_a03.gif)">
                                            <img src="<%=themePath %>/images/wf_a03.gif" width="15" height="8">
                                        </td>
                                        <td style="background-image: url(<%=themePath %>/images/wf_a04.gif)">
                                            <table border="0" align="center" cellpadding="0" cellspacing="0" style="margin-left:auto; margin-right:auto; width:95%">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblSpeedSendFailedMessage" runat="server" Text="快速送出失敗：" Visible="false" ForeColor="Red" meta:resourcekey="lblSpeedSendFailedMessageResource1" ></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Panel ID="Panel1" runat="server" Width="100%" meta:resourcekey="Panel1Resource2">
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td style="height: 18px">&nbsp;</td>
                                                                    <td style="height: 18px" valign="top">
                                                                        <asp:Panel ID="Panel4" runat="server" Width="100%" meta:resourcekey="Panel1Resource2"></asp:Panel>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="background-image: url(<%=themePath %>/images/wf_a05.gif)">
                                            <img src="<%=themePath %>/images/wf_a05.gif" width="15" height="8">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-image:url(<%=themePath %>/images/wf_a06.gif);background-position:0% 0%;height:20px;width:15px"></td>
                                        <td style="background-image:url(<%=themePath %>/images/wf_a07.gif);background-position:0% 0%;height:20px"></td>
                                        <td style="background-image:url(<%=themePath %>/images/wf_a08.gif);background-position:0% 0%;height:20px;width:15px"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="blank8"></td>
                        </tr>
                    </table>    
                </center>

                <asp:Panel ID="Panel3" runat="server" Width="100%" meta:resourcekey="Panel3Resource1">
                    <uc4:UC_QueryIqySingle ID="UC_QueryIqySingle1" runat="server" />
                </asp:Panel>
                
                <asp:HiddenField ID="hiddenScriptId" runat="server" />
                <asp:HiddenField ID="hiddenUserGUID" runat="server" />
                <asp:HiddenField ID="hiddenUserDept" runat="server" />
                <asp:HiddenField ID="hiddenTempScriptId" runat="server" />
                <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
                <asp:HiddenField ID="HiddenFormFileGroupId" runat="server" />
                <asp:HiddenField ID="hiddenActionMode" runat="server" Value="Init" />
                <asp:HiddenField ID="hfValidateMsg" runat="server" />

                <asp:Label ID="lblSaveTxt" runat="server" Text="儲存" Visible="False" meta:resourcekey="lblSaveTxtResource1"></asp:Label>
                <asp:Label ID="lblSendTxt" runat="server" Text="送出" Visible="False" meta:resourcekey="lblSendTxtResource1"></asp:Label>
                <asp:Label ID="lblSpeedSend" runat="server" Text="快速送出" visible="False" meta:resourcekey="lblSpeedSendResource1" ></asp:Label>
                <asp:Panel ID="Panel2" runat="server" Width="100%" Visible="False" meta:resourcekey="Panel1Resource1"></asp:Panel>
                <asp:Label ID="lblPeople" runat="server" meta:resourcekey="lblPeopleResource1" Text="人" Visible="False"></asp:Label>
                <asp:Label ID="lblNoStartGroup" runat="server" meta:resourcekey="lblNoStartGroupResource1" Text="沒有發現起始群組" Visible="False"></asp:Label>
                <asp:Label ID="lblFindTopGroup" runat="server" meta:resourcekey="lblFindTopGroupResource1" Text="已經找到最上層群組，仍未發現該職級" Visible="False"></asp:Label>
                <asp:Label ID="lblUnusual" runat="server" meta:resourcekey="lblUnusualResource1" Text="異常" Visible="False"></asp:Label>
                <asp:Label ID="lblMsgNoJobTitle" runat="server" Text="送出失敗！申請者在所選申請部門中並無設定職級，無法送出！" Visible="False" meta:resourcekey="lblMsgNoJobTitleResource1"></asp:Label>
                <asp:Label ID="lblNoJobTitleMsg" Visible="False" runat="server" Text="您還沒有設定職級! \n\n如有問題請洽詢管理員。" meta:resourcekey="lblNoJobTitleMsgResource1"></asp:Label>
                <asp:Label ID="lblConfirmWinTitle" runat="server" Text="簽核確認" Visible="False" meta:resourcekey="lblConfirmWinTitleResource1"></asp:Label>
                <asp:Label ID="lblnewWindowMsg" Visible="False" runat="server" Text="無法開啟簽核視窗，請嘗試將快顯封鎖程式關閉" meta:resourcekey="lblnewWindowMsgResource1"></asp:Label>
                <asp:Label ID="lblNoPassMsg" runat="server" Text="驗證失敗，失敗原因如下：\n\n" Visible="False" meta:resourcekey="lblNoPassMsgResource1"></asp:Label>
                <asp:Label ID="lblAddSignComment" runat="server" Text="加入簽核意見" Visible="False" meta:resourcekey="lblAddSignCommentResource1"></asp:Label>
                <asp:Label ID="lblAdditionalSign" runat="server" Text="加簽" Visible="False" meta:resourcekey="lblAdditionalSignResource2"></asp:Label>
                <asp:Label ID="lblNoAuth" runat="server" Text="無權限申請此表單" Visible="False" meta:resourcekey="lblNoAuthResource1"></asp:Label>
                <asp:Label ID="lblNoAllowApply" runat="server" Text="此張表單目前不允許申請" Visible="False" meta:resourcekey="lblNoAllowApplyResource1"></asp:Label>
                <asp:Label ID="lblScriptIsDeleteMessage" runat="server" Text="此份草稿可能已經被刪除或出現異常，請重新選取草稿。" Visible="False" meta:resourcekey="lblScriptIsDeleteMessageResource1"></asp:Label>
                <asp:Label ID="lblSetProposalForOpinion" runat="server" Text="建議徵詢人員設定" Visible="False" meta:resourcekey="TBarButtonResource9"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
