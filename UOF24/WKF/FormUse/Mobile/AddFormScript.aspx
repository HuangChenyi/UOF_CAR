<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="AddFormScript.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.Mobile.AddFormScript" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx" TagName="VersionFieldCollectionUsingUC" TagPrefix="uc5" %>
<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUC.ascx" TagName="VersionFieldCollectionUC" TagPrefix="uc3" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register src="../FormIQY/UC_QueryIqySingle.ascx" tagname="UC_QueryIqySingle" tagprefix="uc7" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Src="~/WKF/FormUse/Mobile/UC_MobileVersionFieldCollectionUsing.ascx" TagPrefix="uc2" TagName="UC_MobileVersionFieldCollectionUsing" %>
<%@ Register Src="~/WKF/Common/UC_FileOnlinePreview.ascx" TagPrefix="uc9" TagName="UC_FileOnlinePreview" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <script id="js" type="text/javascript">
        function saveScrollPosition() 
        {
            $('#<%=this.HiddenField1.ClientID%>').val($('#<%=this.Panel1.ClientID%>').scrollTop());                       
        }       
                
        function setScrollPosition() 
        {        
            $('#<%=this.Panel1.ClientID%>').scrollTop($('#<%=this.HiddenField1.ClientID%>').val());
        }

        Sys.Application.add_load(function () {
            //表單計算欄位
            try {
                //隱藏所有欄位的填寫者Label
                $('.FillerVisible').hide();
                calculate();
                SetDivZero();
            } catch (e) {
            }

            try {
                setScrollPosition();
                var actionMode = $uof.tool.htmlDecode($('#<%=hiddenActionMode.ClientID%>').val());
                var confirmWinUrl = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(confirmWinUrl, true)%>');
                var dialogTitleName = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(dialogTitleName,true)%>');
                if (actionMode != "Init") {
                    $uof.dialog.open2(confirmWinUrl, "", dialogTitleName, "<%=confirmWinWidth%>", "<%=confirmWinHeight%>", function checkReturn(returnValue) {
                        if (typeof (returnValue) == "undefined") {
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
            } catch (e) {
                alert("<%=lblnewWindowMsg.Text%>");
            }
        });



    </script>
    <script type="text/javascript" id="telerikClientEvents1">
        var ajaxManager;
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
            try {
                if (window.opener && (typeof window.opener.RefreshPage != 'undefined')) {
                    window.opener.RefreshPage();
                }
            }
            catch (e) {
                console.log(e);
            }
            return false;
        }

        function FormFileLinkClick() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "FormFileLinkClick", "Value": "" }));
            try {
                if (window.opener && (typeof window.opener.RefreshPage != 'undefined')) {
                    window.opener.RefreshPage();
                }
            }
            catch (e) {
                console.log(e);
            }
            return false;
        }

        function Save() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");

            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Save", "Value": "" }));

            try {
                if ( window.opener && (typeof window.opener.RefreshPage != 'undefined')) {
                    window.opener.RefreshPage();
                }
            }
            catch (e) {
                console.log(e);
            }

            alert("<%=lblFormSaved.Text%>");
            return false;
        }

        function Send() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Send", "Value": "" }));
            try {
                if (window.opener && (typeof window.opener.RefreshPage != 'undefined')) {
                    window.opener.RefreshPage();
                }
            }
            catch (e) {
                console.log(e);
            }
            return false;
        }

        function CanCommentClick() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "CanCommentClick", "Value": "" }));

            try {
                if (window.opener && (typeof window.opener.RefreshPage != 'undefined')) {
                    window.opener.RefreshPage();
                }
            }
            catch (e) {
                console.log(e);
            }
            finally {
                return false;
            }
        }

        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();

            if (value == "SaveFormDraft") {
                // 驗證欄位
                for (var i = 0; i < Page_Validators.length; ++i) {
                    ValidatorEnable(Page_Validators[i], (value == "SaveFormDraft"));
                    if (!Page_Validators[i].isvalid) {
                        args.set_cancel(true);
                        break;
                    }
                }
            }
            else if (value == "SendFormDraft") {
                //欄位送出是PostBack 在後端開窗***
                // 驗證欄位
                for (var i = 0; i < Page_Validators.length; ++i) {
                    ValidatorEnable(Page_Validators[i], (value == "SendFormDraft"));
                    var cbxSendNeedSave = $("#ctl00_ContentPlaceHolder1_cbxSendNeedSave");

                    //如果有勾選送出後儲存副本至草稿匣則排除草稿名稱的驗證
                    if (cbxSendNeedSave.prop('checked')) {
                        if (!Page_Validators[i].isvalid) {
                            args.set_cancel(true);
                            break;
                        }
                    }
                    else {
                        if (Page_Validators[i].id != "ctl00_ContentPlaceHolder1_RequiredFieldValidatorScriptName") {
                            if (!Page_Validators[i].isvalid) {
                                args.set_cancel(true);
                                break;
                            }
                        }
                    }
                }
            }
        }

        function RadToolBar2_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();

            //發出徵詢
            if (value == "ForOpinion") {
                var UserGUID = $uof.tool.htmlDecode('<%=hiddenUserGUID.Value%>');
                var ScriptID = $uof.tool.htmlDecode('<%=hiddenScriptId.Value%>');
                var UserDept = $uof.tool.htmlDecode('<%=hiddenUserDept.Value%>');
                var IsScriptIQY = 1;
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormUse/FormIQY/IssueIQY.aspx", args.get_item(), "發出徵詢", 850, 700, openDialogResult,
                    { "USER_GUID": UserGUID, "TASK_ID": ScriptID, "IS_SCRIPT_IQY": IsScriptIQY, "USER_DEPT": UserDept });
            }

            //建議徵詢人員設定
            if (value == "ForOpinionProposal") {
                var ScriptID = $uof.tool.htmlDecode('<%=hiddenScriptId.Value%>');
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormUse/FormIQY/SetProposalForOpinion.aspx", args.get_item(), "建議徵詢人員設定", 430, 320, function () { return false; }, { "ScriptID": ScriptID });
            }

            if (value == "SignComment") {
                var ScriptID = $uof.tool.htmlDecode('<%=hiddenScriptId.Value%>');
                var IsScript = "Y";
                $uof.dialog.open2("~/WKF/FormUse/AddSignComment.aspx", args.get_item(), "", 600, 480, openDialogResult, { "ScriptID": ScriptID, "IsScript": IsScript });
            }

        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }
    </script>
    <style type="text/css">
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
    </style>

    <div class="pageLayout" ID="layout"  runat="server" visible="false">
         <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest"></telerik:RadAjaxManager>
        <telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="true" HtmlTag="None">
            <telerik:LayoutRow RowType="Generic">
                <Rows>
                    <telerik:LayoutRow RowType="Generic" CssClass="header">
                        <Rows>
                            <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                                <Columns>
                                    <telerik:LayoutColumn Span="12">
                                        <h1><asp:Label ID="lblFormName" runat="server" Text="" meta:resourcekey="lblFormNameResource1"></asp:Label></h1>
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
                                              <h3 class="blockheader"><asp:Label ID="Label4" runat="server" Text="申請資訊" meta:resourcekey="Label4Resource1"></asp:Label></h3>                                            
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Generic" CssClass="content">
                                                <Rows>                                                  
                                                    <telerik:LayoutRow Visible="false">
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title"><asp:Literal ID="Literal1" runat="server" Text="申請者" meta:resourcekey="Literal1Resource1"></asp:Literal></label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <telerik:RadTextBox ID="RadTextBox1" runat="server" Text="" Width="100%" ReadOnly="true"></telerik:RadTextBox>                                                                 
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow id="trApplicantDept" runat="server">
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title"><asp:Literal ID="Literal2" runat="server" Text="申請部門" meta:resourcekey="Literal2Resource1"></asp:Literal></label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">                                                                
                                                                <asp:DropDownList ID="ddlUserDept" runat="server" OnSelectedIndexChanged="ddlUserDept_SelectedIndexChanged" meta:resourcekey="ddlUserDeptResource1" Width="100%"></asp:DropDownList><asp:Label ID="lblMsgNoSettingJobTitle" runat="server" Text="無設定申請者職級" Visible="False" ForeColor="Red" meta:resourcekey="lblMsgNoSettingJobTitleResource1"></asp:Label>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow Visible="false">
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title"><asp:Literal ID="Literal3" runat="server" Text="申請時間" meta:resourcekey="Literal3Resource1"></asp:Literal></label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <telerik:RadTextBox ID="RadTextBox2" runat="server" Text="" Width="100%" ReadOnly="true"></telerik:RadTextBox>                                                                 
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow>
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label  class="title"><asp:Literal ID="Literal4" runat="server" Text="緊急程度" meta:resourcekey="Literal4Resource1"></asp:Literal></label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <asp:RadioButtonList ID="rblFormType" runat="server" RepeatDirection="Vertical" meta:resourcekey="rblFormTypeResource1"><asp:ListItem Value="0" meta:resourcekey="ListItemResource1" Text="緊急"></asp:ListItem><asp:ListItem Value="1" meta:resourcekey="ListItemResource2" Text="急"></asp:ListItem><asp:ListItem Selected="True" Value="2" meta:resourcekey="ListItemResource3" Text="普通"></asp:ListItem></asp:RadioButtonList>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow Visible="false">
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title"><asp:Literal ID="Literal5" runat="server" Text="代理填寫者" meta:resourcekey="Literal5Resource1"></asp:Literal></label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <telerik:RadTextBox ID="RadTextBox3" runat="server" Text="" Width="100%" ReadOnly="true"></telerik:RadTextBox>
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
                                        <Content><h3 class="blockheader"><asp:Label ID="Label12" runat="server" Text="表單" meta:resourcekey="Label12Resource1"></asp:Label></h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Container" CssClass="content">
                                                <Columns>
                                                    <telerik:CompositeLayoutColumn Span="12" CssClass="validateFocus">
                                                        <Content>
                                                            <%-- <uc5:VersionFieldCollectionUsingUC ID="VersionFieldCollectionUsingUC1" runat="server" />--%>
                                                            <uc2:UC_MobileVersionFieldCollectionUsing runat="server" ID="UC_MobileVersionFieldCollectionUsing" />
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
                                    <telerik:CompositeLayoutColumn Span="12">
                                        <Content>
                                            <h3 class="blockheader"><asp:Label ID="Label5" runat="server" Text="相關附件(表單)" meta:resourcekey="Label5Resource1"></asp:Label></h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Generic" CssClass="content nopadding">
                                                <Columns>
                                                    <telerik:LayoutColumn Span="12">
                                                        <asp:LinkButton ID="lbtnRemoteFileCenter" runat="server" ForeColor="OliveDrab" CausesValidation="False" Text="檔案操作" meta:resourcekey="lbtnRemoteFileCenterResource1" style="-webkit-text-size-adjust: 100%"></asp:LinkButton>
                                                        <div id="divFC" runat="server" style="text-align:left">
                                                            <uc1:UC_FileCenter runat="server" id="UC_FileCenter1" ModuleName="WKF" Editable="false" ProxyEnabled="true"/>
                                                        </div>
                                                        <div id="divFOP" runat="server" style="text-align:left;">
                                                            <uc9:UC_FileOnlinePreview runat="server" ID="UC_FileOnlinePreview" />
                                                        </div>
                                                        <asp:Label ID="lblFileGroupId" runat="server" Visible="False" meta:resourcekey="lblRemoteFileGroupIdResource1"></asp:Label>
                                                    </telerik:LayoutColumn>
                                                </Columns>
                                            </telerik:LayoutRow>
                                        </Rows>
                                    </telerik:CompositeLayoutColumn>
                                    <telerik:CompositeLayoutColumn Span="12">
                                        <Content><h3 class="blockheader"><asp:Label ID="Label7" runat="server" Text="個人附件(站點)" meta:resourcekey="lblPersonalAttachResource1"></asp:Label></h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Generic" CssClass="content nopadding">
                                                <Columns>
                                                    <telerik:LayoutColumn Span="12">
                                                        <asp:LinkButton ID="lbtnPersonalRemoteFileCenter" runat="server" ForeColor="OliveDrab" meta:resourcekey="LinkButton1Resource1" CausesValidation="False" Text="檔案操作" style="-webkit-text-size-adjust: 100%"></asp:LinkButton>
                                                        <div id="divFCPersonal" runat="server"  style="text-align:left">
                                                            <uc1:UC_FileCenter runat="server" id="UC_PersonalFileCenter" Editable="false" ModuleName="WKF" ProxyEnabled="true"/>
                                                        </div>
                                                        <div id="divFOPPersonal" runat="server" style="text-align:left;">
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
                                            <h3 class="blockheader"><asp:Label ID="Label6" runat="server" Text="意見" meta:resourcekey="Label6Resource1"></asp:Label></h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Generic" CssClass="content nopadding">
                                                <Columns>
                                                    <telerik:LayoutColumn Span="12">
                                                        <asp:LinkButton ID="lbtnCanComment" runat="server" ForeColor="OliveDrab" Text="罐頭意見" meta:resourcekey="lbtnCanCommentResource1"></asp:LinkButton>
                                                        <br />
                                                        <br />
                                                        <asp:UpdatePanel ID="updatepanel1" runat="server">
                                                            <ContentTemplate>
                                                                <asp:TextBox ID="tbxComment" runat="server" TextMode="MultiLine" Width="100%" Height="100px" meta:resourcekey="tbxCommentResource1"></asp:TextBox>
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
     </div>


    <table width="100%" cellpadding="0" cellpadding="0" border="0" height="100%" style="display:none">
        <tr>
            <td style="background-image: url(<%=themePath %>/images/wf_bg.gif); vertical-align: top">
                <center>
<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td style="background-image:url(<%=themePath %>/images/wf_a01.gif);background-position:0% 100%;height:15px;width:15px"></td>
        <td style="background-image:url(<%=themePath %>/images/wf_a09.gif);background-position:0% 100%;background-repeat:repeat-x;height:15px"></td>
        <td style="background-image:url(<%=themePath %>/images/wf_a02.gif);background-position:0% 100%;height:15px;width:15px"></td>
      </tr>
      <tr>
        <td style="background-image: url(<%=themePath %>/images/wf_a03.gif)"></td>
        <td style="background-image: url(<%=themePath %>/images/wf_a04.gif)">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" id="FormIQYTable" runat="server">
                    <tr>
                        <td>
                            <telerik:RadToolBar ID="RadToolBar2" runat="server"  OnClientButtonClicking="RadToolBar2_ButtonClicking" OnButtonClick="RadToolBar2_ButtonClick" Width="100%" meta:resourcekey="UltraWebToolbar2Resource1">
                                <Items>
                                    <telerik:RadToolBarButton runat="server" Text="發出徵詢" Value="ForOpinion" meta:resourcekey="TBarButtonResource3" DisabledImageUrl="~/Common/Images/Icon/icon_m180.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m180.gif" ImageUrl="~/Common/Images/Icon/icon_m180.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m180.gif" >
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" Value="sForOpinion">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" Text="建議徵詢人員設定" Value="ForOpinionProposal" meta:resourcekey="TBarButtonResource4"  DisabledImageUrl="~/Common/Images/Icon/icon_m27.gif"  HoveredImageUrl="~/Common/Images/Icon/icon_m27.gif" ImageUrl="~/Common/Images/Icon/icon_m27.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m27.gif">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" Value="sForOpinionProposal">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" Text="罐頭意見" Value="SignComment" meta:resourcekey="TBarButtonResource5" DisabledImageUrl="~/Common/Images/Icon/icon_m180.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m180.gif" ImageUrl="~/Common/Images/Icon/icon_m180.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m180.gif">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" value="memo">
                                        <ItemTemplate>
                                                <asp:Label ID="lblMemo" Text="表單儲存後，方可徵詢他人意見。" runat="server" meta:resourcekey="TBLabelResource2"></asp:Label>
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
                                            
                                        </center>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: white; height: 100%; margin: 0; padding: 0" valign="top">
                                        <asp:Panel ID="pnlAppInfo" runat="server" Height="140px" ScrollBars="Auto">
                                            <table cellpadding="0" cellspacing="0" width="100%" id="TABLE1" runat="server" style="height: 135px; margin: 0; padding: 0">
                                                <tr>
                                                    <td style="width: 26%;" align="right" nowrap="nowrap"><asp:Label ID="Label1" runat="server" Text="申請者：" meta:resourcekey="Label1Resource1"></asp:Label></td>
                                                    <td style="text-align:left"><asp:Label ID="lblApplicant" runat="server" meta:resourcekey="lblApplicantResource1"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 26%;" nowrap="nowrap"><asp:Label ID="lbeFormStatusTitle" runat="server" Text="緊急程度：" meta:resourcekey="lbeFormStatusTitleResource1"></asp:Label></td>
                                                    <td style=" text-align:left"></td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 26%;" nowrap="nowrap" ><asp:Label ID="Label8" runat="server" Text="申請時間：" meta:resourcekey="Label8Resource1" ></asp:Label></td>
                                                    <td style="text-align:left"><asp:Label ID="lblApplyTime" runat="server" meta:resourcekey="lblApplyTimeResource1"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 26%;" nowrap="nowrap"><asp:Label ID="Label2" runat="server" Text="申請部門：" meta:resourcekey="Label2Resource1"></asp:Label></td>
                                                    <td style="text-align:left"></td>
                                                </tr>
                                                <tr id="agentLableDisplayTR" runat="server">
                                                    <td style="width: 26%;" align="right" nowrap="nowrap"><asp:Label ID="lblAgentApplicant" runat="server" Text="代理填寫者：" meta:resourcekey="lblAgentApplicantResource1"></asp:Label></td>
                                                    <td style=" text-align:left"><asp:Label ID="lblAgentUser" runat="server" meta:resourcekey="lblAgentUserResource1"></asp:Label></td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 25%; height: 100%; padding-left:3px; padding-right:3px;" valign="top">
                            <table class="PopTable" style=" height:100%" cellspacing="0" width="100%">
                                <tr>
                                    <td class="PopTableHeader" align="center" height="25px"> <center></center></td>
                                </tr>
                                <tr>
                                    <td style="background-color: white; height: 140px; margin: 0; padding-bottom: 0; padding-top: 0;" valign="top" align="left">
                                        
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 25%; height: 100%; margin: 0; padding: 0; padding-right: 3px;" valign="top">
                            <table cellspacing="0" class="PopTable" style="height: 160px; margin: 0; padding: 0;table-layout:fixed;word-wrap:break-word" width="100%">
                                <tr style="vertical-align: top;">
                                    <td align="center" class="PopTableHeader" height="20px" style="text-align: center;">
                                        <center></center>
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
        <td style="background-image:url(<%=themePath %>/images/wf_a06.gif);background-position:0% 0%;height:20px;width:15px"></td>
        <td style="background-image:url(<%=themePath %>/images/wf_a07.gif);background-position:0% 0%;height:20px"></td>
        <td style="background-image:url(<%=themePath %>/images/wf_a08.gif);background-position:0% 0%;height:20px;width:15px"></td>
      </tr>
    </table></td>
  </tr>
</table>
    









<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="blank8"></td>
  </tr>
</table>
<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td style="min-width:120px;width:120px"><img src="<%=themePath %>/images/wf_icon01.jpg" width="120" height="65"></td>
        <td style="background-image: url(<%=themePath %>/images/wf_a01.jpg);background-repeat:repeat-x;height:65px;background-position: 0% 100%;"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td class="bigT" style="height:65px; vertical-align:middle;text-align:left"></td>
            <td style="height:65px; vertical-align:middle;text-align:right"><asp:Panel ID="ScriptNamePanel" runat="server" meta:resourcekey="ScriptNamePanelResource1"><table style="text-align:right;width:100%"><tr><td><asp:Label ID="Label3" runat="server" ForeColor="Red" Text="＊" meta:resourcekey="Label3Resource1"></asp:Label><asp:Label ID="lblScriptName" runat="server" Text="草稿名稱" meta:resourcekey="lblScriptNameResource1" CssClass="h"></asp:Label>：<asp:TextBox ID="tbxScriptName" runat="server" meta:resourcekey="tbxScriptNameResource1" Width="200px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorScriptName" runat="server" ControlToValidate="tbxScriptName"  Display="Dynamic" ErrorMessage="請輸入草稿名稱" meta:resourcekey="RequiredFieldValidatorScriptNameResource1"></asp:RequiredFieldValidator><asp:CheckBox ID="cbxSendNeedSave" runat="server" Text="送出後儲存副本至草稿匣" Checked="True" meta:resourcekey="cbxSendNeedSaveResource1"  CssClass="h" /></td></tr></table></asp:Panel></td>
            </tr>
        </table></td>
        <td width="26"><img src="<%=themePath %>/images/wf_a02.jpg" width="26" height="65"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="15" height="8" style="background-image: url(<%=themePath %>/images/wf_a03.gif)"><img src="<%=themePath %>/images/wf_a03.gif" width="15" height="8"></td>
        <td height="8" style="background-image: url(<%=themePath %>/images/wf_a04.gif)"></td>
        <td width="15" height="8" style="background-image: url(<%=themePath %>/images/wf_a05.gif)"><img src="<%=themePath %>/images/wf_a05.gif" width="15" height="8"></td>
      </tr>
      <tr>
        <td style="background-image: url(<%=themePath %>/images/wf_a03.gif)"><img src="<%=themePath %>/images/wf_a03.gif" width="15" height="8"></td>
        <td style="background-image: url(<%=themePath %>/images/wf_a04.gif)"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td>
            
            
            
            
            
                    <asp:Panel ID="Panel1" runat="server" Width="100%" meta:resourcekey="Panel1Resource1">
                        
                        <table  border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td style="height: 18px">&nbsp;</td>
                                <td valign="top" style="height: 18px">
                                   
                                </td>
                            </tr>
                        </table>
                        
                    </asp:Panel>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            </td>
          </tr>
        </table></td>
        <td style="background-image: url(<%=themePath %>/images/wf_a05.gif)"><img src="<%=themePath %>/images/wf_a05.gif" width="15" height="8"></td>
      </tr>
      <tr>
        <td style="background-image:url(<%=themePath %>/images/wf_a06.gif);background-position:0% 0%;height:20px;width:15px"></td>
        <td style="background-image:url(<%=themePath %>/images/wf_a07.gif);background-position:0% 0%;height:20px"></td>
        <td style="background-image:url(<%=themePath %>/images/wf_a08.gif);background-position:0% 0%;height:20px;width:15px"></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="blank8"></td>
  </tr>
</table>
    </center>











                <asp:Panel ID="Panel2" runat="server" Width="100%" meta:resourcekey="Panel2Resource1">
                    <uc7:UC_QueryIqySingle ID="UC_QueryIqySingle1" runat="server" />
                </asp:Panel>






                <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
                <asp:HiddenField ID="HiddenFormFileGroupId" runat="server" />
                <asp:HiddenField ID="hiddenTempScriptId" runat="server" />
                <asp:HiddenField ID="HiIsModify" runat="server" Value="False" />
                <asp:HiddenField ID="hiddenScriptId" runat="server" />
                <asp:HiddenField ID="hiddenUserGUID" runat="server" />
                <asp:HiddenField ID="hiddenUserDept" runat="server" />
                <asp:HiddenField ID="hiddenActionMode" runat="server" Value="Init" />
                <asp:Label ID="lblSaveTxt" runat="server" Text="儲存" Visible="False" meta:resourcekey="lblSaveTxtResource1"></asp:Label>
                <asp:Label ID="lblSendTxt" runat="server" Text="送出" Visible="False" meta:resourcekey="lblSendTxtResource1"></asp:Label>
                <asp:Label ID="lblNoJobTitleMsg" Visible="False" runat="server" Text="您還沒有設定職級! \n\n如有問題請洽詢管理員。" meta:resourcekey="lblNoJobTitleMsgResource1"></asp:Label>
                <asp:Label ID="lblConfirmWinTitle" Visible="False" runat="server" Text="簽核確認" meta:resourcekey="lblConfirmWinTitleResource1"></asp:Label>
                <asp:Label ID="lblnewWindowMsg" Visible="False" runat="server" Text="無法開啟簽核視窗，請嘗試將快顯封鎖程式關閉" meta:resourcekey="lblnewWindowMsgResource1"></asp:Label>
                <asp:Label ID="lblReturnTxt" runat="server" Text="返回" Visible="False" meta:resourcekey="lblReturnTxtResource1"></asp:Label>
                <asp:Label ID="lblFormSaved" runat="server" Text="儲存成功" Visible="False" meta:resourcekey="lblFormSavedResource1"></asp:Label>
                <asp:Label ID="lblNoAuth" runat="server" meta:resourcekey="lblNoAuthResource1" Text="無權限申請此表單" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
