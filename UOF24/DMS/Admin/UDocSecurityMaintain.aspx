<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="UDocSecurityMaintain.aspx.cs" Inherits="Ede.Uof.Web.DMS.Admin.UDocSecurityMaintain" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%">
                <tr>
                    <td style="width: 100%">
                        <telerik:RadToolBar ID="rtbSecuriInfoQuery" runat="server" Width="100%" SingleClick="None" OnButtonClick="rtbSecuriInfoQuery_ButtonClick" meta:resourcekey="rtbSecuriInfoQueryResource1">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Value="date" meta:resourcekey="RadToolBarButtonResource1">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblQueryDate" runat="server" Text="建立日期" meta:resourcekey="lblQueryDateResource1"></asp:Label>
                                                </td>
                                                <td>
                                                    <telerik:RadDatePicker ID="rdpDateBegin" runat="server" meta:resourcekey="rdpDateBeginResource1">
                                                        <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                        </Calendar>
                                                        <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
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
                                                <td>~<telerik:RadDatePicker ID="rdpDateEnd" runat="server" meta:resourcekey="rdpDateEndResource1">
                                                    <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                    </Calendar>
                                                    <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
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
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" meta:resourcekey="RadToolBarButtonResource2">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="keyword" meta:resourcekey="RadToolBarButtonResource3">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblKeyWord" runat="server" Text="關鍵字" meta:resourcekey="lblKeyWordResource1"></asp:Label>
                                                </td>
                                                <td>
                                                    <telerik:RadTextBox ID="rtxtKeyWord" runat="server" LabelCssClass="" LabelWidth="64px" meta:resourcekey="rtxtKeyWordResource1" Resize="None">
                                                        <EmptyMessageStyle Resize="None" />
                                                        <ReadOnlyStyle Resize="None" />
                                                        <FocusedStyle Resize="None" />
                                                        <DisabledStyle Resize="None" />
                                                        <InvalidStyle Resize="None" />
                                                        <HoveredStyle Resize="None" />
                                                        <EnabledStyle Resize="None" />
                                                    </telerik:RadTextBox>
                                                    <asp:Label ID="lblKeyWordComment" runat="server" CssClass="SizeMemo" Text="請輸入保全編號、檔案名稱" meta:resourcekey="lblKeyWordCommentResource1"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 2" meta:resourcekey="RadToolBarButtonResource4">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource5">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" meta:resourcekey="RadToolBarButtonResource6">
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </td>
                </tr>
                <tr>
                    <td>
                        <Ede:Grid ID="Grid1" runat="server" Width="100%" AutoGenerateCheckBoxColumn="False" AllowSorting="True" AutoGenerateColumns="False" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortColumnName="SECURITY_DOC_SERIAL_NUMBER" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" AllowPaging="True" OnPageIndexChanging="Grid1_PageIndexChanging" OnRowDataBound="Grid1_RowDataBound" OnSorting="Grid1_Sorting" meta:resourcekey="Grid1Resource1">
                            <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

                            <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                            <Columns>
                                <asp:BoundField DataField="SECURITY_DOC_SERIAL_NUMBER" SortExpression="SECURITY_DOC_SERIAL_NUMBER" HeaderText="保全編號" meta:resourcekey="BoundFieldResource1">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="開啟次數限制" SortExpression="OPEN_TIMES" meta:resourcekey="BoundFieldResource2" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblOpenTimes" runat="server" ></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="有效日期" SortExpression="EXPIRY_DATE" meta:resourcekey="TemplateFieldResource1" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblExpiryDate" runat="server" meta:resourcekey="lblExpiryDateResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="IP限制範圍" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIPRange" runat="server" meta:resourcekey="lblIPRangeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="CUSTOM_NAME" HeaderText="檔案名稱" SortExpression="CUSTOM_NAME" meta:resourcekey="BoundFieldResource3">
                                    <HeaderStyle Width="240px" Wrap="False" />
                                <ItemStyle Width="240px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="COMMENT" HeaderText="備註" meta:resourcekey="BoundFieldResource4">
                                    <HeaderStyle Width="300px" Wrap="False" />
                                <ItemStyle Width="300px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="狀態" SortExpression="IS_INVALID" meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="失效日期" SortExpression="INVALID_DATE" meta:resourcekey="TemplateFieldResource4">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInvalidDate" runat="server" meta:resourcekey="lblInvalidDateResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="建立者" SortExpression="CREATOR" meta:resourcekey="TemplateFieldResource5">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCreator" runat="server" meta:resourcekey="lblCreatorResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="建立日期" SortExpression="CREATE_DATE" meta:resourcekey="TemplateFieldResource6">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCreateDate" runat="server" meta:resourcekey="lblCreateDateResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource7">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="lbtnSerialNO" runat="server" Text="維護" OnClick="lbtnSerialNO_Click" meta:resourcekey="lbtnSerialNOResource1"></asp:LinkButton>&nbsp;
                                                </td>
                                                <td>
                                                    <asp:LinkButton ID="lbtnOpenTimes" runat="server" Text="明細" meta:resourcekey="lbtnOpenTimesResource1"></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" Width="80px" />
                                    <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                </asp:TemplateField>
                            </Columns>
                        </Ede:Grid>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblNormal" runat="server" Text="正常" Visible="False" meta:resourcekey="lblNormalResource1"></asp:Label>
            <asp:Label ID="lblInvalid" runat="server" Text="失效" Visible="False" meta:resourcekey="lblInvalidResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
