<%@ Page Title="罐頭簡訊" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="CannedMessageDialog.aspx.cs" Inherits="Ede.Uof.Web.EIP.SMS.CannedMessageDialog" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
        function OnToolbarClicking(sender, args) {
            var item = args.get_item();
            if (item.get_value() == 'Create') {
                args.set_cancel(true);
                $uof.dialog.open2('~/EIP/SMS/MaintainCannedText.aspx', item, '<%=lblTitle.Text%>', 400, 400, function dialogResult(returnValue) {
                    if (returnValue === null || returnValue === '') {
                        return false;
                    }
                    return true;
                });
            }
            else if (item.get_value() == 'Delete') {
                if (!confirm('<%=lblConfirm.Text%>')) {
                    args.set_cancel(true);
                }
            }
    }
    </script>
    <telerik:RadToolBar ID="RadToolbar1" runat="server" Width="100%" OnClientButtonClicking="OnToolbarClicking" OnButtonClick="RadToolbar1_ButtonClick" meta:resourcekey="RadToolbar1Resource1">
        <Items>
            <telerik:RadToolBarButton Value="Create" runat="server" Text="新增" ImageUrl="~/Common/Images/Icon/icon_j13.gif" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton Value="Delete" runat="server" Text="刪除" ImageUrl="~/Common/Images/Icon/icon_m115.gif" meta:resourcekey="RadToolBarButtonResource3"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <Fast:Grid ID="gridCannedText" runat="server" Width="100%" DataKeyNames="CANNED_TEXT_GUID"
                EnhancePager="True" PageSize="15" DataKeyOnClientWithCheckBox="False"
                AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="True"
                AllowSorting="True" AllowPaging="True" OnRowDataBound="gridCannedText_RowDataBound"
                DefaultSortDirection="Ascending" OnPageIndexChanging="gridCannedText_PageIndexChanging"
                OnSorting="gridCannedText_Sorting" OnRowCommand="gridCannedText_RowCommand">
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:BoundField DataField="CANNED_TEXT_GUID" Visible="False" meta:resourcekey="BoundFieldResource1" />
                    <asp:TemplateField HeaderText="內容" SortExpression="CANNED_TEXT" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnCannedText" runat="server" Text='<%#: Eval("CANNED_TEXT") %>' meta:resourcekey="lbtnCannedTextResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" Text="修改" meta:resourcekey="lbtnEditResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <PagerStyle HorizontalAlign="Left" />
            </Fast:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblSaveMsg" runat="server" Text="儲存" Visible="False"
        meta:resourcekey="lblSaveMsgResource1"></asp:Label>
    <asp:Label ID="lblConfirmMsg" runat="server" Text="確定" Visible="False"
        meta:resourcekey="lblConfirmMsgResource1"></asp:Label>
    <asp:Label ID="lblDeleteMsg" runat="server" Text="刪除" Visible="False"
        meta:resourcekey="lblDeleteMsgResource1"></asp:Label>
    <asp:Label ID="lblSaved" runat="server" Text="簽核意見已儲存!!" Visible="False"
        meta:resourcekey="lblSavedResource1"></asp:Label>
    <asp:Label ID="lblChoseMsg" runat="server" Text="請選擇" Visible="False"
        meta:resourcekey="lblChoseMsgResource1"></asp:Label>
    <asp:Label ID="lblChoose" runat="server" Text="請選擇簽核意見" Visible="False"
        meta:resourcekey="lblChooseResource1"></asp:Label>
    <asp:Label ID="lblIsSystemMsg" runat="server" Text="系統預設的簽核意見不可刪除"
        Visible="False" meta:resourcekey="lblIsSystemMsgResource1"></asp:Label>
    <asp:Label ID="lblDeleted" runat="server" Text="簽核意見已刪除!!" Visible="False"
        meta:resourcekey="lblDeletedResource1"></asp:Label>
    <asp:Label ID="lblConfirm" runat="server" Text="確認刪除罐頭簡訊?" Visible="False" meta:resourcekey="lblConfirmResource1"></asp:Label>
    <asp:Label ID="lblTitle" runat="server" Text="罐頭簡訊" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>
</asp:Content>
