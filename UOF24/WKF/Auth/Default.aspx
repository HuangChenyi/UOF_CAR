<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="WKF_Auth_Default" Title="權限設定" Culture="auto"
    meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="Default.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">
        function OnToolbarClicking(e, args) {
            var roleId = $("#<%=hideRole.ClientID%>").val();
            var Key = args.get_item().get_value();
            if (Key == "new") {
                args.set_cancel(true);
                if (roleId == "WKFClassifiedDesigner")
                    $uof.dialog.open2("~/WKF/Auth/SetupDesignMember.aspx", args.get_item(), "設計者維護", 900, 600, OpenDialogResult);
                if (roleId == "WKFClassifiedHandOver")
                    $uof.dialog.open2("~/WKF/Auth/SetupHandoverMember.aspx", args.get_item(), "交接人員維護", 900, 400, OpenDialogResult);
            }
            else if (Key == "delete") {
                if (confirm('<%=lblConfirm.Text %>') == false) {
                    args.set_cancel(true);
                }
            }
            else if (Key == "formManage") {
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/ManageFormType.aspx", args.get_item(), "", 380, 530, OpenDialogResult);
            }
            else if (Key == "flowManage") {
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FlowManagement/SubFlowMT.aspx", args.get_item(), "", 380, 540, OpenDialogResult);
            }
        }

        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined")
                return false;
            else
                return true;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <telerik:RadTreeView ID="RadTreeView1" runat="server" OnNodeClick="RadTreeView1_NodeClick"></telerik:RadTreeView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="updatePanelRight" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td valign="top">

                        <telerik:RadTabStrip ID="RadTabStrip1" MultiPageID="RadMultiPage1" BackColor="White"
                            runat="server" SelectedIndex="0" OnTabClick="RadTabStrip1_TabClick">
                            <Tabs>
                                <telerik:RadTab Text="全域設定" Value="global" meta:resourcekey="RadTabResource1" Selected="True"></telerik:RadTab>
                                <telerik:RadTab Text="分權設定" Value="class" meta:resourcekey="RadTabResource2"></telerik:RadTab>
                            </Tabs>
                        </telerik:RadTabStrip>
                        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0"
                            BackColor="White" meta:resourcekey="RadMultiPage1Resource1">
                            <telerik:RadPageView ID="global" runat="server" Selected="True">
                                <table width="100%" class="PopTable" cellspacing="1">
                                    <tr>
                                        <td style="background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif); text-align: left;">
                                            <asp:Label ID="lblRole" runat="server" Text="角色說明：" meta:resourcekey="lblRoleResource1"></asp:Label>
                                            <asp:Label
                                                ID="lblRoleDesc" runat="server" meta:resourcekey="lblRoleDescResource1"></asp:Label>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif); text-align: left;">

                                            <input id="hideRole" runat="server" type="hidden" />
                                            <uc2:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ShowMember="False" />
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 0; width: 100%">
                                            <table width="100%" class="PopTable" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td class="PopTableHeader" style="text-align: center; padding: 0;">
                                                        <center>
                                                           <asp:Label ID="Label2" runat="server" Text="可使用功能列表" meta:resourcekey="Label2Resource1"></asp:Label>
                                                        </center>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>

                                <Fast:Grid ID="gridFunction" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                    AutoGenerateColumns="False" Width="100%"
                                    OnRowDataBound="Grid1_RowDataBound" AllowPaging="True" OnPageIndexChanging="Grid1_PageIndexChanging"
                                    meta:resourcekey="Grid1Resource1">
                                    <Columns>
                                        <asp:TemplateField HeaderText="功能名稱" meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblFuncName" meta:resourceKey="lblFuncNameResource1" __designer:wfdid="w16"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </Fast:Grid>
                            </telerik:RadPageView>
                            <telerik:RadPageView ID="class" runat="server">
                                <table width="100%" class="PopTable" cellspacing="1">
                                    <tr>
                                        <td style="background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif); text-align: left;">
                                            <asp:Label ID="lblRole2" runat="server" Text="角色說明：" meta:resourcekey="lblRoleResource1"></asp:Label>
                                            <asp:Label
                                                ID="lblRoleDesc2" runat="server"></asp:Label>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif); text-align: left;">

                                            <input id="Hidden1" runat="server" type="hidden" />
                                            <table style="width: 100%">
                                                <tr>
                                                    <td>
                                                        <telerik:RadToolBar ID="radToolbar" runat="server" OnButtonClick="radToolbar_ButtonClick" OnClientButtonClicking="OnToolbarClicking" width="100%">
                                                            <Items>
                                                                <telerik:RadToolBarButton Value="new" runat="server" Text="新增"
                                                                    ImageUrl="~/Common/Images/Icon/icon_j13.gif" meta:resourcekey="radButtonNewResource1">
                                                                </telerik:RadToolBarButton>
                                                                <telerik:RadToolBarButton runat="server" IsSeparator="true"></telerik:RadToolBarButton>
                                                                <telerik:RadToolBarButton Value="delete" runat="server" Text="刪除"
                                                                    ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="radButtonDeleteResource1">
                                                                </telerik:RadToolBarButton>
                                                                <telerik:RadToolBarButton runat="server" IsSeparator="true"></telerik:RadToolBarButton>
                                                                <telerik:RadToolBarButton Value="formManage" runat="server" Text="表單類別管理"
                                                                    ImageUrl="~/Common/Images/Icon/icon_m21.png" meta:resourcekey="radButtonFormManageResource1">
                                                                </telerik:RadToolBarButton>
                                                                <telerik:RadToolBarButton runat="server" Value="sepForm" IsSeparator="true"></telerik:RadToolBarButton>
                                                                <telerik:RadToolBarButton Value="flowManage" runat="server" Text="副流程類別管理"
                                                                    ImageUrl="~/Common/Images/Icon/icon_m116.gif" meta:resourcekey="radButtonFlowManageResource1">
                                                                </telerik:RadToolBarButton>
                                                                <telerik:RadToolBarButton runat="server" Value="sepFlow" IsSeparator="true"></telerik:RadToolBarButton>
                                                            </Items>
                                                        </telerik:RadToolBar>
                                                        <Fast:Grid ID="gridCateDesigner" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                                            AutoGenerateColumns="False" DataKeyNames="DESIGN_RM_ID" Width="100%"
                                                            OnRowDataBound="gridCateDesigner_RowDataBound" OnRowCommand="gridCateDesigner_RowCommand" AllowPaging="False">
                                                            <Columns>
                                                                <asp:BoundField DataField="DESIGN_RM_ID" Visible="false" />
                                                                <asp:TemplateField HeaderText="設計者" meta:resourcekey="boundFieldResource1">
                                                                    <ItemTemplate>
                                                                        <uc2:UC_ChoiceList ID="UC_ChoiceList1" runat="server" IsAllowEdit="false"
                                                                            ShowMember="False" ExpandToUser="false" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="表單類別" meta:resourcekey="boundFieldResource2">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblFormCateGory" runat="server"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="副流程類別" meta:resourcekey="boundFieldResource3">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblFlowCateGory" runat="server"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="操作" meta:resourcekey="boundFieldResource4">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lbtnOp" runat="server" Text="編輯" meta:resourcekey="lbtnOpResource1"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </Fast:Grid>
                                                        <Fast:Grid ID="gridClassHandOver" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                                            AutoGenerateColumns="False" DataKeyNames="HANDOVER_RM_ID" Width="100%"
                                                            OnRowDataBound="gridClassHandOver_RowDataBound" OnRowCommand="gridClassHandOver_RowCommand" AllowPaging="False">
                                                            <Columns>
                                                                <asp:BoundField DataField="HANDOVER_RM_ID" Visible="false" />
                                                                <asp:TemplateField HeaderText="交接管理員" meta:resourcekey="boundFieldResource5" HeaderStyle-Width="50%">
                                                                    <ItemTemplate>
                                                                        <uc2:UC_ChoiceList ID="UC_ChoiceClassHandOver" runat="server" IsAllowEdit="false"
                                                                            ShowMember="False" ExpandToUser="true" />
                                                                    </ItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="管理部門" meta:resourcekey="boundFieldResource6" HeaderStyle-Width="35%">
                                                                    <ItemTemplate>
                                                                        <uc2:UC_ChoiceList ID="UC_ChoiceClassHandOverDept" runat="server" IsAllowEdit="false"
                                                                            ShowMember="False" ExpandToUser="false" />
                                                                    </ItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="操作" meta:resourcekey="boundFieldResource4" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lbtnOperate" runat="server" Text="編輯" meta:resourcekey="lbtnOpResource1"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </Fast:Grid>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 0; width: 100%">
                                            <table width="100%" class="PopTable" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td class="PopTableHeader" style="text-align: center; padding: 0;">
                                                        <center>
                                        <asp:Label ID="Label4" runat="server" Text="可使用功能列表" meta:resourcekey="Label2Resource1"></asp:Label>
                                        </center>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>

                                <Fast:Grid ID="gridClassFunction" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                    AutoGenerateColumns="False"
                                    Width="100%"
                                    OnRowDataBound="Grid1_RowDataBound" AllowPaging="True" OnPageIndexChanging="Grid1_PageIndexChanging"
                                    meta:resourcekey="Grid1Resource1">
                                    <Columns>
                                        <asp:TemplateField HeaderText="功能名稱" meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblFuncName" meta:resourceKey="lblFuncNameResource1" __designer:wfdid="w16"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </Fast:Grid>
                            </telerik:RadPageView>
                        </telerik:RadMultiPage>

                        &nbsp;
                        <asp:Label ID="lblWKFDesigner" runat="server" Text="被設定為設計者的人員，才可使用設計模組的相關功能。" Visible="False"
                            meta:resourcekey="lblWKFDesignerResource1"></asp:Label>
                        <asp:Label ID="lblWKFManager" runat="server" Text="被設定為管理員者，才可使用電子簽核所有的功能，並可設定設計者人員。於系統管理>>系統組態>>管理員設定處設定。"
                            Visible="False" meta:resourcekey="lblWKFManagerResource1"></asp:Label>
                        <asp:Label ID="lblWKFArchiveUser" runat="server" Text="只要於表單中，被設定為表單歸檔者的人員。" Visible="False"
                            meta:resourcekey="lblWKFArchiveUserResource1"></asp:Label>
                        <asp:Label ID="lblWKFUser" runat="server" Text="只要於表單中，被設定為表單使用者的人員。" Visible="False"
                            meta:resourcekey="lblWKFUserResource1"></asp:Label>
                        <asp:Label ID="lblElectronicDocument" runat="server" Text="" Visible="false"
                            meta:resourcekey="lblElectronicDocumentResource1"></asp:Label>
                        <asp:Label ID="lblWKFInnerUser" runat="server" Text="指公司內部所有人員。" Visible="False"
                            meta:resourcekey="lblWKFInnerUserResource1"></asp:Label>
                        <asp:Label ID="lblWKFOuterUser" runat="server" Text="指公司以外的使用人員。" Visible="False"
                            meta:resourcekey="lblWKFOuterUserResource1"></asp:Label>
                        <asp:Label ID="lblList" runat="server" Text="角色列表" meta:resourcekey="Label1Resource1" Visible="false"></asp:Label>
                        <asp:Label ID="lblWKFReaderUser" runat="server" Text="被設定為表單查閱者的人員，可操作「表單查閱者查詢」。" Visible="false" meta:resourcekey="lblWKFReaderUserResource1"></asp:Label>
                        <asp:Label ID="lblWKFResponsible" runat="server" Text="被設定為表單負責人的人員，可操作「表單負責人管理」。" Visible="false" meta:resourcekey="WKFResponsibleResource1"></asp:Label>
                        <asp:Label ID="lblWKFHandOver" runat="server" Text="被設定為交接管理員的人員，才可以使用表單交接的相關功能。" Visible="false" meta:resourcekey="lblWKFHandOverResource1"></asp:Label>
                        <asp:Label ID="lblConfirm" runat="server" Text="確認要刪除此設計者?" Visible="false" meta:resourcekey="lblConfirmResource1"></asp:Label>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


