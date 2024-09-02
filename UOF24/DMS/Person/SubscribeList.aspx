<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="DMS_Person_SubscribeList" Title="訂閱清單" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" Codebehind="SubscribeList.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script id="SubscribeListjs" type="text/javascript">
        function RadFolderToolbar1_Click(sender, args) {
            if (args.get_item().get_value() == "Delete")
                if (confirm('<%=lblConfirmDelete.Text %>') == false)
                    args.set_cancel(true);
        }

    </script>
    <table style="width: 100%;">
        <tr>
            <td >
                <telerik:RadToolBar ID="RadFolderToolbar1" runat="server" Width="100%" OnButtonClick="RadFolderToolbar1_ButtonClicked" OnClientButtonClicking="RadFolderToolbar1_Click" meta:resourcekey="barMainResource1">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Enabled="true" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" Text="取消訂閱" Value="Delete" meta:resourcekey="TBarButtonResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource2" />
                        <telerik:RadToolBarButton runat="server" Value="QUERY1">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="訂閱項目" ForeColor="Blue" meta:resourcekey="TBLabelResource1"></asp:Label>
                                <asp:Label ID="lblSubscribecount" runat="server" Text="" ForeColor="Blue"></asp:Label>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                            AutoGenerateColumns="False"
                            Width="100%" DataKeyNames="USER_ID,ROLE_ID,INFORM_CASE" AllowPaging="True" DataKeyOnClientWithCheckBox="False" OnRowDataBound="Grid1_RowDataBound" OnPageIndexChanging="Grid1_PageIndexChanging" EnhancePager="True" OnSorting="Grid1_Sorting" PageSize="15"  DefaultSortDirection="Ascending" EmptyDataText="No data found" KeepSelectedRows="False"  >
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="訂閱項目" meta:resourcekey="TemplateFieldResource1" SortExpression="ROLE_ID">
                                    <ItemTemplate>
                                        <span style="word-break: break-all; width: 500px;">
                                            <asp:Image runat="server" ID="docIcon" ImageUrl="~/DMS/images/icon/unknown.gif"></asp:Image>
                                            <asp:Label runat="server" ID="lblItem" ></asp:Label>
                                        </span>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="false"/>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="訂閱種類" meta:resourcekey="TemplateFieldResource2" SortExpression="SUB_TYPE">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblType" ></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="150px" Wrap="False" />
                                    <ItemStyle HorizontalAlign="Center"/>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="通知時機" meta:resourcekey="TemplateFieldResource3" SortExpression="INFORM_CASE">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTiming" ></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="150px" Wrap="False" />
                                    <ItemStyle HorizontalAlign="Center"/>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="訂閱來源" SortExpression="SOURCE" meta:resourcekey="TemplateFieldResource4">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSource" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle Width="150px" Wrap="False" />
                                    <ItemStyle HorizontalAlign="Center"/>
                                </asp:TemplateField>
                            </Columns>
                            <EnhancePagerSettings ShowHeaderPager="True" />
                        </Fast:Grid>
                        <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要取消訂閱?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
                        <asp:Label ID="lblFile" runat="server" Text="檔案" Visible="False" meta:resourcekey="lblFileResource1"></asp:Label>
                        <asp:Label ID="lblFolder" runat="server" Text="目錄" Visible="False" meta:resourcekey="lblFolderResource1"></asp:Label>
                        <asp:Label ID="lblAll" runat="server" Text="全部" Visible="False" meta:resourcekey="lblAllResource1"></asp:Label>
                        <asp:Label ID="lblNewDoc" runat="server" Text="新文件公布" Visible="False" meta:resourcekey="lblNewDocResource1"></asp:Label>
                        <asp:Label ID="lblVersonChange" runat="server" Text="版本變更" Visible="False" meta:resourcekey="lblVersonChangeResource1"></asp:Label>
                        <asp:Label ID="lblDocVoid" runat="server" Text="文件作廢" Visible="False" meta:resourcekey="lblDocVoidResource1"></asp:Label>
                        <asp:Label ID="lblDocDelete" runat="server" Text="文件刪除" Visible="False" meta:resourcekey="lblDocDeleteResource1"></asp:Label>
                        <asp:Label ID="lblCount" runat="server" Text="筆" Visible="False" meta:resourcekey="lblCountResource1"></asp:Label>
                        <asp:Label ID="lblTotalItem" runat="server" Text="總共訂閱" Visible="False" meta:resourcekey="lblTotalItemResource1"></asp:Label>
                        <asp:Label ID="lblMsgSource1" runat="server" Text="個人訂閱" Visible="False" meta:resourcekey="lblMsgSource1Resource1"></asp:Label>
                        <asp:Label ID="lblMsgSource2" runat="server" Text="代理訂閱" Visible="False" meta:resourcekey="lblMsgSource2Resource1"></asp:Label>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="RadFolderToolbar1" EventName="ButtonClick" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>
