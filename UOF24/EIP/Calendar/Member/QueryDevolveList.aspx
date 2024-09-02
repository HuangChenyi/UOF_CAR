<%@ Page Title="交辦知會" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="QueryDevolveList.aspx.cs" Inherits="EIP_Calendar_Member_QueryDevolveList" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        Sys.Application.add_load(function () {
            var is_Editable = "<%=Request.QueryString["isEditable"]%>";

            //連結交辦清單
            var devolveGuid = "<%=Request.QueryString["devolveGuid"]%>";
            var Owner_Guid = "<%=Request.QueryString["OwnerGuid"]%>";
            if ((devolveGuid != "") & (Owner_Guid != "") & ($("#<%=tbx_HiddenField.ClientID%>").val() == 'True')) {
                $("#<%=tbx_HiddenField.ClientID%>").val('False');

                $uof.dialog.open2("~/EIP/Calendar/CreateDevolve.aspx", "", "", 460, 520,
                    function (returnValue) { if (returnValue == null || typeof (returnValue) == 'undefined') { return false } return true },
                    { "devolveGuid": devolveGuid, "OwnerGuid": Owner_Guid, "isEditable": is_Editable });
            }
        })
    </script>

    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="QueryDevolveListRadToolBar" runat="server" Width="100%" OnButtonClick="QueryDevolveListRadToolBar_ButtonClick" meta:resourcekey="QueryDevolveListRadToolBarResource1" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="交辦時間" Value="DevolveTime" meta:resourcekey="RadToolBarButtonResource3">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblDevolveDate" runat="server" Text="交辦時間 : " meta:resourcekey="lblDevolveDateResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadDatePicker ID="rdpDateStart" runat="server" meta:resourcekey="rdpDateStartResource1">
                                            <Calendar EnableWeekends="True" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;">
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
                                    <td style="padding-left: 1px; padding-right: 1px">
                                        <asp:Label ID="Label1" runat="server" Text="~" meta:resourcekey="Label1Resource1"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadDatePicker ID="rdpDateEnd" runat="server"  meta:resourcekey="rdpDateEndResource1">
                                            <Calendar EnableWeekends="True" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;">
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
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="sp" meta:resourcekey="RadToolBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="狀態" Value="DevolveStatus" meta:resourcekey="RadToolBarButtonStatusResource5">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text="狀態:" meta:resourcekey="lblStatusResource1"></asp:Label>
                            <asp:DropDownList ID="ddlStatus" runat="server" meta:resourcekey="ddlStatusResource1">
                                <asp:ListItem Value="All" meta:resourcekey="ListItemAllResource1">全部</asp:ListItem>
                                <asp:ListItem Value="Audit" meta:resourcekey="ListItemAuditResource1">待審核</asp:ListItem>
                                <asp:ListItem Value="Completed" meta:resourcekey="ListItemCompletedResource1">已完成</asp:ListItem>
                                <asp:ListItem Value="Proceeding" meta:resourcekey="ListItemProceedingResource1">未完成</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="sp" meta:resourcekey="RadToolBarButtonResource6">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query" ImageUrl="~/Common/Images/Icon/icon_m39.png" meta:resourcekey="RadToolBarButtonQueryResource7">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="sp" meta:resourcekey="RadToolBarButtonResource8">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>

            <Fast:Grid ID="gridDevolve" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" DataKeyNames="DEVOLVE_GUID"
                OnRowDataBound="gridDevolve_RowDataBound" Width="100%" OnRowCommand="gridDevolve_RowCommand"
                DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                EnhancePager="True" KeepSelectedRows="False" PageSize="15"
                DataSourceID="objDsDevolve" OnBeforeExport="gridDevolve_BeforeExport" meta:resourcekey="gridDevolveResource2" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                <ExportExcelSettings AllowExportToExcel="True" />
                <Columns>
                    <asp:TemplateField HeaderText="主旨" SortExpression="SUBJECT" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="btnEditDevolve" Text='<%#: Eval("SUBJECT") %>'
                                CommandName="EditDetail" meta:resourceKey="btnEditDevolveResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="30%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="開始時間" SortExpression="START_TIME" meta:resourcekey="BoundFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblStartTime" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="120px" Wrap="False" />
                        <ItemStyle Width="120px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="結束時間" SortExpression="END_TIME" meta:resourcekey="BoundFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblEndTime" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="120px" Wrap="False" />
                        <ItemStyle Width="120px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="逾時(天)" meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("DELAY_TIME") %>' meta:resourcekey="Label2Resource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="交辦對象" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <uc1:uc_choicelist runat="server" id="UC_ChoiceList1" isallowedit="false" TreeHeight="100"></uc1:uc_choicelist>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="交辦對象" Visible="False" meta:resourcekey="TemplateFieldResource6">
                        <ItemTemplate>
                            <asp:Label ID="lblUser" runat="server" meta:resourcekey="lblUserResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="狀態" SortExpression="IS_COMPLETE" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblStatus" meta:resourceKey="lblStatusResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="80px" Wrap="False" />
                        <ItemStyle Width="80px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="btnViewProgress" Text="工作進度" CausesValidation="False"
                                meta:resourceKey="btnViewProgressResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="80px" />
                        <ItemStyle Width="80px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="USER_SET" HeaderText="USER_SET" meta:resourceKey="BoundFieldResource3"
                        SortExpression="USER_SET" Visible="False"></asp:BoundField>
                </Columns>
            </Fast:Grid>
            <asp:ObjectDataSource ID="objDsDevolve" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetNoClassDevolve" TypeName="Ede.Uof.EIP.Schedule.Devolve.DevolveManagementUCO">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lbOwnerGuid" Name="userGUID" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="lbMeetingGuid" Name="meetingGUID" DefaultValue="" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </ContentTemplate>        
    </asp:UpdatePanel>

    <asp:HiddenField ID="tbx_HiddenField" Value="True" runat="server" />
    <asp:Label ID="msgUncomplete" runat="server" Text="未完成" Visible="False" meta:resourcekey="msgUncompleteResource1"></asp:Label>
    <asp:Label ID="msgComplete" runat="server" Text="已完成" Visible="False" meta:resourcekey="msgCompleteResource1"></asp:Label>
    <asp:Label ID="msgAudit" runat="server" Text="待審核" Visible="False" meta:resourceKey="msgAuditResource1"></asp:Label>
    <asp:Label ID="lbOwnerGuid" runat="server" Visible="False" meta:resourcekey="lbOwnerGuidResource1"></asp:Label>
    <asp:Label ID="lbMeetingGuid" runat="server" Visible="False" meta:resourcekey="lbMeetingGuidResource1"></asp:Label>
</asp:Content>
