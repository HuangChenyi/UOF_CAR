<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="WKF_Admin_SetAgent" Title="設定他人代理人" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="SetAgent.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../FormUse/UC_FormList.ascx" TagName="UC_FormList" TagPrefix="uc1" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script id="SetAgentjs" type="text/javascript">
        function treeForm_NodeClick(treeId, nodeId, button) {

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

        function GetSelectedUser() {
            var str = '<%= this.lblGuid.Text %>';
            return str;
        }
    </script>
    <script type="text/javascript" id="telerikClientEvents1">

        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            if (value == "AddAgentTime") {
                args.set_cancel(true);
                $uof.dialog.open2('~/WKF/Admin/AddAgentTime.aspx', args.get_item(), '<%=lblModifyAgentTime.Text%>', 1050, 400, openDialogResult, { "user": "<%=this.lblGuid.Text%>" });

            }
            else if (value == "AddFormAgent") {
                var paras = { "formId": GetSelectedTag(), "user": GetSelectedUser(), "formName": GetSelectedText() };
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/Admin/AddAgentForm.aspx", args.get_item(), '', 600, 400, openDialogResult, paras);
            }
            else if (args.get_item().get_value() == "AddRoleAgent") {
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/Agent/AddRoleAgent.aspx", args.get_item(), '<%=lblAddRoleAgent.Text%>', 700, 300, openDialogResult, { "userGuid": '<%=lblGuid.Text%>' });
            }
            else if (args.get_item().get_value() == "Delete") {
                if (confirm('<%=lblDelete.Text %>') == false)
                    args.set_cancel(true);
            }
            <%--else if (value == "DeleteAgentTime") {
                if (confirm('<%=lblDelete.Text %>') == false)
                    args.set_cancel(true);
            }
            else if (value == "DeleteFormAgent") {
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

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" meta:resourceKey="UltraWebToolbar1Resource1" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_ButtonClicking">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="啟動代理時間" meta:resourceKey="TBarButtonResource1"
                        ImageUrl="~/Common/Images/Icon/icon_m104.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m104.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m104.gif"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m104.gif"
                        Value="AddAgentTime">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m105.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m105.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m105.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m105.gif" Text="新增角色代理人" Value="AddRoleAgent" meta:resourceKey="AddRoleAgentResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sAddRoleAgent" />
                    <telerik:RadToolBarButton runat="server" Text="新增表單代理人" meta:resourceKey="TBarButtonResource2"
                        ImageUrl="~/Common/Images/Icon/icon_m105.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m105.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m105.gif"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m105.gif"
                        Value="AddFormAgent">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <%--<telerik:RadToolBarButton runat="server" Text="刪除代理時間" meta:resourceKey="TBarButtonResource3"
                        ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        Value="DeleteAgentTime">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除表單代理" meta:resourceKey="TBarButtonResource4"
                        ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        Value="DeleteFormAgent">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 7" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource4">
                    </telerik:RadToolBarButton>
                     <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sDescription" />--%>
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
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <uc1:UC_FormList ID="UC_FormList1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td valign="top" width="100%">
                <table width="100%">
                    <tr>
                        <td style="height: 141px">
                            <uc2:UC_BtnChoiceOnce ID="UC_BtnChoiceOnce1" runat="server" />
                            <asp:Label ID="lblUserName" runat="server" meta:resourcekey="lblUserNameResource1"></asp:Label>
                            <asp:Label ID="lblGuid" runat="server" Visible="False" meta:resourcekey="lblGuidResource1"></asp:Label><br />
                            <table cellspacing="1" class="PopTable" width="100%">
                                <tr>
                                    <td align="center" class="PopTableHeader" colspan="2">
                                        <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="一般代理人列表"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="background-color: white" valign="top">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblFirstAgent" runat="server" meta:resourcekey="Label42Resource1"
                                                        Text="第一代理人"></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="lbFirstAgent" runat="server" meta:resourcekey="lbFirstAgentResource1"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblSecondAgent" runat="server" meta:resourcekey="Label43Resource1"
                                                        Text="第二代理人"></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="lbSecondAgent" runat="server" meta:resourcekey="lbSecondAgentResource1"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblThirdAgent" runat="server" meta:resourcekey="Label44Resource1"
                                                        Text="第三代理人"></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="lbThirdAgent" runat="server" meta:resourcekey="lbThirdAgentResource1"></asp:Label></td>
                                            </tr>
                                        </table>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table width="100%">
                            <tbody>
                                <tr>
                                    <td align="center">
                                        <br />
                                        <table class="PopTable" cellspacing="1" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td class="PopTableHeader" align="center">
                                                        <asp:Label runat="server" Text="表單代理資訊" ID="lblFormAgentInfo" meta:resourceKey="lblFormAgentInfoResource1"></asp:Label>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <Fast:Grid runat="server" Width="100%" DataKeyOnClientWithCheckBox="False" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                            AutoGenerateColumns="False" ID="DGFormAgentInfo" DataKeyNames="USER_GUID,FORM_ID" meta:resourceKey="DGFormAgentInfoResource1"
                                            OnRowDataBound="DGFormAgentInfo_RowDataBound" DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True"
                                            KeepSelectedRows="False" PageSize="15">
                                            <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl=""
                                                PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                                                PreviousImageUrl="" ShowHeaderPager="True" />
                                            <ExportExcelSettings AllowExportToExcel="False" />
                                            <Columns>
                                                <asp:TemplateField Visible="False" HeaderText="USER_GUID" meta:resourceKey="TemplateFieldResource1">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#: Bind("USER_GUID") %>' ID="lblUserGuid" meta:resourceKey="lblUserGuidResource1" __designer:wfdid="w6"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField Visible="False" HeaderText="FORM_ID" meta:resourceKey="TemplateFieldResource2">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#: Bind("FORM_ID") %>' ID="lblFormId" meta:resourceKey="lblFormIdResource1" __designer:wfdid="w7"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="表單名稱" meta:resourceKey="TemplateFieldResource3">
                                                    <HeaderStyle Width="50%"/>
                                                    <ItemTemplate>
                                                        &nbsp;<asp:LinkButton runat="server" ID="lbFormName" Text='<%#: Bind("FORM_NAME") %>' meta:resourceKey="lbFormNameResource1" __designer:wfdid="w8"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="表單代理人" meta:resourceKey="TemplateFieldResource4">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#: Bind("FORM_AGENT") %>' ID="lblFormAgent" meta:resourceKey="lblFormAgentResource1" __designer:wfdid="w8"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField Visible="False" HeaderText="AGENT_FLAG" meta:resourceKey="TemplateFieldResource5">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#: Bind("AGENT_FLAG") %>' ID="lblFormFlag" meta:resourceKey="lblFormFlagResource1" __designer:wfdid="w6"></asp:Label>
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
                                                    <td class="PopTableHeader" align="center">
                                                        <asp:Label runat="server" Text="代理時間列表" ID="lblAgnetTimeList" meta:resourceKey="lblAgnetTimeListResource1"></asp:Label>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <Fast:Grid runat="server" Width="100%" DataKeyOnClientWithCheckBox="False" AllowSorting="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" ID="DGAgentTimeList" DataKeyNames="USER_GUID,AGENT_TIME_START,AGENT_TIME_END,AGENT_USER_GUID" meta:resourceKey="DGAgentTimeListResource1" OnRowDataBound="DGAgentTimeList_RowDataBound" DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="15">
                                            <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                                            <ExportExcelSettings AllowExportToExcel="False" />
                                            <Columns>
                                                <asp:TemplateField Visible="False" HeaderText="USER_GUID" meta:resourceKey="TemplateFieldResource6">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#: Bind("USER_GUID") %>' ID="lblUserGuid" meta:resourceKey="lblUserGuidResource2" __designer:wfdid="w3"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="代理起始時間" meta:resourceKey="TemplateFieldResource7">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="lbAgentTimeStart" Text='<%#: Bind("AGENT_TIME_START") %>' meta:resourceKey="lbAgentTimeStartResource1" __designer:wfdid="w11"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="代理結束時間" meta:resourceKey="TemplateFieldResource8">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#: Bind("AGENT_TIME_END") %>' ID="lblAgentTimeEnd" meta:resourceKey="lblAgentTimeEndResource1" __designer:wfdid="w4"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="代理人" meta:resourcekey="TemplateFieldResource9">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#: Bind("AGENT_USER_GUID") %>' ID="lblAgentUser" meta:resourcekey="lblAgentUserResource1"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </Fast:Grid>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblNoSetAgent" runat="server" Text="沒有設定人員" Visible="False" meta:resourcekey="lblNoSetAgentResource1"></asp:Label>
    <asp:Label ID="lblNoAgent" runat="server" Text="此表單不代理" Visible="False" meta:resourcekey="lblNoAgentResource1"></asp:Label>
    <asp:Label ID="lblNoData" runat="server" Text="沒有資料" Visible="False" meta:resourcekey="lblNoDataResource1"></asp:Label>
    <asp:Label ID="lblModifyFormAgent" runat="server" Text="修改表單代理人" Visible="False" meta:resourcekey="lblModifyFormAgentResource1"></asp:Label>
    <asp:Label ID="lblModifyAgentTime" runat="server" Text="修改代理時間" Visible="False" meta:resourcekey="lblModifyAgentTimeResource1"></asp:Label>
    <asp:Label ID="lblDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>&nbsp;
    <asp:Label ID="lblSelect" runat="server" Text="選擇欲設定之人員" Visible="False" meta:resourcekey="lblSelectResource1"></asp:Label>&nbsp;
    <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="表單列表" Visible="False"></asp:Label>
    <asp:Label ID="lblNoSet" runat="server" Text="不設定" Visible="False" meta:resourcekey="lblNoSetResource1"></asp:Label>
    <asp:Label ID="lblAddRoleAgent" runat="server" Text="新增角色代理人" Visible="false" meta:resourcekey="lblAddRoleAgentResource1"></asp:Label>
    <asp:Label ID="lblModifyRoleAgent" runat="server" Text="修改角色代理人" Visible="false" meta:resourcekey="lblModifyRoleAgentResource1"></asp:Label>
    <asp:Label ID="lblRoleError" runat="server" Text="此角色被異動後已不存在，請重新設定" Visible="false" meta:resourcekey="lblRoleErrorResource1"></asp:Label>
    <asp:Label ID="lblGroupTitleDelete" runat="server" Text="部門或職級已被刪除，請重新設定" Visible="false" meta:resourcekey="lblGroupTitleDeleteResource1"></asp:Label>
    <asp:Label ID="lblNoRoleAgent" runat="server" Text="此角色不代理" Visible="False" meta:resourcekey="lblNoRoleAgentResource1"></asp:Label>
    <asp:Label ID="lblAgentExample" runat="server" Text="UOF代理機制說明" Visible="False" meta:resourcekey="hyAgentDescriptionResource1"></asp:Label>
</asp:Content>


