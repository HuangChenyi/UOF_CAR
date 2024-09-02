<%@ Page Title="角色權限表" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="UserAuthList.aspx.cs" Inherits="System_Organization_Auth_UserAuthList" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .GridColHiden {
            display: none;           
        }
    </style>

    <table class="PopTable">
        <tr>
            <td style="width: 10%">
                <asp:Label ID="lblGroupTitle" runat="server" Text="部門" meta:resourcekey="lblGroupTitleResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblGroup" runat="server" meta:resourcekey="lblGroupResource1"></asp:Label>
            </td>
            <td style="width: 10%">
                <asp:Label ID="lblNameTitle" runat="server" Text="姓名" meta:resourcekey="lblNameTitleResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
            </td>
            <td style="width: 10%">
                <asp:Label ID="lblModuleTitle" runat="server" Text="模組" meta:resourcekey="lblModuleTitleResource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlDLModule" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDLModule_SelectedIndexChanged" meta:resourcekey="radDLModuleResource1"></asp:DropDownList>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="udpGrdAuth" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
            <Ede:Grid ID="grdAuth" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                AutoGenerateColumns="False" Width="100%" DataKeyOnClientWithCheckBox="False" OnSorting="grdAuth_Sorting"
                PageSize="15" DefaultSortDirection="Ascending" EnhancePager="True" DefaultSortColumnName="MODULE_NAME" OnPageIndexChanging="grdAuth_PageIndexChanging"
                EmptyDataText="沒有資料" KeepSelectedRows="False" OnRowDataBound="grdAuth_RowDataBound" OnBeforeExport="grdAuth_BeforeExport"
                CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="grdAuthResource1">
                <ExportExcelSettings AllowExportToExcel="True" ExportType="GridContent" />
                <EnhancePagerSettings ShowHeaderPager="True" />
                <Columns>
                    <asp:TemplateField HeaderText="帳號" meta:resourcekey="lblGridAccountResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblGridAccount" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="GridColHiden" />
                        <ItemStyle CssClass="GridColHiden" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="姓名" meta:resourcekey="lblGridNameResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblGridName" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="GridColHiden" />
                        <ItemStyle CssClass="GridColHiden" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="員工編號" meta:resourcekey="lblGridEmployeeNOResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblGridEmployeeNO" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="GridColHiden" />
                        <ItemStyle CssClass="GridColHiden" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="部門" meta:resourcekey="lblGridDepResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblGridDep" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="GridColHiden" />
                        <ItemStyle CssClass="GridColHiden" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="模組" DataField="MODULE_NAME" SortExpression="MODULE_NAME" meta:resourcekey="BoundFieldResource1">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False"  />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="角色" DataField="ROLE_NAME" SortExpression="ROLE_NAME" meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="權限" SortExpression="IS_AUTH" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblAuth" runat="server" meta:resourcekey="lblAuthResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="100px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="管理範圍" meta:resourcekey="TemplateFieldResource2">
                         <ItemTemplate>
                            <asp:LinkButton ID="lbtnShowAuthItems" runat="server" Text="觀看" meta:resourcekey="lbtnShowAuthItemsResource1"></asp:LinkButton>
                        </ItemTemplate>                              
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
            </Ede:Grid>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlDLModule" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lblAll" runat="server" Text="全部" Visible="False" meta:resourcekey="lblAllResource1"></asp:Label>

    <asp:Label ID="lblGridRole" runat="server" Text="角色" Visible="False" meta:resourcekey="lblGridRoleResource1"></asp:Label>

    <asp:Label ID="lblGriModule" runat="server" Text="模組" Visible="False" meta:resourcekey="lblGriModuleResource1"></asp:Label>
    <asp:Label ID="lblGriAuth" runat="server" Text="權限" Visible="False" meta:resourcekey="lblGriAuthResource1"></asp:Label>
    <asp:Label ID="lblGridItems" runat="server" Text="管理範圍" Visible="False" meta:resourcekey="lblGridItemsResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hfCurrentCulture" runat="server" />
     <asp:Label ID="lblEmployeeNO" runat="server"  Visible="false" ></asp:Label>
     <asp:Label ID="lblAccount" runat="server"  Visible="false" ></asp:Label>
</asp:Content>
