<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="WKF_FormUse_PersonalBox_SetAgent" Title="設定代理人" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="SetAgent.aspx.cs" %>

<%@ Register Src="../UC_FormList.ascx" TagName="UC_FormList" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
        <style>
        .rbPrimary{
            padding-left:0px !important;
        }
    </style>
    <script id="SetAgentjs" type="text/javascript">

        function treeForm_NodeClick(treeId, nodeId, button) {

        }

        function OnBarMainClick(sender, args) {
            if (args.get_item().get_value() == "AddAgentTime") {
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/Agent/AddAgentTime.aspx", args.get_item(), "", 1050, 400, openDialogResult);
            }
            else if (args.get_item().get_value() == "AddFormAgent") {
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/Agent/AddAgentForm.aspx", args.get_item(), "", 600, 400, openDialogResult, { "formId": GetSelectedTag(), "formName": GetSelectedText() });
            }
            else if (args.get_item().get_value() == "AddRoleAgent") {
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/Agent/AddRoleAgent.aspx", args.get_item(), '<%=lblAddRoleAgent.Text%>', 700, 300, openDialogResult, { "userGuid": '<%=hfUserGuid.Value%>' });
            }
            else if (args.get_item().get_value() == "Delete") {
                if (confirm('<%=lblDelete.Text %>') == false)
                    args.set_cancel(true);
            }
<%--        else if (args.get_item().get_value() == "DeleteAgentTime") {
            if (confirm('<%=lblDelete.Text %>') == false)
                args.set_cancel(true);
        }
        else if (args.get_item().get_value() == "DeleteFormAgent") {
            if (confirm('<%=lblDelete.Text %>') == false)
                args.set_cancel(true);
        }--%>
        }

        function openAgentExample() {
            $uof.dialog.open2("~/WKF/Agent/AgentExample.aspx", "", '<%=lblAgentExample.Text%>', 1800, 900, function () { return false; });
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }

        function GetSelectedTag() {
            var tree = $find('<%=UC_FormList1.formListClientId %>');
            var obj = tree.get_selectedNode();
            var str = obj.get_value().split("@");
            return str[0];
        }

        function GetSelectedText() {
            var tree = $find('<%=UC_FormList1.formListClientId %>');
            var obj = tree.get_selectedNode();
            return obj.get_text();
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="3" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick" Width="100%">
        <Tabs>
            <telerik:RadTab runat="server" Value="MyFormList">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Value="ApplyFormList">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Value="GetbackFormList">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Selected="True" Value="SetAgent">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Value="custFlow">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
            <telerik:RadToolBar ID="webToolBar" runat="server" OnClientButtonClicking="OnBarMainClick"
                OnButtonClick="webToolBar_ButtonClick" Width="100%" meta:resourcekey="UltraWebToolbar1Resource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m104.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m104.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m104.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m104.gif" Text="啟動代理時間" Value="AddAgentTime" meta:resourceKey="TBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sAddAgentTime" />
                    <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m105.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m105.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m105.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m105.gif" Text="新增角色代理人" Value="AddRoleAgent" meta:resourceKey="AddRoleAgentResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sAddRoleAgent" />
                    <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m105.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m105.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m105.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m105.gif" Text="新增表單代理人" Value="AddFormAgent" meta:resourceKey="TBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sAddFormAgent" />
                    <%--<telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m03.gif" Text="刪除代理時間" Value="DeleteAgentTime" meta:resourceKey="TBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sDeleteAgentTime" />
                    <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m03.gif" Text="刪除表單代理" Value="DeleteFormAgent" meta:resourceKey="TBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sDeleteFormAgent" />--%>
                    <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m03.gif" Text="刪除" Value="Delete" meta:resourceKey="DeleteResource5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sDescription" />
                    <telerik:RadToolBarButton>
                        <ItemTemplate>
                            <div id="divTip" style="padding-top: 5px">
                                <asp:LinkButton ID="lbAgentExample" runat="server" OnClientClick="openAgentExample()" Text="UOF代理機制說明" meta:resourcekey="hyAgentDescriptionResource1"></asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>

        </ContentTemplate>
        <%--        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="UC_FormList1" EventName="OnNodedClicked"></asp:AsyncPostBackTrigger>
        </Triggers>--%>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <uc1:UC_FormList ID="UC_FormList1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="3">
        <telerik:RadPageView ID="RadPageView1" runat="server">RadPageView</telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server">RadPageView</telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView3" runat="server">RadPageView</telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView4" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="tbbg01">
                <tr>
                    <td style="width: 100%; vertical-align: top;">
                        <%--                    <table width="100%">
                        <tr>
                            <td style="height: 141px;vertical-align:top;"">--%>
                        <table width="100%" class="PopTable" cellspacing="1">
                            <tr>
                                <td class="PopTableHeader" style="width: 50%;">
                                    <asp:Label ID="Label2" runat="server" Text="一般代理人列表" meta:resourcekey="Label2Resource1"></asp:Label>
                                </td>
                                <td class="PopTableHeader">
                                    <asp:Label ID="Label3" runat="server" Text="代理人操作說明" meta:resourcekey="Label3Resource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: White">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblFirstAgent" runat="server" Text="第一代理人" meta:resourcekey="Label42Resource1"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbFirstAgent" runat="server" meta:resourcekey="lbFirstAgentResource1"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblSecondAgent" runat="server" Text="第二代理人" meta:resourcekey="Label43Resource1"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbSecondAgent" runat="server" meta:resourcekey="lbSecondAgentResource1"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblThirdAgent" runat="server" Text="第三代理人" meta:resourcekey="Label44Resource1"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbThirdAgent" runat="server" meta:resourcekey="lbThirdAgentResource1"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="background-color: White" valign="top">
                                    <asp:Label ID="lblDesc" runat="server" Text="一般代理人設定請至" meta:resourcekey="lblDescResource1"></asp:Label>
                                    <asp:HyperLink ID="HyperLinkPersonalSet" runat="server" Text="個人設定" meta:resourcekey="HyperLinkPersonalSetResource1"
                                        Target="_top">
                                    </asp:HyperLink>
                            </tr>
                        </table>
                        <%--                            </td>
                        </tr>
                    </table>--%>
                        <br />
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" RenderMode="Inline">
                            <ContentTemplate>
                                <table width="100%">
                                    <tbody>
                                        <tr>
                                            <td align="center">
                                                <table class="PopTable" cellspacing="1" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td class="PopTableHeader">
                                                                <asp:Label ID="lblFormAgentInfo" runat="server" meta:resourcekey="lblFormAgentInfoResource1" Text="表單代理資訊"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <Fast:Grid ID="DGFormAgentInfo" runat="server" Width="100%" PageSize="15" EnhancePager="True"
                                                    DataKeyOnClientWithCheckBox="False" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                                    AutoGenerateColumns="False" DataKeyNames="USER_GUID,FORM_ID"
                                                    OnRowDataBound="DGFormAgentInfo_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="USER_GUID" Visible="False" meta:resourcekey="TemplateFieldResource1">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# Bind("USER_GUID") %>' ID="lblUserGuid" meta:resourceKey="lblUserGuidResource1"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="FORM_ID" Visible="False" meta:resourcekey="TemplateFieldResource2">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# Bind("FORM_ID") %>' ID="lblFormId" meta:resourceKey="lblFormIdResource1"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="表單名稱" meta:resourcekey="TemplateFieldResource3">
                                                            <HeaderStyle Width="50%" />
                                                            <ItemTemplate>
                                                                &nbsp;<asp:LinkButton runat="server" ID="lbFormName" Text='<%#: Bind("FORM_NAME") %>'
                                                                    meta:resourceKey="lbFormNameResource1"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="表單代理人" meta:resourcekey="TemplateFieldResource4">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# Bind("FORM_AGENT") %>' ID="lblFormAgent" meta:resourceKey="lblFormAgentResource1"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="AGENT_FLAG" Visible="False" meta:resourcekey="TemplateFieldResource5">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# Bind("AGENT_FLAG") %>' ID="lblFormFlag" meta:resourceKey="lblFormFlagResource1"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </Fast:Grid>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                                <table class="PopTable" cellspacing="1" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td class="PopTableHeader">
                                                                <asp:Label ID="lblRoleAgentInfo" runat="server" meta:resourcekey="lblRoleAgentInfoResource1" Text="角色代理資訊"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <Fast:Grid ID="DGRoleAgentInfo" runat="server" Width="100%" PageSize="15" EnhancePager="True"
                                                    DataKeyOnClientWithCheckBox="False" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                                    AutoGenerateColumns="False" DataKeyNames="AGENT_GUID" EmptyDataText="沒有資料"
                                                    OnRowDataBound="DGRoleAgentInfo_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="AGENT_GUID" Visible="False" meta:resourcekey="tfAgentGuidResource1">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# Bind("AGENT_GUID") %>' ID="lblAgentGuid" meta:resourceKey="lblAgentGuidResource1"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="USER_GUID" Visible="False" meta:resourcekey="tfUserGuidResource1">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# Bind("USER_GUID") %>' ID="lblUserGuid" meta:resourceKey="lblUserGuidResource3"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="GROUP_ID" Visible="False" meta:resourcekey="tfGroupIdResource2">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# Bind("GROUP_ID") %>' ID="lblGroupId" meta:resourceKey="lblGroupIdResource1"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="GROUP_NAME" Visible="False" meta:resourcekey="tfGroupNameResource2">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# Bind("GROUP_NAME") %>' ID="lblGroupName" meta:resourceKey="lblGroupNameResource1"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="TITLE_ID" Visible="False" meta:resourcekey="tfTitleIdResource2">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# Bind("TITLE_ID") %>' ID="lblTitleId" meta:resourceKey="lblTitleIdResource1"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="TITLE_NAME" Visible="False" meta:resourcekey="tfTitleNameResource2">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# Bind("TITLE_NAME") %>' ID="lblTitleName" meta:resourceKey="lblTitleNameResource1"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="角色" meta:resourcekey="tfRoleResource3">
                                                            <HeaderStyle Width="50%" />
                                                            <ItemTemplate>
                                                                <asp:LinkButton runat="server" ID="lbtnRoleName" meta:resourceKey="lbtnRoleNameResource1"></asp:LinkButton>
                                                                <asp:Label runat="server" ID="lblRoleName" ForeColor="Red" meta:resourceKey="lblRoleNameResource1"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="角色代理人" meta:resourcekey="tfRoleAgentResource4">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# Bind("AGENT_USER_GUID") %>' ID="lblRoleAgent" meta:resourceKey="lblRoleAgentResource1"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="AGENT_FLAG" Visible="False" meta:resourcekey="tfAgentFlagResource5">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# Bind("AGENT_FLAG") %>' ID="lblRoleFlag" meta:resourceKey="lblRoleFlagResource1"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </Fast:Grid>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <br />
                                                <table class="PopTable" cellspacing="1" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td class="PopTableHeader">
                                                                <asp:Label ID="lblAgnetTimeList" runat="server" meta:resourcekey="lblAgnetTimeListResource1" Text="代理時間列表"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <Fast:Grid ID="DGAgentTimeList" runat="server" Width="100%" PageSize="15" EnhancePager="True"
                                                    DataKeyOnClientWithCheckBox="False" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                                    AutoGenerateColumns="False" DataKeyNames="USER_GUID,AGENT_TIME_START,AGENT_TIME_END,AGENT_USER_GUID"
                                                    OnRowDataBound="DGAgentTimeList_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="USER_GUID" Visible="False" meta:resourcekey="TemplateFieldResource6">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# Bind("USER_GUID") %>' ID="lblUserGuid" meta:resourceKey="lblUserGuidResource2"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="代理起始時間" meta:resourcekey="TemplateFieldResource7">
                                                            <ItemTemplate>
                                                                <asp:LinkButton runat="server" ID="lbAgentTimeStart" Text='<%# Bind("AGENT_TIME_START") %>'
                                                                    meta:resourceKey="lbAgentTimeStartResource1"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="代理結束時間" meta:resourcekey="TemplateFieldResource8">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# Bind("AGENT_TIME_END") %>' ID="lblAgentTimeEnd"
                                                                    meta:resourceKey="lblAgentTimeEndResource1"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="代理人" meta:resourcekey="TemplateFieldResource9">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# Bind("AGENT_USER_GUID") %>' ID="lblAgentUser"
                                                                    meta:resourceKey="lblAgentTimeEndResource1"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </Fast:Grid>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </ContentTemplate>
                            <%--<triggers>
                                        <asp:AsyncPostBackTrigger ControlID="UC_FormList1" EventName="OnNodedClicked"></asp:AsyncPostBackTrigger>
                                        <asp:AsyncPostBackTrigger ControlID="webToolBar" EventName="ButtonClick">
                                        </asp:AsyncPostBackTrigger>
                                    </triggers>--%>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView5" runat="server">RadPageView</telerik:RadPageView>
    </telerik:RadMultiPage>
    <asp:HiddenField ID="hfUserGuid" runat="server" />
    <asp:Label ID="lblCustFlow" runat="server" Text="定義自訂流程" Visible="False" meta:resourcekey="lblCustFlowResource1"></asp:Label>
    <asp:Label ID="lblNoSetAgent" runat="server" Text="沒有設定人員" Visible="False" meta:resourcekey="lblNoSetAgentResource1"></asp:Label>
    <asp:Label ID="lblNoAgent" runat="server" Text="此表單不代理" Visible="False" meta:resourcekey="lblNoAgentResource1"></asp:Label>
    <asp:Label ID="lblNoData" runat="server" Text="沒有資料" Visible="False" meta:resourcekey="lblNoDataResource1"></asp:Label>
    <asp:Label ID="lblModifyFormAgent" runat="server" Text="修改表單代理人" Visible="False" meta:resourcekey="lblModifyFormAgentResource1"></asp:Label>
    <asp:Label ID="lblModifyAgentTime" runat="server" Text="修改代理時間" Visible="False" meta:resourcekey="lblModifyAgentTimeResource1"></asp:Label>
    <asp:Label ID="lblDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>&nbsp;
    <asp:Label ID="lblMyFormList" runat="server" Text="個人表單" Visible="False" meta:resourcekey="lblMyFormListResource1"></asp:Label>
    <asp:Label ID="Label4" runat="server" Text="表單申請" Visible="False" meta:resourcekey="Label4Resource1"></asp:Label>
    <asp:Label ID="lblGetbackList" runat="server" Text="表單取回" Visible="False" meta:resourcekey="lblGetbackListResource1"></asp:Label>
    <asp:Label ID="lblSetAgent" runat="server" Text="設定代理人" Visible="False" meta:resourcekey="lblSetAgentResource1"></asp:Label>
    <asp:Label ID="lblNoSet" runat="server" Text="不設定" Visible="false" meta:resourcekey="lblNoSetResource1"></asp:Label>
    <asp:Label ID="lblList" runat="server" meta:resourcekey="Label1Resource1" Text="表單列表" Visible="false"></asp:Label>
    <asp:Label ID="lblAddRoleAgent" runat="server" Text="新增角色代理人" Visible="false" meta:resourcekey="lblAddRoleAgentResource1"></asp:Label>
    <asp:Label ID="lblModifyRoleAgent" runat="server" Text="修改角色代理人" Visible="false" meta:resourcekey="lblModifyRoleAgentResource1"></asp:Label>
    <asp:Label ID="lblRoleError" runat="server" Text="此角色被異動後已不存在，請重新設定" Visible="false" meta:resourcekey="lblRoleErrorResource1"></asp:Label>
    <asp:Label ID="lblGroupTitleDelete" runat="server" Text="部門或職級已被刪除，請重新設定" Visible="false" meta:resourcekey="lblGroupTitleDeleteResource1"></asp:Label>
    <asp:Label ID="lblNoRoleAgent" runat="server" Text="此角色不代理" Visible="False" meta:resourcekey="lblNoRoleAgentResource1"></asp:Label>
    <asp:Label ID="lblAgentExample" runat="server" Text="UOF代理機制說明" Visible="False" meta:resourcekey="hyAgentDescriptionResource1"></asp:Label>
</asp:Content>
