<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="ReApplyForm.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.Mobile.ReApplyForm" %>
<%@ Register Src="~/WKF/Browse/TaskRecord/UC_TaskSiteRecord.ascx" TagName="UC_TaskSiteRecord" TagPrefix="uc4" %>
<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx" TagName="VersionFieldCollectionUsingUC" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../FormIQY/UC_QueryIqyTask.ascx" TagName="UC_QueryIqyTask" TagPrefix="uc5" %>
<%@ Register Src="../TaskSiteSignInfo/UC_SignComment.ascx" TagName="UC_SignComment" TagPrefix="uc6" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>
<%@ Register Src="~/WKF/FormUse/Mobile/UC_MobileVersionFieldCollectionUsing.ascx" TagPrefix="uc2" TagName="UC_MobileVersionFieldCollectionUsing" %>
<%@ Register Src="~/WKF/Common/UC_FileOnlinePreview.ascx" TagPrefix="uc9" TagName="UC_FileOnlinePreview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        
    <style>
        .formTitle {
            background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif);
            text-align: center;
            height: 20px;
        }

        .formInfo {
            background-color: White;
            vertical-align: top;
        }
        /*common*/

        .RadForm_MetroTouch .rfdSelect, .RadForm_Silk .rfdSelect, .RadForm_Silk .rfdSelectBox {
            font-size: 100% !important;
        }

        .rfdSelectBox li {
            height: 1.8em;
            line-height: 1em;
        }

        .RadForm_MetroTouch label {
            font-size: 100% !important;
        }

        .RadForm_MetroTouch label.title {
            font-size: 100% !important;
            font-weight: 700 !important;
            margin: 0 0 .28571429rem !important;
        }

        .pageLayout {
        }

        .pageLayout h1,
        .pageLayout h2 {
            font-weight: normal;
        }

        .pageLayout h1 {
            margin: 0;
            font-size: 133%;
        }

        .pageLayout h2 {
            font-size: 180%;
        }

        .pageLayout h3 {
            font-size: 133%;
        }

        .pageLayout .riTextBox {
            width: 100%;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        .pageLayout .radios td {
            padding-right: 15px;
        }

        .pageLayout .t-row {
            padding-bottom: 15px;
        }
        /*header*/
        .pageLayout .header {
            /*background-color: #e2e2dc;*/
            /*background-color: #ee6e73;*/
            background-color: #F6511D;
            color: #ffffff;
            line-height: 40px;
            width: 100%;
        }

        .pageLayout .header p {
            font-size: 1.43em;
        }

        .pageLayout .header img {
            width: 100%;
            display: block;
        }

        /*content*/
        /*.content {
        text-align: center;
        }*/
        .blockheader {
            padding: .5rem 1rem;
            box-shadow: none;
            border-top: 1px solid #d4d4d5;
            border-left: 1px solid #d4d4d5;
            border-right: 1px solid #d4d4d5;
            margin: 20px 0 0 0;
            border-radius: .28571429rem .28571429rem 0 0;
            background: #7FB800;
            color: #fff;
        }

        .blockheader + .content {
            border: 1px solid #d4d4d5;
            border-radius: 0 0 .28571429rem .28571429rem;
            padding: 1em;
        }

        .content.nopadding {
            padding: 1em 0;
        }

        .content .t-container {
            padding: 0;
        }

        .t-container .t-container-static .t-col {
            padding: 0px;
        }

        .t-container.t-container-static {
            padding: 15px 0px 0px 0px !important;
        }

        @media only screen and (min-width: 769px) {

            /*.pageLayout .header {
                padding: 4% 4% 0;
            }*/
            .pageLayout .header {
                text-align: center;
            }
        }

        @media only screen and (max-width: 768px) {

            .pageLayout .header {
                text-align: center;
            }
        }

        .MobileFormList {
            background-clip: padding-box;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            color: rgb(51, 51, 51);
            display: block;
            font-family: sans-serif;
            font-size: 14px;
            line-height: 20.8px;
            list-style-image: none;
            list-style-position: outside;
            list-style-type: none;
            margin-bottom: 0px;
            margin-left: 0px;
            margin-right: 0px;
            margin-top: 0px;
            padding-bottom: 0px;
            padding-left: 0px;
            padding-right: 0px;
            padding-top: 0px;
            text-shadow: rgb(243, 243, 243) 0px 1px 0px;
        }

        .MobileFormList .group {
            cursor: default;
            display: block;
            font-size: 1.0em;
            font-weight: bold;
            line-height: 1.3em;
            list-style-image: none;
            list-style-position: outside;
            list-style-type: none;
            margin-bottom: 0px;
            margin-left: 0px;
            margin-right: 0px;
            margin-top: 0px;
            outline-color: rgb(51, 51, 51);
            outline-style: none;
            outline-width: 0px;
            overflow-x: hidden;
            overflow-y: hidden;
            padding-bottom: 7px;
            padding-left: 4px;
            padding-right: 8px;
            padding-top: 7px;
            position: relative;
            text-align: left;
            border-bottom-color: #999;
            border-bottom-style: solid;
            border-bottom-width: 1.5px;
        }

        .MobileFormList .item {
            font-size: 1em;
            line-height: 1.0em;
            display: block;
            list-style-image: none;
            list-style-position: outside;
            list-style-type: none;
            margin-bottom: 0px;
            margin-left: 0px;
            margin-right: 0px;
            margin-top: 0px;
            overflow-x: visible;
            overflow-y: visible;
            padding-bottom: 0px;
            padding-left: 0px;
            padding-right: 0px;
            padding-top: 0px;
            position: relative;
            text-align: left;
            text-shadow: rgb(243, 243, 243) 0px 1px 0px;
        }

        .MobileFormList .item div {
            border-top-color: rgb(221, 221, 221);
            border-top-style: solid;
            border-top-width: 1px;
            color: rgb(51, 51, 51);
            display: block;
            font-size: 16px;
            line-height: 20.8px;
            list-style-image: none;
            list-style-position: outside;
            list-style-type: none;
            margin-bottom: 0px;
            margin-left: 0px;
            margin-right: 0px;
            margin-top: 0px;
            overflow-x: hidden;
            overflow-y: hidden;
            padding-bottom: 11.2px;
            padding-left: 16px;
            padding-right: 8px;
            padding-top: 11.2px;
            position: relative;
            text-align: left;
            text-decoration: none;                    
        }

        .MobileFormList .item div span:nth-child(1) {
            display: block;
            font-size: 95%;
            float: left;
            margin-bottom: 3px;
            text-shadow: rgb(243, 243, 243) 0px 1px 0px;
            font-weight: 600;
        }

        .MobileFormList .item div span:nth-child(2) {
            display: block;
            font-size: 95%;
            float: right;
           font-weight: normal;
        }

        .MobileFormList .item div span:nth-child(3) {
            display: block;
            font-size: 90%;
            clear: both;
            color:rgba(51,51,51,0.9);
        }

        .MobileFormList .item div span:nth-child(4) {
            display: block;
            font-size: 90%;
            font-weight: normal;
        }

        /*為了開啟表單時一瞬間先隱藏按鈕，待畫面完成後再顯示*/                    
        .footer {
            display: none;
        }

    </style>

    <script id="ReApplyFormJS" type="text/javascript">
        var ajaxManager;
         history.pushState(null, null, window.location.href);
        window.addEventListener('popstate', function () {
            setInterval(function () {
                if (window.location.href.indexOf('FileControlHandler.ashx') <= 0)
                    window.location.href = '#InAppBrowserClosed';
            }, 100);
        });

        function WebForm_OnSubmit() {
            if (typeof (ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) {
                $('.validateFocus input').blur();
                $('.validateFocus textarea').blur();
                for (var i in Page_Validators) {
                    try {
                        if (!Page_Validators[i].isvalid) {
                            var control = $("#" + Page_Validators[i].id);
                            var controlOffset = control.offset().top;
                            var controlHeight = control.height();
                            var windowHeight = $(window).height();
                            $('html, body').scrollTop(controlOffset + 25 - ((windowHeight / 2) - (controlHeight / 2)));
                            control.focus();
                            return;
                        }
                    } catch (e) { }
                }
            
                return false;
            }
            return true;
        }

        function PersonalFileLinkClick() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "PersonalFileLinkClick", "Value": "" }));
            return false;
        }

        function FormFileLinkClick() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "FormFileLinkClick", "Value": "" }));
            return false;
        }

        function SpeedSend() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "SpeedSend", "Value": "" }));
            return false;
        }

        function Send() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Send", "Value": "" }));
            return false;
        }

        function Additional() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Additional", "Value": "" }));
            return false;
        }

        function Return() {
            if ($uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["isMNext"],true)%>').toLowerCase()=='true') {
                setInterval(function () {
                    window.location.href = '#InAppBrowserClosed';
                }, 300);
            }
            return false;
        }

        function saveDraft() {
            var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                ajaxManager.ajaxRequest(JSON.stringify({ "Key": "SaveDraft", "Value": "" }));
            return 'done';
        }

        function saveScrollPosition() 
        {
            $('#<%=this.HiddenField1.ClientID%>').val($('#<%=this.Panel1.ClientID%>').scrollTop()); 
        }       
                
        function setScrollPosition() 
        {        
            $('#<%=this.Panel1.ClientID%>').scrollTop($('#<%=this.HiddenField1.ClientID%>').val());
        }

        $(function () {

            var paras = {
                taskId: $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["TASK_ID"],true)%>'),
                siteId: $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["SITE_ID"],true)%>'),
                nodeSeq: $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["NODE_SEQ"],true)%>')
            };


            if ($uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["isMNext"],true)%>').toLowerCase() == 'true') {
                window.close = function () {
                    setInterval(function () {
                        window.location.href = '#InAppBrowserClosed';
                    }, 300);
                };
            };
            //表單計算欄位
            try {
                calculate();
                //SetDivZero();
            } catch(e) {
            }

            try {
                setScrollPosition();
                var validateMsg = $uof.tool.htmlDecode($('#<%=hfValidateMsg.ClientID%>').val());
                var actionMode = $uof.tool.htmlDecode($('#<%=hiddenActionMode.ClientID%>').val());
                
                if (actionMode == "noPass") {
                    alert('<%=lblNoPassMsg.Text%>' + validateMsg);
                }
            } catch(e) {
                alert("<%=lblnewWindowMsg.Text%>");
            }
        });

        function openDialogResult(returnValue) {
            //判斷是否PostBack
            if (typeof (returnValue) == 'undefined') {
                return false;
            }
            return true;
        }

        function CanCommentClick() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "CanCommentClick", "Value": "" }));
            return false;
        }

        function OnBarMainClick(sender, args) {
            var title = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(dialogTitleName, true)%>');
            var flowId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(flowId,true)%>');
            var formversionId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId,true)%>');
            if (args.get_item().get_value() == "SaveFormDraft") {
                // 驗證欄位
                for (var i = 0; i < Page_Validators.length; ++i) {
                    ValidatorEnable(Page_Validators[i], (oButton.Key == "SaveFormDraft"));

                    if (!Page_Validators[i].isvalid) {
                        args.set_cancel(true);
                        break;
                    }
                }
            }
            else if (args.get_item().get_value() == "SendFormDraft") {
                //欄位送出是PostBack 在後端開窗    	   
                // 驗證欄位
                for (var i = 0; i < Page_Validators.length; ++i) {
                    ValidatorEnable(Page_Validators[i], (oButton.Key == "SendFormDraft"));

                    if (!Page_Validators[i].isvalid) {
                        args.set_cancel(true);
                        break;
                    }
                }
            }
            else if (args.get_item().get_value() == "ShowFlow") {
                args.set_cancel(true);
                $uof.dialog.open2('~/WKF/Browse/ViewMasterFlow.aspx', args.get_item(), title, 1280, 1080, openDialogResult, { 'formVersionId': formversionId, 'flowId': flowId });
            }
            else if (args.get_item().get_value() == "ViewFlow") {
                args.set_cancel(true);
                $uof.dialog.open2('~/WKF/Browse/ViewSignFlow.aspx', args.get_item(), title, 800, 650, function () { return false; },
                    { 'TASK_ID': paras.taskId, 'SITE_ID': paras.siteId, 'NODE_SEQ': paras.nodeSeq });
            }
            else if (args.get_item().get_value() == "ViewFlowDetail") {
                args.set_cancel(true);
                $uof.dialog.open2('~/WKF/FormUse/SiteSignInfo.aspx', args.get_item(), title, 800, 650, function () { return false; },
                    { 'TASK_ID': paras.taskId, 'SITE_ID': paras.siteId });
            }
            else if (args.get_item().get_value() == "SignComment") {
                var para = {
                    'ScriptID': paras.taskId,
                    'SiteID': paras.siteId,
                    'NodeSEQ': '0',
                    'IsScript': 'N'
                }
                args.set_cancel(true);
                $uof.dialog.open2('~/WKF/FormUse/AddSignComment.aspx', args.get_item(), '', 600, 480, openDialogResult, para);
            }
            else if (args.get_item().get_value() == "ForOpinion") {
                var para = {
                    "USER_GUID": $uof.tool.htmlDecode("<%=hiddenUserGUID.Value%>"),
                    "TASK_ID": $uof.tool.htmlDecode("<%=hiddenTaskId.Value%>"),
                    "IS_SCRIPT_IQY": "0",
                    "USER_DEPT": $uof.tool.htmlDecode("<%=hiddenUserDEPT.Value%>"),
                    "SITE_ID": $uof.tool.htmlDecode("<%=hiddenSiteid.Value%>"),
                    "NODE_SEQ": $uof.tool.htmlDecode("<%=hiddenNodeSEQ.Value%>")
                };
                args.set_cancel(true);
                $uof.dialog.open2('~/WKF/FormUse/FormIQY/IssueIQY.aspx', args.get_item(), '發出徵詢', 850, 700, openDialogResult, para);
            }
            else if (args.get_item().get_value() == "SimulationFlow") {

            }
            else if (args.get_item().get_value() == "PreAdditionalSign") {

            }
            else if (args.get_item().get_value() == "Attach") {

            }
            else if (args.get_item().get_value() == "Forum") {
                var TaskID = $uof.tool.htmlDecode("<%=hiddenTaskId.Value%>");
                args.set_cancel(true);
                $uof.dialog.open2('~/WKF/FormForum/DefaultDialog.aspx', args.get_item(), '', 0, 0, function () { return false; }, { 'taskid': TaskID });
            }
            else if (args.get_item().get_value() == "FormDescription") {
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/EditFormDescription.aspx", args.get_item(), "", 1024, 900, function () { return false; }, { "formVersionId": formversionId, "type": "View", "culture": "<%=Ede.Uof.EIP.SystemInfo.Current.Culture%>" });
            }
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == 'undefined') {
                return false;
            }
            return true;
        }

        function checkReturn(oEvent) {
            var comment = $('#<% = txtComment.ClientID %>');
            if (comment.val() == '') {
                alert($('#<% = lblReturnSignComment.ClientID %>').html());
                comment.focus();
                oEvent.cancel = true;
            }
        }

        Sys.Application.add_load(function () {
            var botButtom = $(".footer");
            if (botButtom) {
                setTimeout(function () {
                    botButtom.show();
                }, 500);
            }
            //隱藏所有欄位的填寫者Label
            $('.FillerVisible').hide();
            oncbShowFillerChecked();
        });

        function oncbShowFillerChecked() {
            if ($('#<%=cbShowFiller.ClientID %>').is(':checked')) {
                $('.FillerVisible').show();
            }
            else {
                $('.FillerVisible').hide();
            }
        }
    </script>

    <div class="pageLayout" id="layout" runat="server">
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="pnlRefresh" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="true" HtmlTag="None">
            <telerik:LayoutRow RowType="Generic">
                <Rows>
                    <telerik:LayoutRow RowType="Generic" CssClass="header">
                        <Rows>
                            <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                                <Columns>
                                    <telerik:LayoutColumn Span="12">

                                        <h1>
                                            <asp:Label ID="lblFormName" runat="server" meta:resourcekey="lblFormNameResource1"></asp:Label></h1>

                                    </telerik:LayoutColumn>


                                </Columns>
                            </telerik:LayoutRow>
                        </Rows>
                    </telerik:LayoutRow>

                    <telerik:LayoutRow RowType="Generic" CssClass="content">
                        <Rows>
                            <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                                <Columns>
                                    <telerik:CompositeLayoutColumn Span="12">
                                        <Content>
                                            <h3 class="blockheader">
                                                <asp:Label ID="lblComment" runat="server" Text="申請資訊" meta:resourcekey="lblCommentResource1"></asp:Label></h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Generic" CssClass="content">
                                                <Rows>

                                                    <telerik:LayoutRow>
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="Literal1" runat="server" Text="申請者"></asp:Literal></label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label>
                                                                    <asp:Literal ID="lblApplicant" runat="server" Text="申請者" ></asp:Literal>
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow ID="trApplicantDept" runat="server">
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="Literal3" runat="server" Text="申請部門"></asp:Literal></label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label>
                                                                    <asp:Literal ID="lblDepartment" runat="server" Text=""></asp:Literal>
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow>
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="Literal5" runat="server" Text="申請時間"></asp:Literal></label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">

                                                                <label>
                                                                    <asp:Literal ID="lblApplyTime" runat="server" Text="" ></asp:Literal>
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow>
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="Literal7" runat="server" Text="緊急程度"></asp:Literal></label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label>
                                                                    <asp:RadioButtonList ID="rblUrgentLevel" runat="server" RepeatDirection="Vertical" meta:resourcekey="rblUrgentLevelResource1">
                                                                        <asp:ListItem Value="0" meta:resourcekey="lblMostUrgentResource1" Text="緊急" />
                                                                        <asp:ListItem Value="1" meta:resourcekey="lblUrgentResource1" Text="急" />
                                                                        <asp:ListItem Value="2" meta:resourcekey="lblNormalResource1" Text="普通" />
                                                                    </asp:RadioButtonList>
                                                                </label>

                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>

                                                    <telerik:LayoutRow ID="agentRow" runat="server">
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="Literal9" runat="server" Text="代理填寫者"></asp:Literal></label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label>
                                                                    <asp:Literal ID="lblAgentUser" runat="server" Text=""></asp:Literal>
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                </Rows>
                                            </telerik:LayoutRow>
                                        </Rows>

                                        <Content>
                                        </Content>



                                    </telerik:CompositeLayoutColumn>
                                </Columns>
                            </telerik:LayoutRow>

                            <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                                <Columns>
                                    <telerik:CompositeLayoutColumn Span="12">
                                        <Content>
                                            <h3 class="blockheader">
                                                <asp:Label ID="Label4" runat="server" Text="表單" meta:resourcekey="Label4Resource1"></asp:Label>
                                                &nbsp;
                                                <asp:CheckBox ID="cbShowFiller" style="zoom:75%;" onclick="oncbShowFillerChecked()" runat="server" meta:resourcekey="cbShowFillerResource1" />
                                                <asp:Label ID="lblShowFiller" style="zoom:75%;" runat="server" Text="顯示填寫者" meta:resourcekey="lblShowFillerResource1"></asp:Label>
                                            </h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Container" CssClass="content">
                                                <Columns>
                                                    <telerik:CompositeLayoutColumn Span="12" CssClass="validateFocus">
                                                        <Content>
                                                            <asp:Label ID="lblSpeedSendFailedMessage" runat="server" Text="快速送出失敗：" 
                                                                Visible="false" ForeColor="Red" meta:resourcekey="lblSpeedSendFailedMessageResource1" >
                                                            </asp:Label>
                                                            
                                                            <uc2:UC_MobileVersionFieldCollectionUsing runat="server" ID="VersionFieldCollectionUsingUC1" />
                                                            <%--<uc2:VersionFieldCollectionUsingUC ID="VersionFieldCollectionUsingUC1" runat="server" />--%>
                                                        </Content>
                                                    </telerik:CompositeLayoutColumn>
                                                </Columns>
                                            </telerik:LayoutRow>
                                        </Rows>

                                    </telerik:CompositeLayoutColumn>


                                </Columns>
                            </telerik:LayoutRow>
                            <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                                <Columns>
                                    <telerik:CompositeLayoutColumn id="AttachmentsByForm" runat="server" Span="12">
                                        <Content>
                                            <h3 class="blockheader">
                                                <asp:Label ID="lblFileUpload" runat="server" Text="相關附件(表單)" meta:resourcekey="lblFileUploadResource1"></asp:Label></h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Generic" CssClass="content nopadding">
                                                <Columns>
                                                    <telerik:LayoutColumn Span="12">
                                                        <asp:LinkButton ID="lbtnFileCenter" runat="server" ForeColor="OliveDrab" CausesValidation="False" Text="檔案操作" meta:resourcekey="lbtnRemoteFileCenterResource1" style="-webkit-text-size-adjust: 100%"></asp:LinkButton>
                                                        <div id="divFC" runat="server" style="text-align:left">
                                                            <uc2:UC_FileCenter runat="server" id="UC_FileCenter1" ModuleName="WKF" Editable="false" ProxyEnabled="true"/>
                                                        </div>
                                                        <div id="divFOP" runat="server" style="text-align:left;overflow-x:scroll">
                                                            <uc9:UC_FileOnlinePreview runat="server" ID="UC_FileOnlinePreview" />
                                                        </div>
                                                        <asp:Label ID="lblFileGroupId" runat="server" Visible="False" meta:resourcekey="lblRemoteFileGroupIdResource1"></asp:Label>
                                                    </telerik:LayoutColumn>
                                                </Columns>
                                            </telerik:LayoutRow>
                                        </Rows>

                                    </telerik:CompositeLayoutColumn>
                                    <telerik:CompositeLayoutColumn id="AttachmentsBySite" runat="server" Span="12">
                                        <Content>
                                            <h3 class="blockheader">
                                                <asp:Label ID="Label2" runat="server" Text="個人附件(站點)" meta:resourcekey="lblPersonalAttachResource1"></asp:Label>
                                                </h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Generic" CssClass="content nopadding">
                                                <Columns>
                                                    <telerik:LayoutColumn Span="12">
                                                        <asp:LinkButton ID="lbtnPersonalFileCenter" runat="server" ForeColor="OliveDrab" meta:resourcekey="LinkButton1Resource1" CausesValidation="False" Text="檔案操作" style="-webkit-text-size-adjust: 100%"></asp:LinkButton>
                                                        <div id="divFCPersonal" runat="server"  style="text-align:left">
                                                            <uc2:UC_FileCenter runat="server" id="UC_PersonalFileCenter" Editable="false" ModuleName="WKF" ProxyEnabled="true"/>
                                                        </div>
                                                        <div id="divFOPPersonal" runat="server" style="text-align:left;overflow-x:scroll">
                                                            <uc9:UC_FileOnlinePreview runat="server" ID="UC_FileOnlinePreviewPersonal" />
                                                        </div>
                                                        <asp:Label ID="lblPersonalFileGroupId" runat="server" Visible="False" meta:resourcekey="lblPersonalRemoteFileGroupIdResource1"></asp:Label>
                                                    </telerik:LayoutColumn>
                                                </Columns>
                                            </telerik:LayoutRow>
                                        </Rows>

                                    </telerik:CompositeLayoutColumn>

                                </Columns>
                            </telerik:LayoutRow>
                            <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                                <Columns>
                                    <telerik:CompositeLayoutColumn Span="12">
                                        <Content>
                                            <h3 class="blockheader">
                                                <asp:Label ID="lblFormFlow" runat="server" Text="表單流程" meta:resourcekey="lblFormFlowResource1"></asp:Label></h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Generic" CssClass="content nopadding">
                                                <Columns>
                                                    <telerik:LayoutColumn Span="12" CssClass="scrollx">
                                                        <uc6:UC_SignComment ID="UC_SignComment1" runat="server" MobileUI="true" />
                                                    </telerik:LayoutColumn>
                                                </Columns>
                                            </telerik:LayoutRow>
                                        </Rows>
                                    </telerik:CompositeLayoutColumn>


                                </Columns>
                            </telerik:LayoutRow>

                            <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                                <Columns>
                                    <telerik:CompositeLayoutColumn Span="12">
                                        <Content>
                                            <h3 class="blockheader">
                                                <asp:Label ID="lblOtherInfo" runat="server" Text="意見" meta:resourcekey="lblOtherInfoResource1"></asp:Label></h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Generic" CssClass="content nopadding">
                                                <Columns>
                                                    <telerik:LayoutColumn Span="12">
                                                        <asp:LinkButton ID="lbtnCanComment" runat="server" ForeColor="OliveDrab" Text="罐頭意見" meta:resourcekey="lbtnCanCommentResource1" style="-webkit-text-size-adjust: 100%"></asp:LinkButton>
                                                        <br />
                                                        <br />
                                                        <asp:UpdatePanel ID="updatepanel1" runat="server">
                                                            <ContentTemplate>
                                                                <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Width="100%" Height="80px" meta:resourcekey="txtCommentResource1"></asp:TextBox>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </telerik:LayoutColumn>
                                                </Columns>
                                            </telerik:LayoutRow>
                                        </Rows>

                                    </telerik:CompositeLayoutColumn>


                                </Columns>
                            </telerik:LayoutRow>
                        </Rows>
                    </telerik:LayoutRow>
                </Rows>
            </telerik:LayoutRow>
        </telerik:RadPageLayout>
        <asp:Panel ID="pnlRefresh" runat="server">
            <asp:HiddenField ID="hiddenActionMode" runat="server" Value="Init" />
            <asp:HiddenField ID="hfValidateMsg" runat="server" />
            <%--<asp:Label ID="lblmsg" runat="server" style="display:none" />--%>
        </asp:Panel>
    </div>

    <table cellpadding="0" border="0" style="height: 100%; width: 100%;display: none">
        <tr>
            <td style="background-image: url(<%=themePath %>/images/wf_bg.gif);vertical-align:top">
                <center>
                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%;">
                                <tr>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a01.gif); background-position: 0% 100%; height: 15px; width: 15px"></td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a09.gif); background-position: 0% 100%; background-repeat: repeat-x; height: 15px"></td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a02.gif); background-position: 0% 100%; height: 15px; width: 15px"></td>
                                </tr>
                                <tr>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a03.gif)"></td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a04.gif)">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" id="FormIQYTable"
                                            runat="server">
                                            <tr>
                                                <td>
                                                <telerik:RadToolBar ID="webToolBar" runat="server" OnClientButtonClicking="OnBarMainClick"
                                            OnButtonClick="webToolBar_ButtonClick" Width="100%" meta:resourcekey="webToolBarResource1">
                                            <Items>
                                                 <telerik:RadToolBarButton runat="server"  
                                                    meta:resourceKey="TBarButtonResource6"  CausesValidation="false"
                                                        CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                        DisabledImageUrl="~/Common/Images/Icon/icon_m101.gif" 
                                                        HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                        ImageUrl="~/Common/Images/Icon/icon_m101.gif" Text="觀看表單流程" Value="ShowFlow" >
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sShowFlow" meta:resourcekey="RadToolBarButtonResource1" >
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server"  
                                                    meta:resourceKey="TBarButtonResource11"  CausesValidation="false"
                                                        CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                        DisabledImageUrl="~/Common/Images/Icon/icon_m101.gif" 
                                                        HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                        ImageUrl="~/Common/Images/Icon/icon_m101.gif" Text="模擬流程" Value="SimulationFlow" >
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sSimulationFlow" meta:resourcekey="RadToolBarButtonResource2" >
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server"  
                                                    meta:resourceKey="TBarButtonResource3"  CausesValidation="false"
                                                        CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                        DisabledImageUrl="~/Common/Images/Icon/icon_m101.gif" 
                                                        HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                        ImageUrl="~/Common/Images/Icon/icon_m101.gif" Text="進階加簽" Value="PreAdditionalSign" >
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sPreAdditionalSign" meta:resourcekey="RadToolBarButtonResource3" >
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server"  
                                                    meta:resourceKey="TBarButtonResource1"  CausesValidation="false"
                                                        CheckedImageUrl="~/Common/Images/Icon/icon_j06.gif"
                                                        DisabledImageUrl="~/Common/Images/Icon/icon_j06.gif" 
                                                        HoveredImageUrl="~/Common/Images/Icon/icon_j06.gif"
                                                        ImageUrl="~/Common/Images/Icon/icon_j06.gif" Text="實際簽核流程" Value="ViewFlow" >
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sViewFlow" meta:resourcekey="RadToolBarButtonResource5" >
                                                    </telerik:RadToolBarButton>
                                                      <telerik:RadToolBarButton runat="server"  
                                                    meta:resourceKey="TBarButtonResource2"  CausesValidation="false"
                                                        CheckedImageUrl="~/Common/Images/Icon/icon_j07.gif"
                                                        DisabledImageUrl="~/Common/Images/Icon/icon_j07.gif" 
                                                        HoveredImageUrl="~/Common/Images/Icon/icon_j07.gif"
                                                        ImageUrl="~/Common/Images/Icon/icon_j07.gif" Text="實際簽核明細" Value="ViewFlowDetail" >
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sViewFlowDetail" meta:resourcekey="RadToolBarButtonResource6" >
                                                    </telerik:RadToolBarButton>
                                                     <telerik:RadToolBarButton runat="server"  
                                                    meta:resourceKey="TBarButtonResource5"  CausesValidation="false"
                                                        CheckedImageUrl="~/Common/Images/Icon/icon_m180.gif"
                                                        DisabledImageUrl="~/Common/Images/Icon/icon_m180.gif" 
                                                        HoveredImageUrl="~/Common/Images/Icon/icon_m180.gif"
                                                        ImageUrl="~/Common/Images/Icon/icon_m180.gif" Text="罐頭意見" Value="SignComment" >
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sSignComment" meta:resourcekey="RadToolBarButtonResource7" >
                                                    </telerik:RadToolBarButton>
                                                     <telerik:RadToolBarButton runat="server"  
                                                    meta:resourceKey="TBarButtonResource7"  CausesValidation="false"
                                                        CheckedImageUrl="~/Common/Images/Icon/icon_m180.gif"
                                                        DisabledImageUrl="~/Common/Images/Icon/icon_m180.gif" 
                                                        HoveredImageUrl="~/Common/Images/Icon/icon_m180.gif"
                                                        ImageUrl="~/Common/Images/Icon/icon_m180.gif" Text="發出徵詢" Value="ForOpinion" >
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sForOpinion" meta:resourcekey="RadToolBarButtonResource8" >
                                                    </telerik:RadToolBarButton>
                                                 <telerik:RadToolBarButton runat="server" 
                                                     meta:resourcekey="FormForumResource"  CausesValidation="false"
                                                        CheckedImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                        DisabledImageUrl="~/Common/Images/Icon/icon_m12.gif" 
                                                        HoveredImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                        ImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                        Text="表單討論" Value="Forum">
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="Separator3" meta:resourcekey="RadToolBarButtonResource9">
                                                        </telerik:RadToolBarButton>
                                                 <telerik:RadToolBarButton runat="server"
                                                                CausesValidation="false"
                                                                CheckedImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                                DisabledImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                                HoveredImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                                ImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                                Text="表單說明" Value="FormDescription" meta:resourcekey="RadToolBarButtonResource10">
                                                            </telerik:RadToolBarButton>
                                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="SeparatorbyDescription" meta:resourcekey="RadToolBarButtonResource12">
                                                            </telerik:RadToolBarButton>
                                                    </Items>
                                                    </telerik:RadToolBar>
                                                    


                                                
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="width: 25%; height: 100%; margin: 0; padding: 0; padding-right: 3px;" valign="top">
                                                    <table class="PopTable" style="height: 160px;" width="100%">
                                                        <tr style="vertical-align:top;">
                                                            <td align="center" class="PopTableHeader"  height="20px" style="text-align:center;">
                                                                <center>
                                                                    
                                                                </center>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background-color: white; height: 100%; margin: 0; padding: 0" valign="top">
                                                                <asp:Panel ID="pnlAppInfo" runat="server" Height="140px" ScrollBars="Auto">
                                                                    <table cellpadding="0" cellspacing="0" width="100%" id="TABLE1" runat="server" style="height: 135px; margin: 0; padding: 0">
                                                                            <tr>
                                                                                <td style="text-align: right; width: 26%;">
                                                                                    <asp:Label ID="Label15" runat="server" Text="申請人：" meta:resourcekey="Label15Resource1"></asp:Label>
                                                                                </td>
                                                                                <td style="text-align: left;" nowrap="nowrap">
                                                                                    
                                                                                </td>
                                                                                <td style="height: 21px"></td>
                                                                                <td style="height: 21px"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 26%; height: 21px; text-align: right" nowrap="nowrap">
                                                                                    <asp:Label ID="Label17" runat="server" Text="部門：" meta:resourcekey="Label17Resource1"></asp:Label>
                                                                                </td>
                                                                                <td style="text-align: left">
                                                                                    
                                                                                </td>
                                                                                <td style="height: 21px"></td>
                                                                                <td style="height: 21px"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td nowrap style="text-align: right; width: 26%;">
                                                                                    <asp:Label ID="Label1" runat="server" Text="申請時間：" meta:resourcekey="Label1Resource1"></asp:Label>
                                                                                </td>
                                                                                <td style="text-align: left">
                                                                                    
                                                                                </td>
                                                                                <td style="height: 21px"></td>
                                                                                <td style="height: 21px"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td nowrap style="text-align: right; width: 26%;">
                                                                                    <asp:Label ID="Label9" runat="server" Text="緊急程度：" meta:resourcekey="Label9Resource1"></asp:Label>
                                                                                </td>
                                                                                <td style="text-align: left">
                                                                                    
                                                                                </td>
                                                                                <td style="height: 21px"></td>
                                                                                <td style="height: 21px"></td>
                                                                            </tr>
                                                                            <tr id="agentLableDisplayTR" runat="server">
                                                                                <td>
                                                                                    <asp:Label ID="lblAgentApplicant" runat="server" Text="代理填寫者：" meta:resourcekey="lblAgentApplicantResource1"></asp:Label>
                                                                                    
                                                                                </td>
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
                                                                    
                                                                </center>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td  style="background-color: white;height:140px;margin:0; padding-bottom:0; padding-top:0;" valign="top" align="left"  >
                                                                
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td style="width: 25%; height: 100%; margin: 0; padding: 0; padding-right: 3px;" valign="top">
                                                    <table cellspacing="0" class="PopTable" style="height: 160px; margin: 0; padding: 0;table-layout:fixed;word-wrap:break-word" width="100%">
                                                        <tr style="vertical-align: top;">
                                                            <td align="center" class="PopTableHeader" height="20px" style="text-align: center;">
                                                                <center>
                                                                    
                                                                </center>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background-color: white; height: 140px; margin: 0; padding: 0; width: 100%; vertical-align: top; text-align: center">
                                                                <div align="center" style="height: 135px; overflow: auto; width: 100%; margin: 0; padding: 0">
                                                                    
                                                                        <div style="text-align:left">
                                                                            
                                                                        </div>
                                                                    
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td style="width: 25%; height: 100%; margin: 0; padding: 0" valign="top">
                                                    <table cellspacing="0" class="PopTable" style="height: 160px; margin: 0; padding: 0;table-layout:fixed;word-wrap:break-word" width="100%">
                                                        <tr style="vertical-align: top;">
                                                            <td align="center" class="PopTableHeader" height="20px" style="text-align: center;">
                                                                <center>
                                                                    
                                                                </center>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" style="background-color: white; height: 140px; margin: 0; padding: 0; width: 100%" valign="top">
                                                                <div align="center" style="height: 135px; overflow: auto; width: 100%; margin: 0; padding: 0">
                                                                    
                                                                        <div style="text-align:left">
                                                                            
                                                                        </div>
                                                                    
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
                                    <td style="background-image: url(<%=themePath %>/images/wf_a06.gif); background-position: 0% 0%; height: 20px; width: 15px"></td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a07.gif); background-position: 0% 0%; height: 20px"></td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a08.gif); background-position: 0% 0%; height: 20px; width: 15px"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="blank8">
                        </td>
                    </tr>
                </table>
                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width:120px;min-width:120px">
                                        <img src="<%=themePath %>/images/wf_icon01.jpg" width="120" height="65" />
                                    </td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a01.jpg);background-repeat:repeat-x;height:65px;background-position: 0% 100%;">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="bigT" style="height: 65px; vertical-align:middle;text-align:left">
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="26">
                                        <img src="<%=themePath %>/images/wf_a02.jpg" width="26" height="65" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="height: 8px; width: 15px; background-image: url(<%=themePath %>/images/wf_a03.gif);">
                                        <img src="<%=themePath %>/images/wf_a03.gif" width="15px" height="8px">
                                    </td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a04.gif); height: 8px;">
                                    </td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a05.gif); height: 8px;
                                        width: 15px;">
                                        <img src="<%=themePath %>/images/wf_a05.gif" width="15px" height="8px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15px; background-image: url(<%=themePath %>/images/wf_a03.gif);">
                                        <img src="<%=themePath %>/images/wf_a03.gif" width="15px" height="8px">
                                    </td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a04.gif);">
                                        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:Panel ID="Panel1" runat="server" Width="100%" meta:resourcekey="Panel1Resource1">
                                                        
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a05.gif);">
                                        <img src="<%=themePath %>/images/wf_a05.gif" width="15" height="8">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a06.gif); background-position: 0% 0%; height: 20px; width: 15px"></td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a07.gif); background-position: 0% 0%; height: 20px"></td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a08.gif); background-position: 0% 0%; height: 20px; width: 15px"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="blank8">
                        </td>
                    </tr>
                </table>
                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width:120px;min-width:120px">
                                        <img src="<%=themePath %>/images/wf_icon02.jpg" width="120" height="65">
                                    </td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a01.jpg);background-repeat:repeat-x;height:65px;background-position: 0% 100%;">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="bigT" style="height: 65px; vertical-align:middle;text-align:left">
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="26">
                                        <img src="<%=themePath %>/images/wf_a02.jpg" width="26" height="65">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a03.gif); width: 15px;
                                        height: 8px;">
                                        <img src="<%=themePath %>/images/wf_a03.gif" width="15px" height="8px">
                                    </td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a04.gif); height: 8px;">
                                    </td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a05.gif); width: 15px;
                                        height: 8px;">
                                        <img src="<%=themePath %>/images/wf_a05.gif" width="15px" height="8px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a03.gif);">
                                        <img src="<%=themePath %>/images/wf_a03.gif" width="15px" height="8px">
                                    </td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a04.gif);">
                                        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:Panel ID="Panel3" runat="server" meta:resourcekey="Panel3Resource1">
                                                        
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a05.gif);">
                                        <img src="<%=themePath %>/images/wf_a05.gif" width="15" height="8">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a06.gif); background-position: 0% 0%; height: 20px; width: 15px"></td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a07.gif); background-position: 0% 0%; height: 20px"></td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a08.gif); background-position: 0% 0%; height: 20px; width: 15px"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="blank8">
                        </td>
                    </tr>
                </table>
                    </center>
                <asp:Panel ID="Panel2" runat="server" Width="100%" meta:resourcekey="Panel1Resource1">
                    <uc5:UC_QueryIqyTask ID="UC_QueryIqyTask1" runat="server" />
                </asp:Panel>
                <asp:HiddenField ID="hiddenTaskId" runat="server" />
                <asp:HiddenField ID="hiddenUserGUID" runat="server" />
                <asp:HiddenField ID="hiddenUserDEPT" runat="server" />
                <asp:HiddenField ID="hiddenSiteid" runat="server" />
                <asp:HiddenField ID="hiddenNodeSEQ" runat="server" />
                <asp:Label ID="lblDialogTitleMsg" runat="server" Text="送出表單" Visible="False" meta:resourcekey="lblDialogTitleMsgResource1"></asp:Label>
                <asp:Label ID="lblNormal" runat="server" Text="普通" Visible="False" meta:resourcekey="lblNormalResource1"></asp:Label>
                <asp:Label ID="lblUrgent" runat="server" Text="急" Visible="False" meta:resourcekey="lblUrgentResource1"></asp:Label>
                <asp:Label ID="lblMostUrgent" runat="server" Text="緊急" Visible="False" meta:resourcekey="lblMostUrgentResource1"></asp:Label>
                <asp:Label ID="lblSaveTxt" runat="server" Text="儲存" Visible="False" meta:resourcekey="lblSaveTxtResource1"></asp:Label>
                <asp:Label ID="lblNoPassMsg" runat="server" Text="驗證失敗，失敗原因如下：\n\n" Visible="False" meta:resourcekey="lblNoPassMsgResource1"></asp:Label>
                <asp:Label ID="lblSendTxt" runat="server" Text="送出" Visible="False" meta:resourcekey="lblSendTxtResource1"></asp:Label>
                <asp:Label ID="lblSpeedSend" runat="server" Text="快速送出" visible="False" meta:resourcekey="lblSpeedSendResource1" ></asp:Label>                    
                <asp:Label ID="lblReturn" runat="server" Text="退簽" Visible="False" meta:resourcekey="lblReturnResource1"></asp:Label>
                <asp:Label ID="lblReturnSignComment" runat="server" ForeColor="Red" Text="請在意見欄輸入退簽意見" meta:resourcekey="lblReturnSignCommentResource1" CssClass="hiddenNotify"></asp:Label>
                <asp:Label ID="lblNotCurrentSite" runat="server" meta:resourcekey="lblNotCurrentSiteResource1" Text="此站點非可處理站點" Visible="False"></asp:Label>
                <asp:Label ID="lblTaskEnd" runat="server" Text="表單已結案，無法進行簽核" Visible="False" meta:resourcekey="lblTaskEndResource1"></asp:Label>
                <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
                <asp:Label ID="lblConfirmWinTitle" runat="server" Text="簽核確認" Visible="False" meta:resourcekey="lblConfirmWinTitleResource1"></asp:Label>
                <asp:Label ID="lblnewWindowMsg" Visible="False" runat="server" Text="無法開啟簽核視窗，請嘗試將快顯封鎖程式關閉" meta:resourcekey="lblnewWindowMsgResource1"></asp:Label>
                <asp:Label ID="lblJumpSign" runat="server" Text="跳關送出" Visible="False" meta:resourcekey="lblJumpSignResource1"></asp:Label>
                <asp:Label ID="lblAdditionalSign" runat="server" Text="加簽" Visible="False" meta:resourcekey="lblAdditionalSignResource1"></asp:Label>
                <asp:Label ID="lblPrevPage" runat="server" Text="返回" Visible="False" meta:resourcekey="lblPrevPageResource1" ></asp:Label>
                <asp:Label ID="lblNoAuth" runat="server" meta:resourcekey="lblNoAuthResource1" Text="無權限處理或觀看此表單" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
