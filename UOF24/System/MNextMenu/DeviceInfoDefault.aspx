<%@ Page Title="行動裝置管理" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="DeviceInfoDefault.aspx.cs" Inherits="System_MNextMenu_DeviceInfoDefault" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Src="~/Common/Organization/DepartmentTree.ascx" TagPrefix="uc1" TagName="DepartmentTree" %>
<%@ Register Src="~/Common/Organization/GroupTree.ascx" TagPrefix="uc1" TagName="GroupTree" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
    <script type="text/javascript">
        function ConfirmRemoveAllDevice() {
            return confirm('<%=lblRemoveAllDevice.Text%>');
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server">
    <telerik:RadTabStrip ID="RadTabStrip1" OnTabClick="RadTabStrip1_TabClick" MultiPageID="rmpDevice" SelectedIndex="0" runat="server" meta:resourcekey="RadTabStrip1Resource1" >
        <Tabs>
            <telerik:RadTab PageViewID="pvEmployee" runat="server" Value="EmployeeTab" Text="內部員工" Selected="true" meta:resourcekey="RadTabResource1" ></telerik:RadTab>
            <telerik:RadTab PageViewID="pvMember" runat="server" Value="MemberTab" Text="外部會員" meta:resourcekey="RadTabResource2" ></telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional" >
        <ContentTemplate>
            
            <telerik:RadMultiPage ID="rmpDevice" runat="server" SelectedIndex="0" meta:resourcekey="rmpDeviceResource1" >
                <telerik:RadPageView ID="rpvEmployee" Selected="True" runat="server" meta:resourcekey="rpvEmployeeResource1" >
                    <uc1:DepartmentTree runat="server" ID="DepartmentTree" DisplayActiveControl="true"/>
                </telerik:RadPageView>
                <telerik:RadPageView ID="rpvMember" runat="server" meta:resourcekey="rpvMemberResource1" >
                    <uc1:GroupTree runat="server" ID="GroupTree" />
                </telerik:RadPageView>
            </telerik:RadMultiPage>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" >
        <ContentTemplate>
            <telerik:RadToolBar ID="rtbSearch" OnButtonClick="rtbSearch_ButtonClick" Width="100%" runat="server" SingleClick="None" meta:resourcekey="rtbSearchResource1">
                <Items>
                    <telerik:RadToolBarButton Value="WithChild" runat="server" meta:resourcekey="RadToolBarButtonResource1">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbWithChild" runat="server" meta:resourcekey="cbWithChildResource1"/>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"/>
                    <telerik:RadToolBarButton Value="UserName" runat="server" meta:resourcekey="RadToolBarButtonResource3">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text="查詢人員" meta:resourcekey="Label2Resource1"></asp:Label>
                            <asp:TextBox ID="txtUserName" runat="server" meta:resourcekey="txtUserNameResource1"></asp:TextBox>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4"/>
                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                Value="Search" Text="查詢" ToolTip="查詢" meta:resourcekey="RadToolBarButtonResource5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6"/>
                </Items>
            </telerik:RadToolBar>
            <asp:Panel ID="pnlEmployee" runat="server" meta:resourcekey="pnlEmployeeResource1">
                <Ede:Grid ID="grdEmpDeviceInfo" runat="server" Width="100%" DataKeyNames="USER_GUID"
                          EmptyDataText="沒有資料" PageSize="15" EnhancePager="True" AutoGenerateColumns="False" 
                          AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                          OnRowDataBound="grdEmpDeviceInfo_RowDataBound"
                          OnPageIndexChanging="grdEmpDeviceInfo_PageIndexChanging"
                          OnSorting="grdEmpDeviceInfo_Sorting"
                          DefaultSortColumnName="GROUP_NAME,ACCOUNT" DefaultSortDirection="Ascending"
                          CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" KeepSelectedRows="False"  SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="grdEmpDeviceInfoResource1">
                    <EnhancePagerSettings ShowHeaderPager="True"/>
                    <HeaderStyle Wrap="False"/>
                    <ExportExcelSettings AllowExportToExcel="False" />
                    <Columns>
                        <asp:TemplateField HeaderText="部門" SortExpression="GROUP_NAME" meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <asp:Label ID="lblGroupName" runat="server" meta:resourcekey="lblGroupNameResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ACCOUNT" HeaderText="帳號" SortExpression="ACCOUNT" meta:resourcekey="BoundFieldResource1">
                            <HeaderStyle Width="150px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="名稱" SortExpression="NAME" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="登入中數量" SortExpression="DEVICE_COUNT" meta:resourcekey="TemplateFieldResource3" >
                            <ItemTemplate>
                                <asp:LinkButton ID="lbEmpAmount" OnClick="lbEmpAmount_Click" runat="server" meta:resourcekey="lbEmpAmountResource1" ></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Width="150px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="管理" meta:resourcekey="TemplateFieldResource4">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbEmpRemoveAll" OnClick="lbEmpRemoveAll_Click" OnClientClick="return ConfirmRemoveAllDevice();" Text="全部解除" runat="server" meta:resourcekey="lbEmpRemoveAllResource1"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Width="150px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                </Ede:Grid>
            </asp:Panel>

            <asp:Panel ID="pnlMember" runat="server" Visible="False" meta:resourcekey="pnlMemberResource1">
                <Ede:Grid ID="grdMemDeviceInfo" runat="server" Width="100%" DataKeyNames="USER_GUID"
                          EmptyDataText="沒有資料" PageSize="15" EnhancePager="True" AutoGenerateColumns="False" 
                          AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                          OnRowDataBound="grdMemDeviceInfo_RowDataBound"
                          OnPageIndexChanging="grdMemDeviceInfo_PageIndexChanging"
                          OnSorting="grdMemDeviceInfo_Sorting"
                          DefaultSortColumnName="ACCOUNT" DefaultSortDirection="Ascending"
                          CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" KeepSelectedRows="False"  SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="grdMemDeviceInfoResource1">
                    <EnhancePagerSettings ShowHeaderPager="True"/>
                    <HeaderStyle Wrap="False"/>
                    <ExportExcelSettings AllowExportToExcel="False" />
                    <Columns>
                        <asp:BoundField DataField="ACCOUNT" HeaderText="帳號" SortExpression="ACCOUNT" meta:resourcekey="BoundFieldResource2">
                            <HeaderStyle Width="150px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="名稱" SortExpression="NAME" meta:resourcekey="TemplateFieldResource5">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource2"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="登入中數量" SortExpression="DEVICE_COUNT" meta:resourcekey="TemplateFieldResource6">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbMemAmount" OnClick="lbMemAmount_Click" runat="server" meta:resourcekey="lbMemAmountResource1"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Width="150px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="管理" meta:resourcekey="TemplateFieldResource7">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbMemRemoveAll" OnClick="lbMemRemoveAll_Click" OnClientClick="return ConfirmRemoveAllDevice();" Text="全部解除" runat="server" meta:resourcekey="lbMemRemoveAllResource1"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Width="150px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                </Ede:Grid>
            </asp:Panel>

            <asp:HiddenField ID="hfEmpWithChild" runat="server" Value="false"/>
            <asp:HiddenField ID="hfEmpSearchName" runat="server"/>
            <asp:HiddenField ID="hfEmpPageIndex" runat="server" Value="0"/>

            <asp:HiddenField ID="hfMemWithChild" runat="server"  Value="false"/>
            <asp:HiddenField ID="hfMemSearchName" runat="server"/>
            <asp:HiddenField ID="hfMemPageIndex" runat="server" Value="0"/>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblEmployeeLeftTitle" runat="server" Text="內部組織結構列表" Visible="False" meta:resourcekey="lblEmployeeLeftTitleResource1"></asp:Label>
    <asp:Label ID="lblMemberLeftTitle" runat="server" Text="外部組織結構列表" Visible="False" meta:resourcekey="lblMemberLeftTitleResource1"></asp:Label>
    <asp:Label ID="lblWithSubDep" runat="server" Text="包含子部門" Visible="False" meta:resourcekey="lblWithSubDepResource1"></asp:Label>
    <asp:Label ID="lblWithSubGrp" runat="server" Text="包含子群組" Visible="False" meta:resourcekey="lblWithSubGrpResource1"></asp:Label>
    <asp:Label ID="lblDeviceManagement" runat="server" Text="行動裝置管理" Visible="False" meta:resourcekey="lblDeviceManagementResource1" ></asp:Label>
    <asp:Label ID="lblRemoveAllDevice" runat="server" Text="確定要解除全部綁定嗎?" Visible="False" meta:resourcekey="lblRemoveAllDeviceResource1"></asp:Label>

</asp:Content>


    
