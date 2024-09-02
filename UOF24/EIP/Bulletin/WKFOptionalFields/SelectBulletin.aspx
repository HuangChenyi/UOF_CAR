<%@ Page Title="選擇公告類別" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SelectBulletin.aspx.cs" Inherits="Ede.Uof.Web.EIP.Bulletin.WKFOptionalFields.SelectBulletin" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function OnValueChanging(sender, args) {
            if (args.get_newValue() == "") {
                args.set_newValue(args.get_oldValue());
            }
        }
        function resizeTree(X, Y) {
            var tree = $find("<%=classTree.ClientID %>");
            tree.get_element().style.height = Y + "px";
            $("#<%=Y.ClientID%>").val(Y);
        }
    </script>
    <telerik:RadSplitter ID="MainRadSplitter" runat="server" PanesBorderSize="0" Width="100%" Height="100%" FullScreenMode="True" meta:resourcekey="MainRadSplitterResource1" SplitBarsSize="">
        <telerik:RadPane ID="RadPaneDep" runat="server" Width="25%" Index="0" meta:resourcekey="RadPaneDepResource1">
            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="請選擇一公告類別" Display="Dynamic" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                    <telerik:RadTreeView ID="classTree" runat="server" Width="100%" Height="100%" OnNodeClick="classTree_NodeClick" meta:resourcekey="classTreeResource1">
                    </telerik:RadTreeView>
                    <asp:HiddenField ID="X" runat="server" />
                    <asp:HiddenField ID="Y" runat="server" />
                    <asp:Label ID="lblNoAuthority" runat="server" Text="選擇的類別沒有發佈權限。" Visible="False" meta:resourcekey="lblNoAuthorityResource1"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPane>
        <telerik:RadPane ID="RadPaneGrid" runat="server" Width="75%" Index="1" meta:resourcekey="RadPaneGridResource1">
            <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <telerik:RadToolBar ID="rtbSearch" runat="server" Width="100%" OnButtonClick="rtbSearch_ButtonClick" meta:resourcekey="rtbSearchResource1" SingleClick="None">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Value="QueryDate" meta:resourcekey="RadToolBarButtonResource1">
                                <ItemTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblQueryDate" runat="server" Text="查詢日期" ToolTip="查詢日期" meta:resourcekey="lblQueryDateResource1"></asp:Label>
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker runat="server" ID="WebDateStart" meta:resourcekey="WebDateStartResource1">
                                                    <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                    </Calendar>
                                                    <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                                                        <ClientEvents OnValueChanging="OnValueChanging" />
                                                        <EmptyMessageStyle Resize="None" />
                                                        <ReadOnlyStyle Resize="None" />
                                                        <FocusedStyle Resize="None" />
                                                        <DisabledStyle Resize="None" />
                                                        <InvalidStyle Resize="None" />
                                                        <HoveredStyle Resize="None" />
                                                        <EnabledStyle Resize="None" />
                                                    </DateInput>
                                                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                                </telerik:RadDatePicker>
                                            </td>
                                            <td>~
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker runat="server" ID="WebDateEnd" meta:resourcekey="WebDateEndResource1">
                                                    <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                    </Calendar>
                                                    <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                                                        <ClientEvents OnValueChanging="OnValueChanging" />
                                                        <EmptyMessageStyle Resize="None" />
                                                        <ReadOnlyStyle Resize="None" />
                                                        <FocusedStyle Resize="None" />
                                                        <DisabledStyle Resize="None" />
                                                        <InvalidStyle Resize="None" />
                                                        <HoveredStyle Resize="None" />
                                                        <EnabledStyle Resize="None" />
                                                    </DateInput>
                                                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                                </telerik:RadDatePicker>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.png"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m39.png" ImageUrl="~/Common/Images/Icon/icon_m39.png"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m39.png" Text="查詢"
                                Value="Query" ToolTip="查詢" meta:resourcekey="RadToolBarButtonResource3">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" meta:resourcekey="RadToolBarButtonResource4">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <Ede:Grid ID="grdSearch" runat="server" Width="100%" OnSorting="grdSearch_Sorting" OnRowDataBound="grdSearch_RowDataBound" OnPageIndexChanging="grdSearch_OnPageIndexChanging" AllowPaging="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" AllowSorting="True" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="grdSearchResource1" DefaultSortColumnName="TOPIC">
                        <EnhancePagerSettings ShowHeaderPager="True" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="主旨" SortExpression="TOPIC" meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="lbtnTopic" Text='<%#: Bind("TOPIC") %>' meta:resourcekey="lbtnTopicResource1"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="150px" Wrap="True" />
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="ANNOUNCER" DataField="ANNOUNCER" meta:resourceKey="BoundFieldResource1" Visible="False" />
                            <asp:TemplateField HeaderText="發佈者" SortExpression="CURRENT_ANNOUNCER_DEP" meta:resourcekey="TemplateFieldResource2">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAnnouncer" runat="server" Text="Label" meta:resourcekey="lblAnnouncerResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Width="150px" Wrap="True"  />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="張貼部門" SortExpression="ANNOUNCER_DEP" meta:resourcekey="TemplateFieldResource3">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblAnnouncerDep" Text='<%#: Bind("ANNOUNCER_DEP") %>' meta:resourcekey="lblAnnouncerDepResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Width="105px" Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="發佈時間" SortExpression="CREATE_DATE" meta:resourcekey="BoundFieldResource2">
                                <ItemTemplate>
                                    <asp:Label ID="lblCreateDate" runat="server"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="105px"/>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource4">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="TextBox1Resource2"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="50px" Wrap="False" />
                                <ItemStyle Width="50px" Wrap="False"/>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource5">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnSelectBulletin" runat="server" Text="選取" OnClick="lbtnSelectBulletin_Click" meta:resourcekey="lbtnSelectBulletinResource1"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="30px" Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                    </Ede:Grid>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPane>

    </telerik:RadSplitter>
    <asp:HiddenField ID="hfApplicant" runat="server" />
    <asp:Label ID="lblInnerclass" runat="server" Text="內部公告" Visible="False" meta:resourcekey="lblInnerclassResource1"></asp:Label>
    <asp:Label ID="lblOuterclass" runat="server" Text="外部公告" Visible="False" meta:resourcekey="lblOuterclassResource1"></asp:Label>
    <asp:Label ID="lblMsgPublish" runat="server" Text="已發佈" Visible="False" meta:resourcekey="lblMsgPublishResource1"></asp:Label>
    <asp:Label ID="lblMsgProcess" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblMsgProcessResource1"></asp:Label>
    <asp:Label ID="lblMsgDeny" runat="server" Text="發佈拒絕" Visible="False" meta:resourcekey="lblMsgDenyResource1"></asp:Label>
    <asp:Label ID="lblMsgPublishing" runat="server" Text="未發佈" Visible="False" meta:resourcekey="lblMsgPublishingResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
