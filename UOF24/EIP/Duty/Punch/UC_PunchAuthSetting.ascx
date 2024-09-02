<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_PunchAuthSetting.ascx.cs" Inherits="EIP_Duty_Punch_UC_PunchAuthSetting" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>

<script id="punchJS" type="text/javascript">

    function rtbPunchAuthSettingClicking(sender, args) {

        var key = args.get_item().get_value();

        switch (key) {
            case "Add":
                args.set_cancel(true);
                let pageType = $('#<%=hfPageType.ClientID%>').val();
                let dialogTitle = $('#<%=hfDialogTitle.ClientID%>').val();
                $uof.dialog.open2("~/EIP/Duty/Punch/AuthSettingEditDialog.aspx", args.get_item(), dialogTitle, 600, 300, openDialogResult, { 'editType': 'Add', 'pageType': pageType });
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

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table style="width:100%; height: 100%;">
            <tr>
                <td valign="top">
                    <telerik:RadToolBar ID="rtbPunchAuthSetting" runat="server" Width="100%" 
                        OnButtonClick="rtbPunchAuthSetting_OnButtonClick" OnClientButtonClicking="rtbPunchAuthSettingClicking" meta:resourcekey="rtbPunchAuthSettingResource1" SingleClick="None">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="新增" Value="Add"
                                CheckedImageUrl="~/Common/Images/Icon/icon_j13.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_j13.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_j13.gif"
                                ImageUrl="~/Common/Images/Icon/icon_j13.gif"
                                meta:resourcekey="rtbAddResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="刪除" Value="Del"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                meta:resourcekey="rtbDelResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </td>
            </tr>
            <tr>
                <td>
                    <Ede:Grid ID="grdPunchAuthSetting" runat="server" 
                        AllowSorting="True"
                        AutoGenerateColumns="False"
                        AutoGenerateCheckBoxColumn="True"
                        DataKeyNames="RM_ID"
                        DataKeyOnClientWithCheckBox="False"
                        EmptyDataText="沒有資料"
                        KeepSelectedRows="False"
                        OnRowDataBound="grdPunchAuthSetting_RowDataBound"
                        PageSize="5"
                        Width="100%" CustomDropDownListPage="False" DefaultSortDirection="Ascending" EnhancePager="True" meta:resourcekey="grdPunchAuthSettingResource1" SelectedRowColor="" UnSelectedRowColor="" >
                        <EnhancePagerSettings ShowHeaderPager="True" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="維護人員" meta:resourcekey="tfMaintainerResource1">
                                <ItemTemplate>
                                    <uc1:UC_ChoiceList ID="UC_MaintainerChoiceList" runat="server" IsAllowEdit="false" ExpandToUser="false"/>
                                </ItemTemplate>
                                <HeaderStyle Width="47%" Wrap="False" CssClass="cssCenter"/>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="可管理對象(包含子部門)" meta:resourcekey="tfManagedObjectResource1">
                                <ItemTemplate>
                                    <uc1:UC_ChoiceList ID="UC_ManagedObjectChoiceList" runat="server" IsAllowEdit="false" ExpandToUser="false"/>
                                </ItemTemplate>
                                <HeaderStyle Width="47%" Wrap="False" CssClass="cssCenter"/>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" Text="編輯" OnClick="lbtnEdit_Click" meta:resourcekey="lbtnEditResource1"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle width="6%" Wrap="False" CssClass="cssCenter" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                    </Ede:Grid>
                </td>
            </tr>
        </table>
            
        <asp:Label ID="lblIPSettingTitle" runat="server" Text="可刷卡IP權限設定" Visible="False" meta:resourcekey="lblIPSettingTitleResource1"></asp:Label>
        <asp:Label ID="lblPositionSettingTitle" runat="server" Text="App刷卡範圍權限設定" Visible="False" meta:resourcekey="lblPositionSettingTitleResource1"></asp:Label>
        <asp:Label ID="lblAppSettingTitle" runat="server" Text="只可用App權限設定" Visible="False" meta:resourcekey="lblAppSettingTitleResource1"></asp:Label>
        <asp:Label ID="lblExcludeSettingTitle" runat="server" Text="特殊人員權限設定" Visible="False" meta:resourcekey="lblExcludeSettingTitleResource1"></asp:Label>
        
        <asp:Label ID="lblDelConfirm" runat="server" Text="確定要刪除選取的項目嗎？" Visible="False" meta:resourcekey="lblDelConfirmResource1"></asp:Label>

        <asp:HiddenField ID="hfPageType" runat="server" />
        <asp:HiddenField ID="hfDialogTitle" runat="server" />

    </ContentTemplate>
        
</asp:UpdatePanel>