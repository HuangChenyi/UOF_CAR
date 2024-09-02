<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_DesignFormFolw" Title="設定表單流程" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DesignFormFolw.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../FlowManagement/Layout/UC_SetMastFlow.ascx" TagName="UC_SetMastFlow" TagPrefix="uc3" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="~/WKF/FlowManagement/UC_MasterFlow.ascx" TagName="UC_MasterFlow" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <head>
        <style>
            .SubFlowTD
            {
                vertical-align: top;
                background-attachment: fixed;
                background-image: url("<%=themePath %>/images/wkf/line1.gif");
                background-repeat: repeat-y;
            }
            .EmptyTable
            {
                padding: 0;
                border: 0;
                margin: 0;
                text-align: center;
            }
            .SignerTD
            {
                color: blue;
                text-align: left;
            }
            .SiteLeftTD
            {
                background-image: url("<%=themePath %>/images/wkf/site_left.gif");
                background-repeat: repeat-y;
            }
            .SiteMiddleTD
            {
                background-image: url("<%=themePath %>/images/wkf/app_con.gif");
                background-repeat: repeat-y;
            }
            .SiteRightTD
            {
                width: 8px;
                background-image: url("<%=themePath %>/images/wkf/site_right.gif");
                background-repeat: repeat-y;
            }
            .CondTextTD
            {
                text-align: center;
                font-weight: bold;
            }
            .CondLeftTD
            {
                background-image: url("<%=themePath %>/images/wkf/site_left_big.gif");
                background-repeat: repeat-y;
            }
            .CondMiddleTD
            {
                background-image: url("<%=themePath %>/images/wkf/cond_con.gif");
                background-repeat: repeat-y;
                text-align: center;
            }
            .CondRightTD
            {
                background-image: url("<%=themePath %>/images/wkf/site_rig_big.gif");
                background-repeat: repeat-y;
            }
            td_
            {
                text-align: center;
                vertical-align: top;
                
                width: 120px;
            }
            table_
            {
                text-align: center;
                border: 0;
            }
        </style>
    </head>
    <script id="redirectjs" type="text/javascript">

    //導頁
    function RedirectPage(url)
    {
        window.location = url;       
        return false;
    }   
    </script>

    <script type="text/javascript" id="telerikClientEvents1">

        Sys.Application.add_load(function () {
            var hfFlowId = '<%=hfFlowId.Value%>';
            if (hfFlowId === "") {
                SetToolbarEnable(false);
            }
            else {
                SetToolbarEnable(true);
            }
        });

        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            if (value == "AddMasterFlow") {  //新增主流程
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FlowManagement/SetupMasterFlow.aspx", args.get_item(), "", 800, 760, openDialogResult, { "formVersionId": "<%=formVersionId%>" });
            }
            else if (value == "ModifyMasterFlow") {  //維護主流程
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FlowManagement/SetupMasterFlow.aspx", args.get_item(), "", 0, 0, openDialogResult, { "formVersionId": "<%=formVersionId%>", "masterFlowId": "<%=flowId%>" });
            }
            else if (value == "DeleteMasterFlow") {
                if (confirm('<%=lblConfirmDelete.Text %>') == false) {
                    args.set_cancel(true);
                }
            }
            else if (value == "DownloadDiagram") {
                window.open("../../WKF/Browse/Service/FormFlowPrintHandler.ashx?formVersionId=<%=formVersionId%>&user=<%=CurrentUser%>&cul=<%=CurrentCulture%>");
                args.set_cancel(true);
            }
            else if (value == "FlowVerify") {  //流程驗證
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/VerifyFlow.aspx", args.get_item(), "", 0, 0, openDialogResult, { "formVersionId": "<%=formVersionId%>", "masterFlowId": "<%=flowId%>", "isCutPicture": "N" });
            }
            else if (value == "FlowVerifyDownload") {  //下載流程驗證報表
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/VerifyFlowExcelDownload.aspx", args.get_item(), "", 900, 680, openDialogResult, { "formVersionId": "<%=formVersionId%>", "currentUser": "<%=CurrentUser%>", "flowId": "<%=flowId%>" });
            }
        }
        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }

        function SetToolbarEnable(enable) {
            var toolbar = $find("<%=RadToolBar1.ClientID%>");
            toolbar.findItemByValue("AddMasterFlow").set_enabled(!enable);
            toolbar.findItemByValue("ModifyMasterFlow").set_enabled(enable);
            toolbar.findItemByValue("DeleteMasterFlow").set_enabled(enable);
        }

    </script>
    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <telerik:RadButton ID="ibtnDesignField" runat="server" Text="1.設計欄位>>" CausesValidation="False"
                                meta:resourcekey="ibtnDesignFieldResource1" AutoPostBack="false"></telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupCondition" runat="server"  Text="2.設定條件>>" CausesValidation="False"
                                 meta:resourcekey="ibtnSetupConditionResource1" AutoPostBack="false"></telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupNotify" runat="server" Text="3.設定起結案通知>>" CausesValidation="False"
                                meta:resourcekey="ibtnSetupNotifyResource1" AutoPostBack="false"></telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnDesignFlow" runat="server" Text="4.設定流程>>" CausesValidation="False"
                                meta:resourcekey="ibtnDesignFlowResource1"></telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupRelease" runat="server" Text="5.設定發佈資訊>>" CausesValidation="False"
                                meta:resourcekey="ibtnSetupReleaseResource1" AutoPostBack="false"></telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupMail" runat="server" Text="6.設定郵件樣板>>" CausesValidation="False"
                                meta:resourcekey="ibtnSetupMailResource1" AutoPostBack="false"></telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupDes" runat="server" Text="7.設定使用說明" AutoPostBack="false" CausesValidation="False" meta:resourcekey="ibtnSetupDesResource1">
                            </telerik:RadButton>
                        </td>      
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td>
                <telerik:RadToolBar ID="RadToolBar1" runat="server" meta:resourcekey="UltraWebToolbar1Resource1" OnClientButtonClicking="RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" Width="100%">
                    <Items>
                        <telerik:RadToolBarButton runat="server" 
                            ImageUrl="~/Common/Images/Icon/icon_m108.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m108_g.gif"
                            Value="AddMasterFlow" HoveredImageUrl="~/Common/Images/Icon/icon_m108.gif"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m108.gif" Text="新增流程"
                            meta:resourceKey="TBarButtonResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" 
                            ImageUrl="~/Common/Images/Icon/icon_m109.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m109_g.gif"
                            Value="ModifyMasterFlow" HoveredImageUrl="~/Common/Images/Icon/icon_m109.gif"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m109.gif" Text="維護流程"
                            meta:resourceKey="TBarButtonResource2">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" 
                            ImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03_g.gif"
                            Value="DeleteMasterFlow" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" Text="刪除流程"
                            meta:resourceKey="TBarButtonResource3">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="DownloadDiagram" Text="下載流程圖" ImageUrl="~/Common/Images/Icon/icon_el01.png" meta:resourcekey="TBarButtonResource4">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="true"></telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="FlowVerify" Text="流程驗證" ImageUrl="~/Common/Images/Icon/icon_m182.png" meta:resourcekey="TBarButtonResource5">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="spVerify1"></telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="FlowVerifyDownload" Text="下載流程驗證報表" ImageUrl="~/Common/Images/Icon/icon_m215.png" meta:resourcekey="TBarButtonResource6">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="spVerify2"></telerik:RadToolBarButton>
                    </Items>

                </telerik:RadToolBar>
                <table class="PopTable" cellspacing="1" align="left" width="100%">
                    <tr>
                        <td class="PopTableLeftTD" width="20%" style="display:none">
                            <asp:Label ID="lblTitleFlowName" runat="server" Text="流程名稱" meta:resourcekey="lblTitleFlowNameResource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" width="30%" style="display:none">
                            <asp:Label ID="lblFlowName" runat="server" meta:resourcekey="lblFlowNameResource1"></asp:Label>
                        </td>
                        <td class="PopTableLeftTD" width="35%">
                            <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="是否啟用流程設定"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" width="65%">
                            <asp:RadioButtonList ID="rblEnableFlow" runat="server" meta:resourcekey="rblEnableFlowResource1"
                                RepeatDirection="Horizontal" AutoPostBack="True" Enabled="False" OnSelectedIndexChanged="rblEnableFlow_SelectedIndexChanged">
                                <asp:ListItem Value="1" meta:resourcekey="ListItemResource1">是</asp:ListItem>
                                <asp:ListItem Value="0" Selected="True" meta:resourcekey="ListItemResource2">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" style="height: 71px;">
                <asp:Panel ID="Panel1"  ScrollBars="None"  runat="server" Width="100%" meta:resourcekey="Panel1Resource1"
                    >
                    <table width="100%">
                        <tr>
                            <td align="center" valign="top">
                                <table width="70%">
                                    <tr>
                                        <td align="left" nowrap="nowrap">
                                            <asp:ImageButton ID="imgSiteType" runat="server" ImageUrl="site_normal.gif" ToolTip="觀看站點" Enabled="false"
                                                meta:resourceKey="imgSiteTypeResource1" />
                                            <asp:Label ID="Label2" runat="server" Text="觀看站點資訊" meta:resourceKey="Label2Resource1"></asp:Label>
                                        </td>
                                        <td align="left" nowrap="nowrap">
                                            <asp:ImageButton ID="imgWSSetting" runat="server" ImageUrl="site_SetWS.gif" ToolTip="Web Service 設定" Enabled="false"
                                                meta:resourceKey="imgWSSettingResource1" />
                                            <asp:Label ID="Label3" runat="server" Text="WebService設定" meta:resourceKey="Label3Resource1"></asp:Label>
                                        </td>
                                        <td align="left" nowrap="nowrap">
                                            <asp:ImageButton ID="imgsiteNote" runat="server" ImageUrl="site_noteSet.gif" ToolTip="站點備註" Enabled="false"
                                                meta:resourceKey="imgsiteNoteResource1" />
                                            <asp:Label ID="Label4" runat="server" Text="站點備註(有備註內容)" meta:resourceKey="Label4Resource1"></asp:Label>
                                        </td>
                                        <td align="left" nowrap="nowrap">
                                            <asp:ImageButton ID="imgsiteNote1" runat="server" ImageUrl="site_noteSet1.gif" ToolTip="站點備註" Enabled="false"
                                                meta:resourceKey="imgsiteNote1Resource1" />
                                            <asp:Label ID="Label5" runat="server" Text="站點備註(無備註內容)" meta:resourceKey="Label5Resource1"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" nowrap="nowrap">
                                            <asp:ImageButton ID="imgsiteMail" runat="server" ImageUrl="site_Mail.gif" ToolTip="站點郵件" Enabled="false"
                                                meta:resourceKey="imgsiteMailResource1" />
                                            <asp:Label ID="Label6" runat="server" Text="站點郵件資訊" meta:resourceKey="Label6Resource1"></asp:Label>
                                        </td>
                                        <td align="left" nowrap="nowrap">
                                            <asp:ImageButton ID="imgAllow" runat="server" ImageUrl="site_SetWS.gif" ToolTip="可結案" Enabled="false"
                                                meta:resourceKey="imgAllowResource1" />
                                            <asp:Label ID="Label7" runat="server" Text="可結案站點" meta:resourceKey="Label7Resource1"></asp:Label>
                                        </td>
                                        <td align="left" nowrap="nowrap">
                                            <asp:ImageButton ID="imgNo" runat="server" ImageUrl="site_SetWS.gif" ToolTip="不可結案" Enabled="false"
                                                meta:resourceKey="imgNoResource1" />
                                            <asp:Label ID="Label8" runat="server" Text="不可結案站點" meta:resourceKey="Label8Resource1"></asp:Label>
                                        </td>
                                        <td align="left" nowrap="nowrap">
                                            <asp:ImageButton ID="imgCondition" runat="server" ImageUrl="site_SetWS.gif" ToolTip="依條件結案" Enabled="false"
                                                meta:resourceKey="imgConditionResource1" />
                                            <asp:Label ID="Label9" runat="server" Text="依條件結案站點" meta:resourceKey="Label9Resource1"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" nowrap="nowrap"> 
                                            <asp:ImageButton ID="imgSignSetting" runat="server" ToolTip="加退簽及否決設定" Enabled="false"
                                                meta:resourceKey="imgSignSettingResource1" />
                                            <asp:Label ID="Label10" runat="server" Text="加退簽及否決設定" meta:resourceKey="Label10Resource1"></asp:Label>
                                        </td>
                                        <td align="left" nowrap="nowrap"> 
                                            <asp:ImageButton ID="imgNoneCustomWords" runat="server" ToolTip="無自定義簽核文字" ImageUrl="~/Common/Images/Icon/icon_m205.png" Enabled="false"
                                                meta:resourceKey="imgNoneCustomWordsResource1" />
                                            <asp:Label ID="Label11" runat="server" Text="無自定義簽核文字" meta:resourceKey="Label11Resource1"></asp:Label>
                                        </td>
                                        <td align="left" nowrap="nowrap"> 
                                            <asp:ImageButton ID="imgHasCustomWords" runat="server" ToolTip="有自定義簽核文字"  ImageUrl="~/Common/Images/Icon/icon_m206.png" Enabled="false"
                                                meta:resourceKey="imgHasCustomWordsResource1" />
                                            <asp:Label ID="Label12" runat="server" Text="有自定義簽核文字" meta:resourceKey="Label12Resource1"></asp:Label>
                                        </td>
                                        <td align="left" nowrap="nowrap"> 
                                            <asp:ImageButton ID="imgRequiredField" runat="server" ToolTip="填寫修改權限設定"  ImageUrl="../../Common/Images/Icon/icon_m208.png" Enabled="false"
                                                meta:resourceKey="imgRequiredFieldResource1" />
                                            <asp:Label ID="lblRequiredField" runat="server" Text="填寫修改權限設定" meta:resourceKey="lblRequiredFieldResource1"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <uc3:UC_SetMastFlow ID="UC_SetMastFlow1" runat="server"></uc3:UC_SetMastFlow>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblFieldDesign" runat="server" meta:resourcekey="lblFieldDesignResource1"
        Text="1.設計欄位>>" Visible="False"></asp:Label>
    <asp:Label ID="lblFormCondition" runat="server" meta:resourcekey="lblFormConditionResource1"
        Text="2.設定條件>>" Visible="False"></asp:Label>
    <asp:Label ID="lblFormFlow" runat="server" meta:resourcekey="lblFormFlowResource1"
        Text="4.設定流程>>" Visible="False"></asp:Label>
    <asp:Label ID="lblFormPublish" runat="server" meta:resourcekey="lblFormPublishResource1"
        Text="5.設定發佈資訊>>" Visible="False"></asp:Label>

    <asp:HiddenField ID="hfFlowId" Value="" runat="server" />

</asp:Content>
