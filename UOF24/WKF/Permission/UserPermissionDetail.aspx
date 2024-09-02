<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="UserPermissionDetail.aspx.cs" Inherits="Ede.Uof.Web.WKF.Permission.UserPermissionDetail" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .ColumnHide {
            display:none;
        }
    </style>
    <asp:UpdatePanel ID="updatepanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable" style="width: 100%">
                <tr style="width: 100%">
                    <td style="width: 20%">
                        <asp:Label ID="Label1" runat="server" Text="部門" meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td style="width: 30%">
                        <asp:Label ID="lblDept" runat="server" meta:resourcekey="lblDeptResource1"></asp:Label>
                    </td>
                    <td style="width: 20%">
                        <asp:Label ID="Label2" runat="server" Text="姓名" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td style="width: 30%">
                        <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                    </td>
                </tr>
                <tr style="width: 100%">
                    <td style="width: 20%">
                        <asp:Label ID="Label3" runat="server" Text="表單類別" meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td style="width: 30%">
                        <asp:DropDownList ID="ddlFormCategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFormCategory_SelectedIndexChanged" meta:resourcekey="ddlFormCategoryResource1"></asp:DropDownList>
                    </td>
                    <td style="width: 20%">
                        <asp:Label ID="Label4" runat="server" Text="表單名稱" meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>
                    <td style="width: 30%">
                        <asp:DropDownList ID="ddlFormNames" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFormNames_SelectedIndexChanged" meta:resourcekey="ddlFormNamesResource1"></asp:DropDownList>
                    </td>
                </tr>
            </table>
            <Fast:Grid ID="grid1" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateCheckBoxColumn="False" OnRowDataBound="grid1_RowDataBound" OnSorting="grid1_Sorting"
                DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" DefaultSortColumnName="CATEGORY_ID"
                EmptyDataText="沒有資料" EnhancePager="True" PageSize="15" OnPageIndexChanging="grid1_PageIndexChanging"
                Width="100%" KeepSelectedRows="False" OnBeforeExport="grid1_BeforeExport"
                AutoGenerateColumns="False" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="grid1Resource1">
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="True" DataSourceType="ObjectDataSource" />
                <Columns>
                     <asp:TemplateField HeaderText="帳號" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblAccount" meta:resourcekey="lblAccountResource1"></asp:Label>
                        </ItemTemplate>
                         <HeaderStyle CssClass="ColumnHide" />
                         <ItemStyle CssClass="ColumnHide" />
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="姓名" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblName" meta:resourcekey="lblNameResource2"></asp:Label>
                        </ItemTemplate>
                         <HeaderStyle CssClass="ColumnHide" />
                         <ItemStyle CssClass="ColumnHide" />
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="員工編號" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblNo" meta:resourcekey="lblNoResource1"></asp:Label>
                        </ItemTemplate>
                         <HeaderStyle CssClass="ColumnHide" />
                         <ItemStyle CssClass="ColumnHide" />
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="部門" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblGroup" meta:resourcekey="lblGroupResource1"></asp:Label>
                        </ItemTemplate>
                         <HeaderStyle CssClass="ColumnHide" />
                         <ItemStyle CssClass="ColumnHide" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="表單類別" DataField="CATEGORY_ID" SortExpression="CATEGORY_ID" meta:resourcekey="BoundFieldResource1">
                        <ItemStyle Wrap="False" Width="30%" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="表單名稱" DataField="FORM_ID" SortExpression="FORM_ID" meta:resourcekey="BoundFieldResource2">
                        <ItemStyle Wrap="False" Width="30%"/>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="表單使用者" SortExpression="WKFUser" meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblWKFUser" meta:resourcekey="lblWKFUserResource1"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" Width="10%" HorizontalAlign="Center"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="表單負責人" SortExpression="WKFResponsible" meta:resourcekey="TemplateFieldResource6">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblWKFResponsible" meta:resourcekey="lblWKFResponsibleResource1"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" Width="10%" HorizontalAlign="Center"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="表單查閱者" SortExpression="WKFReader" meta:resourcekey="TemplateFieldResource7">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblWKFReader" meta:resourcekey="lblWKFReaderResource1"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" Width="10%" HorizontalAlign="Center"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="表單歸檔者" SortExpression="WKFArchiveUser" meta:resourcekey="TemplateFieldResource8">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblWKFArchiveUser" meta:resourcekey="lblWKFArchiveUserResource1"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" Width="10%" HorizontalAlign="Center"/>
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
            <asp:Label ID="lblAll" runat="server" Text="全部" Visible="False" meta:resourcekey="lblAllResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
