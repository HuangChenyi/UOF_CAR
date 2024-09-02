<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_Admin_FilingDownloadExcel" Codebehind="FilingDownloadExcel.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="System.Web.UI.HtmlControls" TagPrefix="cc2" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="System.Web.UI" TagPrefix="cc1" %>

<script type="text/javascript" id="telerikClientEvents1">
//<![CDATA[

	function RadToolBar1_ButtonClicking(sender,args)
	{
	    if (args.get_item().get_value() == "Delete") {
	        if (confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>') == false) {
	            args.set_cancel(true);
	     }
	 }
	}
//]]>
</script>


<table style="width: 99%; height: 100%" class="tbbg01">
    <tr>
        <td style="width: 100%; height: 100%" valign="top">
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" meta:resourcekey="UltraWebToolbar1Resource1" OnClientButtonClicking="RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="Button 0" Value="ExportTime">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="匯出時間 ：" meta:resourcekey="TBLabelResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <table id="Table1" runat="server">
                                            <tr id="Tr1" runat="server">
                                                <td id="Td1" runat="server">
                                                    <telerik:RadDatePicker ID="rdpStartTime" Runat="server"></telerik:RadDatePicker>
                                                </td>
                                                <td id="Td2" runat="server" style="padding-left: 3px; padding-right: 3px;">~</td>
                                                <td id="Td3" runat="server">
                                                    <telerik:RadDatePicker ID="rdpEndTime" Runat="server"></telerik:RadDatePicker>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="Button 2" Value="ExportType">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="匯出種類：" meta:resourcekey="TBLabelResource2"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlExportType" runat="server" meta:resourcekey="ddlExportTypeResource1">
                                            <asp:ListItem Value="-1" meta:resourcekey="ListItemResource1" Text="全部"></asp:ListItem>
                                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource2" Text="表單統計"></asp:ListItem>
                                            <asp:ListItem Value="1" meta:resourcekey="ListItemResource3" Text="表單單據"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="查詢" meta:resourcekey="TBarButtonResource1"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        Value="Query">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除" meta:resourcekey="TBarButtonResource2"
                        ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        DisabledImageUrl="'~/Common/Images/Icon/icon_m03.gif"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        Value="Delete">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 7" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:CustomValidator runat="server" ID="cvCheckStartTime" ErrorMessage="請輸入查詢日期(起)" OnServerValidate="CheckStartTime" Display="Dynamic" ForeColor="Red" meta:resourceKey="RequiredFieldValidator1Resource1"></asp:CustomValidator>
                    <asp:CustomValidator runat="server" ID="cvCheckEndTime" ErrorMessage="請輸入查詢日期(迄)" OnServerValidate="CheckEndTime" Display="Dynamic" ForeColor="Red" meta:resourceKey="RequiredFieldValidator2Resource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="cvTimeError" runat="server" Display="Dynamic"
                        ErrorMessage="結束時間需晚於開始時間" meta:resourcekey="CompareValidator1Resource1" ForeColor="Red">
                    </asp:CustomValidator>
                    <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                        AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False"
                        EnhancePager="True" PageSize="15"
                        Width="100%" OnRowDataBound="Grid1_RowDataBound" OnSorting="Grid1_Sorting" DataKeyNames="EXPORT_ID,FILE_GROUP_ID" AllowPaging="True" OnPageIndexChanging="Grid1_PageIndexChanging">
                        <EnhancePagerSettings
                            ShowHeaderPager="True" />
                        <Columns>
                            <asp:BoundField DataField="EXPORT_ID" HeaderText="EXPORT_ID" Visible="False" meta:resourcekey="BoundFieldResource1" />
                            <asp:TemplateField  HeaderText="匯出時間" SortExpression="EXPORT_TIME" meta:resourcekey="BoundFieldResource2">
                                <ItemTemplate>
                                    <asp:Label ID="lblExportTime" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="檔名" meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server"></asp:Image><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Common/FileCenter/DownloadFile.aspx?id="+Eval("FILE_ID") %>'><%# Eval("FILE_NAME") %></asp:HyperLink><asp:Label ID="lblfileName" runat="server" Text=""></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="匯出種類" SortExpression="EXPORT_TYPE" meta:resourcekey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblExportType" meta:resourcekey="lblExportTypeResource1"></asp:Label>

                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="匯出者" meta:resourcekey="TemplateFieldResource3">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblUser" meta:resourcekey="lblUserResource1"></asp:Label>

                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource4">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblExportStatus" meta:resourcekey="lblExportStatusResource1"></asp:Label>

                                    <asp:LinkButton runat="server" ID="lbtnStatus" meta:resourcekey="lbtnStatusResource1"></asp:LinkButton>


                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作" Visible="False" meta:resourcekey="TemplateFieldResource5">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="lbtnDownload" meta:resourcekey="lbtnDownloadResource1">下載</asp:LinkButton>

                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                <ItemStyle HorizontalAlign="Center" Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                    </Fast:Grid>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick"></asp:AsyncPostBackTrigger>
                </Triggers>
            </asp:UpdatePanel>
        </td>
    </tr>
</table>
<asp:Label ID="lblSuccess" runat="server" Text="成功" Visible="False" meta:resourcekey="lblSuccessResource1"></asp:Label>
<asp:Label ID="lblFail" runat="server" Text="失敗" Visible="False" meta:resourcekey="lblFailResource1"></asp:Label>
<asp:Label ID="lblStatistics" runat="server" Text="統計" Visible="False" meta:resourcekey="lblStatisticsResource1"></asp:Label>
<asp:Label ID="lblList" runat="server" Text="單據" Visible="False" meta:resourcekey="lblListResource1"></asp:Label>
<asp:Label ID="lblProcess" runat="server" Text="處理中" Visible="False" meta:resourcekey="lblProcessResource1"></asp:Label>
<asp:Label ID="lblErrorMessage" runat="server" Text="錯誤訊息" Visible="False" meta:resourcekey="lblErrorMessageResource1"></asp:Label>