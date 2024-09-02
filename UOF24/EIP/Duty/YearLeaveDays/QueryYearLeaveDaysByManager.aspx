<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="QueryYearLeaveDaysByManager.aspx.cs" Inherits="Ede.Uof.Web.EIP.Duty.YearLeaveDays.QueryYearLeaveDaysByManager" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="~/Common/Organization/UC_DeptManagerTree.ascx" TagPrefix="uc1" TagName="UC_DeptManagerTree" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <uc1:UC_DeptManagerTree runat="server" ID="UC_DeptManagerTree" ShowDeptManagerTree="true" ShowDeptPersonalTree="false" ShowSuperiorTree="false" OnNodeOnClick="UC_DeptManagerTree_NodeOnClick" DisplayActiveControl="true"/>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" OnButtonClick="RadToolBar1_ButtonClick" Width="100%" SingleClick="None" meta:resourcekey="RadToolBar1Resource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="subDept" meta:resourcekey="RadToolBarButtonResource1">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbSubDept" runat="server" Text="包含子部門" meta:resourcekey="cbSubDeptResource1"/>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="查詢" Value="Query" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource4">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <table class="PopTable" style="width:100%" >
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="查詢方式" meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="rbByYear" Text="依年度" runat="server" Checked="True" GroupName="SearchType" AutoPostBack="True" OnCheckedChanged="rbByYear_CheckedChanged" meta:resourcekey="rbByYearResource1" />
                        <asp:DropDownList ID="ddlYear" runat="server" meta:resourcekey="ddlYearResource1">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlRange" runat="server" meta:resourcekey="ddlRangeResource1">
                            <asp:ListItem Value="0" Selected="True" Text="全部" meta:resourcekey="ListItemResource1"></asp:ListItem>
                            <asp:ListItem Value="1" Text="今年" meta:resourcekey="ListItemResource2"></asp:ListItem>
                            <asp:ListItem Value="2" Text="去年保留" meta:resourcekey="ListItemResource3"></asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <asp:RadioButton ID="rbByRange" Text="依到期日" runat="server" GroupName="SearchType" AutoPostBack="True" OnCheckedChanged="rbByYear_CheckedChanged" meta:resourcekey="rbByRangeResource1" />
                        <telerik:RadDatePicker ID="rdBegin" runat="server" meta:resourcekey="rdBeginResource1">
                        </telerik:RadDatePicker>
                        <asp:Label ID="Label8" runat="server" Text="~" meta:resourcekey="Label8Resource1"></asp:Label>
                        <telerik:RadDatePicker ID="rdEnd" runat="server" meta:resourcekey="rdEndResource1">
                        </telerik:RadDatePicker>
                    </td>
                </tr>              
                <tr>
                    <td >
                        <asp:Label ID="Label6" runat="server" Text="人員" meta:resourcekey="Label6Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUser" runat="server" meta:resourcekey="txtUserResource1"></asp:TextBox>
                    </td>                    
                </tr>
            </table>
            <Ede:Grid ID="grdYearLeaveDays" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                      AllowPaging="True" AllowSorting="True" OnPageIndexChanging="grdYearLeaveDays_PageIndexChanging" OnSorting="grdYearLeaveDays_Sorting"
                      OnRowDataBound="grdYearLeaveDays_RowDataBound" CustomDropDownListPage="False" 
                      DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" DefaultSortColumnName="ACCOUNT"
                      EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor=""
                      OnBeforeExport="grdYearLeaveDays_BeforeExport" Width="100%" meta:resourcekey="grdYearLeaveDaysResource1">

                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                <ExportExcelSettings AllowExportToExcel="True" />
                <Columns>
                    <asp:BoundField HeaderText="帳號" DataField="ACCOUNT" SortExpression="ACCOUNT" meta:resourcekey="BoundFieldResource1"/>
                    <asp:BoundField HeaderText="姓名" DataField="NAME" SortExpression="NAME" meta:resourcekey="BoundFieldResource2"/>
                    <asp:TemplateField HeaderText="姓名" meta:resourcekey="BoundFieldResource2" >
                      <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                     </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="員工編號" DataField="EMPLOYEE_NO" SortExpression="EMPLOYEE_NO" meta:resourcekey="BoundFieldResource3"/>
                    <asp:BoundField HeaderText="部門" DataField="GROUP_NAME" SortExpression="GROUP_NAME" meta:resourcekey="BoundFieldResource4"/>
                    <asp:BoundField HeaderText="可用年休" DataField="DAYS" SortExpression="DAYS" meta:resourcekey="BoundFieldResource5">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="已用年休" DataField="USED_DAYS" SortExpression="USED_DAYS" meta:resourcekey="BoundFieldResource6">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="剩餘年休" DataField="REMINE_DAYS" SortExpression="REMINE_DAYS" meta:resourcekey="BoundFieldResource7">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="單位" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblUnit" runat="server" meta:resourcekey="lblUnitResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="使用期限(起)" DataField="BEGIN" DataFormatString="{0:yyyy/MM/dd}" meta:resourcekey="BoundFieldResource8" SortExpression="BEGIN">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="使用期限(訖)" DataField="END" DataFormatString="{0:yyyy/MM/dd}" meta:resourcekey="BoundFieldResource9" SortExpression="END" >
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="備註" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblRemark" runat="server" meta:resourcekey="lblRemarkResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </Ede:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="Label3" runat="server" Text="內部組織結構列表" Visible="False" meta:resourcekey="Label3Resource1"></asp:Label>
    <asp:Label ID="lblExtend" runat="server" Text="去年度保留" Visible="False" meta:resourcekey="lblExtendResource1"></asp:Label>
    <asp:Label ID="lblDayUnit" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayUnitResource1"></asp:Label>
    <asp:Label ID="lblHourUnit" runat="server" Text="時" Visible="False" meta:resourcekey="lblHourUnitResource1"></asp:Label>
</asp:Content>
