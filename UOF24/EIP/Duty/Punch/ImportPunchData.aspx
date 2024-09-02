<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Punch_ImportPunchData" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ImportPunchData.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type="text/javascript">
    function RadToolBarButtonClicking(sender, args) {
        var key = args.get_item().get_value();
        switch (key) {
            case "Import":
                args.set_cancel(true);
                $uof.dialog.open2("~/EIP/Duty/Punch/ImportEdit.aspx", args.get_item(), '<%=lblImportTitle.Text %>', 500, 400, openDialogResult);

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
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="RadToolBarButtonClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None" >
        <Items>
            <telerik:RadToolBarButton runat="server" Text="匯入" Value="Import"
                CheckedImageUrl="~/Common/Images/Icon/icon_m110.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m110.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m110.gif"
                ImageUrl="~/Common/Images/Icon/icon_m110.gif"
                meta:resourcekey="RadToolBarImportResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton meta:resourcekey="RadToolBarButtonResource2">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text="刷卡資料成功匯入後，需待排程(約5分鐘)寫入人員刷卡資料" CssClass="SizeMemo"  meta:resourcekey="TBLabelResource1"></asp:Label>
                </ItemTemplate>
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <Fast:Grid ID="importLogGrid" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" 
        DataKeyOnClientWithCheckBox="True" DefaultSortDirection="Descending" EmptyDataText="沒有資料" EnhancePager="True" OnPageIndexChanging="importLogGrid_PageIndexChanging"
        OnRowDataBound="importLogGrid_RowDataBound" PageSize="15" 
         KeepSelectedRows="False" meta:resourcekey="IPGridResource1"
        OnSorting="importLogGrid_Sorting" Width="50%" DefaultSortColumnName="CREATE_DATE" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
        <EnhancePagerSettings ShowHeaderPager="False" />
        <ExportExcelSettings AllowExportToExcel="False" />
        <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl=""
            LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass=""
            PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl=""
            ShowHeaderPager="False"></EnhancePagerSettings>
        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        <Columns>
            <asp:TemplateField HeaderText="匯入時間" SortExpression="CREATE_DATE" meta:resourcekey="BoundFieldResource1">
                <ItemTemplate>
                    <asp:Label ID="lblCreateDate" runat="server" Text='<%# Bind("CREATE_DATE") %>' meta:resourcekey="lblCreateDateResource1"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="200px" />
                <ItemStyle Width="200px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="匯入者" meta:resourcekey="TemplateFieldResource1">
                <ItemTemplate>
                    <asp:Label ID="lblUser" runat="server" meta:resourcekey="lblUserResource1"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                </EditItemTemplate>
                <HeaderStyle Width="250px" />
                <ItemStyle Width="250px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="檔案" meta:resourcekey="TemplateFieldResource2">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="hylink" runat="server" meta:resourcekey="hylinkResource1">[hylink]</asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </Fast:Grid>
    <asp:Label ID="lblImportTitle" runat="server" Text="匯入檔案" Visible="False" meta:resourcekey="lblImportTitleResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
