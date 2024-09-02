<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserPermission.ascx.cs" Inherits="Ede.Uof.Web.WKF.Permission.UserPermission" %>
<%@ Register Src="~/Common/Organization/GroupTree.ascx" TagPrefix="uc1" TagName="GroupTree" %>
<%@ Register Src="~/Common/Organization/DepartmentTree.ascx" TagPrefix="uc1" TagName="DepartmentTree" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<script type="text/javascript">
    function TwoColumnRadsplitter1_onLoad(sender) {

    }


</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <telerik:RadSplitter ID="Radsplitter1" runat="server" Orientation="Horizontal"
            Width="100%" PanesBorderSize="0" Height="100%"
            BorderSize="0" LiveResize="True" OnClientLoad="TwoColumnRadsplitter1_onLoad" FullScreenMode="True" meta:resourcekey="Radsplitter1Resource1" OnClientLoaded="TwoColumnRadsplitter1_onLoad" SplitBarsSize="">
            <telerik:RadPane ID="Radpane12" runat="server" Scrolling="None" Index="0" meta:resourcekey="Radpane12Resource1">
                <telerik:RadSplitter ID="Radsplitter2" runat="server" Height="100%" LiveResize="True" Width="100%" FullScreenMode="True" meta:resourcekey="Radsplitter2Resource1" SplitBarsSize="">
                    <telerik:RadPane ID="leftPane" runat="server" Width="300px" Scrolling="None" Index="0" meta:resourcekey="leftPaneResource1">
                        <div class="LeftPaneBackground">
                            <telerik:RadSplitter ID="Radsplitter3" runat="server" Width="100%" Height="100%" Orientation="Horizontal"
                                BorderSize="0" PanesBorderSize="0" LiveResize="True" OnClientLoad="TwoColumnRadsplitter1_onLoad" FullScreenMode="True" meta:resourcekey="Radsplitter3Resource1" OnClientLoaded="TwoColumnRadsplitter1_onLoad" SplitBarsSize="">
                                <telerik:RadPane ID="leftDownPane" runat="server" Index="0" meta:resourcekey="leftDownPaneResource1">
                                    <div id="leftTopPane" runat="server" class="LeftPaneTitle">
                                        <asp:Label ID="lbltitle" runat="server" Text="內部組織結構列表" meta:resourcekey="lbltitleResource1"></asp:Label>
                                    </div>
                                    <uc1:DepartmentTree runat="server" ID="DepartmentTree" DisplayActiveControl="true"/>
                                </telerik:RadPane>
                            </telerik:RadSplitter>
                        </div>
                    </telerik:RadPane>
                    <telerik:RadSplitBar ID="RadSplitbar1" runat="server" CollapseMode="Forward" Index="1" meta:resourcekey="RadSplitbar1Resource1">
                    </telerik:RadSplitBar>
                    <telerik:RadPane ID="Radpane2" runat="server" Index="2" meta:resourcekey="Radpane2Resource1">
                        <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Value="depth" meta:resourcekey="RadToolBarButtonResource1" >
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbDepth" Text="包含子部門" runat="server" meta:resourcekey="cbDepthResource1" />
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2" ></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource3">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource4" ></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton>
                                    <ItemTemplate>
                                        <asp:Label ID="lblMemo" runat="server" Text="*可查詢到停用人員及帳號到期人員" CssClass="SizeMemo" meta:resourcekey="RadToolBarButtonResource5"></asp:Label>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                        <table class="PopTable" style="width:100%">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="人員" meta:resourcekey="Label1Resource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtKeyword" runat="server" meta:resourcekey="txtKeywordResource1"></asp:TextBox>
                                    <asp:Label ID="Label2" runat="server" Text="*可依人員帳號、姓名及員工編號查詢" CssClass="SizeMemo" meta:resourcekey="Label2Resource1"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <Fast:Grid ID="grid1" runat="server" AllowPaging="True" AllowSorting="True" OnPageIndexChanging="grid1_PageIndexChanging"
                                    AutoGenerateCheckBoxColumn="False" OnRowDataBound="grid1_RowDataBound" OnSorting="grid1_Sorting"
                                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" DefaultSortColumnName="ACCOUNT"
                                    EmptyDataText="沒有資料" EnhancePager="True" PageSize="15"
                                    Width="100%" KeepSelectedRows="False" OnBeforeExport="grid1_BeforeExport"
                                    AutoGenerateColumns="False"  CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="grid1Resource1"   >
                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="True" DataSourceType="ObjectDataSource" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="帳號" SortExpression="ACCOUNT" meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnAccount" runat="server" Text='<%# Bind("IS_LOCKED_OUT") %>' meta:resourcekey="lbtnAccountResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" Width="10%"/>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="NAME" HeaderText="姓名" SortExpression="NAME" meta:resourcekey="BoundFieldResource1">
                                            <ItemStyle Wrap="False" Width="20%"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="EMPLOYEE_NO" HeaderText="員工編號" SortExpression="EMPLOYEE_NO" meta:resourcekey="BoundFieldResource2">
                                            <ItemStyle Wrap="False" Width="10%"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="GROUP_NAME" HeaderText="部門" SortExpression="GROUP_NAME" meta:resourcekey="BoundFieldResource3">
                                            <ItemStyle Wrap="False" Width="20%"/>
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="帳號鎖定" SortExpression="IS_LOCKED_OUT" meta:resourcekey="TemplateFieldResource2">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLock" runat="server" meta:resourcekey="lblLockResource1" ></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" Width="10%"/>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="帳號停用" SortExpression="IS_SUSPENDED" meta:resourcekey="TemplateFieldResource3">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSuspended" runat="server" meta:resourcekey="lblSuspendedResource1"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" Width="10%"/>
                                        </asp:TemplateField>
                                       <asp:BoundField DataField="EXPIRE_DATE" DataFormatString="{0:d}" HeaderText="帳號到期日" HtmlEncode="False" SortExpression="EXPIRE_DATE" meta:resourcekey="BoundFieldResource4">
                                           <ItemStyle Wrap="False" Width="15%"/>
                                       </asp:BoundField>
                                    </Columns>
                                </Fast:Grid>
                    </telerik:RadPane>
                </telerik:RadSplitter>
            </telerik:RadPane>
        </telerik:RadSplitter>
        <asp:Label runat="server" ID="lbYes" Text="是" Visible="False" meta:resourcekey="lbYesResource1" ></asp:Label>
        <asp:Label runat="server" ID="lbNo" Text="否" Visible="False" meta:resourcekey="lbNoResource1" ></asp:Label>
         <asp:Label runat="server" ID="lblPermission" Text="表單權限表" Visible="False" meta:resourcekey="lblPermissionResource1" ></asp:Label>
    </ContentTemplate>
</asp:UpdatePanel>
