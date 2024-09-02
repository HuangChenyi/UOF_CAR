<%@ Page Title="刷卡IP範圍" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="PunchIPSetting.aspx.cs" Inherits="EIP_Duty_Punch_PunchIPSetting" meta:resourcekey="PageResource1" culture="auto" uiculture="auto" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="~/EIP/Duty/Punch/UC_PunchAuthSetting.ascx" TagName="UC_PunchAuthSetting" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <script id="punchJS" type="text/javascript">

        function rtbPunchIPMaintainClicking(sender, args) {
            var key = args.get_item().get_value();

            switch (key) {
                case "Add":
                    args.set_cancel(true);
                    let currentUser = $('#<%=hfCurrentUser.ClientID%>').val();
                    $uof.dialog.open2("~/EIP/Duty/Punch/PunchIPRangeEdit.aspx", args.get_item(), '<%=lblDialogTitleAdd.Text %>', 600, 450, openDialogResult, { 'currentUser': currentUser });
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

    <telerik:RadTabStrip ID="rtsPunchIP" runat="server" SelectedIndex="0" MultiPageID="rmpPunchIP" meta:resourcekey="rtsPunchIPResource1">
        <Tabs>
            <telerik:RadTab runat="server" Text="可刷卡IP" PageViewID="rpvPunchIPMaintain" meta:resourcekey="rpvPunchIPMaintainResource1"></telerik:RadTab>
            <telerik:RadTab runat="server" Text="權限設定" PageViewID="rpvAuthSetting" meta:resourcekey="rpvAuthSettingResource1"></telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>

    <telerik:RadMultiPage ID="rmpPunchIP" runat="server" SelectedIndex="0" meta:resourcekey="rmpPunchIPResource1">
        
        <telerik:RadPageView ID="rpvPunchIPMaintain" runat="server" Width="100%" meta:resourcekey="rpvPunchIPMaintainResource2" Selected="True">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table style="width:100%; height: 100%;">
                        <tr>
                            <td valign="top">
                                <telerik:RadToolBar ID="rtbPunchIPMaintain" runat="server" Width="100%" 
                                    OnButtonClick="rtbPunchIPMaintain_OnButtonClick" OnClientButtonClicking="rtbPunchIPMaintainClicking" meta:resourcekey="rtbPunchIPMaintainResource1" SingleClick="None">
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" Text="新增" Value="Add"
                                            CheckedImageUrl="~/Common/Images/Icon/icon_j13.gif"
                                            DisabledImageUrl="~/Common/Images/Icon/icon_j13.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_j13.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_j13.gif"
                                            meta:resourcekey="rtbAddResource1">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource1" />
                                        <telerik:RadToolBarButton runat="server" Text="刪除" Value="Del"
                                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            meta:resourcekey="rtbDelResource1">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"/>
                                        <telerik:RadToolBarButton runat="server" meta:resourcekey="RadToolBarButtonResource3">
                                            <ItemTemplate>
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/Icon/icon_m132.gif" meta:resourcekey="Image1Resource1" />
                                                <asp:Label ID="lblEnabled" runat="server" Text="：啟用" ForeColor="Blue" meta:resourcekey="lblEnabledResource1"></asp:Label>
                                                &nbsp;
                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Common/Images/Icon/icon_m141.gif" meta:resourcekey="Image2Resource1" />
                                                <asp:Label ID="lblDisabled" runat="server" Text="：停用" ForeColor="Blue" meta:resourcekey="lblDisabledResource1"></asp:Label>
                                            </ItemTemplate>
                                        </telerik:RadToolBarButton>
                                    </Items>
                                </telerik:RadToolBar>

                                <Ede:Grid ID="grdPunchIPMaintain" runat="server" 
                                    AllowPaging="True" 
                                    AllowSorting="True" 
                                    AutoGenerateCheckBoxColumn="True"
                                    AutoGenerateColumns="False" 
                                    DataKeyNames="INDEX"
                                    DataKeyOnClientWithCheckBox="True"
                                    DefaultSortColumnName="BEGIN"
                                    DefaultSortDirection="Ascending"
                                    EmptyDataText="沒有資料" 
                                    EnhancePager="True" 
                                    OnPageIndexChanging="grdPunchIPMaintain_PageIndexChanging"
                                    OnRowDataBound="grdPunchIPMaintain_RowDataBound" 
                                    OnSorting="grdPunchIPMaintain_Sorting"
                                    PageSize="15"
                                    KeepSelectedRows="False" 
                                    Width="100%" CustomDropDownListPage="False" meta:resourcekey="grdPunchIPMaintainResource1" SelectedRowColor="" UnSelectedRowColor="">
                                    <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:Image ID="imgStatus" runat="server" meta:resourcekey="imgStatusResource1" />
                                            </ItemTemplate>
                                            <HeaderStyle Width="5%" Wrap="False" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="IP(起)" SortExpression="BEGIN" meta:resourcekey="tfBeginResource1">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnEdit" runat="server" Text='<%# Bind("BEGIN") %>' OnClick="lbtnEdit_Click" meta:resourcekey="lbtnEditResource1" ></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="END" HeaderText="IP(訖)" SortExpression="END" meta:resourcekey="bfEndResource1">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>

                                         <asp:TemplateField HeaderText="人員" meta:resourcekey="tfUserSetResource1">
                                            <ItemTemplate>
                                                <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList_IP" IsAllowEdit="false" />
                                            </ItemTemplate>
                                            <HeaderStyle Width="25%" Wrap="False" />
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="建立者" SortExpression="CREATOR_NAME" meta:resourcekey="tfCreatorResource1">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCreator" runat="server" meta:resourcekey="lblCreatorResource1"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Width="10%" Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="維護人員" SortExpression="MODIFIER_NAME" meta:resourcekey="tfModifierResource1">
                                            <ItemTemplate>
                                                <asp:Label ID="lblModifier" runat="server" meta:resourcekey="lblModifierResource1"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Width="10%" Wrap="False" />
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="維護時間" SortExpression="MODIFY_DATE" meta:resourcekey="tfModifyDateResource1">
                                            <ItemTemplate>
                                                <asp:Label ID="lblModifyDate" runat="server" meta:resourcekey="lblModifyDateResource1"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Width="10%" Wrap="False" />
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="REMARK" HeaderText="備註" meta:resourcekey="bfRemarkResource1">
                                            <HeaderStyle Width="10%" Wrap="False" />
                                            <ItemStyle Width="10%" Wrap="True" />
                                        </asp:BoundField>
                                       
                                    </Columns>
                                </Ede:Grid>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>    
        
        <telerik:RadPageView ID="rpvAuthSetting" runat="server" Width="100%" meta:resourcekey="rpvAuthSettingResource2">
            <uc2:UC_PunchAuthSetting ID="UC_PunchAuthSetting" runat="server"></uc2:UC_PunchAuthSetting>
        </telerik:RadPageView>

    </telerik:RadMultiPage>
        
    <asp:Label ID="lbl104PunchModule" runat="server" Text="假勤管理" Visible="False" meta:resourcekey="lbl104PunchModuleResource1"></asp:Label>
    <asp:Label ID="lblUOFPunchModule" runat="server" Text="刷卡管理" Visible="False"  meta:resourcekey="lblUOFPunchModuleResource1"></asp:Label>
    <asp:Label ID="lblPunchGroup" runat="server" Text="刷卡設定" Visible="False" meta:resourcekey="lblPunchGroupResource1"></asp:Label>

    <asp:Label ID="lblDialogTitleAdd" runat="server" Text="新增IP範圍" Visible="False" meta:resourcekey="lblDialogTitleAddResource1"></asp:Label>
    <asp:Label ID="lblDialogTitleEdit" runat="server" Text="維護IP範圍" Visible="False" meta:resourcekey="lblDialogTitleEditResource1"></asp:Label>
    <asp:Label ID="lblDelConfirm" runat="server" Text="確定要刪除選取的項目嗎？" Visible="False" meta:resourcekey="lblDelConfirmResource1"></asp:Label>

    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
