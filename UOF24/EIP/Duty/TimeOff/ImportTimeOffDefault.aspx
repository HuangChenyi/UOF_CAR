<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="ImportTimeOffDefault.aspx.cs" Inherits="Ede.Uof.Web.EIP.Duty.TimeOff.ImportTimeOffDefault" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
            function RadToolBarButtonClicking(sender, args) {
        var key = args.get_item().get_value();
        switch (key) {
            case "Import":
                args.set_cancel(true);
                $uof.dialog.open2("~/EIP/Duty/TimeOff/ImportTimeOffEdit.aspx", args.get_item(), '<%=lblDialogTitle.Text %>', 500, 400, openDialogResult);

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
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="RadToolBarButtonClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="匯入" Value="Import"
                CheckedImageUrl="~/Common/Images/Icon/icon_m110.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m110.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m110.gif"
                ImageUrl="~/Common/Images/Icon/icon_m110.gif" meta:resourcekey="RadToolBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Ede:Grid ID="importLogGrid" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                DataKeyOnClientWithCheckBox="True" DefaultSortDirection="Descending" EmptyDataText="沒有資料" EnhancePager="True" OnPageIndexChanging="importLogGrid_PageIndexChanging"
                OnRowDataBound="importLogGrid_RowDataBound" PageSize="15"
                KeepSelectedRows="False"
                OnSorting="importLogGrid_Sorting" Width="60%" DefaultSortColumnName="CREATE_DATE" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="importLogGridResource1">
                <EnhancePagerSettings ShowHeaderPager="False" />
                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                <Columns>
                    <asp:TemplateField HeaderText="匯入時間" SortExpression="CREATE_DATE">
                        <ItemTemplate>
                            <asp:Label ID="lblCreateDate" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="120px" Wrap="False" />
                        <ItemStyle Width="120px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="匯入者" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblUser" runat="server" meta:resourcekey="lblUserResource1"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <HeaderStyle Width="200px" Wrap="False"/>
                        <ItemStyle Width="200px" Wrap="False"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="檔案" meta:resourcekey="TemplateFieldResource2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="hylink" runat="server" meta:resourcekey="hylinkResource1">[hylink]</asp:HyperLink>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                </Columns>
            </Ede:Grid>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lblDialogTitle" runat="server" Text="匯入補休時數" Visible="False" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
