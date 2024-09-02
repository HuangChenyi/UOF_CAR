<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="QueryAuthorizationAccount.aspx.cs" Inherits="Ede.Uof.Web.Sys.Authorization.QueryAuthorizationAccount" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function RadToolBar1_ButtonClicking(sender, args) {
            var Key = args.get_item().get_value();
            if (Key == "Enable") {
                if (!confirm('<%=lblEnable.Text%>')) {
                    arg.set_cancel(true);
                }
            }
            else if (Key == "Disable") {
                if (!confirm('<%= lblDisable.Text %>')) {
                    arg.set_cancel(true);
                }
            }

        }
    </script>
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_ButtonClicking">
        <Items>
            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m49b.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m49b.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m49b.gif" ImageUrl="~/Common/Images/Icon/icon_m49b.gif" meta:resourcekey="RadToolBarSerachResource1"
                Text="帳號啟用" Value="Enable">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m46.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m46.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m46.gif" ImageUrl="~/Common/Images/Icon/icon_m46.gif" meta:resourcekey="RadToolBarSerachResource1"
                Text="帳號停用" Value="Disable">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="Authorization">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text="授權"></asp:Label>
                    <asp:DropDownList ID="ddlAuthorization" runat="server">
                        <asp:ListItem Text="全部" Value="" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="是" Value="True"></asp:ListItem>
                        <asp:ListItem Text="否" Value="False"></asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="Keyword">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text="查詢人員"></asp:Label>
                    <asp:TextBox ID="txtKeyword" runat="server"></asp:TextBox>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarSerachResource1"
                Text="查詢" Value="Query">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text="系統管理員不在授權計算範圍中" ForeColor="Blue"></asp:Label>
                </ItemTemplate>
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Ede:Grid ID="grdAuthorizationAccount" runat="server" AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="True" AllowPaging="True"
                CustomDropDownListPage="False" DataKeyNames="USER_GUID" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" Width="100%"
                OnPageIndexChanging="grdAuthorizationAccount_PageIndexChanging" OnRowDataBound="grdAuthorizationAccount_RowDataBound"
                OnBeforeExport="grdAuthorizationAccount_BeforeExport" AllowSorting="True" DefaultSortColumnName="CREATE_DATE" OnSorting="grdAuthorizationAccount_Sorting" meta:resourcekey="grdAuthorizationAccountResource1">
                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

                <ExportExcelSettings AllowExportToExcel="True" DataSourceType="ObjectDataSource"></ExportExcelSettings>
                <Columns>
                    <asp:BoundField DataField="GROUP_NAME" HeaderText="部門/群組" SortExpression="GROUP_NAME" meta:resourcekey="BoundFieldResource1">
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" Width="15%" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="帳號" SortExpression="ACCOUNT" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnAccount" runat="server" Text='<%#: Eval("ACCOUNT") %>' OnClick="lbtnAccount_Click" meta:resourcekey="lbtnAccountResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" Width="15%" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="NAME" HeaderText="名稱" SortExpression="NAME" meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" Width="15%" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="鎖定" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblLock" runat="server" Text='<%# Bind("IS_LOCKED_OUT") %>' meta:resourcekey="lblLockResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" Width="10%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="停用" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblSuspended" runat="server" Text='<%# Bind("IS_SUSPENDED") %>' meta:resourcekey="lblSuspendedResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" Width="10%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="到期日" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:Label ID="lblExpireDate" runat="server" Text='<%# Bind("EXPIRE_DATE", "{0:d}") %>' meta:resourcekey="lblExpireDateResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="建立日期" SortExpression="CREATE_DATE" meta:resourcekey="BoundFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblCreateDate" runat="server" Text='<%# Bind("CREATE_DATE") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="授權" SortExpression="ANTHORIZATION" meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblHasAuthorization" Text="V" Visible="False" meta:resourcekey="lblHasAuthorizationResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
            </Ede:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hfLicenseCount" runat="server" Value="0"/>
    <asp:HiddenField ID="hfNowIndex" runat="server" />
    <asp:HiddenField ID="hideServerLicense" runat="server" />

    <asp:Label runat="server" ID="lblYes" Text="是" Visible="False" meta:resourcekey="lblYesResource1"></asp:Label>
    <asp:Label runat="server" ID="lblNo" Text="否" Visible="False" meta:resourcekey="lblNoResource1"></asp:Label>
    <asp:Label runat="server" ID="lblEnable" Text="確定要啟用帳號?" Visible="False" meta:resourcekey="lblEnableResource1"></asp:Label>
    <asp:Label runat="server" ID="lblDisable" Text="確定要停用帳號?" Visible="False" meta:resourcekey="lblDisableResource1"></asp:Label>
</asp:Content>
