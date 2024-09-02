<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Duty_Report_QueryAllLeaDetailByManager" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="QueryAllLeaDetailByManager.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="../../../Common/Organization/UC_DeptManagerTree.ascx" TagName="UC_DeptManagerTree" TagPrefix="uc1" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <contenttemplate>
            <uc1:UC_DeptManagerTree ID="UC_DeptManagerTree1" runat="server" ShowSuperiorTree="true" ShowDeptManagerTree="true" DisplayActiveControl="true"/>
                
        </contenttemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>
                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick">
                    <Items>
                        <telerik:RadToolBarButton runat="server">
                            <ItemTemplate>
                                <asp:Label ID="lblQueryUser" runat="server" Text="查詢人員" meta:resourcekey="lblQueryUserResource1"></asp:Label>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="user">
                            <ItemTemplate>
                                <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="subDept">
                            <ItemTemplate>
                                <asp:CheckBox ID="chbChild" runat="server" Text="包含子部門" meta:resourcekey="chbChildResource1" />
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarQueryResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true">
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <contenttemplate>
                        <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                            AutoGenerateColumns="False" Width="100%" DataKeyOnClientWithCheckBox="False"
                            PageSize="15" DefaultSortDirection="Ascending" EnableModelValidation="True" EnhancePager="True"
                            EmptyDataText="沒有資料" KeepSelectedRows="False" OnPageIndexChanging="Grid1_PageIndexChanging"
                            OnRowDataBound="Grid1_RowDataBound" OnSorting="Grid1_Sorting"
                            meta:resourcekey="Grid1Resource1" DefaultSortColumnName="ACCOUNT">
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <EnhancePagerSettings ShowHeaderPager="True" />
                            <Columns>
                                <asp:TemplateField HeaderText="帳號" SortExpression="ACCOUNT" meta:resourcekey="TemplateFieldResource1">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%#: Bind("ACCOUNT") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnUserAccount" runat="server" Text='<%#: Bind("ACCOUNT") %>' meta:resourcekey="lbtnUserAccountResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="200px" Wrap="False" />
                                    <ItemStyle HorizontalAlign="Left" Width="200px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="姓名" meta:resourcekey="BoundFieldResource1" >
                                    <ItemTemplate>
                                       <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="200px" Wrap="False" />
                                    <ItemStyle HorizontalAlign="Left" Width="200px" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="部門" DataField="GROUP_NAME" SortExpression="GROUP_NAME"
                                    meta:resourcekey="BoundFieldResource2">
                                    <HeaderStyle Width="200px" Wrap="False" />
                                    <ItemStyle HorizontalAlign="Left" Width="200px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="帳號停用" SortExpression="IS_SUSPENDED" meta:resourcekey="TemplateFieldResource2">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%#: Bind("IS_SUSPENDED") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblIsSupended" runat="server" Text='<%#: Bind("IS_SUSPENDED") %>' meta:resourcekey="lblIsSupendedResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="100px" Wrap="False" />
                                    <ItemStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="帳號到期日" SortExpression="EXPIRE_DATE" meta:resourcekey="TemplateFieldResource3">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%#: Bind("EXPIRE_DATE") %>' meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblExpireDate" runat="server" Text='<%#: Bind("EXPIRE_DATE") %>' meta:resourcekey="lblExpireDateResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="100px" Wrap="False" />
                                    <ItemStyle Width="100px" />
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </contenttemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:Label ID="Label1" runat="server" Text="內部組織結構列表" meta:resourcekey="Label1Resource1" Visible="false"></asp:Label>
    <asp:Label ID="lblYes" runat="server" Text="是" Visible="False" meta:resourcekey="lblYesResource1"></asp:Label>
    <asp:Label ID="lblNo" runat="server" Text="否" Visible="False" meta:resourcekey="lblNoResource1"></asp:Label>
    <asp:Label ID="lblDialogTitle" runat="server" Text="可休假別時數明細" Visible="False" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
</asp:Content>

