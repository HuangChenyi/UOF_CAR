<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="System_LoginLog_Default" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="Default.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
    function RadToolBar1_ButtonClicking(sender, args) {

        var Key = args.get_item().get_value();

        if (Key == 'btnDelete') {
            if (confirm('<%= lblConfirmDelete.Text %>') == false) {
                    args.set_cancel(true);
                }
            }
        }
    </script>
    <center style="text-align: left">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td style="width: 100%; text-align: left;">
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick"
                        OnClientButtonClicking="RadToolBar1_ButtonClicking" 
                        meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Value="RBBCustom" 
                                meta:resourcekey="RadToolBarButtonResource1">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td style="padding-left:2px; padding-right:0px">
                                                <asp:Label ID="lblStartTime" runat="server" Text="開始：" meta:resourcekey="TBLabelResource1"></asp:Label>
                                            </td>
                                            <td style="padding-left:0px; padding-right:2px">
                                                <telerik:RadDatePicker ID="rdpStartTime" runat="server" 
                                                    meta:resourcekey="rdpStartTimeResource1">
                                                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                                                    </Calendar>
                                                    <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" 
                                                        Width="">
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
                                            <td style="padding-left:2px; padding-right:0px">
                                                <asp:Label runat="server" ID="lblEndTime" Text="結束：" meta:resourcekey="TBLabelResource2"></asp:Label>
                                            </td>
                                            <td style="padding-left:0px; padding-right:2px">
                                                <telerik:RadDatePicker ID="rdpEndTime" runat="server" 
                                                    meta:resourcekey="rdpEndTimeResource1">
                                                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                                                    </Calendar>
                                                    <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" 
                                                        Width="">
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
                                            <td style="padding-left:2px; padding-right:0px">
                                                <asp:Label runat="server" ID="lblAction" Text="動作：" meta:resourcekey="TBLabelResource3"></asp:Label>
                                            </td>
                                            <td style="padding-left:0px; padding-right:2px">
                                                <asp:DropDownList ID="ddlAction" runat="server" meta:resourcekey="ddlActionResource1">
                                                    <asp:ListItem Value="All" meta:resourcekey="ListItemResource1" Text="全部"></asp:ListItem>
                                                    <asp:ListItem Value="Login" meta:resourcekey="ListItemResource2" Text="登入"></asp:ListItem>
                                                    <asp:ListItem Value="Logout" meta:resourcekey="ListItemResource3" Text="登出"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="padding-left:2px; padding-right:0px">
                                                <asp:Label runat="server" ID="lblUser" Text="使用者：" meta:resourcekey="TBLabelResource4"></asp:Label>
                                            </td>
                                            <td style="padding-left:0px; padding-right:2px">
                                                <asp:TextBox ID="UseKeyword" runat="server" 
                                                    meta:resourcekey="UseKeywordResource1" width="100px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" 
                                meta:resourcekey="RadToolBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                Value="btnQuery" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="查詢" ToolTip="查詢"
                                meta:resourcekey="TBarButtonResource20">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" 
                                meta:resourcekey="RadToolBarButtonResource3">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/System/icon_images/icon_m03.gif"
                                ImageUrl="~/System/icon_images/icon_m03.gif" Value="btnDelete" CheckedImageUrl="~/System/icon_images/icon_m03.gif"
                                Text="刪除" ToolTip="刪除" meta:resourcekey="TBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s3" 
                                meta:resourcekey="RadToolBarButtonResource4">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="結束時間需晚於開始時間"
                        OnServerValidate="CustomValidator1_ServerValidate" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                </td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" width="60%">
            <tr>
                <td style="width: 100%;" >
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <Fast:Grid ID="DGFormList" runat="server" AllowPaging="True" AutoGenerateCheckBoxColumn="False"
                                AutoGenerateColumns="False" OnRowDataBound="DGFormList_RowDataBound" Width="100%"
                                AllowSorting="True" OnPageIndexChanging="DGFormList_PageIndexChanging" OnSorting="DGFormList_Sorting"
                                DataKeyOnClientWithCheckBox="False" PageSize="50" 
                                 DefaultSortDirection="Descending" OnBeforeExport="DGFormList_BeforeExport"
                                EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" 
                                meta:resourcekey="DGFormListResource2"  
                                 DefaultSortColumnName="TIME" CustomDropDownListPage="False" ExportExcelSettings-DataSourceType="ObjectDataSource">
                                <EnhancePagerSettings ShowHeaderPager="True" />
                                <ExportExcelSettings AllowExportToExcel="True" DataSourceType="ObjectDataSource"/>
                                <Columns>
                                     <asp:BoundField HeaderText="使用者名稱" meta:resourcekey="TemplateFieldResource1" SortExpression="NAME" >
                                    <ItemStyle Width="55%" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ACTION" HeaderText="動作" meta:resourcekey="BoundFieldResource1"
                                        SortExpression="ACTION" >
                                    <ItemStyle Width="10%" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IP" HeaderText="IP" SortExpression="IP" >
                                    <ItemStyle Width="10%" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="裝置" meta:resourcekey="TemplateFieldResource4">
                                        <HeaderStyle Wrap="false"/>
                                        <ItemStyle Width="10%" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="驗證方式" SortExpression="AUTH_TYPE" meta:resourcekey="BoundField2Resource1">
                                        <HeaderStyle Wrap="false"/>
                                        <ItemStyle Width="10%" Wrap="False" />
                                    </asp:BoundField>
                                      <asp:BoundField HeaderText="時間" SortExpression="TIME" meta:resourcekey="TemplateFieldResource2">
                                        <HeaderStyle Wrap="false"/>
                                         <ItemStyle Width="15%" Wrap="False" />
                                    </asp:BoundField>
                                </Columns>
                            </Fast:Grid>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
                            <asp:AsyncPostBackTrigger ControlID="DGFormList" EventName="PageIndexChanging" />
                            <asp:AsyncPostBackTrigger ControlID="DGFormList" EventName="Sorting" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <center>
        <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
        <asp:HiddenField ID="hfCurrentUser" runat="server"></asp:HiddenField>
        <asp:Label ID="lblAuthTypeForm" runat="server" Text="一般驗證" Visible="False" meta:resourcekey="lblAuthTypeFormResource1"></asp:Label>
        <asp:Label ID="lblAuthTypeEx" runat="server" Text="自訂驗證" Visible ="False" meta:resourcekey="lblAuthTypeExResource1"></asp:Label>
</asp:Content>
