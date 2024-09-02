<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DownloadExportPermission.ascx.cs" Inherits="Ede.Uof.Web.WKF.Permission.DownloadExportPermission" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<script>
	function RadToolBar1_ButtonClicking(sender,args)
	{
	    if (args.get_item().get_value() == "Delete") {
	        if (confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>') == false) {
	            args.set_cancel(true);
	     }
	 }
	}
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_ButtonClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
            <Items>
                <telerik:RadToolBarButton runat="server" meta:resourcekey="RadToolBarButtonResource1">
                    <ItemTemplate>
                        <asp:Label ID="queryDate" runat="server" Text="匯出時間:" meta:resourcekey="queryDateResource1"></asp:Label>
                    </ItemTemplate>
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Value="startdate" meta:resourcekey="RadToolBarButtonResource2">
                    <ItemTemplate>
                        <telerik:RadDatePicker ID="rdStartDate" runat="server" meta:resourcekey="rdStartDateResource1">
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
                        </igsch:WebDateChooser>
                    </ItemTemplate>
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" meta:resourcekey="RadToolBarButtonResource3">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text="~" meta:resourcekey="Label3Resource1"></asp:Label>
                    </ItemTemplate>
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Value="enddate" meta:resourcekey="RadToolBarButtonResource4">
                    <ItemTemplate>
                        <telerik:RadDatePicker ID="rdEndDate" runat="server" meta:resourcekey="rdEndDateResource1">
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
                        </igsch:WebDateChooser>
                    </ItemTemplate>
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource5"></telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Text="查詢" Value="Serach"
                    CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                    DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                    HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                    ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource6">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource7"></telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
                    CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                    DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                    HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                    ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource8">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource9"></telerik:RadToolBarButton>
            </Items>
        </telerik:RadToolBar>
        <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
            AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False"
            EnhancePager="True" PageSize="15" DefaultSortColumnName="EXPORT_TIME" DefaultSortDirection="Descending"
            Width="100%" OnRowDataBound="Grid1_RowDataBound" OnSorting="Grid1_Sorting" DataKeyNames="EXPORT_ID,FILE_GROUP_ID" AllowPaging="True" OnPageIndexChanging="Grid1_PageIndexChanging" CustomDropDownListPage="False" EmptyDataText="No data found" KeepSelectedRows="False" meta:resourcekey="Grid1Resource1" SelectedRowColor="" UnSelectedRowColor="">
            <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
            <ExportExcelSettings AllowExportToExcel="False" />
            <Columns>
                <asp:BoundField DataField="EXPORT_ID" HeaderText="EXPORT_ID" Visible="False" meta:resourcekey="BoundFieldResource1"  />
                <asp:TemplateField HeaderText="匯出時間" SortExpression="EXPORT_TIME" meta:resourcekey="TemplateFieldResource1" >
                    <ItemTemplate>
                        <asp:Label ID="lblExportTime" runat="server" meta:resourcekey="lblExportTimeResource1"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="檔名" meta:resourcekey="TemplateFieldResource2" >
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" meta:resourcekey="Image1Resource1"></asp:Image><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Common/FileCenter/DownloadFile.aspx?id="+Eval("FILE_ID") %>'><%# Eval("FILE_NAME") %></asp:HyperLink><asp:Label ID="lblfileName" runat="server" meta:resourcekey="lblfileNameResource1"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="匯出者" meta:resourcekey="TemplateFieldResource3">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblUser" meta:resourcekey="lblUserResource1" ></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource4" >
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblExportStatus" meta:resourcekey="lblExportStatusResource1" ></asp:Label>
                        <asp:LinkButton runat="server" ID="lbtnStatus" meta:resourcekey="lbtnStatusResource1" ></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
        </Fast:Grid>
        <asp:Label ID="lblSuccess" runat="server" Text="成功" Visible="False" meta:resourcekey="lblSuccessResource1" ></asp:Label>
        <asp:Label ID="lblFail" runat="server" Text="失敗" Visible="False" meta:resourcekey="lblFailResource1" ></asp:Label>
        <asp:Label ID="lblProcess" runat="server" Text="處理中" Visible="False" meta:resourcekey="lblProcessResource1" ></asp:Label>
        <asp:Label ID="lblErrorMessage" runat="server" Text="錯誤訊息" Visible="False" meta:resourcekey="lblErrorMessageResource1" ></asp:Label>
    </ContentTemplate>
</asp:UpdatePanel>
