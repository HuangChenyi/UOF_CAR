<%@ Page Title="App刷卡範圍" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="PunchPositionSetting.aspx.cs" Inherits="EIP_Duty_Punch_PunchPositionSetting" meta:resourcekey="PageResource1" culture="auto" uiculture="auto" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="~/EIP/Duty/Punch/UC_PunchAuthSetting.ascx" TagName="UC_PunchAuthSetting" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <script id="punchJS" type="text/javascript">

        function rtbPunchPositionMaintainClicking(sender, args) {
            var key = args.get_item().get_value();

            switch (key) {
                case "Add":
                    args.set_cancel(true);
                    let currentUser = $('#<%=hfCurrentUser.ClientID%>').val();
                    $uof.dialog.open2("~/EIP/Duty/Punch/PunchPositionRangeEdit.aspx", args.get_item(), '<%=lblDialogTitleAdd.Text %>', 850, 950, openDialogResult, { 'currentUser': currentUser });
                    break;

                case "Del":
                    if (!confirm('<%=lblDelConfirm.Text %>'))
                        args.set_cancel(true);
                    break;
            }
        }

        function openDialogResult(returnValue) {
            if (returnValue === '' || returnValue === null)
                return false;
            else
                return true;
        }

    </script>

    <telerik:RadTabStrip ID="rtsPunchPosition" runat="server" SelectedIndex="0" MultiPageID="rmpPunchPosition" meta:resourcekey="rtsPunchPositionResource1">
        <Tabs>
            <telerik:RadTab runat="server" Text="App刷卡範圍" PageViewID="rpvPunchPositionMaintain" meta:resourcekey="rpvPunchPositionMaintainResource1"></telerik:RadTab>
            <telerik:RadTab runat="server" Text="權限設定" PageViewID="rpvAuthSetting" meta:resourcekey="rpvAuthSettingResource1"></telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>

    <telerik:RadMultiPage ID="rmpPunchPosition" runat="server" SelectedIndex="1" meta:resourcekey="rmpPunchPositionResource1">
        
        <telerik:RadPageView ID="rpvPunchPositionMaintain" runat="server" Width="100%" meta:resourceKey="rpvPunchPositionMaintainResource2" Selected="True">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table style="width:100%; height: 100%;">
                        <tr>
                            <td valign="top">
                                <telerik:RadToolBar ID="rtbPunchPositionMaintain" runat="server" Width="100%" 
                                    OnButtonClick="rtbPunchPositionMaintain_OnButtonClick" OnClientButtonClicking="rtbPunchPositionMaintainClicking" meta:resourceKey="rtbPunchPositionMaintainResource1" SingleClick="None">
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" Text="新增" Value="Add"
                                            CheckedImageUrl="~/Common/Images/Icon/icon_j13.gif"
                                            DisabledImageUrl="~/Common/Images/Icon/icon_j13.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_j13.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_j13.gif"
                                            meta:resourcekey="rtbAddResource1">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourceKey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" Text="刪除" Value="Del"
                                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            meta:resourcekey="rtbDelResource1">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourceKey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" meta:resourceKey="RadToolBarButtonResource3">
                                            <ItemTemplate>
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/Icon/icon_m132.gif" meta:resourceKey="Image1Resource1" />
                                                <asp:Label ID="lblEnabled" runat="server" Text="：啟用" ForeColor="Blue" meta:resourcekey="lblEnabledResource1"></asp:Label>
                                                &nbsp;
                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Common/Images/Icon/icon_m141.gif" meta:resourceKey="Image2Resource1" />
                                                <asp:Label ID="lblDisabled" runat="server" Text="：停用" ForeColor="Blue" meta:resourcekey="lblDisabledResource1"></asp:Label>
                                            </ItemTemplate>
                                        </telerik:RadToolBarButton>
                                    </Items>
                                </telerik:RadToolBar>

                                <Ede:Grid ID="grdPunchPositionMaintain" runat="server" 
                                    AllowPaging="True" 
                                    AllowSorting="True" 
                                    AutoGenerateCheckBoxColumn="True"
                                    AutoGenerateColumns="False" 
                                    DataKeyNames="PUNCH_POSITION_GUID"
                                    DataKeyOnClientWithCheckBox="True"
                                    DefaultSortColumnName="NAME"
                                    DefaultSortDirection="Ascending"
                                    EmptyDataText="沒有資料" 
                                    EnhancePager="True" 
                                    OnPageIndexChanging="grdPunchPositionMaintain_PageIndexChanging"
                                    OnRowDataBound="grdPunchPositionMaintain_RowDataBound" 
                                    OnSorting="grdPunchPositionMaintain_Sorting"
                                    PageSize="15"
                                    KeepSelectedRows="False" 
                                    Width="100%" CustomDropDownListPage="False" meta:resourceKey="grdPunchPositionMaintainResource1" SelectedRowColor="" UnSelectedRowColor="">
                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="狀態" meta:resourceKey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:Image ID="imgStatus" runat="server" meta:resourceKey="imgStatusResource1" />
                                            </ItemTemplate>
                                            <HeaderStyle Width="5%" Wrap="False" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="名稱" SortExpression="NAME" meta:resourcekey="tfNameResource1">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnEdit" runat="server" Text='<%# Bind("NAME") %>' OnClick="lbtnEdit_Click" meta:resourceKey="lbtnEditResource1" ></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Width="15%" Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="RADIUS" HeaderText="半徑範圍(公尺)" SortExpression="RADIUS" meta:resourcekey="bfRadiusResource1">
                                            <HeaderStyle Width="5%" Wrap="False" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Right" />
                                        </asp:BoundField>

                                         <asp:TemplateField HeaderText="人員" meta:resourcekey="tfUserSetResource1">
                                            <ItemTemplate>
                                                <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList_Position" IsAllowEdit="false" />
                                            </ItemTemplate>
                                            <HeaderStyle Width="45%" Wrap="False" />
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="建立者" SortExpression="CREATOR_NAME" meta:resourcekey="tfCreatorResource1">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCreator" runat="server" meta:resourceKey="lblCreatorResource1"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Width="10%" Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="維護人員" SortExpression="MODIFIER_NAME" meta:resourcekey="tfModifierResource1">
                                            <ItemTemplate>
                                                <asp:Label ID="lblModifier" runat="server" meta:resourceKey="lblModifierResource1"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Width="10%" Wrap="False" />
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="維護時間" SortExpression="MODIFY_DATE" meta:resourcekey="tfModifyDateResource1">
                                            <ItemTemplate>
                                                <asp:Label ID="lblModifyDate" runat="server" meta:resourceKey="lblModifyDateResource1"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Width="10%" Wrap="False" />
                                        </asp:TemplateField>

                                    </Columns>
                                </Ede:Grid>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>    
        
        <telerik:RadPageView ID="rpvAuthSetting" runat="server" Width="100%" meta:resourceKey="rpvAuthSettingResource2">
            <uc2:UC_PunchAuthSetting ID="UC_PunchAuthSetting" runat="server"></uc2:UC_PunchAuthSetting>
        </telerik:RadPageView>

    </telerik:RadMultiPage>

    <asp:Label ID="lbl104PunchModule" runat="server" Text="假勤管理" Visible="False" meta:resourcekey="lbl104PunchModuleResource1"></asp:Label>
    <asp:Label ID="lblUOFPunchModule" runat="server" Text="刷卡管理" Visible="False"  meta:resourcekey="lblUOFPunchModuleResource1"></asp:Label>
    <asp:Label ID="lblPunchGroup" runat="server" Text="刷卡設定" Visible="False" meta:resourcekey="lblPunchGroupResource1"></asp:Label>

    <asp:Label ID="lblDialogTitleAdd" runat="server" Text="新增刷卡範圍" Visible="False" meta:resourcekey="lblDialogTitleAddResource1"></asp:Label>
    <asp:Label ID="lblDialogTitleEdit" runat="server" Text="維護刷卡範圍" Visible="False" meta:resourcekey="lblDialogTitleEditResource1"></asp:Label>
    <asp:Label ID="lblDelConfirm" runat="server" Text="確定要刪除選取的項目嗎？" Visible="False" meta:resourcekey="lblDelConfirmResource1"></asp:Label>

    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

