<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="PMS_Maintain_Default" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Src="../Common/UC_MyAudit.ascx" TagName="UC_MyAudit" TagPrefix="uc8" %>
<%@ Register Src="../Common/UC_WaitAudit.ascx" TagName="UC_WaitAudit" TagPrefix="uc7" %>
<%@ Register Src="../Common/UC_SearchProject.ascx" TagName="UC_SearchProject" TagPrefix="uc6" %>
<%@ Register Src="../Common/UC_ProjectMaintainToolbar.ascx" TagName="UC_ProjectMaintainToolbar" TagPrefix="uc5" %>
<%@ Register Src="../Common/UC_ProjectStatusDDL.ascx" TagName="UC_ProjectStatusDDL" TagPrefix="uc4" %>
<%@ Register Src="../Common/UC_GridTask.ascx" TagName="UC_GridTask" TagPrefix="uc3" %>
<%@ Register Src="../Common/UC_ProjectContent.ascx" TagName="UC_ProjectContent" TagPrefix="uc2" %>
<%@ Register Src="../Common/UC_ProjectTree.ascx" TagName="UC_ProjectTree" TagPrefix="uc1" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../Common/UC_ProjectWorkItem.ascx" TagName="UC_ProjectWorkItem" TagPrefix="uc9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">

    <script type="text/javascript">
<!--

    function utbarOverView_ButtonClicking(sender, args) {
        var value = args.get_item().get_value();
        if (value == "btnUrge") {
            var checkedRowKeys = $uof.fastGrid.getChecked('<%=gridLate.GridClientID %>');

            var hidCheckedRowKeys = $('#<%= hidCheckedRowKeys.ClientID %>');

            if (hidCheckedRowKeys != null) {
                hidCheckedRowKeys.val(checkedRowKeys);
            }

            if (checkedRowKeys == "") {
                alert('<%=lblListTaskGUIDEmptyMsg.Text %>');
            }
            else {
                $uof.dialog.open2("~/PMS/Maintain/Urge.aspx", args.get_item(), "", 500, 400, openDialogResult,
                    { "HideCheckedClientID": "<%=hidCheckedRowKeys.ClientID%>", "HideFromParent": "True" });
            }
            args.set_cancel(true);
        }
    }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }

    function GetLateGridSelectedKeys() {
        var hidCheckedRowKeys = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hidCheckedRowKeys.Value,true)%>');
        return hidCheckedRowKeys.val();
    }

    function rtsTab_TabSelecting(sender, args) {
        var tabValue = args.get_tab().get_index();
        var tab = $find('<%=rtsTab.ClientID%>');
        var toolbar = $find('<%=rmpToolBar.ClientID%>');
        var tree = $find('<%=rmpTree.ClientID%>');
        var view = $find('<%=rmpTab.ClientID%>');
        tab.get_tabs().getTab(tabValue).select;
        toolbar.set_selectedIndex(tabValue);
        tree.set_selectedIndex(tabValue);
        view.set_selectedIndex(tabValue);
    }


    // -->
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadTabStrip ID="rtsTab" runat="server" MultiPageID="rmpToolBar" OnTabClick="rtsTab_TabClick" SelectedIndex="0" meta:resourcekey="rtsTabResource1">
                <Tabs>
                    <telerik:RadTab runat="server" Text="總覽" PageViewID="rpvMaintainToolbar" Selected="True" meta:resourcekey="RadTabResource1">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="專案維護" PageViewID="rpvMaintain" meta:resourcekey="RadTabResource2">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage ID="rmpToolBar" runat="server" meta:resourcekey="rmpToolBarResource1">
                <telerik:RadPageView runat="server" ID="RadPageView1" meta:resourcekey="RadPageView1Resource1">
                </telerik:RadPageView>
                <telerik:RadPageView runat="server" ID="rpvMaintainToolbar" meta:resourcekey="rpvMaintainToolbarResource1">
                    <uc5:UC_ProjectMaintainToolbar ID="UC_ProjectMaintainToolbar1" runat="server"></uc5:UC_ProjectMaintainToolbar>
                    <asp:Label ID="lblNoProjMsg" runat="server" Text="尚未建立專案" ForeColor="Blue" meta:resourcekey="lblNoProjMsgResource1"></asp:Label>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel6" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <telerik:RadMultiPage ID="rmpTree" runat="server" SelectedIndex="0" meta:resourcekey="rmpTreeResource1">
                <telerik:RadPageView runat="server" ID="rpvOverViewTree" meta:resourcekey="rpvOverViewTreeResource1" Selected="True">
                    <telerik:RadTreeView ID="treeViewOverView" runat="server" OnNodeClick="treeViewOverView_NodeClick" meta:resourcekey="treeViewOverViewResource1" EnableNodeTextHtmlEncoding="True">
                    </telerik:RadTreeView>
                </telerik:RadPageView>
                <telerik:RadPageView runat="server" ID="rpvMaintainTree" meta:resourcekey="rpvMaintainTreeResource1">
                    <uc1:UC_ProjectTree ID="ucProjectTree" runat="server" />
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
        <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
            <ContentTemplate>
                <telerik:RadMultiPage ID="rmpTab" runat="server" SelectedIndex="0" meta:resourcekey="rmpTabResource1">
                    <telerik:RadPageView runat="server" ID="rpvOverView" meta:resourcekey="rpvOverViewResource1" Selected="True">
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:ValidationSummary ID="validSummaryOverview" runat="server" DisplayMode="SingleParagraph" ValidationGroup="Overview" BackColor="Red" ForeColor="White" meta:resourcekey="validSummaryOverviewResource1" />
                                <table width="100%" height="100%" cellspacing="0" cellpadding="0" class="tbbg01">
                                    <tr>
                                        <td valign="top">
                                            <asp:Panel ID="panUnCloseProj" runat="server" meta:resourcekey="panUnCloseProjResource1">
                                                <uc6:UC_SearchProject ID="UC_SearchProject1" runat="server" />
                                            </asp:Panel>
                                            <asp:Panel ID="panLate" runat="server" meta:resourcekey="panLateResource1">
                                                <telerik:RadToolBar ID="utbarOverView" runat="server" Width="100%" OnClientButtonClicking="utbarOverView_ButtonClicking" meta:resourcekey="utbarOverViewResource2">
                                                    <Items>
                                                        <telerik:RadToolBarButton runat="server" Text="稽催" Value="btnUrge"
                                                            ClickedImageUrl="~/Common/Images/Icon/icon_m162.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m162.gif"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m162.gif" ImageUrl="~/Common/Images/Icon/icon_m162.gif" meta:resourcekey="RadToolBarButtonResource1">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                                                        </telerik:RadToolBarButton>
                                                    </Items>
                                                </telerik:RadToolBar>
                                                <uc3:UC_GridTask ID="gridLate" runat="server" GenerateCheckBox="true" GenerateProjectColumn="true" />
                                            </asp:Panel>
                                            <asp:Panel ID="panFuture" runat="server" meta:resourcekey="panFutureResource1">
                                                <asp:Label ID="lblFuture" runat="server" Text="未來七天內預計開始的任務" ForeColor="Blue" meta:resourcekey="lblFutureResource1"></asp:Label><br />
                                                <uc3:UC_GridTask ID="gridFuture" runat="server" GenerateCheckBox="false" GenerateProjectColumn="true" />
                                            </asp:Panel>
                                            <asp:Panel ID="panWaitAudit" runat="server" meta:resourcekey="panWaitAuditResource1">
                                                <uc7:UC_WaitAudit ID="UC_WaitAudit1" runat="server" />
                                            </asp:Panel>
                                            <asp:Panel ID="panMyAudit" runat="server" meta:resourcekey="panMyAuditResource1">
                                                <uc8:UC_MyAudit ID="UC_MyAudit1" runat="server"></uc8:UC_MyAudit>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" ID="rpvMaintain" meta:resourcekey="rpvMaintainResource1">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table width="100%" cellpadding="0" cellspacing="0" class="tbbg01">
                                    <tr>
                                        <td valign="top" style="height: 100%">
                                            <asp:ValidationSummary ID="validSummaryMaintain" runat="server" DisplayMode="SingleParagraph" BackColor="Red" ForeColor="White"
                                                ValidationGroup="Maintain" meta:resourcekey="validSummaryMaintainResource1" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td style="vertical-align: top" width="80%">
                                                        <asp:Label ID="lblTest" runat="server" meta:resourcekey="lblTestResource1"></asp:Label>
                                                        <asp:HiddenField ID="hidProjGUID" runat="server" />
                                                        <uc2:UC_ProjectContent ID="ucProjectContent" runat="server"></uc2:UC_ProjectContent>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>  
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:CustomValidator ID="cvOverview" runat="server" BackColor="Red" ForeColor="White" Visible="False" Width="80px" Display="None" ValidationGroup="Overview" meta:resourcekey="cvOverviewResource1"></asp:CustomValidator>
        <asp:CustomValidator ID="cvMaintain" runat="server" BackColor="Red" ForeColor="White" Visible="False" Width="80px" ValidationGroup="Maintain" meta:resourcekey="cvMaintainResource1"></asp:CustomValidator>
        <asp:Label ID="lblListTaskGUIDEmptyMsg" runat="server" Text="請選擇要進行稽催的任務。" Visible="False" meta:resourcekey="lblListTaskGUIDEmptyMsgResource1"></asp:Label>
        <asp:Label ID="lblUnCloseProj" runat="server" Text="尚未結案" Visible="False" meta:resourcekey="lblUnCloseProjResource1"></asp:Label>
        <asp:Label ID="lblFutureTask" runat="server" Text="未來任務" Visible="False" meta:resourcekey="lblFutureTaskResource1"></asp:Label>
        <asp:Label ID="lblTimeOutTask" runat="server" Text="逾時任務" Visible="False" meta:resourcekey="lblTimeOutTaskResource1"></asp:Label>
        <asp:Label ID="lblWaitAudit" runat="server" Text="待審核" Visible="False" meta:resourcekey="lblWaitAuditResource1"></asp:Label>
        <asp:Label ID="lblMyAuditing" runat="server" Text="審核中的" Visible="False" meta:resourcekey="lblMyAuditingResource1"></asp:Label>
        <asp:Label ID="lblWaitReform" runat="server" Text="待改善" Visible="False" meta:resourcekey="lblWaitReformResource1"></asp:Label>
        <asp:Label ID="lblTitle1" Text="分類列表" meta:resourcekey="Label1Resource1" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lblTitle2" Text="專案列表" runat="server" meta:resourcekey="lblTitleResource1" Visible="false"></asp:Label>
        <asp:Label ID="lblOverView" runat="server" Text="總覽" Visible="False" meta:resourcekey="lblOverViewResource1"></asp:Label>
        <asp:Label ID="lblMaintain" runat="server" Text="專案維護" Visible="False" meta:resourcekey="lblMaintainResource1"></asp:Label>
        <asp:Label ID="lblMyProject" runat="server" Text="我的專案" Visible="False" meta:resourcekey="lblMyProjectResource1"></asp:Label>
        <asp:Label ID="lblAudit" runat="server" Text="審核" Visible="False" meta:resourcekey="lblAuditResource1"></asp:Label>
        <asp:HiddenField ID="hidCheckedRowKeys" runat="server" />
</asp:Content>
