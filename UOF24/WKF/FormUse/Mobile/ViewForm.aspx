<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="ViewForm.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.Mobile.ViewForm" Culture="auto" meta:resourcekey="PageResource2" UICulture="auto" %>

<%@ Register Src="../../Browse/TaskRecord/UC_TaskSiteRecord.ascx" TagName="UC_TaskSiteRecord" TagPrefix="uc4" %>
<%@ Register Src="../../FormManagement/VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx" TagName="VersionFieldCollectionUsingUC" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="../FormIQY/UC_QueryIqyTask.ascx" TagName="UC_QueryIqyTask" TagPrefix="uc5" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../TaskSiteSignInfo/UC_SignComment.ascx" TagName="UC_SignComment" TagPrefix="uc6" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc7" TagName="UC_FileCenter" %>
<%@ Register Src="~/WKF/FormUse/Mobile/UC_MobileVersionFieldCollectionUsing.ascx" TagPrefix="uc2" TagName="UC_MobileVersionFieldCollectionUsing" %>
<%@ Register Src="~/WKF/Common/UC_FileOnlinePreview.ascx" TagPrefix="uc9" TagName="UC_FileOnlinePreview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <script type="text/javascript">

        Sys.Application.add_load(function () {
            //隱藏所有欄位的填寫者Label
            $('.FillerVisible').hide();
        });

        $(function () {
            //表單計算欄位
            try {
                var SignedStatus = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["SignedStatus"], true) %>");

                if (SignedStatus == "IsSigned") {
                    alert("<%=lblIsSigned.Text%>");
                }
                else if (SignedStatus == "IsCallFail") {
                    alert("<%=lblIsCallFail.Text%>");
                }
                else if (SignedStatus == "IsCancel") {
                    alert("<%=lblIsCancel.Text%>");
                }
                calculate();
                SetDivZero();
            } catch (e) {

            }
        });

        function OnBarMainClick(sender, args) {
            if (args.get_item().get_value() == "ForOpinion") {
                var para = {
                    "IQY_ID": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(iqyID, true)%>"),
                    "USER_GUID": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(userGuid, true)%>"),
                    "TASK_ID": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(taskId, true)%>"),
                    "SITE_ID": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(siteId, true)%>"),
                    "NODE_SEQ": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(nodeSeq, true)%>"),
                    "USER_DEPT": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(userDept, true)%>"),
                    "IS_SCRIPT_IQY": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(isScriptIqy, true)%>")
                };
                args.set_cancel(true);
                $uof.dialog.open2('~/WKF/FormUse/FormIQY/ReplyIQY.aspx', args.get_item(), '<%=Label4.Text%>', 850, 700, openDialogResult, para);
            }

            else if (args.get_item().get_value() == "ViewFlow") {
                var para = {
                    "TASK_ID": $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(taskId, true)%>"),
                    "SITE_ID": $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(siteId, true)%>"),
                    "NODE_SEQ": $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(nodeSeq, true)%>")
                }
                args.set_cancel(true);
                $uof.dialog.open2('~/WKF/Browse/ViewSignFlow.aspx', args.get_item(), '', 800, 650, function () { return false; }, para);
            }

            else if (args.get_item().get_value() == "ViewFlowDetail") {
                args.set_cancel(true);
                $uof.dialog.open2('~/WKF/FormUse/SiteSignInfo.aspx', args.get_item(), '', 800, 650, function () { return false; },
                    {
                        "TASK_ID": $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(taskId, true)%>"),
                        "SITE_ID": $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(siteId, true)%>")
                    });

            }
            else if (args.get_item().get_value() == "Forum") {
                args.set_cancel(true);
                $uof.dialog.open2('~/WKF/FormForum/DefaultDialog.aspx', args.get_item(), '', 0, 0, function () { return false; }, { "taskid": $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(taskId, true)%>") });
            }
            else if (args.get_item().get_value() == "FormDescription") {
                args.set_cancel(true);
                var w = $uof.tool.computeScreenSize('w', 1024);
                var h = $uof.tool.computeScreenSize('h', 768);
                var url = '../../FormManagement/EditFormDescription.aspx?formVersionId=' + $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId, true)%>") + '&type=View&culture=' + $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Ede.Uof.EIP.SystemInfo.Current.Culture, true)%>");
                $uof.window.open(url, w, h, true);
            }
        }
        function openDialogResult(returnValue) {
            if (typeof (returnValue) == 'undefined') {
                return false;
            }
            return true;
        }

        function oncbShowFillerChecked() {
            if ($('#<%=cbShowFiller.ClientID %>').is(':checked')) {
                $('.FillerVisible').show();
            }
            else {
                $('.FillerVisible').hide();
            }
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
                        color: rgba(51,51,51,0.9);
                    }

                    .MobileFormList .item div span:nth-child(4) {
                        display: block;
                        font-size: 90%;
                        font-weight: normal;
                    }
    </style>

    <div class="pageLayout" id="layout" runat="server">
        <telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="True" HtmlTag="None" EnableAjaxSkinRendering="False" EnableEmbeddedBaseStylesheet="True" EnableEmbeddedScripts="False" EnableEmbeddedSkins="False" meta:resourcekey="RadPageLayoutResource1" RegisterWithScriptManager="True" RenderMode="Classic">
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
                                                                    <asp:Literal ID="Literal1" runat="server" Text="申請者" meta:resourcekey="Label15Resource1"></asp:Literal></label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label>
                                                                    <asp:Literal ID="lblApplicant" runat="server" meta:resourcekey="lblApplicantResource1"></asp:Literal>
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow>
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="Literal3" runat="server" Text="申請部門" meta:resourcekey="Label17Resource1"></asp:Literal></label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label>
                                                                    <asp:Literal ID="lblDepartment" runat="server" meta:resourcekey="lblDepartmentResource1"></asp:Literal>
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow>
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="Literal5" runat="server" Text="申請時間" meta:resourcekey="Label3Resource1"></asp:Literal></label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">

                                                                <label>
                                                                    <asp:Literal ID="lblApplyTime" runat="server" meta:resourcekey="lblApplyTimeResource1"></asp:Literal>
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow>
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="Literal7" runat="server" Text="緊急程度" meta:resourcekey="Label9Resource1"></asp:Literal></label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label>
                                                                    <asp:Literal ID="lblurgentLevel" runat="server" meta:resourcekey="lblurgentLevelResource1"></asp:Literal>
                                                                </label>

                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow ID="currentSignerRow" runat="server">
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="Literal2" runat="server" Text="現在鎖單者" meta:resourcekey="Label1Resource1"></asp:Literal></label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label>
                                                                    <asp:Literal ID="lblLocker" runat="server" meta:resourcekey="lblLockerResource1"></asp:Literal>
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow ID="agentRow" runat="server">
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="Literal9" runat="server" Text="代理填寫者" meta:resourcekey="lblAgentApplicantResource1"></asp:Literal></label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label>
                                                                    <asp:Literal ID="lblAgentUser" runat="server" meta:resourcekey="lblAgentUserResource1"></asp:Literal>
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
                            <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div" Visible="false">
                                <Columns>
                                    <telerik:CompositeLayoutColumn Span="12">
                                        <Content>
                                            <h3 class="blockheader">
                                                <asp:Label ID="Label2" runat="server" Text="歸檔者" meta:resourcekey="Label2Resource1"></asp:Label></h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Generic" CssClass="content">
                                                <Columns>
                                                    <telerik:LayoutColumn Span="12">
                                                        <div style="text-align: left">
                                                            <uc1:UC_ChoiceList ID="UC_ChoiceListArchiveUser" runat="server" ShowMember="False" />
                                                        </div>
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
                                                <asp:Label ID="lblForm" runat="server" Text="表單" meta:resourcekey="lblFormResource1"></asp:Label>
                                                &nbsp;
                                                <asp:CheckBox ID="cbShowFiller" Style="zoom: 75%;" onclick="oncbShowFillerChecked()" runat="server" meta:resourcekey="cbShowFillerResource1" />
                                                <asp:Label ID="lblShowFiller" Style="zoom: 75%;" runat="server" Text="顯示填寫者" meta:resourcekey="lblShowFillerResource1"></asp:Label>
                                            </h3>
                                        </Content>
                                        <Rows>


                                            <telerik:LayoutRow RowType="Container" CssClass="content">
                                                <Columns>
                                                    <telerik:CompositeLayoutColumn Span="12">
                                                        <Content>
                                                            <uc2:UC_MobileVersionFieldCollectionUsing runat="server" ID="VersionFieldCollectionUsingUC2" />

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
                                    <telerik:CompositeLayoutColumn ID="AttachmentsByForm" runat="server" Span="12">
                                        <Content>
                                            <h3 class="blockheader">
                                                <asp:Label ID="lblFileUpload" runat="server" Text="相關附件(表單)" meta:resourcekey="lblFileUploadResource1"></asp:Label></h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Generic" CssClass="content">
                                                <Columns>
                                                    <telerik:LayoutColumn Span="12">
                                                        <div id="divFC" runat="server" style="text-align: left">
                                                            <uc7:UC_FileCenter runat="server" ID="UC_FileCenter" ModuleName="WKF" Editable="false" ProxyEnabled="true" />
                                                        </div>
                                                        <div id="divFOP" runat="server" style="text-align: left;">
                                                            <uc9:UC_FileOnlinePreview runat="server" ID="UC_FileOnlinePreview" />
                                                        </div>
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
                                            <telerik:LayoutRow RowType="Generic" CssClass="content">
                                                <Columns>
                                                    <telerik:LayoutColumn Span="12">
                                                        <uc6:UC_SignComment ID="UC_SignComment1" runat="server" MobileUI="true" />
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



    <table width="100%" cellpadding="0" cellpadding="0" border="0" height="100%" style="display: none">
        <tr>
            <td style="background-image: url(<%=themePath %>/images/wf_bg.gif); vertical-align: top">
                <center>
                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="background-image: url(<%=themePath %>/images/wf_a01.gif); background-position: 0% 100%; height: 15px; width: 15px"></td>
                                        <td style="background-image: url(<%=themePath %>/images/wf_a09.gif); background-position: 0% 100%; background-repeat: repeat-x; height: 15px"></td>
                                        <td style="background-image: url(<%=themePath %>/images/wf_a02.gif); background-position: 0% 100%; height: 15px; width: 15px"></td>
                                    </tr>
                                    <tr>
                                        <td style="background-image: url(<%=themePath %>/images/wf_a03.gif)"></td>
                                        <td style="background-image: url(<%=themePath %>/images/wf_a04.gif)">
                                            <table width="100%">
                                                <tr>
                                                    <td colspan="3">
                                                        <telerik:RadToolBar ID="webToolBar" runat="server" OnClientButtonClicking="OnBarMainClick"
                                                            OnButtonClick="webToolBar_ButtonClick" Width="100%" meta:resourcekey="webToolBarResource1" SingleClick="None">
                                                            <Items>
                                                                <telerik:RadToolBarButton runat="server" meta:resourceKey="TBarButtonResource1" CheckedImageUrl="~/Common/Images/Icon/icon_m181.gif"
                                                                    DisabledImageUrl="~/Common/Images/Icon/icon_m181.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m181.gif"
                                                                    ImageUrl="~/Common/Images/Icon/icon_m181.gif"
                                                                    Text="回覆徵詢" Value="ForOpinion">
                                                                </telerik:RadToolBarButton>
                                                                <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sForOpinion" meta:resourcekey="RadToolBarButtonResource2">
                                                                </telerik:RadToolBarButton>
                                                                <telerik:RadToolBarButton runat="server" meta:resourceKey="TBarButtonResource2" CheckedImageUrl="~/Common/Images/Icon/icon_j06.gif"
                                                                    DisabledImageUrl="~/Common/Images/Icon/icon_j06.gif" HoveredImageUrl="~/Common/Images/Icon/icon_j06.gif"
                                                                    ImageUrl="~/Common/Images/Icon/icon_j06.gif"
                                                                    Text="實際簽核流程" Value="ViewFlow">
                                                                </telerik:RadToolBarButton>
                                                                <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sViewFlow" meta:resourcekey="RadToolBarButtonResource3">
                                                                </telerik:RadToolBarButton>
                                                                <telerik:RadToolBarButton runat="server" meta:resourceKey="TBarButtonResource3"
                                                                    CheckedImageUrl="~/Common/Images/Icon/icon_j07.gif"
                                                                    DisabledImageUrl="~/Common/Images/Icon/icon_j07.gif"
                                                                    HoveredImageUrl="~/Common/Images/Icon/icon_j07.gif"
                                                                    ImageUrl="~/Common/Images/Icon/icon_j07.gif"
                                                                    Text="實際簽核明細" Value="ViewFlowDetail">
                                                                </telerik:RadToolBarButton>
                                                                <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sViewFlowDetail" meta:resourcekey="RadToolBarButtonResource4">
                                                                </telerik:RadToolBarButton>
                                                                <telerik:RadToolBarButton runat="server"
                                                                    meta:resourcekey="FormForumResource"
                                                                    CheckedImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                                    DisabledImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                                    HoveredImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                                    ImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                                    Text="表單討論" Value="Forum">
                                                                </telerik:RadToolBarButton>
                                                                <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="Separator3" meta:resourcekey="RadToolBarButtonResource5">
                                                                </telerik:RadToolBarButton>
                                                                <telerik:RadToolBarButton runat="server"
                                                                    CausesValidation="false"
                                                                    CheckedImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                                    DisabledImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                                    HoveredImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                                    ImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                                    Text="表單說明" Value="FormDescription" meta:resourcekey="RadToolBarButtonResource11">
                                                                </telerik:RadToolBarButton>
                                                                <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="SeparatorbyDescription" meta:resourcekey="RadToolBarButtonResource12">
                                                                </telerik:RadToolBarButton>
                                                            </Items>
                                                        </telerik:RadToolBar>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 30%; height: 100%; margin: 0; padding: 0; padding-right: 3px;" valign="top">
                                                        <table class="PopTable" style="height: 160px;" width="100%">
                                                            <tr style="vertical-align: top;">
                                                                <td align="center" class="PopTableHeader" height="20px" style="text-align: center;">
                                                                    <center>
                                                                    </center>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="background-color: white; height: 100%; margin: 0; padding: 0" valign="top">
                                                                    <asp:Panel ID="pnlAppInfo" runat="server" Height="140px" ScrollBars="Auto" meta:resourcekey="pnlAppInfoResource1">
                                                                        <table cellpadding="0" cellspacing="0" width="100%" runat="server" style="height: 135px; margin: 0; padding: 0">
                                                                            <tr>
                                                                                <td style="text-align: right; width: 35%;" runat="server">
                                                                                    <asp:Label ID="Label15" runat="server" Text="申請人：" meta:resourcekey="Label15Resource1"></asp:Label>
                                                                                </td>
                                                                                <td style="text-align: left"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right; width: 35%;">
                                                                                    <asp:Label ID="Label17" runat="server" Text="部門：" meta:resourcekey="Label17Resource1"></asp:Label>
                                                                                </td>
                                                                                <td style="text-align: left"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right; width: 35%;">
                                                                                    <asp:Label ID="Label9" runat="server" Text="緊急程度：" meta:resourcekey="Label9Resource1"></asp:Label>
                                                                                </td>
                                                                                <td style="text-align: left"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right; width: 26%;">
                                                                                    <asp:Label ID="Label3" runat="server" Text="申請時間：" meta:resourcekey="Label3Resource1"></asp:Label>
                                                                                </td>
                                                                                <td style="text-align: left"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right; width: 35%;">
                                                                                    <asp:Label ID="Label1" runat="server" Text="現在鎖單者：" meta:resourcekey="Label1Resource1"></asp:Label>
                                                                                </td>
                                                                                <td style="text-align: left"></td>
                                                                            </tr>
                                                                            <tr id="agentLableDisplayTR" runat="server">
                                                                                <td style="text-align: right; width: 35%;">
                                                                                    <asp:Label ID="lblAgentApplicant" runat="server" Text="代理填寫者：" meta:resourcekey="lblAgentApplicantResource1"></asp:Label>
                                                                                </td>
                                                                                <td style="text-align: left"></td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td style="width: 30%; height: 100%; padding-left: 0; padding-right: 3px; margin: 0; padding-bottom: 0; padding-top: 0;" valign="top">
                                                        <table cellspacing="0" class="PopTable" style="height: 160px; margin: 0; padding: 0" width="100%">
                                                            <tr style="vertical-align: top;">
                                                                <td align="center" class="PopTableHeader" style="text-align: center; height: 20px">
                                                                    <center>
                                                                    </center>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="background-color: white; height: 140px; margin: 0; padding-bottom: 0; padding-top: 0;" valign="top" align="left">
                                                                    <div style="height: 99%; overflow: auto; text-align: left;">
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td style="width: 30%; height: 100%; margin: 0; padding: 0; padding-right: 3px;" valign="top">
                                                        <table cellspacing="0" class="PopTable" style="height: 160px; margin: 0; padding: 0; table-layout: fixed; word-wrap: break-word" width="100%">
                                                            <tr style="vertical-align: top;">
                                                                <td align="center" class="PopTableHeader" height="20px" style="text-align: center;">
                                                                    <center>
                                                                    </center>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="background-color: white; height: 140px; margin: 0; padding: 0; width: 100%; vertical-align: top; text-align: left">
                                                                    <div style="height: 135px; overflow: auto; width: 100%; margin: 0; padding: 0; text-align: left">
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
                                        <td style="min-width: 120px; width: 120px">
                                            <img src="<%=themePath %>/images/wf_icon01.jpg" width="120" height="65">
                                        </td>
                                        <td style="background-image: url(<%=themePath %>/images/wf_a01.jpg); background-repeat: repeat-x; height: 65px; background-position: 0% 100%;">
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="bigT" style="height: 65px; vertical-align: middle; text-align: left"></td>
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
                                        <td width="15" height="8" style="background-image: url(<%=themePath %>/images/wf_a03.gif)">
                                            <img src="<%=themePath %>/images/wf_a03.gif" width="15" height="8">
                                        </td>
                                        <td height="8" style="background-image: url(<%=themePath %>/images/wf_a04.gif)"></td>
                                        <td width="15" height="8" style="background-image: url(<%=themePath %>/images/wf_a05.gif)">
                                            <img src="<%=themePath %>/images/wf_a05.gif" width="15" height="8">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-image: url(<%=themePath %>/images/wf_a03.gif)">
                                            <img src="<%=themePath %>/images/wf_a03.gif" width="15" height="8">
                                        </td>
                                        <td style="background-image: url(<%=themePath %>/images/wf_a04.gif)">
                                            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:Panel ID="Panel1" runat="server" Width="100%" meta:resourcekey="Panel1Resource1">
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
                                        <td style="background-image: url(<%=themePath %>/images/wf_a06.gif); background-position: 0% 0%; height: 20px; width: 15px"></td>
                                        <td style="background-image: url(<%=themePath %>/images/wf_a07.gif); background-position: 0% 0%; height: 20px"></td>
                                        <td style="background-image: url(<%=themePath %>/images/wf_a08.gif); background-position: 0% 0%; height: 20px; width: 15px"></td>
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
                                        <td style="min-width: 120px; width: 120px">
                                            <img src="<%=themePath %>/images/wf_icon02.jpg" width="120" height="65">
                                        </td>
                                        <td style="background-image: url(<%=themePath %>/images/wf_a01.jpg); background-repeat: repeat-x; height: 65px; background-position: 0% 100%;">
                                            <table border="0" cellpadding="0" cellspacing="0" style="height: 65px; width: 100%">
                                                <tr>
                                                    <td class="bigT" style="vertical-align: middle; text-align: left"></td>
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
                                        <td width="15" height="8" style="background-image: url(<%=themePath %>/images/wf_a03.gif)">
                                            <img src="<%=themePath %>/images/wf_a03.gif" width="15" height="8">
                                        </td>
                                        <td height="8" style="background-image: url(<%=themePath %>/images/wf_a04.gif)"></td>
                                        <td width="15" height="8" style="background-image: url(<%=themePath %>/images/wf_a05.gif)">
                                            <img src="<%=themePath %>/images/wf_a05.gif" width="15" height="8">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-image: url(<%=themePath %>/images/wf_a03.gif)">
                                            <img src="<%=themePath %>/images/wf_a03.gif" width="15" height="8">
                                        </td>
                                        <td style="background-image: url(<%=themePath %>/images/wf_a04.gif)">
                                            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:Panel ID="Panel3" runat="server" meta:resourcekey="Panel3Resource1">
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
                                        <td style="background-image: url(<%=themePath %>/images/wf_a06.gif); background-position: 0% 0%; height: 20px; width: 15px"></td>
                                        <td style="background-image: url(<%=themePath %>/images/wf_a07.gif); background-position: 0% 0%; height: 20px"></td>
                                        <td style="background-image: url(<%=themePath %>/images/wf_a08.gif); background-position: 0% 0%; height: 20px; width: 15px"></td>
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
                <asp:Panel ID="Panel2" runat="server" Width="100%" meta:resourcekey="Panel1Resource1">
                    <uc5:UC_QueryIqyTask ID="UC_QueryIqyTask1" runat="server" />
                </asp:Panel>
                <asp:HiddenField ID="hfIQY_ID" runat="server" />
                <asp:HiddenField ID="hfUSER_GUID" runat="server" />
                <asp:HiddenField ID="hfTASK_ID" runat="server" />
                <asp:HiddenField ID="hfSITE_ID" runat="server" />
                <asp:HiddenField ID="hfNODE_SEQ" runat="server" />
                <asp:HiddenField ID="hfUSER_DEPT" runat="server" />
                <asp:HiddenField ID="hfIS_SCRIPT_IQY" runat="server" />
                <asp:Label ID="lblDialogTitleMsg" runat="server" Text="送出表單" Visible="False" meta:resourcekey="lblDialogTitleMsgResource1"></asp:Label>
                <asp:Label ID="lblNormal" runat="server" Text="普通" Visible="False" meta:resourcekey="lblNormalResource1"></asp:Label>
                <asp:Label ID="lblUrgent" runat="server" Text="急" Visible="False" meta:resourcekey="lblUrgentResource1"></asp:Label>
                <asp:Label ID="lblMostUrgent" runat="server" Text="緊急" Visible="False" meta:resourcekey="lblMostUrgentResource1"></asp:Label>
                <asp:Label ID="Label4" runat="server" Text="回覆徵詢" Visible="False" meta:resourcekey="Label4Resource1"></asp:Label>
                <asp:Label ID="lblIsSigned" runat="server" Text="此張單據已經簽核過了" Visible="False" meta:resourcekey="lblIsSignedResource1"></asp:Label>
                <asp:Label ID="lblIsCallFail" runat="server" Text="此張單據呼叫DLL組件失敗\r\n暫時無法簽核!!" Visible="False" meta:resourcekey="lblIsCallFailResource1"></asp:Label>
                <asp:Label ID="lblNoSiteMessage" runat="server" Text="您無法簽核此表單(已被簽核過或無簽核權限)!" Visible="False" meta:resourcekey="lblNoSiteMessageResource1"></asp:Label>
                <asp:Label ID="lblNotAllowMobileSign" runat="server" Text="此表單不允許行動裝置簽核" Visible="False" meta:resourcekey="lblNotAllowMobileSignResource1"></asp:Label>
                <asp:Label ID="lblNotAllowMobileUse" runat="server" Text="此表單不允許行動裝置操作" Visible="False" meta:resourcekey="lblNotAllowMobileUseResource1"></asp:Label>
                <asp:Label ID="lblNodata" runat="server" Text="表單已被刪除，無法找到表單相關資訊" Visible="False" meta:resourcekey="lblNodataResource1"></asp:Label>
                <asp:Label ID="lblNextNotify" runat="server" Text="下一張未讀" Visible="False" meta:resourcekey="lblNextNotifyResource1"></asp:Label>
                <asp:Label ID="lblReturnTxt" runat="server" Text="返回" Visible="False" meta:resourcekey="lblReturnTxtResource1"></asp:Label>
                <asp:Label ID="lblNoAuth" runat="server" meta:resourcekey="lblNoAuthResource1" Text="無權限處理或觀看此表單" Visible="False"></asp:Label>
                <asp:Label ID="lblIsCancel" runat="server" Text="此張單據已經作廢了" Visible="False" meta:resourcekey="lblIsCancelResource1"></asp:Label>
                <asp:Label ID="lblNotAllowSign" runat="server" Text="此表單正在進行背景簽核，無法簽核" meta:resourcekey="lblNotAllowSignResource1" Visible="False"></asp:Label>
                <asp:Label ID="lblNotAllowModify" runat="server" Text="此表單正在進行背景簽核，無法修改" meta:resourcekey="lblNotAllowModifyResource1" Visible="False"></asp:Label>
                <asp:Label ID="lblGetBackTxt" runat="server" Text="取回" Visible="False" meta:resourcekey="lblGetBackTxtResource1"></asp:Label>
                <asp:Label ID="lblVoidTxt" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblVoidTxtResource1"></asp:Label>
                <asp:Label ID="lblTaskOperateFailTxt" runat="server" Text="表單已由下一站人員簽核或鎖定，故無法取回" Visible="False" meta:resourcekey="lblTaskOperateFailTxtResource1"></asp:Label>
                <asp:Label ID="lblFormGetBackForBackgoundProcessing" runat="server" Text="此表單正在進行背景簽核，無法取回" meta:resourcekey="lblFormGetBackForBackgoundProcessingResource1" Visible="False"></asp:Label>
                <asp:Label ID="lblFormEndTxt" runat="server" Text="此表單已結案，故無法作廢" Visible="False" meta:resourcekey="lblFormEndTxtResource1"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
