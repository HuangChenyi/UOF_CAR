<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="WKF_FormUse_PersonalBox_CustFlow" Title=""
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CustFlow.aspx.cs" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="System.Web.UI.HtmlControls" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="System.Web.UI" TagPrefix="cc2" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="UC_CustFlowList.ascx" TagName="UC_CustFlowList" TagPrefix="uc1" %>
<%@ Register Src="../../Browse/UC_SubFlowLayOut/UC_SubFlow.ascx" TagName="UC_SubFlow"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">

        function OnBarMainClick(sender, args) {
            //新增開窗
            if (args.get_item().get_value() == "key_Insert") {
                args.set_cancel(true);                
                $uof.dialog.open2("~/WKF/Custom/AddCustSite.aspx", args.get_item(), "", 1024, 768, openDialogResult);
            }
            //刪除
            if (args.get_item().get_value() == "key_Delete") {
                if (confirm('<%=lblDelete.Text%>') == false) {
                    args.set_cancel(true);
                }
            }
            //修改
            if (args.get_item().get_value() == "key_Set") {
                //flowId
                if (GetSelectedFlowTag() != null) {
                    args.set_cancel(true);
                    $uof.dialog.open2("~/WKF/Custom/AddCustSite.aspx", args.get_item(), "", 1024, 768, openDialogResult, { "flowId": GetSelectedFlowTag() });
                }
            }

        }


        function OpenSetDialog(flowID) {
            $uof.dialog.open2("~/WKF/Custom/AddCustSite.aspx", "", "", 1024, 768, function (returnValue) {$('#<%=hiSiteID.ClientID%>').val(returnValue);$('#<%=btnPost.ClientID%>').click(); return true; }, { "flowId": flowID });
            return false;
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }
    </script>
    <head>
        <style>
            .SubFlowTD
            {
                vertical-align: top;
                background-attachment: fixed;
                background-image: url("../../App_Themes/DefaultTheme/images/wkf/line1.gif");
                background-repeat: repeat-y;
            }
            .EmptyTable
            {
                padding: 0px;
                border: 0px;
                margin: 0px;
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
                font-size: 12px;
                width: 120;
            }
            table_
            {
                text-align: center;
                border: 0px;
            }
        </style>
    </head>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="4" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick" Width="100%">
        <Tabs>
            <telerik:RadTab runat="server" Value="MyFormList">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Value="ApplyFormList">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Value="GetbackFormList">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Value="SetAgent">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Selected="True" Value="custFlow">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server"  UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="webToolBar" runat="server" OnClientButtonClicking="OnBarMainClick"
                OnButtonClick="webToolBar_ButtonClick" Width="100%" meta:resourcekey="UltraWebToolbar1Resource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m163.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m163.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m163.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m163.gif" Text="新增" Value="key_Insert" meta:resourcekey="TBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="skey_Insert" />
                    <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m88.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m88.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m88.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m88.gif" Text="設定" Value="key_Set" meta:resourcekey="TBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="skey_Set" />
                    <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m87.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m87.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m87.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m87.gif" Text="複製" Value="key_Copy" meta:resourcekey="TBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="skey_Copy" />
                    <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m03.gif" Text="刪除" Value="key_Delete" meta:resourcekey="TBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="skey_Delete" />
                    <telerik:RadToolBarButton runat="server" Value="keyword">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text="關鍵字" meta:resourcekey="Label2Resource1"></asp:Label>
                            <asp:TextBox ID="txtKeyword" runat="server"></asp:TextBox>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="查詢" Value="key_Query" meta:resourcekey="keyQueryResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="skey_Query" />
                </Items>
            </telerik:RadToolBar>

        </ContentTemplate>
<%--        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="UC_CustFlowList1" EventName="OnNodedClicked"></asp:AsyncPostBackTrigger>
        </Triggers>--%>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="upnl_Tree" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <uc1:UC_CustFlowList ID="UC_CustFlowList1" runat="server" />
        </ContentTemplate>
<%--        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="webToolBar" EventName="ButtonClick" />
        </Triggers>--%>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="4">
        <telerik:RadPageView ID="RadPageView1" runat="server">RadPageView</telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server">RadPageView</telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView3" runat="server">RadPageView</telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView4" runat="server">RadPageView</telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView5" Selected="True" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" class="tbbg01" width="100%">
                <tbody>
                    <tr>
                        <td style="text-align: center; vertical-align: top; height: 100%;">
                            <asp:UpdatePanel ID="upnl_Content" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <table style="height: 100%" cellspacing="0" cellpadding="0" width="100%" style="border-width: 1px; padding: 1px; line-height: 1.2em; border-style: outset; border-color: #FFFFFF; border-collapse: collapse;">
                                        <tr>
                                            <td class="PopTableHeader" style="border-width: 1px; padding: 1px; border-style: outset; border-color: #FFFFFF; border-collapse: collapse;">
                                                <center>
                                                            <asp:Label ID="lblSiteInfo" runat="server" Text="站點資訊" meta:resourcekey="lblSiteInfoResource1"></asp:Label>
                                                        </center>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="background-color: White; text-align: center;">
                                                <asp:Label ID="lbl_NotModifyMSG" runat="server"  ForeColor="Red" CssClass="SizeS"
                                                    Text="此自訂流程正被使用中，不允許設定與刪除！" Visible="False" meta:resourcekey="lbl_NotModifyMSGResource1"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="padding: 2px;">
                                                <uc2:UC_SubFlow ID="UC_SubFlow1" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
<%--                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="UC_CustFlowList1" EventName="OnNodedClicked"></asp:AsyncPostBackTrigger>
                                </Triggers>--%>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </tbody>
            </table>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <asp:Label ID="lblDelete" runat="server" Text="確定刪除嗎?" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:Label ID="lblCustFlow" runat="server" Text="定義自訂流程" Visible="False" meta:resourcekey="lblCustFlowResource1"></asp:Label>
    <asp:Label ID="lblMyFormList" runat="server" Text="個人表單" Visible="False" meta:resourcekey="lblMyFormListResource1"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="表單申請" Visible="False" meta:resourcekey="Label1Resource2"></asp:Label>
    <asp:Label ID="lblGetbackList" runat="server" Text="表單取回" Visible="False" meta:resourcekey="lblGetbackListResource1"></asp:Label>
    <asp:Label ID="lblSetAgent" runat="server" Text="設定代理人" Visible="False" meta:resourcekey="lblSetAgentResource1"></asp:Label>
    <asp:Button ID="btnPost" runat="server" Text="" Style="display: none" OnClick="btnPost_Click" />
    <asp:Label ID="lblClassList" runat="server" meta:resourcekey="lblClassListResource1" Text="流程列表" Visible="false"></asp:Label>
    <asp:HiddenField ID="hiSiteID" runat="server" />
</asp:Content>
