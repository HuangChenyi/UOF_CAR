<%@ Page Title="異動記錄" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Employee_JobHistory" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="JobHistory.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <Fast:Grid ID="grid" runat="server" AutoGenerateCheckBoxColumn="False" Width="100%"
        AllowSorting="True" AutoGenerateColumns="False"
        DataKeyOnClientWithCheckBox="False" EnhancePager="True"
        PageSize="15" AllowPaging="True"
        OnBeforeExport="grid_BeforeExport" OnPageIndexChanging="grid_PageIndexChanging"
        OnRowCommand="grid_RowCommand" OnRowDataBound="grid_RowDataBound"
        KeepSelectedRows="False" meta:resourcekey="gridResource1"
        EmptyDataText="沒有資料" OnSorting="grid_Sorting"
        DefaultSortDirection="Ascending" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
        <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>

        <ExportExcelSettings AllowExportToExcel="true" DataSourceType="DataTable" ExcelExportFileName="JobHistory.xls"></ExportExcelSettings>
        <Columns>
            <asp:TemplateField HeaderText="異動型態" meta:resourcekey="TemplateFieldResource1" HeaderStyle-Wrap="false"
                SortExpression="ORDERS">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnOrders" runat="server"
                        meta:resourcekey="lbtnOrdersResource1"></asp:LinkButton>
                </ItemTemplate>

                <HeaderStyle Wrap="False"></HeaderStyle>

                <ItemStyle Width="80px" HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="異動前資料" meta:resourcekey="TemplateFieldResource2" HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="lblOldJobInfo" runat="server"
                        meta:resourcekey="lblOldJobInfoResource1"></asp:Label>
                </ItemTemplate>

                <HeaderStyle Wrap="False"></HeaderStyle>

                <ItemStyle Width="250px" HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="異動後資料" meta:resourcekey="TemplateFieldResource3" HeaderStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="lblJobInfo" runat="server"
                        meta:resourcekey="lblJobInfoResource1"></asp:Label>
                </ItemTemplate>

                <HeaderStyle Wrap="False"></HeaderStyle>

                <ItemStyle Width="250px" HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="修改者" meta:resourcekey="TemplateFieldResource4" HeaderStyle-Wrap="false"
                SortExpression="MODIFIER">
                <ItemTemplate>
                    <asp:Label ID="lblModifier" runat="server"
                        meta:resourcekey="lblModifierResource1"></asp:Label>
                </ItemTemplate>

                <HeaderStyle Wrap="False"></HeaderStyle>

                <ItemStyle Width="100px" HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="MODIFY_FROM" HeaderText="IP" HeaderStyle-Wrap="false"
                meta:resourcekey="BoundFieldResource4" SortExpression="MODIFY_FROM">
                <HeaderStyle Wrap="False"></HeaderStyle>

                <ItemStyle Width="80px" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="修改時間" SortExpression="MODIFY_TIME" meta:resourcekey="TemplateFieldResource5">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MODIFY_TIME") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblModifyTime" runat="server" Text='<%# Bind("MODIFY_TIME") %>' meta:resourcekey="lblModifyTimeResource1"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle HorizontalAlign="Left" Width="110px" Wrap="False" />
            </asp:TemplateField>
            <asp:BoundField DataField="EFF_DATE" DataFormatString="{0:yyyy/MM/dd}"
                HeaderText="生效日期" meta:resourcekey="BoundFieldResource2" HeaderStyle-Wrap="false"
                SortExpression="EFF_DATE">
                <HeaderStyle Wrap="False"></HeaderStyle>

                <ItemStyle Width="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="REMARK" HeaderText="備註" HeaderStyle-Wrap="false"
                meta:resourcekey="BoundFieldResource3">
                <HeaderStyle Wrap="False"></HeaderStyle>

                <ItemStyle Width="150px" HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
    </Fast:Grid>

    <asp:Label ID="lblDept" runat="server" Text="部門：" Visible="False"
        meta:resourcekey="lblDeptResource1"></asp:Label>
    <asp:Label ID="lblFunc" runat="server" Text="職務：" Visible="False"
        meta:resourcekey="lblFuncResource1"></asp:Label>
    <asp:Label ID="lblTitle" runat="server" Text="職級：" Visible="False"
        meta:resourcekey="lblTitleResource1"></asp:Label>
    <asp:Label ID="lblMasterDept" runat="server" Text="主要部門" Visible="False"
        meta:resourcekey="lblMasterDeptResource1"></asp:Label>
    <asp:Label ID="lblPlus1" runat="server" Text="兼任1" Visible="False"
        meta:resourcekey="lblPlus1Resource1"></asp:Label>
    <asp:Label ID="lblPlus2" runat="server" Text="兼任2" Visible="False"
        meta:resourcekey="lblPlus2Resource1"></asp:Label>
    <asp:Label ID="lblPlus3" runat="server" Text="兼任3" Visible="False" meta:resourcekey="lblPlus3Resource1"></asp:Label>
    <asp:Label ID="lblPlus4" runat="server" Text="兼任4" Visible="False" meta:resourcekey="lblPlus4Resource1"></asp:Label>
    <asp:Label ID="lblPlus5" runat="server" Text="兼任5" Visible="False" meta:resourcekey="lblPlus5Resource1"></asp:Label>
    <asp:Label ID="lblPlus6" runat="server" Text="兼任6" Visible="False" meta:resourcekey="lblPlus6Resource1"></asp:Label>
    <asp:Label ID="lblPlus7" runat="server" Text="兼任7" Visible="False" meta:resourcekey="lblPlus7Resource1"></asp:Label>
    <asp:Label ID="lblPlus8" runat="server" Text="兼任8" Visible="False" meta:resourcekey="lblPlus8Resource1"></asp:Label>
    <asp:Label ID="lblPlus9" runat="server" Text="兼任9" Visible="False" meta:resourcekey="lblPlus9Resource1"></asp:Label>
    <asp:Label ID="lblTask" runat="server" Text="排程" Visible="False" meta:resourcekey="lblTaskResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

