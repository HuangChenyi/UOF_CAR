<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="System_Organization_Employee_ExpSusDefault" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="ExpSusDefault.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../../Common/Organization/DepartmentTree.ascx" TagName="DepartmentTree" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server" Height="0">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblTreeList" runat="server" Text="內部組織結構列表" Visible="False" meta:resourcekey="lblTreeListResource1"></asp:Label>
            <table>
                <tr>
                    <td>
                        <uc1:DepartmentTree ID="DepartmentTree1" runat="server" DisplayActiveControl="true"/>
                        <asp:LinkButton ID="lbtnSearch" runat="server" meta:resourcekey="lbtnSearchResource1"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Value="subDept" meta:resourcekey="RadToolBarButtonResource3">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbSubDept" runat="server" Text="包含子部門" meta:resourcekey="cbSubDeptResource1" />
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True">
                                </telerik:RadToolBarButton> 
                                <telerik:RadToolBarButton runat="server" Value="Keyword" meta:resourcekey="RadToolBarButtonResource1">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="txtKeyword" meta:resourcekey="txtKeywordResource1"></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    Value="Search" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    Text="搜尋人員" meta:resourcekey="TBarButtonResource20">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input id="hideSource" runat="server" type="hidden" /></input>
                        </input>
                        </input>
                        <Fast:Grid ID="grdExpSus" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" 
                            CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Descending" 
                            EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" DefaultSortColumnName="DATESHOW"
                            meta:resourceKey="grdExpSusResource1" OnPageIndexChanging="grdExpSus_PageIndexChanging" OnRowDataBound="grdExpSus_RowDataBound" 
                            OnSorting="grdExpSus_Sorting" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" Width="100%">
                            <enhancepagersettings showheaderpager="True" />
                            <exportexcelsettings allowexporttoexcel="False" />
                            <Columns>
                                <asp:BoundField DataField="GROUP_NM" HeaderText="部門" meta:resourceKey="BoundFieldResource1" SortExpression="GROUP_NM"></asp:BoundField>
                                <asp:TemplateField HeaderText="帳號" meta:resourceKey="TemplateFieldResource1" SortExpression="ACCOUNT">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnAcc" runat="server" meta:resourceKey="lbtnAccResource1" Text='<%#: Eval("ACCOUNT") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="NAME" HeaderText="名稱" meta:resourceKey="BoundFieldResource2" SortExpression="NAME"></asp:BoundField>
                                <asp:TemplateField HeaderText="停用日期" meta:resourcekey="TemplateFieldResource5" SortExpression="DATESHOW">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSuspendedDateShow" runat="server" meta:resourcekey="lblSuspendedDateShowResource1" Text='<%# Bind("DATESHOW") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="200px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="待簽表單" meta:resourceKey="TemplateFieldResource2" SortExpression="COUNT">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnWKF" runat="server" meta:resourceKey="lbtnWKFResource1" Text='<%# Eval("COUNT") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="權限複製" meta:resourceKey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnCopy" runat="server" meta:resourceKey="lbtnCopyResource1" Text="複製"></asp:LinkButton>
                                        <asp:Label ID="lblDATESHOW" runat="server" meta:resourceKey="lblDATESHOWResource1" Text='<%# Eval("DATESHOW") %>' Visible="False"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="GUID" meta:resourceKey="TemplateFieldResource4" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStopGUID" runat="server" meta:resourceKey="lblStopGUIDResource1" Text='<%# Eval("USER_GUID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblNewWKFTitle" runat="server" Text="待簽表單批次指定簽核人員" Style="display: none" meta:resourcekey="lblNewWKFTitleResource1"></asp:Label>
            <asp:Label ID="lblCopyTitle" runat="server" Text="新增人員" Style="display: none" meta:resourcekey="lblCopyTitleResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
