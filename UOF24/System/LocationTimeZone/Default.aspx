<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="System_LocationTimeZone_Default" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <script type="text/javascript">
         function RadToolBarButtonClicking(sender, args) {
             var key = args.get_item().get_value();
             switch (key) {
                 case "Create":
                     args.set_cancel(true);
                     $uof.dialog.open2("~/System/LocationTimeZone/LocationTimeZoneEdit.aspx", args.get_item(), '<%=lblDialogTitle.Text %>', 700, 300, openDialogResult);

                    break;
                 case "Delete":
                     var checkedData = $uof.fastGrid.getChecked('<%=locationGrid.ClientID%>');
                     if (checkedData != '') {
                         if (!confirm('<%=lblConfirmDelete.Text %>')) {
                             args.set_cancel(true);
                         }
                     }
                     else { args.set_cancel(true); }
                     break;
                 case "Import":
                     args.set_cancel(true);
                     $uof.dialog.open2("~/System/LocationTimeZone/ImportLocationTimeZone.aspx", args.get_item(), '<%=lblImportLocationTimeZone.Text %>', 600, 500, openDialogResult);
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
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="RadToolBarButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" SingleClick="None" meta:resourcekey="RadToolBar1Resource1">
        <Items>
            <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m02.gif"  DisabledImageUrl="~/Common/Images/Icon/icon_m02.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m02.gif" ImageUrl="~/Common/Images/Icon/icon_m02.gif" Text="新增" Value="Create" meta:resourcekey="RadToolBarButtonResource1">
            </telerik:RadToolBarButton>
           <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2" >
            </telerik:RadToolBarButton>    
            <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif"  DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" Text="刪除" Value="Delete" meta:resourcekey="RadToolBarButtonResource3">
            </telerik:RadToolBarButton>
           <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4" >
            </telerik:RadToolBarButton> 
            <telerik:RadToolBarButton runat="server" Value="Location" meta:resourcekey="RadToolBarButtonResource5">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text="歸屬地點:" meta:resourcekey="Label1Resource1"></asp:Label>
                    <asp:TextBox ID="txtQueryLocation" runat="server" meta:resourcekey="txtQueryLocationResource1"></asp:TextBox>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m39.gif"  DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="查詢" Value="Query" meta:resourcekey="RadToolBarButtonResource7" >
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource8" >
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m110.gif"  DisabledImageUrl="~/Common/Images/Icon/icon_m110.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m110.gif" ImageUrl="~/Common/Images/Icon/icon_m110.gif" Text="匯入" Value="Import" meta:resourcekey="RadToolBarButtonResource9" >
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource8" >
            </telerik:RadToolBarButton>            
        </Items>
    </telerik:RadToolBar>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>            
            <Ede:Grid ID="locationGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True" DefaultSortColumnName="NAME"
                AutoGenerateColumns="False" DataKeyNames="LOCATION_ID" Width="800px"
                DataKeyOnClientWithCheckBox="True" DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" PageSize="15"
                KeepSelectedRows="False" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" OnRowDataBound="locationGrid_RowDataBound" OnSelectedIndexChanging="locationGrid_SelectedIndexChanging" OnSorting="locationGrid_Sorting" meta:resourcekey="locationGridResource1" OnPageIndexChanging="locationGrid_PageIndexChanging" OnBeforeExport="locationGrid_BeforeExport">
                <EnhancePagerSettings ShowHeaderPager="False" />
                <ExportExcelSettings AllowExportToExcel="True" />
                <Columns>

                    <asp:TemplateField HeaderText="歸屬地點" SortExpression="NAME" meta:resourcekey="TemplateFieldResource1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NAME") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnLocationName" runat="server" OnClick="lbtnLocationName_Click" Text='<%#: Bind("NAME") %>' meta:resourcekey="lbtnLocationNameResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="200px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="地址" DataField="ADDRESS" meta:resourcekey="BoundFieldResource1">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Width="300px" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="電話" DataField="PHONE" meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" Width="100px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="時區" meta:resourcekey="TemplateFieldResource2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TIMEZONE_ID") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTimeZone" runat="server" Text='<%# Bind("TIMEZONE_ID") %>' meta:resourcekey="lblTimeZoneResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="200px" Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                </Columns>
            </Ede:Grid>
            <asp:TextBox ID="txtShowMsg" runat="server" ReadOnly="True" TextMode="MultiLine" Rows="10" Width="800px" Visible="False" meta:resourcekey="txtShowMsgResource1"></asp:TextBox>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lblDialogTitle" runat="server" Text="新增/維護時區" Visible="False" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除嗎?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblShowMsg" runat="server" Text="下列歸屬地點目前有人員使用，無法進行刪除。" Visible="False" meta:resourcekey="lblShowMsgResource1"></asp:Label>
    <asp:Label ID="lblImportLocationTimeZone" runat="server" Text="匯入歸屬地點" Visible="False" meta:resourcekey="lblImportLocationTimeZoneResource1"></asp:Label>
    <asp:HiddenField ID="hfmapPath" runat="server" />
</asp:Content>
