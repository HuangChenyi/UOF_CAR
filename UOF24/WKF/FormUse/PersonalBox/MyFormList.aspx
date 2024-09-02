<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="WKF_FormUse_PersonalBox_MyFormList" Culture="auto" Title="個人表單" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="MyFormList.aspx.cs" %>

<%@ Register Src="../../Browse/UC_Query.ascx" TagName="UC_Query" TagPrefix="uc1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc2" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <style>
        /*解決網址無法折行造成過長問題*/
        .GridItemAlternating > td {
            word-break: break-all;
        }

        .GridItem > td {
            word-break: break-all;
        }

        .ColMinWidth {
            min-width: 150px;
        }
    </style>

    <script id="MyFormListjs" type="text/javascript">
        function GetFormInfos() {
            return $('#<%=hfSignFormList.ClientID%>').val();
        }

        function CannotGetbackAlert() {
            alert('<%=lblCannotget.Text %>');
        }

        function BackgoundProcessingAlert() {
            alert('<%=lblFormGetBackForBackgoundProcessing.Text %>');
        }

        function OnBarMainClick(sender, args) {
            if (args.get_item().get_value() == "BatchSign") {
                args.set_cancel(true);

                if ($('#<%=hfBatchSignType.ClientID%>').val() == "BatchSignForSingle") // BatchSignForSingle:舊的批次簽核(逐筆) BatchSign:新的批次簽核(背景批次)(預設)
                    $uof.dialog.open2("~/WKF/FormUse/BatchSign/SignViewForSingle.aspx", args.get_item(), "", 1024, 768, function () { return true; });
                else
                    $uof.dialog.open2("~/WKF/FormUse/BatchSign/SignView.aspx", args.get_item(), "", 1024, 768, function () { return true; });


                //批次簽核必須POSTBACK
                //args.set_cancel(true);
            }
        }
        Sys.Application.add_load(function () {


            if ($('#<%=txtIsPostBack.ClientID %>').val() == "False") {
                $('#<%= WebDateChooser1.ClientID  %>').hide();

                var signWindowWidth = "<%=signWindowWidth%>";
                var signWindowHeight = "<%=signWindowHeight%>";
                var DOC_NBR = $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["formNumber"],true)%>");
                var ReturnITEM = $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["item"],true)%>");
                var taskId = $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["taskId"],true)%>");
                var formVersionId = $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["formVersionId"],true)%>");
                var formId = $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["formId"],true)%>");
                var scriptId = $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["scriptId"],true)%>");
                var IsScript = $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["IsScript"],true)%>");
                var iqyId = $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["iqyId"],true)%>");
                var siteId = $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["siteId"],true)%>");
                var nodeSeq = $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["nodeSeq"],true)%>");
                var print = $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["print"],true)%>");
                var openPrint = $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(openPrint,true)%>");
                var agent = $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["AGENT"],true)%>");

                if (IsScript != "") {
                    $uof.dialog.open2("~/WKF/FormUse/Sign_View.aspx", "", "", signWindowWidth, signWindowHeight, function () { return false; }, { "scriptId": scriptId, "ITEM": ReturnITEM, "formVersionId": formVersionId, "formId": formId, "IsScript": IsScript, "taskId": taskId, "iqyId": iqyId, "nodeSeq": nodeSeq, "siteId": siteId, "AGENT": agent });
                    //doPostBack();
                }
                else {
                    if (taskId != "") {
                        if (print === "true" && openPrint === "true") {
                            var url = '<%=Page.ResolveUrl("~/WKF/FormUse/FormPrint.aspx") %>';
                            $uof.window.open(url + "?TASK_ID=" + taskId, 800, 768, true);
                            //doPostBack();
                        }
                        else {
                            $uof.dialog.open2("~/WKF/FormUse/Sign_View.aspx", "", "", signWindowWidth, signWindowHeight, OpensignFormDialog, { "taskId": taskId, "ITEM": ReturnITEM, "nodeSeq": nodeSeq, "siteId": siteId, "AGENT": agent });
                            //doPostBack();
                        }

                    }
                    else if (DOC_NBR != "") {
                        $uof.dialog.open2("~/WKF/FormUse/Sign_View.aspx", "", "", signWindowWidth, signWindowHeight, OpensignFormDialog, { "formNumber": DOC_NBR, "ITEM": ReturnITEM, "nodeSeq": nodeSeq, "siteId": siteId, "AGENT": agent });
                        //doPostBack();
                    }
                }
            }
        });

        function OpensignFormDialog(returnValue) {
            if (typeof (returnValue) != 'undefined')
                doPostBack();
            return false;

        }


        function lbtnRa_set(SignclientID, ViewclientID, taskId, formVersionId, steiId) {
            var signWindowWidth = "<%=signWindowWidth%>";
            var signWindowHeight = "<%=signWindowHeight%>";
            $("#" + SignclientID).css("default", "pointer").prop("disabled", true);

            $uof.dialog.open2("~/WKF/FormUse/ReturnSign/ReApplyForm.aspx", $("#" + SignclientID), "", signWindowWidth, signWindowHeight, function checkReturn(returnValue) {
                if (returnValue === null || typeof (returnValue) == 'undefined') {
                    $("#" + SignclientID).css("cursor", "pointer").prop("disabled", false);
                    return false;
                }
                return true;
            },
                { "TASK_ID": taskId, "formVersionId": formVersionId, "SITE_ID": steiId });
            return false;
        }

        function doPostBack() {
            $('#<%=btn.ClientID %>').click();
        }

        function lbtnSign_set(SignclientID, ViewclientID, taskID, siteID, nodeSeq, formversionID, queryType, keyword, sortString, index, categoryId, agent) {
            var signWindowWidth = "<%=signWindowWidth%>";
        var signWindowHeight = "<%=signWindowHeight%>";
            var lbtnViewClick = $('#' + ViewclientID).click;
            $('#' + ViewclientID).click(function () { });

            $("#" + SignclientID).css("cursor", "default").prop("disabled", true);

            $uof.dialog.open2("~/WKF/FormUse/FreeTask/SignNodeForm.aspx", $('#' + SignclientID), "", signWindowWidth, signWindowHeight, function checkReturn(returnValue) {
                if (typeof (returnValue) == "undefined") {
                    $("#" + SignclientID).css("cursor", "pointer").prop("disabled", false);
                    $("#" + ViewclientID).css("cursor", "pointer").prop("disabled", false);
                    return false;
                }
                else
                    return true;
            }, { "TASK_ID": taskID, "SITE_ID": siteID, "NODE_SEQ": nodeSeq, "formVersionId": formversionID, "QUERY_TYPE": queryType, "KEYWORD": keyword, "SORT_STRING": sortString, "INDEX": index, "CATEGORY_ID": categoryId, "AGENT": agent });


        }

        function lbtnLook_set(SignclientID, ViewclientID, taskID, siteID, nodeSeq, formversionID, queryType, keyword, sortString, index, categoryId, agent) {
            var signWindowWidth = "<%=signWindowWidth%>";
            var signWindowHeight = "<%=signWindowHeight%>";
            var lbtnViewClick = $('#' + ViewclientID).click;
            $('#' + ViewclientID).click(function () { });

            $("#" + SignclientID).css("cursor", "default").prop("disabled", true);
            // 因Bug 31479: [BPM]在[待簽表單-自己/代理]中點按表單編號，再點進行處理來往下送簽後，列表不會重整
            // 20221031改回後端開窗
            //$uof.dialog.open2("~/WKF/FormUse/ViewFormFromSign.aspx", $("#" + ViewclientID), "", signWindowWidth, signWindowHeight, function checkReturn(returnValue) {
            //    if (typeof (returnValue) == "undefined") {
            //        $("#" + SignclientID).css("cursor", "pointer").prop("disabled", false);
            //        $("#" + ViewclientID).css("cursor", "pointer").prop("disabled", false);
            //        return false;
            //    }
            //    else {
            //        return true;
            //    }
            //}, { "TASK_ID": taskID, "SITE_ID": siteID, "NODE_SEQ": nodeSeq, "formVersionId": formversionID, "QUERY_TYPE": queryType, "KEYWORD": keyword, "SORT_STRING": sortString, "INDEX": index, "CATEGORY_ID": categoryId, "AGENT": agent });


        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick">
        <Tabs>
            <telerik:RadTab runat="server" Text="New Tab" Value="MyFormList">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Root RadTab2" Value="ApplyFormList">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Root RadTab3" Value="GetbackFormList">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Root RadTab4" Value="SetAgent">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Root RadTab5" Value="custFlow">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadTreeView ID="treeFormClass" runat="server" OnNodeClick="treeFormClass_NodeClick">
            </telerik:RadTreeView>
        </ContentTemplate>
        <%--        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="DGFormList" EventName="DataBound"></asp:AsyncPostBackTrigger>
            <asp:AsyncPostBackTrigger ControlID="DGFormListAgent" EventName="DataBound"></asp:AsyncPostBackTrigger>
            <asp:AsyncPostBackTrigger ControlID="grdFormSigned" EventName="RowCommand"></asp:AsyncPostBackTrigger>
            <asp:AsyncPostBackTrigger ControlID="grdFormExamined" EventName="RowCommand"></asp:AsyncPostBackTrigger>
            <asp:AsyncPostBackTrigger ControlID="grdQuery" EventName="RowCommand"></asp:AsyncPostBackTrigger>
        </Triggers>--%>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0">
        <telerik:RadPageView ID="RadPageView1" runat="server">
            <table style="height: 470px; width: 100%; border: 0; text-align: left;" cellpadding="1"
                cellspacing="0" class="tbbg01">
                <tr>
                    <td style="vertical-align: top; width: 100%; text-align: left;">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Panel ID="pnlSignSelf" runat="server" Width="100%" meta:resourcekey="pnlSignSelfResource1">
                                    <telerik:RadToolBar ID="webToolBar" runat="server" OnClientButtonClicking="OnBarMainClick"
                                        OnButtonClick="webToolBar_ButtonClick" Width="100%" meta:resourcekey="UltraWebToolbar1Resource1">
                                        <Items>
                                            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m134.gif"
                                                DisabledImageUrl="~/Common/Images/Icon/icon_m134.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m134.gif"
                                                ImageUrl="~/Common/Images/Icon/icon_m134.gif" Text="批次簽核" Value="BatchSign" meta:resourcekey="TBarButtonResource4">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sBatchSign">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text="依表單分類" meta:resourceKey="TBLabelResource8"></asp:Label>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="FormType">
                                                <ItemTemplate>
                                                    <div style="padding-left: 2px; padding-right: 2px;">
                                                        <asp:DropDownList ID="ddlFormList" AutoPostBack="true" runat="server" Width="200px"
                                                            OnSelectedIndexChanged="ddlFormList_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </div>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sFormType">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text="依關鍵字查詢" meta:resourceKey="TBLabelResource7"></asp:Label>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="Keyword">
                                                <ItemTemplate>
                                                    <div style="padding-left: 2px; padding-right: 2px;">
                                                        <div style="padding-left: 2px; padding-right: 2px;">
                                                            <asp:TextBox ID="txtKeyword" runat="server" Width="100px"></asp:TextBox>
                                                            <div style="padding-left: 2px; padding-right: 2px;">
                                                            </div>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sKeyword" />
                                            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                meta:resourceKey="TBarButtonResource6" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                Text="查詢" Value="Query">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sQuery">
                                            </telerik:RadToolBarButton>
                                        </Items>
                                    </telerik:RadToolBar>
                                    <table class="PopTable" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="PopTableRightTD" style="width: 100%; text-align: left;">
                                                <asp:Label ID="Label15" ForeColor="Blue" runat="server" Text="*關鍵字查詢可查詢表單編號、標題、申請者、內容" meta:resourceKey="Label15Resource1"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Button ID="btn" runat="server" Text="Button" CausesValidation="false" Style="display: none" OnClick="Button1_Click" />
                                    <Fast:Grid ID="DGFormList" runat="server" AllowPaging="True" AllowSorting="True"
                                        AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False"
                                        DefaultSortDirection="Ascending" EnhancePager="True" OnPageIndexChanging="DGFormList_PageIndexChanging" OnRowCommand="DGFormList_RowCommand"
                                        OnRowDataBound="DGFormList_RowDataBound" OnSorting="DGFormList_Sorting" PageSize="15"
                                        Width="100%" OnBeforeExport="DGFormList_BeforeExport">
                                        <EnhancePagerSettings ShowHeaderPager="True" />
                                        <ExportExcelSettings AllowExportToExcel="true" DataSourceType="ObjectDataSource" />
                                        <Columns>
                                            <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td style="min-width: 13px">
                                                                <asp:Image ID="imgSelf" runat="server" meta:resourceKey="imgSelfResource1" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                                <ItemStyle Width="13px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="表單編號" meta:resourcekey="BoundFieldResource1" SortExpression="DOC_NBR">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnNbr" runat="server"></asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="80px" Wrap="false" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="FORM_NAME" HeaderText="表單名稱" meta:resourcekey="TemplateFieldResource2"
                                                SortExpression="FORM_NAME">
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="230px" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="標題" meta:resourcekey="TITLEResource1">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDisplayTitle" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="230px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="送出時間" meta:resourcekey="BoundFieldResource2" SortExpression="START_TIME">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFormStartTime" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="110px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="申請人" meta:resourcekey="TemplateFieldResource4" SortExpression="APPLICANT_NAME">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUserSelf" runat="server" meta:resourceKey="lblUserSelfResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="140px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource5">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnCancel" runat="server" Text="作廢" Visible="false" meta:resourceKey="lbtnCancelResource1"></asp:LinkButton>
                                                    <asp:LinkButton ID="lbtnSignSelf" runat="server" meta:resourceKey="lbtnSignSelfResource1"
                                                        Text="簽核"></asp:LinkButton>
                                                    <asp:LinkButton ID="lbtnLookSelf" runat="server" meta:resourceKey="lbtnLookSelfResource1"
                                                        Text="觀看"></asp:LinkButton>
                                                    <asp:LinkButton ID="lbtnPrintSelf" runat="server" meta:resourceKey="lbtnPrintSelfResource1"
                                                        Text="列印"></asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="100px" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle HorizontalAlign="Left" />
                                    </Fast:Grid>
                                    
                                </asp:Panel>
                                <asp:Panel ID="pnlSignAgent" runat="server" Width="100%" meta:resourcekey="pnlSignAgentResource1">
                                    <telerik:RadToolBar ID="webToolBarAgent" runat="server" OnClientButtonClicking="OnBarMainClick"
                                        OnButtonClick="webToolBarAgent_ButtonClick" Width="100%">
                                        <Items>
                                            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m134.gif"
                                                DisabledImageUrl="~/Common/Images/Icon/icon_m134.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m134.gif"
                                                ImageUrl="~/Common/Images/Icon/icon_m134.gif" Text="批次簽核" Value="BatchSign" meta:resourcekey="TBarButtonResource4">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sBatchSign">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text="依表單分類" meta:resourcekey="TBLabelResource9"></asp:Label>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="FormType">
                                                <ItemTemplate>
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                <div style="padding-left: 2px; padding-right: 2px;">
                                                                    <asp:DropDownList ID="ddlAgentformList" AutoPostBack="true" runat="server" Width="200px"
                                                                        OnSelectedIndexChanged="ddlAgentFormList_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sFormType">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text="依關鍵字查詢" meta:resourcekey="TBLabelResource10"></asp:Label>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="Keyword">
                                                <ItemTemplate>
                                                    <table cellpadding="0" cellspacing="0" width="100px">
                                                        <tr>
                                                            <td style="padding-left: 2px; padding-right: 2px;">
                                                                <div style="padding-left: 2px; padding-right: 2px;">
                                                                    <asp:TextBox ID="txtKeywordAgent" runat="server" Width="100px"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sKeyword">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                ImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="查詢" Value="Query" meta:resourcekey="TBarButtonResource7">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sQuery">
                                            </telerik:RadToolBarButton>
                                        </Items>
                                    </telerik:RadToolBar>
                                    <table class="PopTable" cellpadding="0" cellspacing="1">
                                        <tr>
                                            <td class="PopTableRightTD" style="width: 100%; text-align: left;">
                                                <asp:Label ID="Label211" ForeColor="Blue" runat="server" Text="*關鍵字查詢可查詢表單編號、標題、申請者、內容"
                                                    meta:resourceKey="Label15Resource1"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <Fast:Grid ID="DGFormListAgent" runat="server" Width="100%" EnhancePager="True" OnSorting="DGFormListAgent_Sorting"
                                        OnPageIndexChanging="DGFormListAgent_PageIndexChanging" PageSize="15" OnRowDataBound="DGFormListAgent_RowDataBound" OnRowCommand="DGFormListAgent_RowCommand"
                                        DataKeyOnClientWithCheckBox="False" AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="False"
                                        AllowSorting="True" AllowPaging="True" DefaultSortDirection="Ascending" OnBeforeExport="DGFormListAgent_BeforeExport">
                                        <EnhancePagerSettings ShowHeaderPager="True" />
                                        <ExportExcelSettings AllowExportToExcel="true" DataSourceType="ObjectDataSource" />
                                        <Columns>
                                            <asp:TemplateField meta:resourcekey="TemplateFieldResource6">
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td style="min-width: 13px">
                                                                <asp:Image runat="server" ID="imgAgent" meta:resourceKey="imgAgentResource1"></asp:Image>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                                <ItemStyle Width="13px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="表單編號" meta:resourcekey="BoundFieldResource1" SortExpression="DOC_NBR">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnNbrAgent" runat="server"></asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="80px" Wrap="false" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="表單名稱" meta:resourcekey="TemplateFieldResource7" SortExpression="FORM_NAME">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblFormnameAgent" meta:resourceKey="lblFormnameAgentResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="230px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="標題" meta:resourcekey="TITLEResource2">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDisplayTitle" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="230px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="送出時間" meta:resourcekey="BoundFieldResource4" SortExpression="START_TIME">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAgentStartTime" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="110px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="申請人" meta:resourcekey="TemplateFieldResource9" SortExpression="APPLICANT_NAME">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblUserAgent" meta:resourceKey="lblUserAgentResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="140px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="原簽核者" meta:resourcekey="TemplateFieldResource10" SortExpression="ORIGINAL_SIGNER_NAME">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("ORIGINAL_SIGNER") %>' ID="lblOrginalSigner"
                                                        meta:resourceKey="lblOrginalSignerResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="110px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource11">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnSignAgent" runat="server" meta:resourceKey="lbtnSignAgentResource1"
                                                        Text="簽核"></asp:LinkButton>
                                                    <asp:LinkButton ID="lbtnLookAgnet" runat="server" meta:resourceKey="lbtnLookAgnetResource1"
                                                        Text="觀看"></asp:LinkButton>
                                                    <asp:LinkButton ID="lbtnPrintAgent" runat="server" meta:resourceKey="lbtnPrintAgentResource1"
                                                        Text="列印"></asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="100px" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle HorizontalAlign="Left" />
                                    </Fast:Grid>
                                </asp:Panel>
                                <asp:Panel ID="pnlFormAlert" runat="server" Width="100%" meta:resourcekey="pnlFormAlertResource1">
                                    <telerik:RadToolBar ID="toolbarFormAlert" runat="server" meta:resourcekey="toolbarFormAlertResource1"
                                        OnButtonClick="toolbarFormAlert_ButtonClicked" Width="100%">
                                        <Items>
                                            <telerik:RadToolBarButton runat="server" Value="lblReadStatus">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text="讀取狀態：" meta:resourceKey="TBLabelResource1"></asp:Label>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="ReadStatus">
                                                <ItemTemplate>
                                                    <asp:DropDownList runat="server" ID="ddlAlertReadStatus" meta:resourceKey="ddlAlertReadStatusResource1">
                                                        <asp:ListItem Selected="True" Text="所有狀態" Value="All" meta:resourceKey="ListItemResource1"></asp:ListItem>
                                                        <asp:ListItem Text="未讀取" Value="0" meta:resourceKey="ListItemResource2"></asp:ListItem>
                                                        <asp:ListItem Text="已讀取" Value="1" meta:resourceKey="ListItemResource3"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="lblReadStatus">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAlertSource" runat="server" Text="來源：" meta:resourceKey="lblAlertSourceResource1"></asp:Label>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton Value="AlertSource">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlAlertSource" runat="server">
                                                        <asp:ListItem Selected="True" Text="全部" Value="All" meta:resourceKey="ListItemResource1"></asp:ListItem>
                                                        <asp:ListItem Text="一般知會" Value="normal" meta:resourceKey="ListItemnormalResource1"></asp:ListItem>
                                                        <asp:ListItem Text="交接表單" Value="handover" meta:resourceKey="ListItemhandoverResource1"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sReadStatus">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="ApplicationDateAlert">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text="申請日期：" meta:resourceKey="TBLabelResource2"></asp:Label>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="Applydate">
                                                <ItemTemplate>
                                                    <table runat="server" id="Table1">
                                                        <tr runat="server" id="Tr1">
                                                            <td runat="server" id="Td3">
                                                                <telerik:RadDatePicker ID="wdcAlertStartDate" runat="server"></telerik:RadDatePicker>
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="wdcAlertStartDate"
                                                                    ErrorMessage="請輸入申請時間(起)" Display="Dynamic" ID="rfvAlertStartDate" meta:resourceKey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td runat="server" id="Td4" style="padding-left: 3px; padding-right: 3px;">
                                                                <asp:Label runat="server" Text="~" ID="Label8"></asp:Label>
                                                            </td>
                                                            <td runat="server" id="Td5">
                                                                <telerik:RadDatePicker ID="wdcAlertEndDate" runat="server"></telerik:RadDatePicker>
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="wdcAlertEndDate" ErrorMessage="請輸入申請時間(迄)"
                                                                    Display="Dynamic" ID="rfvAlertEndDate" meta:resourceKey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr id="Tr2" runat="server">
                                                            <td id="Td1" runat="server" colspan="3">
                                                                <asp:CompareValidator runat="server" ControlToCompare="wdcAlertStartDate" Operator="GreaterThanEqual"
                                                                    Type="Date" ControlToValidate="wdcAlertEndDate" ErrorMessage="結束時間需晚於開始時間" Display="Dynamic"
                                                                    ID="CompareValidator1" meta:resourceKey="CompareValidator3Resource1"></asp:CompareValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sApplydate">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                ImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="查詢" Value="Query" meta:resourceKey="TBarButtonResource1">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sQuery">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Text="全部已讀" Value="readAll" ImageUrl="~/Common/Images/Icon/icon_m240.png" meta:resourceKey="readAllResource1">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true"></telerik:RadToolBarButton>
                                        </Items>
                                    </telerik:RadToolBar>
                                    <Fast:Grid ID="grdFormAlert" runat="server" Width="100%" EnhancePager="True" OnSorting="grdFormAlert_Sorting"
                                        OnPageIndexChanging="grdFormAlert_PageIndexChanging" PageSize="15" OnRowDataBound="grdFormAlert_RowDataBound"
                                        DataKeyOnClientWithCheckBox="False" AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="False"
                                        AllowSorting="True" AllowPaging="True" OnRowCommand="grdFormAlert_RowCommand"
                                        DefaultSortDirection="Ascending" OnBeforeExport="grdFormAlert_BeforeExport">
                                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl=""
                                            LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                                            PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                                            PreviousImageUrl="" />
                                        <ExportExcelSettings AllowExportToExcel="true" DataSourceType="ObjectDataSource" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="讀取狀態" meta:resourcekey="TemplateFieldResource12" SortExpression="READ_STATUS">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblReadstatusAlert" meta:resourceKey="lblReadstatusAlertResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="80px" Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="來源" meta:resourcekey="alertSourceResource1" SortExpression="HANDOVER_REASON">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblAlertSource"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="80px" Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="表單編號" meta:resourcekey="BoundFieldResource1" SortExpression="DOC_NBR">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnNbrAlert" runat="server"></asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="80px" Wrap="false" />
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="表單名稱" meta:resourcekey="TemplateFieldResource13" SortExpression="FORM_NAME" DataField="FORM_NAME">
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="230px" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="標題" meta:resourcekey="TITLEResource3">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDisplayTitle" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="230px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="申請人" meta:resourcekey="TemplateFieldResource14" SortExpression="APPLICANT_NAME">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblUserAlert" meta:resourceKey="lblUserAlertResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="140px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="結果" meta:resourcekey="TemplateFieldResource15" SortExpression="TASK_RESULT">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblResultAlert" meta:resourceKey="lblResultAlertResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="30px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="申請日期" meta:resourcekey="BoundFieldResource6" SortExpression="BEGIN_TIME">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAlertBeginTime" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="110px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="結案日期" meta:resourcekey="BoundFieldResource7" SortExpression="END_TIME">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAlertEndTime" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="110px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource16">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="lbtnLookAlert" Text="觀看" CommandName="Modify"
                                                        meta:resourceKey="lbtnLookAlertResource1"></asp:LinkButton>
                                                    <asp:LinkButton runat="server" ID="lbtnPrintAlert" Text="列印" meta:resourceKey="lbtnPrintAlertResource1"></asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="100px" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </Fast:Grid>
                                </asp:Panel>
                                <asp:Panel ID="pnlFormExamined" runat="server" Width="100%" meta:resourcekey="pnlFormExaminedResource1">
                                    <telerik:RadToolBar ID="toolbarFormExamined" runat="server" meta:resourcekey="toolbarFormExaminedResource1"
                                        OnButtonClick="toolbarFormExamined_ButtonClicked" Width="100%">
                                        <Items>
                                            <telerik:RadToolBarButton Value="lblFormStatus" runat="server">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label10" runat="server" Text="申請表單狀態：" meta:resourceKey="TBLabelResource3"></asp:Label>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton Value="FormExaminedState" runat="server">
                                                <ItemTemplate>
                                                    <asp:DropDownList runat="server" ID="ddlFormExaminedState" meta:resourceKey="ddlFormExaminedStateResource1">
                                                        <asp:ListItem Selected="True" Text="所有狀態" Value="0" meta:resourceKey="ListItemResource4"></asp:ListItem>
                                                        <asp:ListItem Text="處理中" Value="1" meta:resourceKey="ListItemResource5"></asp:ListItem>
                                                        <asp:ListItem Text="已結案(不含作廢表單)" Value="2" meta:resourceKey="ListItemResource6"></asp:ListItem>
                                                        <asp:ListItem Text="異常" Value="3" meta:resourceKey="ListItemResource7"></asp:ListItem>
                                                        <asp:ListItem Text="作廢" Value="4" meta:resourceKey="ListItemResource8"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sFormExaminedState">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton Value="lblApplicationDate" runat="server">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label11" runat="server" Text="申請日期：" meta:resourceKey="TBLabelResource4"></asp:Label>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton Value="ApplicationDate" runat="server">
                                                <ItemTemplate>
                                                    <table runat="server" id="Table2">
                                                        <tr id="Tr3" runat="server">
                                                            <td id="Td2" runat="server">
                                                                <telerik:RadDatePicker ID="wdcExaminedStartDate" runat="server"></telerik:RadDatePicker>
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="wdcExaminedStartDate"
                                                                    ErrorMessage="請輸入申請時間(起)" Display="Dynamic" ID="rfvExaminedStartDate" meta:resourceKey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td runat="server" id="Td8" style="padding-left: 3px; padding-right: 3px;">
                                                                <asp:Label runat="server" Text="~" ID="Label12"></asp:Label>
                                                            </td>
                                                            <td runat="server" id="Td9">
                                                                <telerik:RadDatePicker ID="wdcExaminedEndDate" runat="server"></telerik:RadDatePicker>
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="wdcExaminedEndDate"
                                                                    ErrorMessage="請輸入申請時間(迄)" Display="Dynamic" ID="rfvExaminedEndDate" meta:resourceKey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr id="Tr4" runat="server">
                                                            <td id="Td7" runat="server" colspan="3">
                                                                <asp:CompareValidator runat="server" ControlToCompare="wdcExaminedStartDate" Operator="GreaterThanEqual"
                                                                    Type="Date" ControlToValidate="wdcExaminedEndDate" ErrorMessage="結束時間需晚於開始時間"
                                                                    Display="Dynamic" ID="CompareValidator2" meta:resourceKey="CompareValidator3Resource1"></asp:CompareValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sApplicationDate">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                ImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="查詢" Value="Query" meta:resourceKey="TBarButtonResource2">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sQuery">
                                            </telerik:RadToolBarButton>
                                        </Items>
                                    </telerik:RadToolBar>
                                    <Fast:Grid ID="grdFormExamined" runat="server" Width="100%" EnhancePager="True" OnSorting="grdFormExamined_Sorting"
                                        OnPageIndexChanging="grdFormExamined_PageIndexChanging" PageSize="15" OnRowDataBound="grdFormExamined_RowDataBound"
                                        DataKeyOnClientWithCheckBox="False" AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="False"
                                        AllowSorting="True" AllowPaging="True" DataKeyNames="DOC_NBR" DefaultSortDirection="Ascending" OnRowCommand="grdFormExamined_RowCommand" OnBeforeExport="grdFormExamined_BeforeExport">
                                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl=""
                                            LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                                            PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                                            PreviousImageUrl="" />
                                        <ExportExcelSettings AllowExportToExcel="true" DataSourceType="ObjectDataSource" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="表單編號" meta:resourcekey="BoundFieldResource1" SortExpression="DOC_NBR">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnNbrExamined" runat="server"></asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="80px" Wrap="false" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="FORM_NAME" HeaderText="表單名稱" meta:resourcekey="TemplateFieldResource17" SortExpression="FORM_NAME">
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="230px" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="標題" meta:resourcekey="TITLEResource4">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDisplayTitle" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="230px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="結果" meta:resourcekey="TemplateFieldResource18" SortExpression="TASK_RESULT">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblResultExamined" meta:resourceKey="lblResultExaminedResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="申請時間" meta:resourcekey="BoundFieldResource9" SortExpression="BEGIN_TIME">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblExamBeginTime" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="110px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="結案時間" meta:resourcekey="BoundFieldResource10" SortExpression="END_TIME">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblExamEndTime" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="110px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="目前簽核者" meta:resourcekey="BoundFieldResource23" SortExpression="CURRENT_SIGNER">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblExamCurrentSigner" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="110px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource19">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="lbtnNotifyExamined" Text="跟催" meta:resourceKey="lbtnNotifyExaminedResource1"></asp:LinkButton>
                                                    <asp:LinkButton runat="server" ID="lbtnEndFormAlter" Text="結案後知會" Enabled="false"
                                                        meta:resourceKey="lbtnEndFormAlterResource1"></asp:LinkButton>
                                                    <asp:LinkButton runat="server" ID="lbtnGetBackExamined" Text="作廢" CommandName="lbtnGetBackExamined" meta:resourceKey="lbtnGetBackExaminedResource1"></asp:LinkButton>
                                                    <asp:LinkButton runat="server" ID="lbtnLookExamined" Text="觀看" meta:resourceKey="lbtnLookExaminedResource1"></asp:LinkButton>
                                                    <asp:LinkButton runat="server" ID="lbtnPrintExamined" Text="列印" meta:resourceKey="lbtnPrintExaminedResource1"></asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="220px" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </Fast:Grid>
                                </asp:Panel>
                                <asp:Panel ID="pnlFormSigned" runat="server" Width="100%" meta:resourcekey="pnlFormSignedResource1">
                                    <telerik:RadToolBar ID="toolbarFormSigned" runat="server" meta:resourcekey="toolbarFormSignedResource1"
                                        OnButtonClick="toolbarFormSigned_ButtonClicked" Width="100%">
                                        <Items>
                                            <telerik:RadToolBarButton runat="server" Value="lblFormSignedStatus">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label13" runat="server" Text="表單狀態：" meta:resourceKey="TBLabelResource5"></asp:Label>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="FormSignedState">
                                                <ItemTemplate>
                                                    <asp:DropDownList runat="server" ID="ddlSignedStatus" meta:resourceKey="ddlSignedStatusResource1">
                                                        <asp:ListItem Selected="True" Text="所有狀態" Value="0" meta:resourceKey="ListItemResource9"></asp:ListItem>
                                                        <asp:ListItem Text="處理中" Value="1" meta:resourceKey="ListItemResource10"></asp:ListItem>
                                                        <asp:ListItem Text="已結案" Value="2" meta:resourceKey="ListItemResource11"></asp:ListItem>
                                                        <asp:ListItem Text="異常" Value="3" meta:resourceKey="ListItemResource12"></asp:ListItem>
                                                        <asp:ListItem Text="作廢" Value="4" meta:resourceKey="ListItemResource13"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sFormSignedState">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="lblApplicationDate">
                                                <ItemTemplate>
                                                    <asp:RadioButton ID="rbSignedApplyDate" runat="server" Text="申請日期" GroupName="QueryType" meta:resourceKey="rbQueryApplyDateResource1" Checked="true" />
                                                    <asp:RadioButton ID="rbSignedSignDate" runat="server" Text="簽核日期" GroupName="QueryType" meta:resourceKey="rbQuerySignDateResource1" />
                                                    &nbsp;
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="ApplicationDate">
                                                <ItemTemplate>
                                                    <table runat="server" id="Table3">
                                                        <tr runat="server" id="Tr5">
                                                            <td runat="server" id="Td6">
                                                                <telerik:RadDatePicker ID="wdcSignedStartDate" runat="server"></telerik:RadDatePicker>
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="wdcSignedStartDate"
                                                                    ErrorMessage="請輸入申請時間(起)" Display="Dynamic" ID="rfvSignStartDate" meta:resourceKey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td runat="server" id="Td10" style="padding-left: 3px; padding-right: 3px;">
                                                                <asp:Label runat="server" Text="~" ID="Label16"></asp:Label>
                                                            </td>
                                                            <td runat="server" id="Td11">
                                                                <telerik:RadDatePicker ID="wdcSignedEndDate" runat="server"></telerik:RadDatePicker>

                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="wdcSignedEndDate" ErrorMessage="請輸入申請時間(迄)"
                                                                    Display="Dynamic" ID="rfvSignEndDate" meta:resourceKey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr runat="server" id="Tr6">
                                                            <td runat="server" id="Td12" colspan="3">
                                                                <asp:CompareValidator runat="server" ControlToCompare="wdcSignedStartDate" Operator="GreaterThanEqual"
                                                                    Type="Date" ControlToValidate="wdcSignedEndDate" ErrorMessage="結束時間需晚於開始時間" Display="Dynamic"
                                                                    ID="CompareValidator4" meta:resourceKey="CompareValidator3Resource1"></asp:CompareValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sApplicationDate">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                ImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="查詢" Value="Query" meta:resourceKey="TBarButtonResource3">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sQuery">
                                            </telerik:RadToolBarButton>
                                        </Items>
                                    </telerik:RadToolBar>
                                    <Fast:Grid ID="grdFormSigned" runat="server" AllowPaging="True" AllowSorting="True"
                                        AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False"
                                        DefaultSortDirection="Ascending" EnhancePager="True" OnPageIndexChanging="grdFormSigned_PageIndexChanging"
                                        OnRowCommand="grdFormSigned_RowCommand" OnRowDataBound="grdFormSigned_RowDataBound"
                                        OnSorting="grdFormSigned_Sorting" PageSize="15" Width="100%" OnBeforeExport="grdFormSigned_BeforeExport">
                                        <EnhancePagerSettings ShowHeaderPager="True" />
                                        <ExportExcelSettings AllowExportToExcel="true" DataSourceType="ObjectDataSource" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="表單編號" meta:resourcekey="BoundFieldResource1" SortExpression="DOC_NBR">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnNbrSigned" runat="server"></asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="80px" Wrap="false" />
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="表單名稱" meta:resourcekey="TemplateFieldResource20" SortExpression="FORM_NAME" DataField="FORM_NAME">
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="230px" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="標題" meta:resourcekey="TITLEResource4">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDisplayTitle" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="230px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="申請人" meta:resourcekey="TemplateFieldResource21" SortExpression="APPLICANT_NAME">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUserSigned" runat="server" meta:resourceKey="lblUserSignedResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="140px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="結果" meta:resourcekey="TemplateFieldResource22" SortExpression="TASK_RESULT">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblResultSigned" runat="server" meta:resourceKey="lblResultSignedResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="30px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="申請日期" meta:resourcekey="BoundFieldResource12" SortExpression="BEGIN_TIME">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSignedBeginTime" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="110px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="結案日期" meta:resourcekey="BoundFieldResource13" SortExpression="END_TIME">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSignedEndTime" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="110px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="目前簽核者" meta:resourcekey="BoundFieldResource23" SortExpression="CURRENT_SIGNER">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSignedCurrentSigner" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="110px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource23">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnNotifySigned" runat="server" meta:resourceKey="lbtnNotifySignedResource1"
                                                        Text="跟催"></asp:LinkButton>
                                                    <asp:LinkButton ID="lbtnGetbackSigned" runat="server" CommandName="Getback" meta:resourceKey="lbtnGetbackSignedResource1"
                                                        Text="取回"></asp:LinkButton>
                                                    <asp:LinkButton ID="lbtnLookSigned" runat="server" meta:resourceKey="lbtnLookSignedResource1"
                                                        Text="觀看"></asp:LinkButton>
                                                    <asp:LinkButton ID="lbtnPrintSigned" runat="server" meta:resourceKey="lbtnPrintSignedResource1"
                                                        Text="列印"></asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="150px" Wrap="False" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </Fast:Grid>
                                </asp:Panel>
                                <asp:Panel ID="pnlFormQuery" runat="server" Width="100%" meta:resourcekey="pnlFormQueryResource1">
                                    <table style="width: 100%;">
                                        <tbody>
                                            <tr>
                                                <td style="width: 100%;">
                                                    <table class="PopTable" cellspacing="1">
                                                        <tr>
                                                            <td class="PopTableHeader" style="height: 25px" align="center" colspan="3" nowrap="nowrap">
                                                                <asp:Label ID="lblBasicQuery" runat="server" Text="基本查詢" meta:resourcekey="lblBasicQueryResource1"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="height: 25px;" nowrap="nowrap" class="PopTableLeftTD">
                                                                <asp:Label ID="lblTaskResult" runat="server" Text="表單狀態" meta:resourcekey="lblTaskResultResource1"></asp:Label>
                                                            </td>
                                                            <td style="height: 25px;" colspan="2" class="PopTableRightTD">
                                                                <asp:DropDownList ID="ddlQueryTaskStatus" runat="server" meta:resourcekey="ddlQueryTaskStatusResource1">
                                                                    <asp:ListItem Text="所有狀態" Value="all" meta:resourcekey="ListItemResource14"></asp:ListItem>
                                                                    <asp:ListItem Text="處理中" Value="1" meta:resourcekey="ListItemResource15"></asp:ListItem>
                                                                    <asp:ListItem Text="已結案" Value="2" meta:resourcekey="ListItemResource16"></asp:ListItem>
                                                                    <asp:ListItem Text="異常" Value="3" meta:resourcekey="ListItemResource17"></asp:ListItem>
                                                                    <asp:ListItem Text="作廢" Value="4" meta:resourcekey="ListItemResource13"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="height: 25px;" nowrap="nowrap" class="PopTableLeftTD">
                                                                <asp:Label ID="lblFormName" runat="server" Text="表單名稱" meta:resourcekey="lblFormNameResource1"></asp:Label>
                                                            </td>
                                                            <td style="height: 25px;" colspan="2" class="PopTableRightTD">
                                                                <asp:DropDownList ID="ddlFormNameQuery" runat="server" meta:resourcekey="ddlFormNameQueryResource1"
                                                                    OnSelectedIndexChanged="ddlFormNameQuery_SelectedIndexChanged" AutoPostBack="True">
                                                                    <asp:ListItem Text="所有表單" Value="all" meta:resourcekey="ListItemResource18"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="height: 25px;" nowrap="nowrap" class="PopTableLeftTD">
                                                                <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                                                <asp:Label ID="lblBeginTime" runat="server" Text="日期" meta:resourcekey="lblBeginTimeResource1"></asp:Label>
                                                            </td>
                                                            <td style="height: 25px;" colspan="2" class="PopTableRightTD">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:RadioButton ID="rbQueryApplyDate" runat="server" GroupName="QueryMode" Text="申請日期" Checked="true" meta:resourcekey="rbQueryApplyDateResource1" />
                                                                            <asp:RadioButton ID="rbQuerySignDate" runat="server" GroupName="QueryMode" Text="簽核日期" meta:resourcekey="rbQuerySignDateResource1" />
                                                                        </td>
                                                                        <td>
                                                                            <telerik:RadDatePicker ID="wdcQueryDateStart" runat="server"></telerik:RadDatePicker>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" meta:resourcekey="RequiredFieldValidator1Resource1"
                                                                                Display="Dynamic" ErrorMessage="請輸入申請時間(起)" ControlToValidate="wdcQueryDateStart"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                        <td>～</td>
                                                                        <td>
                                                                            <telerik:RadDatePicker ID="wdcQueryDateEnd" runat="server"></telerik:RadDatePicker>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" meta:resourcekey="RequiredFieldValidator2Resource1"
                                                                                Display="Dynamic" ErrorMessage="請輸入申請時間(迄)" ControlToValidate="wdcQueryDateEnd"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3">
                                                                            <asp:CompareValidator ID="CompareValidator3" runat="server" meta:resourcekey="CompareValidator3Resource1"
                                                                                Display="Dynamic" ErrorMessage="結束時間需大於開始時間" ControlToValidate="wdcQueryDateEnd"
                                                                                Type="Date" Operator="GreaterThanEqual" ControlToCompare="wdcQueryDateStart"></asp:CompareValidator>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="height: 25px;" nowrap="nowrap" class="PopTableLeftTD">
                                                                <asp:Label ID="Label7" runat="server" Text="表單編號起訖" meta:resourcekey="lblDocNbrResource1"></asp:Label></td>
                                                            <td style="height: 25px;" colspan="2" class="PopTableRightTD">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:TextBox ID="tbDocNbrStart" runat="server" Width="100px" meta:resourcekey="tbDocNbrStartResource1"></asp:TextBox></td>
                                                                        <td>～</td>
                                                                        <td>
                                                                            <asp:TextBox ID="tbDocNbrEnd" runat="server" Width="120px" meta:resourcekey="tbDocNbrEndResource1"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="height: 25px;" nowrap="nowrap" class="PopTableLeftTD">
                                                                <asp:Label ID="Label16" runat="server" Text="關鍵字查詢" meta:resourcekey="Label16Resource1"></asp:Label>
                                                            </td>
                                                            <td style="height: 25px;" colspan="2" class="PopTableRightTD">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:TextBox ID="txtKeywordByFormQuery" runat="server" Width="200px"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label17" ForeColor="Blue" runat="server" Text="*可查詢表單編號、標題、申請者、內容" meta:resourcekey="Label17Resource1"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <uc1:UC_Query ID="UC_Query1" runat="server"></uc1:UC_Query>
                                                    <table style="width: 100%;">
                                                        <tbody>
                                                            <tr>
                                                                <td style="height: 25px; text-align: center; width: 100%;">
                                                                    <center>
                                                                        <asp:Button ID="wibQuery" OnClick="wibQuery_Click" runat="server" meta:resourcekey="wibQueryResource1"
                                                                            Text="查詢"></asp:Button>
                                                                        &nbsp;
                                                                                <asp:Button ID="wibShowSpecial" OnClick="wibShowSpecial_Click" runat="server" meta:resourcekey="wibShowSpecialResource1"
                                                                                    Text="進階查詢"></asp:Button>
                                                                    </center>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <Fast:Grid ID="grdQuery" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                        AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                                        EnhancePager="True" OnPageIndexChanging="grdQuery_PageIndexChanging" OnRowCommand="grdQuery_RowCommand"
                                        OnRowDataBound="grdQuery_RowDataBound" OnSorting="grdQuery_Sorting" PageSize="15"
                                        Style="margin-bottom: 4px" Width="100%" OnBeforeExport="grdQuery_BeforeExport">
                                        <EnhancePagerSettings ShowHeaderPager="True" />
                                        <ExportExcelSettings AllowExportToExcel="true" DataSourceType="ObjectDataSource" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="表單編號" meta:resourcekey="BoundFieldResource1" SortExpression="DOC_NBR">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnNbrQuery" runat="server"></asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="80px" Wrap="false" />
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="表單名稱" meta:resourcekey="TemplateFieldResource24" SortExpression="FORM_NAME" DataField="FORM_NAME">
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="200px" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="標題" meta:resourcekey="TITLEResource4">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDisplayTitle" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="230px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="申請人" meta:resourcekey="TemplateFieldResource25" SortExpression="APPLICANT">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUserQuery" runat="server" meta:resourceKey="lblUserQueryResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="130px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="結果" meta:resourcekey="TemplateFieldResource26" SortExpression="TASK_RESULT">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblResultQuery" runat="server" meta:resourceKey="lblResultQueryResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="100px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="申請日期" SortExpression="BEGIN_TIME" meta:resourcekey="BoundFieldResource15">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblQueryBeginTime" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="130px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="結案日期" SortExpression="END_TIME" meta:resourcekey="BoundFieldResource16">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblQueryEndTime" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="130px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="目前簽核者" meta:resourcekey="BoundFieldResource23" SortExpression="CURRENT_SIGNER">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblQueryCurrentSigner" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="110px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource27">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnCancelQuery" CommandName="lbtnCancelQuery" runat="server" meta:resourceKey="lbtnCancelQueryResource1"
                                                        Text="作廢"></asp:LinkButton>
                                                    &nbsp;<asp:LinkButton ID="lbtnGetBackQuery" runat="server" CommandName="Getback"
                                                        meta:resourceKey="lbtnGetBackQueryResource1" Text="取回"></asp:LinkButton>
                                                    &nbsp;<asp:LinkButton ID="lbtnNotifyQuery" runat="server" meta:resourceKey="lbtnNotifyQueryResource1"
                                                        Text="跟催"></asp:LinkButton>
                                                    &nbsp;<asp:LinkButton ID="lbtnLookQuery" runat="server" meta:resourceKey="lbtnLookQueryResource1"
                                                        Text="觀看"></asp:LinkButton>
                                                    &nbsp;<asp:LinkButton ID="lbtnPrintQuery" runat="server" meta:resourceKey="lbtnPrintQueryResource1"
                                                        Text="列印"></asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="150px" Wrap="False" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </Fast:Grid>
                                </asp:Panel>
                                <asp:Panel ID="pnlForOpinion" runat="server" Width="100%" meta:resourcekey="pnlForOpinionResource1">
                                    <telerik:RadToolBar ID="ForOpinionWebToolbar" runat="server" meta:resourcekey="ForOpinionWebToolbarResource1"
                                        OnButtonClick="ForOpinionWebToolbar_ButtonClicked" Width="100%">
                                        <Items>
                                            <telerik:RadToolBarButton runat="server" Value="FormOpinion">
                                                <ItemTemplate>
                                                    <table id="Table5" width="100%" runat="server">
                                                        <tr id="Tr7" runat="server" align="left">
                                                            <td id="Td15" nowrap="nowrap" style="text-align: right" runat="server" width="90px">
                                                                <asp:Label ID="Label20" runat="server" Text="回覆狀態：" meta:resourceKey="Label11Resource1"></asp:Label>
                                                            </td>
                                                            <td id="Td16" nowrap="nowrap" runat="server">
                                                                <asp:DropDownList ID="ddlForOpinion" runat="server" meta:resourceKey="ddlForOpinionResource1">
                                                                    <asp:ListItem Value="All" meta:resourceKey="ForOpinionListItemResource1">全部狀態</asp:ListItem>
                                                                    <asp:ListItem Value="0" meta:resourceKey="ForOpinionListItemResource2">未回覆</asp:ListItem>
                                                                    <asp:ListItem Value="1" meta:resourceKey="ForOpinionListItemResource3">已回覆</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sFormOpinion">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="DateQuery">
                                                <ItemTemplate>
                                                    <table id="Table6" width="100%" border="0" cellpadding="0" cellspacing="0" runat="server">
                                                        <tr id="Tr8" runat="server">
                                                            <td id="Td17" nowrap="nowrap" runat="server">
                                                                <asp:Label ID="lblForOpinionStartDate" runat="server" Text="徵詢日期：" meta:resourceKey="lblForOpinionStartDateResource1"></asp:Label>
                                                            </td>
                                                            <td id="Td18" nowrap="nowrap" runat="server">
                                                                <telerik:RadDatePicker ID="WebDCForOpinionStartDate" runat="server"></telerik:RadDatePicker>
                                                            </td>
                                                            <td id="Td19" nowrap="nowrap" runat="server" style="padding-left: 3px; padding-right: 3px;">
                                                                <asp:Label ID="lblForOpinionEndDate" runat="server" Text="~" meta:resourceKey="lblForOpinionEndDateResource1"></asp:Label>
                                                            </td>
                                                            <td id="Td20" nowrap="nowrap" runat="server">
                                                                <telerik:RadDatePicker ID="WebDCForOpinionEndDate" runat="server"></telerik:RadDatePicker>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sDateQuery">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                ImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="查詢" Value="Query" meta:resourceKey="TBarButtonResource2">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sQuery">
                                            </telerik:RadToolBarButton>
                                        </Items>
                                    </telerik:RadToolBar>
                                    <Fast:Grid ID="ForOpinionGrid" runat="server" AutoGenerateCheckBoxColumn="False"
                                        AllowSorting="True" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False"
                                        DefaultSortDirection="Ascending" EnhancePager="True" OnPageIndexChanging="Grid1_PageIndexChanging"
                                        OnRowDataBound="Grid1_RowDataBound" PageSize="15" AllowPaging="True" Width="100%"
                                        OnSorting="ForOpinionGrid_Sorting" OnRowCommand="ForOpinionGrid_RowCommand" OnBeforeExport="ForOpinionGrid_BeforeExport">
                                        <EnhancePagerSettings ShowHeaderPager="True" />
                                        <ExportExcelSettings AllowExportToExcel="true" DataSourceType="ObjectDataSource" />
                                        <Columns>
                                            <asp:BoundField HeaderText="回覆狀態" SortExpression="IQY_STATUS" meta:resourcekey="BoundFieldResource17">
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="80px" Wrap="False" HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="表單編號" meta:resourcekey="BoundFieldResource1" SortExpression="DOC_NBR">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnNbrOpinion" runat="server"></asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="80px" Wrap="false" />
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="表單名稱" meta:resourcekey="BoundFieldResource19" SortExpression="FORM_NAME" DataField="FORM_NAME">
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="230px" Wrap="False" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="標題" meta:resourcekey="BoundFieldResource20">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDisplayTitle" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="230px" />
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="表單狀態" meta:resourcekey="BoundFieldResource22" SortExpression="TASK_STATUS">
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="80px" HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="送出時間" meta:resourcekey="BoundFieldResource21" SortExpression="BEGIN_TIME">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOpinionBeginTime" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="110px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="徵詢人" SortExpression="FORM_USER_NAME" meta:resourcekey="TemplateFieldResource28">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblForOpinionUser" runat="server" meta:resourcekey="lblForOpinionUserResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource29">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbForOpinion" runat="server" meta:resourcekey="lbForOpinionResource1"></asp:LinkButton>
                                                    <asp:LinkButton ID="lbLookTask" runat="server" Text="觀看" meta:resourceKey="lbLookTaskResource1"></asp:LinkButton>
                                                    <asp:LinkButton ID="lbForOpinionPrint" runat="server" Text="列印" meta:resourceKey="lbForOpinionPrintResource1"></asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="100px" HorizontalAlign="Center" Wrap="False" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </Fast:Grid>
                                </asp:Panel>
                                <asp:Panel ID="pnlFormAgent" runat="server" Width="100%">
                                    <telerik:RadToolBar ID="FormAgentWebToolbar" runat="server"
                                        OnButtonClick="FormAgentWebToolbar_ButtonClicked" Width="100%">
                                        <Items>
                                            <telerik:RadToolBarButton runat="server" Value="lblFormStatus_Agent">
                                                <ItemTemplate>

                                                    <asp:Label ID="Label24" runat="server" meta:resourceKey="TBLabelAgentFormStatusResource1" Text="申請表單狀態："></asp:Label>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="FormAgentState">
                                                <ItemTemplate>
                                                    <asp:DropDownList runat="server" ID="ddlFormAgentState">
                                                        <asp:ListItem Selected="True" Text="所有狀態" Value="0" meta:resourceKey="ListItemFormAgentStateResource1"></asp:ListItem>
                                                        <asp:ListItem Text="處理中" Value="1" meta:resourceKey="ListItemFormAgentStateResource2"></asp:ListItem>
                                                        <asp:ListItem Text="已結案(不含作廢表單)" Value="2" meta:resourceKey="ListItemFormAgentStateResource3"></asp:ListItem>
                                                        <asp:ListItem Text="異常" Value="3" meta:resourceKey="ListItemFormAgentStateResource4"></asp:ListItem>
                                                        <asp:ListItem Text="作廢" Value="4" meta:resourceKey="ListItemFormAgentStateResource5"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sFormAgentState">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="lblApplicationDate_Agent">
                                                <ItemTemplate>

                                                    <asp:Label ID="Label25" runat="server" meta:resourceKey="TBLabelAgentApplicationDateResource1" Text="申請日期："></asp:Label>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="Applicantdate_Agent">
                                                <ItemTemplate>
                                                    <table runat="server" id="Table4">
                                                        <tr runat="server" id="Tr9">
                                                            <td runat="server" id="Td13">
                                                                <telerik:RadDatePicker runat="server" ID="wdcAgentStartDate"></telerik:RadDatePicker>
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="wdcAgentStartDate"
                                                                    ErrorMessage="請輸入申請時間(起)" Display="Dynamic" ID="RequiredFieldValidator3" meta:resourceKey="RequiredFieldValidator3Resource1">
                                                                </asp:RequiredFieldValidator>
                                                            </td>
                                                            <td runat="server" id="Td14" style="padding-left: 3px; padding-right: 3px;">
                                                                <asp:Label runat="server" Text="~" ID="Label26"></asp:Label>
                                                            </td>
                                                            <td runat="server" id="Td21">
                                                                <telerik:RadDatePicker runat="server" ID="wdcAgentEndDate"></telerik:RadDatePicker>
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="wdcAgentEndDate"
                                                                    ErrorMessage="請輸入申請時間(迄)" Display="Dynamic" ID="RequiredFieldValidator4" meta:resourceKey="RequiredFieldValidator4Resource1">
                                                                </asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr id="Tr10" runat="server">
                                                            <td id="Td22" runat="server" colspan="3">
                                                                <asp:CompareValidator runat="server" ControlToCompare="wdcAgentStartDate" Operator="GreaterThanEqual"
                                                                    Type="Date" ControlToValidate="wdcAgentEndDate" ErrorMessage="結束時間需晚於開始時間"
                                                                    Display="Dynamic" ID="CompareValidator5" meta:resourceKey="CompareValidator5Resource1"></asp:CompareValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sApplicantdate_Agent">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                ImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="查詢" Value="Query" meta:resourceKey="TBarButtonAgentQueryResource1">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sQuery">
                                            </telerik:RadToolBarButton>
                                        </Items>
                                    </telerik:RadToolBar>
                                    <Fast:Grid ID="FormAgentGrid" runat="server" Width="100%" EnhancePager="True" PageSize="15"
                                        DataKeyOnClientWithCheckBox="False" AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="False"
                                        AllowSorting="True" AllowPaging="True" OnPageIndexChanging="FormAgentGrid_PageIndexChanging" OnRowCommand="FormAgentGrid_RowCommand"
                                        OnRowDataBound="FormAgentGrid_RowDataBound" OnSorting="FormAgentGrid_Sorting" OnBeforeExport="FormAgentGrid_BeforeExport">
                                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl=""
                                            LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                                            PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                                            PreviousImageUrl="" />
                                        <ExportExcelSettings AllowExportToExcel="true" DataSourceType="ObjectDataSource" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="表單編號" meta:resourcekey="BoundFieldResource1" SortExpression="DOC_NBR">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnNbrFormAgent" runat="server"></asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="80px" Wrap="false" />
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="表單名稱" meta:resourcekey="TemplateFieldResource30" SortExpression="FORM_NAME" DataField="FORM_NAME">
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="230px" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="標題" meta:resourcekey="TITLEResource4">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDisplayTitle" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="230px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="結果" meta:resourcekey="TemplateFieldResource18" SortExpression="TASK_RESULT">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblResultAgent" meta:resourceKey="lblResultExaminedResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="30px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="申請時間" meta:resourcekey="BoundFieldResource9" SortExpression="BEGIN_TIME">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAgentBeginTime" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="110px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="結案時間" meta:resourcekey="BoundFieldResource10" SortExpression="END_TIME">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAgentEndTime" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Width="110px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="目前簽核者" meta:resourcekey="BoundFieldResource23" SortExpression="CURRENT_SIGNER">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAgentCurrentSigner" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="110px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource19">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="lbtnLookExamined" Text="觀看" meta:resourceKey="lbtnLookSelfResource1"></asp:LinkButton>
                                                    <asp:LinkButton runat="server" ID="lbtnGetBack" Text="取回" meta:resourceKey="lbtnGetbackSignedResource1"></asp:LinkButton>
                                                    <asp:LinkButton runat="server" ID="lbtnCancel" Text="作廢" meta:resourceKey="lbtnCancelResource1"></asp:LinkButton>
                                                    <asp:LinkButton runat="server" ID="lbtnPrintExamined" Text="列印" meta:resourceKey="lbtnPrintSelfResource1"></asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="100px" Wrap="False" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </Fast:Grid>
                                </asp:Panel>
                                <asp:HiddenField ID="hfSignFormList" runat="server" />
                                <asp:TextBox ID="txtIsPostBack" runat="server" Style="display: none"></asp:TextBox>
                                <asp:HiddenField ID="hfBatchSignType" runat="server" />
                            </ContentTemplate>
                            <%--                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="treeFormClass" EventName="NodeClick" />
                                    </Triggers>--%>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server"></telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView3" runat="server"></telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView4" runat="server"></telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView5" runat="server"></telerik:RadPageView>
    </telerik:RadMultiPage>


    <asp:Label ID="lblCustFlow" runat="server" Text="定義自訂流程" Visible="False" meta:resourcekey="lblCustFlowResource1"></asp:Label>
    <asp:Label ID="lblSignSelf" runat="server" Text="待簽表單-自己" Visible="False" meta:resourcekey="lblSignSelfResource1"></asp:Label>
    <asp:Label ID="lblSignAgent" runat="server" Text="待簽表單-代理" Visible="False" meta:resourcekey="lblSignAgentResource1"></asp:Label>
    <asp:Label ID="lblMostUrgent" runat="server" Text="緊急" Visible="False" meta:resourcekey="lblMostUrgentResource1"></asp:Label>
    <asp:Label ID="lblUrgent" runat="server" Text="急" Visible="False" meta:resourcekey="lblUrgentResource1"></asp:Label>
    <asp:Label ID="lblNormal" runat="server" Text="普通" Visible="False" meta:resourcekey="lblNormalResource1"></asp:Label>
    <asp:Label ID="lblDelayform" runat="server" Text="逾時表單" Visible="False" meta:resourcekey="lblDelayformResource1"></asp:Label>
    <asp:Label ID="lblGeneral" runat="server" Text="一般" Visible="False" meta:resourcekey="lblGeneralResource1"></asp:Label>
    <asp:Label ID="lblOr" runat="server" Text="並簽" Visible="False" meta:resourcekey="lblOrResource1"></asp:Label>
    <asp:Label ID="lblAnd" runat="server" Text="會簽" Visible="False" meta:resourcekey="lblAndResource1"></asp:Label>
    <asp:Label ID="lblFormAlert" runat="server" Text="被知會表單" Visible="False" meta:resourcekey="lblFormAlertResource1"></asp:Label>
    <asp:Label ID="lblFormExamined" runat="server" Text="已送審表單" Visible="False" meta:resourcekey="lblFormExaminedResource1"></asp:Label>
    <asp:Label ID="lblFormSigned" runat="server" Text="已簽核表單" Visible="False" meta:resourcekey="lblFormSignedResource1"></asp:Label>
    <asp:Label ID="lblFormQuery" runat="server" Text="查詢表單" Visible="False" meta:resourcekey="lblFormQueryResource1"></asp:Label>
    <asp:Label ID="lblReturnToApplicant" runat="server" Text="被退回的申請" Visible="False" meta:resourcekey="lblReturnToApplicantResource1"></asp:Label>
    <asp:Label ID="lblFormAgent" runat="server" Text="代填寫表單" Visible="False" meta:resourcekey="lblFormAgentResource1"></asp:Label>
    <asp:Label ID="lblForOpinion" runat="server" Text="被徵詢表單" Visible="False" meta:resourcekey="lblForOpinionResource1"></asp:Label>
    <asp:Label ID="lblForOpinionOpinion" runat="server" Text="被徵詢表單回覆" Visible="False" meta:resourcekey="lblForOpinionOpinionResource1"></asp:Label>
    <asp:Label ID="lblForOpinionLinkButtonName" runat="server" Text="回覆" Visible="False" meta:resourcekey="lblForOpinionLinkButtonNameResource1"></asp:Label>
    <asp:Label ID="lblForOpiniond" runat="server" Text="已回覆" Visible="False" meta:resourcekey="lblForOpiniondResource1"></asp:Label>
    <asp:Label ID="lblNoForOpinion" runat="server" Text="未回覆" Visible="False" meta:resourcekey="lblNoForOpinionResource1"></asp:Label>
    <asp:Label ID="lblApplicant" runat="server" Text="申請" Visible="False" meta:resourcekey="lblApplicantResource1"></asp:Label>
    <asp:Label ID="lblUnread" runat="server" Text="未讀取" Visible="False" meta:resourcekey="lblUnreadResource1"></asp:Label>
    <asp:Label ID="lblRead" runat="server" Text="讀取" Visible="False" meta:resourcekey="lblReadResource1"></asp:Label>
    <asp:Label ID="lblPass" runat="server" Text="通過" Visible="False" meta:resourcekey="lblPassResource1"></asp:Label>
    <asp:Label ID="lblReject" runat="server" Text="否決" Visible="False" meta:resourcekey="lblRejectResource1"></asp:Label>
    <asp:Label ID="lblInvalid" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblInvalidResource1"></asp:Label>
    <asp:Label ID="lblException" runat="server" Text="異常" Visible="False" meta:resourcekey="lblExceptionResource2"></asp:Label>
    <asp:Label ID="lblMyFormList" runat="server" Text="個人表單" Visible="False" meta:resourcekey="lblMyFormListResource1"></asp:Label>
    <asp:Label ID="Label9" runat="server" Text="表單申請" Visible="False" meta:resourcekey="Label9Resource1"></asp:Label>
    <asp:Label ID="lblGetbackList" runat="server" Text="表單取回" Visible="False" meta:resourcekey="lblGetbackListResource1"></asp:Label>
    <asp:Label ID="lblSetAgent" runat="server" Text="設定代理人" Visible="False" meta:resourcekey="lblSetAgentResource1"></asp:Label>&nbsp;
    <asp:Label ID="lblCheckForm" runat="server" Text="確定要取回表單?" Visible="False" meta:resourcekey="lblCheckFormResource1"></asp:Label>
    <asp:Label ID="lblCannotget" runat="server" Text="下一站人員已經觀看過表單，故無法取回" Visible="False" meta:resourcekey="lblCannotgetResource1"></asp:Label>
    <asp:Label ID="lblCustFlowDeleteMSG" runat="server" Text="下一站人員已經觀看過表單，故無法取回" Visible="False" meta:resourcekey="lblCustFlowDeleteMSGResource1"></asp:Label>
    <asp:Label ID="lblCopeed" runat="server" Text="處理中" Visible="False" meta:resourcekey="lblCopeedResource1"></asp:Label>
    <asp:Label ID="lblEnd" runat="server" Text="已結案" Visible="False" meta:resourcekey="lblEndResource1"></asp:Label>
    <asp:Label ID="lblAgentApplicantMsg" runat="server" Text="(代填)" Visible="False" meta:resourcekey="lblAgentApplicantMsgResource1"></asp:Label>
    <telerik:RadDatePicker ID="WebDateChooser1" runat="server" Style="display: none"></telerik:RadDatePicker>
    <asp:Label ID="lbl_allForm" runat="server" Text="所有表單" Visible="False" meta:resourcekey="lbl_allFormResource1"></asp:Label>
    <asp:Label ID="lblQueryType" runat="server" Text="Form" Visible="False" meta:resourcekey="lblQueryTypeResource1"></asp:Label>
    <asp:Label ID="lblSelect" runat="server" Text="請選擇表單" Visible="False" meta:resourcekey="lblSelectResource1"></asp:Label>
    <asp:Label ID="lblList" runat="server" Text="分類列表" meta:resourcekey="Label1Resource1" Visible="false"></asp:Label>
    <asp:Label ID="lblTxtModify" runat="server" Text="修改" meta:resourcekey="lblTxtModifyResource1" Visible="false"></asp:Label>
    <asp:Label ID="lblhandoverAlert" runat="server" Text="交接表單" meta:resourcekey="lblhandoverAlertResource1" Visible="false"></asp:Label>
    <asp:Label ID="lblCommonAlert" runat="server" Text="一般知會" meta:resourcekey="lblCommonAlertResource1" Visible="false"></asp:Label>
    <asp:Label ID="lblFormGetBackForBackgoundProcessing" runat="server" Text="此表單正在進行背景簽核，無法取回" Visible="False" meta:resourcekey="lblFormGetBackForBackgoundProcessingResource1"></asp:Label>

</asp:Content>


