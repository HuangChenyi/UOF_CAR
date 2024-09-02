<%@ Page Title="場地內配備主檔維護" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="EquipManagement.aspx.cs" Inherits="Ede.Uof.Web.EIP.Plant.EquipManagement" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function RadClientClick(sender, args) {
            var buttonKey = args.get_item().get_value();
            if (buttonKey == "create") {
                $uof.dialog.open2("~/EIP/Plant/EquipEdit.aspx", args.get_item(), '<%=lblEquipEditTitle.Text%>', 500, 300, EquipDialogResult);
                args.set_cancel(true);
            }
            if (buttonKey == "delete") {
                var CheckedData = $uof.fastGrid.getChecked('<%= Grid1.ClientID %>');
                if (CheckedData == "") {                    
                    args.set_cancel(true);
                    return;
                }

                if (confirm('<%=msgDelconfirm.Text %>') == false)
                    args.set_cancel(true);                    
            }
        }

        function EquipDialogResult(returnValue) {            
            if (typeof(returnValue) == 'undefined') {
                return false;
            }
            return true;
        }
    </script>

    <asp:UpdatePanel ID="Updatepanel1" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadClientClick" Width="100%">
                <Items>
                    <telerik:RadToolBarButton Value="create" Text="新增配備" meta:resourcekey="RadToolBar1createResource1"
                        ImageUrl="../../Common/Images/Icon/icon_m16.gif"
                        HoveredImageUrl="../../Common/Images/Icon/icon_m16.gif"
                        DisabledImageUrl="../../Common/Images/Icon/icon_m16.gif"
                        ClickedImageUrl="../../Common/Images/Icon/icon_m16.gif">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton Value="delete" Text="刪除" meta:resourcekey="RadToolBar1deleteResource1"
                        ImageUrl="../../Common/Images/Icon/icon_m03.gif"
                        HoveredImageUrl="../../Common/Images/Icon/icon_m03.gif"
                        DisabledImageUrl="../../Common/Images/Icon/icon_m03.gif"
                        ClickedImageUrl="../../Common/Images/Icon/icon_m03.gif">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>

            <asp:CustomValidator ID="CVEquipUsing" runat="server" Display="Dynamic"></asp:CustomValidator>

            <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="True"
                AutoGenerateColumns="False" DataKeyNames="EQUIP_GUID" SelectedRowColor="" UnSelectedRowColor=""
                Width="400px" AllowSorting="True" OnRowDataBound="Grid1_RowDataBound"
                OnRowCommand="Grid1_RowCommand" CustomDropDownListPage="False"
                DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                EnhancePager="True" PageSize="15" EmptyDataText="No data found" EnableModelValidation="True" KeepSelectedRows="False">
                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                <Columns>
                    <asp:TemplateField HeaderText="配備名稱" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEquipName" runat="server" Text='<%#: Eval("EQUIP_NAME") %>' CommandName="EditEquip"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EQUIP_GUID" HeaderText="EQUIP_GUID" Visible="false"/>
                </Columns>
            </Fast:Grid>

            <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
            <asp:Label ID="lblEquipUsing" runat="server" Text="上述配備已存在於會議室中，無法刪除" Visible="False" meta:resourcekey="lblEquipUsingResource1"></asp:Label>        
            <asp:Label ID="lblEquipEditTitle" runat="server" Text="場地內配備維護" style="display:none" meta:resourcekey="lblEquipEditTitleResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
