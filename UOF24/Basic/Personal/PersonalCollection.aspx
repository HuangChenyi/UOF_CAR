<%@ Page Title="我的收藏" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="Basic_Personal_PersonalCollection" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="PersonalCollection.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">

        function uwtMasterToolBar_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            if (value == "CollectionDel") {
                args.set_cancel(!confirm('<%= lblConfirmMsg.Text%>'));
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>
            <telerik:RadToolBar ID="uwtMasterToolBar" runat="server" Width="100%" OnClientButtonClicking="uwtMasterToolBar_ButtonClicking" OnButtonClick="uwtMasterToolBar_ButtonClick" meta:resourcekey="uwtMasterToolBarResource1">
                                        <Items>
                                            <telerik:RadToolBarButton runat="server" Value="SourceType" meta:resourcekey="RadToolBarButtonResource1">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlSourceType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSourceType_SelectedIndexChanged"
                                                    meta:resourcekey="ddlSourceTypeResource1" Width="120px">
                                                        <asp:ListItem Text="全部" Value="0" Selected="True" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                                        <asp:ListItem Text="公告" Value="1" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                                        <asp:ListItem Text="討論文章" Value="2" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                                        <asp:ListItem Text="文管文件" Value="3" meta:resourcekey="ListItemResource4"></asp:ListItem>
                                                        <asp:ListItem Text="文管目錄" Value="4" meta:resourcekey="ListItemResource5"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Text="取消收藏" Value="CollectionDel" ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource3">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
                                            </telerik:RadToolBarButton>
                                        </Items>
                                    </telerik:RadToolBar>
            <Fast:Grid ID="gridPersColection" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                              DataKeyNames="COLLECTION_ID"
                             AutoGenerateColumns="False" AllowPaging="True" DataKeyOnClientWithCheckBox="True"
                            EmptyDataText="沒有資料" EnhancePager="True" PageSize="15"
                            KeepSelectedRows="False" Width="100%" OnRowDataBound="gridPersColection_RowDataBound"
                            OnPageIndexChanging="gridPersColection_PageIndexChanging" OnSorting="gridPersColection_Sorting"
                            DefaultSortColumnName="CREATE_DATE" DefaultSortDirection="Descending" meta:resourcekey="gridPersColectionResource1"   >
                            <EnhancePagerSettings ShowHeaderPager="True" firstaltimageurl="" firstimageurl="" lastaltimage="" lastimageurl="" nextialtimageurl="" nextimageurl="" pageinfocssclass="" pagenumbercssclass="" pagenumbercurrentcssclass="" pageredirectcssclass="" previousaltimageurl="" previousimageurl=""></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="標題" SortExpression="TOPIC" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:HyperLink runat="server" ID="hlLink" NavigateUrl='<%# Eval("LINK_URL") %>' meta:resourcekey="hlLinkResource1"><asp:Label runat="server" Text='<%# Eval("TOPIC") %>' ID="lblTopic" meta:resourcekey="lblTopicResource1"></asp:Label>
                                        </asp:HyperLink>
                                        <asp:Label runat="server" ID="lblDataLost" Visible="False" Text="收藏資料可能已被刪除！" ForeColor="Red" meta:resourcekey="lblDataLostResource1"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" Width="50%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="來源" SortExpression="SOURCE_TYPE" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSourceType" runat="server" Text='<%# Bind("SOURCE_TYPE") %>' meta:resourcekey="lblSourceTypeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="收藏類型" DataField="TYPE" SortExpression="TYPE" meta:resourcekey="BFTypeResource1"/>                                
                                <asp:TemplateField HeaderText="最後更新時間" SortExpression="UPDATA_DATE" meta:resourcekey="BoundFieldResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLastUpdateDate" runat="server" Text='<%# Bind("UPDATA_DATE") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="加入收藏時間" SortExpression="CREATE_DATE" meta:resourcekey="BoundFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCreateDate" runat="server" Text='<%# Bind("CREATE_DATE") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
        </contenttemplate>
    </asp:UpdatePanel>
    <asp:Label runat="server" ID="lblConfirmMsg" Visible="False" Text="確定要取消嗎？" meta:resourcekey="lblConfirmMsgResource1"></asp:Label>
    <asp:Label runat="server" ID="lblDMSRoot" Visible="False" Text="文件庫" meta:resourcekey="lblDMSRootResource1"></asp:Label>
    <asp:Label ID="lblSystemTitle" runat="server" Text="系統" Visible="False" meta:resourcekey="lblSystemTitleResource1"></asp:Label>
    <asp:Label ID="lblPersonalTitle" runat="server" Text="個人" Visible="False" meta:resourcekey="lblPersonalTitleResource1"></asp:Label>
    <asp:HiddenField runat="server" ID="hfCurrentUser"></asp:HiddenField>
</asp:Content>
