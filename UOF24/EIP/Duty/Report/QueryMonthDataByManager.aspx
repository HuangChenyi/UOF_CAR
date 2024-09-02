<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Duty_Report_QueryMonthDataByManager" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="QueryMonthDataByManager.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Src="../../../Common/Organization/UC_DeptManagerTree.ascx" TagName="UC_DeptManagerTree" TagPrefix="uc2" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <uc2:UC_DeptManagerTree ID="dept_Tree" runat="server" ShowDeptManagerTree="True" ShowSuperiorTree="True" DisplayActiveControl="true"/>
        </ContentTemplate>
    </asp:UpdatePanel>   
    
                                                    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
            <td>
                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Value="time" meta:resourcekey="RadToolBarButtonResource1">
                            <ItemTemplate>
                                <table id="Table1" style="width: 100%;" runat="server" cellpadding="0" cellspacing="0">
                                    <tr id="Tr1" runat="server">
                                        <td id="Td1" runat="server">
                                            &nbsp;
                                        </td>
                                        <td id="Td2" runat="server">
                                            <asp:Label ID="lblQueryTime" runat="server" Text="查詢時間：" meta:resourcekey="lblQueryTimeResource1"></asp:Label>
                                        </td>
                                        <td id="Td3" runat="server">
                                            <asp:DropDownList ID="ddlYear_Start" runat="server">
                                            </asp:DropDownList>
                                            <asp:Label ID="lblYear_S" runat="server" Text="年" meta:resourcekey="lblYear_SResource1"></asp:Label>
                                        </td>
                                        <td id="Td4" runat="server">
                                            <asp:DropDownList ID="ddlMonth_Start" runat="server">
                                            </asp:DropDownList>
                                            <asp:Label ID="lblMonth_S" runat="server" Text="月～" meta:resourcekey="lblMonth_SResource1"></asp:Label>
                                        </td>
                                        <td id="Td5" runat="server">
                                            <asp:DropDownList ID="ddlYear_End" runat="server">
                                            </asp:DropDownList>
                                            <asp:Label ID="lblYear_E" runat="server" Text="年" meta:resourcekey="lblYear_EResource1"></asp:Label>
                                        </td>
                                        <td id="Td6" runat="server">
                                            <asp:DropDownList ID="ddlMonth_End" runat="server">
                                            </asp:DropDownList>
                                            <asp:Label ID="lblMonth_E" runat="server" Text="月" meta:resourcekey="lblMonth_EResource1"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="subDept" meta:resourcekey="RadToolBarButtonResource3">
                            <ItemTemplate>
                                <asp:CheckBox ID="cbxDept" runat="server" Text="包含子部門" meta:resourcekey="cbxDeptResource1" />
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarQueryResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource5">
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" ErrorMessage="起的時間不可晚於訖的時間"
                    Display="Dynamic" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <Fast:Grid ID="DutyGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                            DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" DefaultSortColumnName="ACCOUNT" EmptyDataText="沒有資料"
                            EnhancePager="True" meta:resourcekey="gridItemResource1" PageSize="15" Width="100%" KeepSelectedRows="False" AutoGenerateColumns="False"
                            OnRowDataBound="DutyGrid_RowDataBound" OnPageIndexChanging="DutyGrid_PageIndexChanging"
                            OnBeforeExport="DutyGrid_BeforeExport" OnSorting="DutyGrid_Sorting" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                            <EnhancePagerSettings ShowHeaderPager="True" />
                            <ExportExcelSettings AllowExportToExcel="True" DataSourceType="ObjectDataSource" />
                            <Columns>
                                <asp:TemplateField HeaderText="帳號" SortExpression="ACCOUNT" meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnlink" runat="server" Text='<%#: Bind("ACCOUNT") %>' meta:resourcekey="lbtnlinkResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="姓名" SortExpression="NAME" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAccount" runat="server" Text='<%#: Bind("NAME") %>' meta:resourcekey="lblAccountResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="員工編號" SortExpression="EMPLOYEE_NO" meta:resourcekey="TemplateFieldEMOResource1">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnempnolink" runat="server" Text='<%#: Bind("EMPLOYEE_NO") %>' meta:resourcekey="lbtnempnolinkResource1" ></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="部門名稱" SortExpression="GROUP_NAME" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDeptName" runat="server" Text='<%#: Bind("GROUP_NAME") %>' meta:resourcekey="lblDeptNameResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
           
    <asp:Label ID="Label7" runat="server" Text="內部組織結構列表" meta:resourcekey="Label7Resource1" Visible="False"></asp:Label>
    <asp:Label ID="lblDayCount" runat="server" Text="日數" Visible="False" meta:resourcekey="lblDayCountResource1"></asp:Label>
    <asp:Label ID="lblHrCount" runat="server" Text="時數" Visible="False" meta:resourcekey="lblHrCountResource1"></asp:Label>
    <asp:Label ID="lblAccountName" runat="server" Text="帳號" Visible="False" meta:resourcekey="lblAccountNameResource1"></asp:Label>
    <asp:Label ID="lblUserName" runat="server" Text="姓名" Visible="False" meta:resourcekey="lblUserNameResource1"></asp:Label>
    <asp:Label ID="lblEmpNO" runat="server" Text="員工編號" Visible="False" meta:resourcekey="lblEmpNOResource1"></asp:Label>
    <asp:Label ID="lblDeptName" runat="server" Text="部門名稱" Visible="False" meta:resourcekey="lblDeptNameResource2"></asp:Label>
    <asp:Label ID="lblLate" runat="server" Text="遲到次數" Visible="False" meta:resourcekey="lblLateResource1"></asp:Label>
    <asp:Label ID="lblAbsent" runat="server" Text="曠職時數" Visible="False" meta:resourcekey="lblAbsentResource1"></asp:Label>
    <asp:Label ID="lblOvertime" runat="server" Text="加班轉費用時數" Visible="False" meta:resourcekey="lblOvertimeResource1"></asp:Label>
    <asp:Label ID="lblOvertimeT" runat="server" Text="加班轉補休時數" Visible="False" meta:resourcekey="lblOverTimeTResource1"></asp:Label>
    <asp:Label ID="lblTravel" runat="server" Text="出差時數" Visible="False" meta:resourcekey="lblTravelResource1"></asp:Label>
    <asp:Label ID="lblHour" runat="server" Text="時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
    <asp:Label ID="lblDay" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
</asp:Content>

