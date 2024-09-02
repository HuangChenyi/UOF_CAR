<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_OMS_QueryLookHistory" Title="觀看記錄" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="QueryLookHistory.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="匯出EXCEL" Value="Export" 
                ClickedImageUrl="~/Common/Images/Icon/icon_m144.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m144.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m144.gif"
                ImageUrl="~/Common/Images/Icon/icon_m144.gif"
                meta:resourcekey="RadToolBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>

    <table id="table1" class="PopTable" cellspacing="1" width="100%">
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label2" runat="server" Text="查詢條件" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td style="white-space: nowrap">
                <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged" meta:resourcekey="ddlTypeResource1">
                    <asp:ListItem Value="Look" Text="已觀看人員" meta:resourcekey="ListItemResource1"></asp:ListItem>
                    <asp:ListItem Value="NoLook" Text="未觀看人員" meta:resourcekey="ListItemResource2"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <br />

    <Fast:Grid ID="grd" runat="server"
        AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" AllowPaging="True"
        CustomDropDownListPage="False"
        DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
        EnhancePager="True" EmptyDataText="沒有資料" KeepSelectedRows="False"
        SelectedRowColor="" UnSelectedRowColor=""
        PageSize="15" Width="100%"
        OnPageIndexChanging="grd_PageIndexChanging" OnSorting="grd_Sorting" OnRowDataBound="grd_RowDataBound"
        meta:resourcekey="grdResource2" >
        <ExportExcelSettings AllowExportToExcel="False" />
        <Columns>
            <asp:BoundField HeaderText="觀看者" DataField="USER_NAME" SortExpression="USER_NAME" meta:resourcekey="BoundFieldResource1">
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="最後觀看時間" SortExpression="CREATE_DATE">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CREATE_DATE") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblCreateDate" runat="server" Text='<%# Bind("CREATE_DATE") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle HorizontalAlign="Center" Wrap="False" />
            </asp:TemplateField>
            <asp:BoundField HeaderText="觀看次數" DataField="LOOK_COUNT" SortExpression="LOOK_COUNT" meta:resourcekey="BoundFieldResource3">
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <EnhancePagerSettings FirstAltImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_01.gif"
            FirstImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_01.gif"
            LastAltImage="&lt;%=themePath %&gt;/images/grid/arrow_04.gif"
            LastImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_04.gif" NextImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_03.gif"
            PreviousImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_02.gif"
            NextIAltImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_03.gif"
            PreviousAltImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_02.gif"
            PageInfoCssClass="GridPagerPagerInfo" PageNumberCssClass="GridPagerNumber"
            PageNumberCurrentCssClass="GridPagerCurrentNumber"
            PageRedirectCssClass="GridPagerPagerInfoRedirect" ShowHeaderPager="True" />
    </Fast:Grid>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblLookUser" runat="server" Text="已觀看人員" Visible="False" meta:resourcekey="lblLookUserResource1"></asp:Label>
    <asp:Label ID="lblNoLookUser" runat="server" Text="未觀看人員" Visible="False" meta:resourcekey="lblNoLookUserResource1"></asp:Label>
    <asp:Label ID="lblLookUserHead" runat="server" Text="觀看者" Visible="False" meta:resourcekey="lblLookUserHeadResource1"></asp:Label>
    <asp:Label ID="lblLastLookDateHead" runat="server" Text="最後觀看時間" Visible="False" meta:resourcekey="lblLastLookDateHeadResource1"></asp:Label>
    <asp:Label ID="lblLookCountHead" runat="server" Text="觀看次數" Visible="False" meta:resourcekey="lblLookCountHeadResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

