<%@ Page Title="待辦事項" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="QueryWorkList.aspx.cs" Inherits="EIP_Calendar_Member_QueryWorkList" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        Sys.Application.add_load(function () {
            $("#<%=btnPostBack.ClientID%>").click();
        });

        function openWork(sender, args) {
            //連結工作項目自動開窗
            var work_id = "<%=Request.QueryString["workid"]%>";
            var Owner_Guid = "<%=Request.QueryString["OwnerGuid"]%>";
            var is_Editable = "<%=Request.QueryString["isEditable"]%>";
            if ((work_id != "") & (Owner_Guid != "") & ($("#<%=tbx_HiddenField.ClientID%>").val() == 'True')) {
                $("#<%=tbx_HiddenField.ClientID%>").val('False');

                $uof.dialog.open2("~/EIP/Calendar/WorkDetail.aspx", sender, "", 600, 650,
                    function (returnValue) { if (returnValue == null || typeof (returnValue) == 'undefined') { return false; } return true; },
                    { "workid": work_id, "OwnerGuid": Owner_Guid, "isEditable": is_Editable });
            }
            return false;
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="待辦時間" Value="DevolveTime" meta:resourcekey="RadToolBarButtonResource3">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text="待辦時間 : " meta:resourcekey="Label3Resource1"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;<telerik:RadDatePicker ID="rdpDateStart" runat="server"  meta:resourcekey="rdpDateStartResource1">
                                            <Calendar EnableWeekends="True" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;">
                                            </Calendar>
                                            <DateInput DateFormat="yyyy/MM/dd" DisplayDateFormat="yyyy/MM/dd" LabelWidth="64px" Width="">
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
                                            <DateInput DateFormat="yyyy/MM/dd" DisplayDateFormat="yyyy/MM/dd" LabelWidth="64px" Width="">
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
                    <telerik:RadToolBarButton runat="server" Text="狀態" Value="DevolveStatus" meta:resourcekey="RadToolBarButtonResource5">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text="狀態 : " meta:resourcekey="Label4Resource1"></asp:Label>
                            <asp:DropDownList ID="ddlStatus" runat="server" meta:resourcekey="ddlStatusResource1">
                                <asp:ListItem Value="All" meta:resourcekey="ListItemResource1">全部</asp:ListItem>
                                <asp:ListItem Value="NotYetBegin" meta:resourcekey="ListItemResource2">尚未開始</asp:ListItem>
                                <asp:ListItem Value="Proceeding" meta:resourcekey="ListItemResource3">進行中</asp:ListItem>
                                <asp:ListItem Value="Audit" meta:resourcekey="ListItemResource4">審核中</asp:ListItem>
                                <asp:ListItem Value="Completed" meta:resourcekey="ListItemResource5">已完成</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="sp" meta:resourcekey="RadToolBarButtonResource6">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query" ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource7">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="sp" meta:resourcekey="RadToolBarButtonResource8">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>


    <Fast:Grid ID="WorkGrid" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
        AutoGenerateColumns="False" DataKeyNames="WORK_GUID" Width="100%" OnRowDataBound="Grid1_RowDataBound"
        AllowPaging="True" DataSourceID="ObjectDataSource1" DataKeyOnClientWithCheckBox="False"
        OnSorting="Grid1_Sorting" DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="15" meta:resourcekey="Grid1Resource1" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
        <EnhancePagerSettings
            ShowHeaderPager="True" />
        <ExportExcelSettings AllowExportToExcel="False" />
        <Columns>
            <asp:TemplateField HeaderText="主旨" SortExpression="SUBJECT"
                meta:resourcekey="TemplateFieldResource1">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnWorkItem" Text='<%#: Eval("SUBJECT") %>' OnClick="lbtnWorkItem_Click" meta:resourceKey="lbtnWorkItemResource1"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle CssClass="breakword" Wrap="False" />
            </asp:TemplateField>
            <asp:BoundField DataField="SOURCE_USER" HeaderText="交辦人" SortExpression="SOURCE_USER"
                meta:resourcekey="BoundFieldResource1">
                <HeaderStyle Width="150px" />
                <ItemStyle Width="150px" Wrap="False" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="開始時間" SortExpression="START_TIME" meta:resourcekey="BoundFieldResource2">
                <ItemTemplate>
                    <asp:Label ID="lblStartTime" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="120px" Wrap="False" />
                <ItemStyle Width="120px" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="結束時間" SortExpression="END_TIME" meta:resourcekey="BoundFieldResource3">
                <ItemTemplate>
                    <asp:Label ID="lblEndTime" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="120px" Wrap="False" />
                <ItemStyle Width="120px" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="狀態" SortExpression="WORK_STATE" meta:resourcekey="TemplateFieldResource2">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblStatus" meta:resourceKey="lblStatusResource1"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="80px" />
                <ItemStyle Width="80px" Wrap="False" />
            </asp:TemplateField>
        </Columns>
    </Fast:Grid>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetNoClassWork"
                TypeName="Ede.Uof.EIP.Schedule.Work.WorkManagementUCO">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hideUserguid" Name="userGUID" PropertyName="Value"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>

            <input id="hideUserguid" runat="server" type="hidden" />
            </input>
            <asp:HiddenField ID="tbx_HiddenField" runat="server" Value="True" />
            <asp:Label ID="msgNotbegin" runat="server" meta:resourceKey="msgNotbeginResource1" Text="尚未開始" Visible="False"></asp:Label>
            <asp:Label ID="msgComplete" runat="server" meta:resourceKey="msgCompleteResource1" Text="已完成" Visible="False"></asp:Label>
            <asp:Label ID="msgProcessing" runat="server" meta:resourceKey="msgProcessingResource1" Text="進行中" Visible="False"></asp:Label>
            <asp:Label ID="msgAudit" runat="server" meta:resourceKey="msgAuditResource1" Text="審核中" Visible="False"></asp:Label>
            <asp:Button ID="btnPostBack" runat="server" meta:resourcekey="btnPostBackResource1" OnClick="btnPostBack_Click" OnClientClick="openWork(this);return false;" Style="display: none;" Text="Button" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
