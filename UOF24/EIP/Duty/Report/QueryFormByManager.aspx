<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Duty_Report_QueryFormByManager" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="QueryFormByManager.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../../Common/Organization/UC_DeptManagerTree.ascx" TagName="UC_DeptManagerTree" TagPrefix="uc2" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
      <script type="text/javascript">
        Sys.Application.add_load(function () {
            var result = $uof.pageMethod.sync("IsAllowRole", []);
            if (result == 'false') {
                alert("<%=lblAllowRoleMsg.Text%>");
                window.location.href = '<%=ResolveUrl("~/Homepage.aspx")%>';
            }
        })        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" >
        <ContentTemplate>
            <uc2:UC_DeptManagerTree ID="dept_Tree" runat="server" OnNodeOnClick="dept_Tree_NodeOnClick" ShowDeptManagerTree="True" ShowSuperiorTree="False"  DisplayActiveControl="true"/>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
            <td>
                  <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>

                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Value="time">
                            <ItemTemplate>
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 30px;" runat="server">
                                            <asp:Label ID="lblSETT" runat="server" Text="類別:" meta:resourcekey="lblSETTResource1"></asp:Label>
                                        </td>
                                        <td runat="server">
                                            <asp:DropDownList ID="ddlSETT" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSETT_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 30px;" runat="server">
                                            <asp:Label ID="lblYear" runat="server" Text="年度:" meta:resourcekey="lblYearResource2"></asp:Label>
                                        </td>
                                        <td id="Td2" runat="server" style="width: 60px;">
                                            <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 30px;" runat="server">
                                            <asp:Label ID="lblClass" runat="server" Text="期別:" meta:resourcekey="lblClassResource1"></asp:Label>
                                        </td>
                                        <td id="Td3" runat="server" style="width: 40px;">
                                            <asp:DropDownList ID="ddlStage" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlStage_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblQueryTime" runat="server" Text="日期:"  meta:resourcekey="lblQueryTimeResource2"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadDatePicker runat="server" ID="rdStartDate"></telerik:RadDatePicker>
                                        </td>
                                        <td>
                                            <asp:Label runat="server" Text="~"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadDatePicker runat="server" ID="rdEndDate"></telerik:RadDatePicker>

                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="subDept">
                            <ItemTemplate>
                                <asp:CheckBox ID="cbxDept" runat="server" Text="包含子部門" meta:resourcekey="cbxDeptResource1" />
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true"  Value="separator">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="subSign">
                            <ItemTemplate>
                                <asp:CheckBox ID="cbxSign" runat="server" Text="未完成簽核" meta:resourcekey="cbxSignResource1" />
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
                 </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <Fast:Grid ID="FormGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                            DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                            EnhancePager="True" PageSize="15" Width="100%" EnableModelValidation="True" KeepSelectedRows="False"
                            AutoGenerateColumns="False" OnRowDataBound="FormGrid_RowDataBound" OnBeforeExport="FormGrid_BeforeExport"
                            OnPageIndexChanging="FormGrid_PageIndexChanging" OnSorting="FormGrid_Sorting"
                            meta:resourcekey="FormGridResource1" DefaultSortColumnName="GROUP_NAME">
                            <EnhancePagerSettings ShowHeaderPager="True"   />
                            <ExportExcelSettings AllowExportToExcel="True" />
                            <Columns>
                                <asp:BoundField DataField="GROUP_NAME" HeaderText="部門" SortExpression="GROUP_NAME"
                                    ItemStyle-Wrap="false" HeaderStyle-Wrap="false" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="FORM_NAME" HeaderText="表單名稱" SortExpression="FORM_NAME"
                                    HeaderStyle-Width="40%" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" meta:resourcekey="BoundFieldResource2" />
                                <asp:BoundField DataField="total" HeaderText="申請數量" SortExpression="total" meta:resourcekey="BoundFieldResource3"
                                    ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="APTotal" HeaderText="完成簽核數量" SortExpression="APTotal"
                                    ItemStyle-Wrap="false" HeaderStyle-Wrap="false" meta:resourcekey="BoundFieldResource4">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="未完成簽核數量" SortExpression="SignTotal" meta:resourcekey="TemplateFieldResource1"
                                    ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnSignTotal" runat="server" Text='<%#:Bind("SignTotal")%>'
                                            Width="50px" meta:resourcekey="lbtnSignTotalResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblTitle" runat="server" Text="未完成簽核表單" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>
    <asp:Label ID="Label7" runat="server" Text="內部組織結構列表" Visible="false" meta:resourcekey="Label7Resource1"></asp:Label>
    <asp:Label ID="lblAllowRoleMsg" runat="server" Text="需有系統管理員、差勤管理員、部門管理員或結算期別維護人員權限才可觀看!" Visible="False" meta:resourcekey="lblAllowRoleMsgResource1"></asp:Label>
    <asp:HiddenField ID="hfRole" runat="server" />
</asp:Content>
