<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="DMS_Admin_DMSEventLog" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="DMSEventLog.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script id="igClientScript" type="text/javascript">
        function wbtnDeleteLog_Click(sender, args) {
            if (!confirm('<%=lblCheckDeleteLog.Text %>'))
                args.set_cancel(true);
        }
    </script>
    <script type="text/javascript">
        Sys.Application.add_load(ChangeName);
        Sys.Application.add_load(ChangeTime);

        function ChangeName() {
            var chkChoiseName = $("#<%=chkChoiseName.ClientID %>");
            var txtName = $("#<%=txtName.ClientID %>");

            txtName.prop("disabled", !chkChoiseName.prop("checked"));

            if (chkChoiseName.prop("checked")) {
                txtName.css("background-color", "White");
            }
            else {
                txtName.css("background-color", "#F0F0F0");
            }
        }

        function ChangeTime() {
            var chkAssDate = $("#<%=chkAssDate.ClientID %>");
            var dateStart = $find("<%=dateStart.ClientID %>");
            var dateEnd = $find("<%=dateEnd.ClientID %>");

            dateStart.set_enabled(chkAssDate.prop("checked"));
            dateEnd.set_enabled(chkAssDate.prop("checked"));
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table border="1" cellpadding="0" cellspacing="0" class="PopTable" style="table-layout: fixed;">
                <tr>
                    <td class="PopTableLeftTD">
                        <asp:Label ID="lblClass" runat="server" Text="類別" meta:resourcekey="lblClassResource1"></asp:Label>
                    </td>
                    <td class="PopTableRightTD">
                        <asp:CheckBox ID="chkDocClass" runat="server" Text="文件" AutoPostBack="True" OnCheckedChanged="chkDocClass_CheckedChanged" meta:resourcekey="chkDocClassResource1" />
                        <asp:CheckBox ID="chkFolderClass" runat="server" Text="目錄" meta:resourcekey="chkFolderClassResource1" />
                        <asp:CheckBox ID="chkSecurity" runat="server" Text="安全性" meta:resourcekey="chkSecurityResource1" />
                    </td>

                    <td rowspan="4" class="PopTableLeftTD">
                        <asp:Label ID="Label1" runat="server" Text="動作者" meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td class="PopTableRightTD" rowspan="4">
                        <uc1:UC_ChoiceList ID="uc_User" runat="server" ChioceType="User" />
                    </td>
                </tr>
                <tr>
                    <td class="PopTableLeftTD">
                        <asp:Label ID="lblName" runat="server" Text="作用物件" meta:resourcekey="lblNameResource1"></asp:Label>
                    </td>
                    <td class="PopTableRightTD" style="padding-bottom: 3px;">
                        <div>
                            <asp:CheckBox ID="chkChoiseName" runat="server" Text="只搜尋下列物件" meta:resourcekey="chkChoiseNameResource1" />
                            <br />
                            <asp:TextBox ID="txtName" runat="server" meta:resourcekey="txtNameResource1"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="PopTableLeftTD">
                        <asp:Label ID="lblAction" runat="server" Text="動作" meta:resourcekey="lblActionResource1"></asp:Label>
                    </td>
                    <td class="PopTableRightTD">
                        <asp:CheckBox ID="chkAdd" runat="server" Text="新增" meta:resourcekey="chkAddResource1" />
                        <asp:CheckBox ID="chkDelete" runat="server" Text="刪除" meta:resourcekey="chkDeleteResource1" />
                        <asp:CheckBox ID="chkModify" runat="server" Text="修改" meta:resourcekey="chkModifyResource1" />
                        <asp:CheckBox ID="chkDownload" runat="server" Text="下載" meta:resourcekey="chkDownloadResource1" />
                        <asp:CheckBox ID="chkView" runat="server" Text="觀看" meta:resourcekey="chkViewResource1" />
                        <asp:CheckBox ID="chkPrint" runat="server" Text="列印" meta:resourcekey="chkPrintResource1" />
                        <asp:CheckBox ID="chkRelease" runat="server" Text="產生離線文件" meta:resourcekey="chkReleaseResource1" />
                    </td>
                </tr>
                <tr>
                    <td class="PopTableLeftTD">
                        <asp:Label ID="lblTime" runat="server" Text="動作時間" meta:resourcekey="lblTimeResource1"></asp:Label>
                    </td>
                    <td class="PopTableRightTD" style="padding-bottom: 3px;">
                        <table border="0">
                            <tr>
                                <td colspan="4">
                                    <asp:CheckBox ID="chkAssDate" runat="server" Text="只搜尋時間內的文件" meta:resourcekey="chkAssDateResource1" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <telerik:RadDatePicker ID="dateStart" runat="server" meta:resourcekey="dateStartResource1">
                                        <Calendar EnableWeekends="True" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
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
                                <td>
                                    <asp:Label ID="Label17" runat="server" Text="~"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadDatePicker ID="dateEnd" runat="server" meta:resourcekey="dateEndResource1">
                                        <Calendar EnableWeekends="True" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
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
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="PopTableRightTD">
                        <table width="100%">
                            <tr>
                                <td valign="bottom" align="center">
                                    <telerik:RadButton ID="btnSearch" runat="server" Text="搜尋" meta:resourcekey="btnSearchResource1" OnClick="btnSearch_Click1"></telerik:RadButton>
                                    &nbsp;&nbsp;&nbsp;
                                    <telerik:RadButton ID="wbtnDeleteLog" runat="server" Text="刪除全部事件" meta:resourcekey="wbtnDeleteLogResource1" OnClick="wbtnDeleteLog_Click1" OnClientClicking="wbtnDeleteLog_Click"></telerik:RadButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <Fast:Grid ID="LogGrid" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False" DataKeyNames="AutoID" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False" EnhancePager="True" PageSize="15" OnRowDataBound="LogGrid_RowDataBound" AllowPaging="True" Width="100%" meta:resourcekey="LogGridResource1" DataSourceID="ObjectDataSource1" DefaultSortColumnName="EVENT_TIME" DefaultSortDirection="Descending" EmptyDataText="No data found" KeepSelectedRows="False">
                <EnhancePagerSettings
                    ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="True" />
                <Columns>
                    <asp:TemplateField HeaderText="類別" SortExpression="EVENT_TYPE" meta:resourcekey="TemplateFieldResource1">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%#: Bind("EVENT_TYPE") %>' ID="TextBox1" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#: Bind("EVENT_TYPE") %>' ID="lblType" meta:resourcekey="lblTypeResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="100px" Wrap="False" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="作用物件" SortExpression="EVENT_OBJECT" meta:resourcekey="TemplateFieldResource2">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%#: Bind("EVENT_OBJECT") %>' ID="TextBox2" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <span style="width: 270px; word-break: break-all">
                                <asp:Label runat="server" Text='<%#: Bind("EVENT_OBJECT") %>' ID="lblObject" meta:resourcekey="lblObjectResource1"></asp:Label>
                            </span>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="動作" SortExpression="EVENT_ACTION" meta:resourcekey="TemplateFieldResource3">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%#: Bind("EVENT_ACTION") %>' ID="TextBox3" meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#: Bind("EVENT_ACTION") %>' ID="lblAction" meta:resourcekey="lblActionResource2"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="100px" Wrap="False" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="動作者" SortExpression="NAME" meta:resourcekey="TemplateFieldResource4">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%#: Bind("EVENT_USER") %>' ID="TextBox4" meta:resourcekey="TextBox4Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#: Bind("EVENT_USER") %>' ID="lblUser" meta:resourcekey="lblUserResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="200px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="動作時間" SortExpression="EVENT_TIME" meta:resourcekey="TemplateFieldResource5">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%#: Bind("EVENT_TIME") %>' ID="TextBox5" meta:resourcekey="TextBox5Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text="" ID="lblTime" meta:resourcekey="lblTimeResource2"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="150px" Wrap="False" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="所在目錄" SortExpression="EVENT_PARENT_FOLDER" meta:resourcekey="TemplateFieldResource6">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%#: Bind("EVENT_PARENT_FOLDER") %>' ID="TextBox6" meta:resourcekey="TextBox6Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <span style="width: 200px; word-break: break-all">
                                <asp:Label runat="server" Text='<%#: Bind("EVENT_PARENT_FOLDER") %>' ID="lblFolder" meta:resourcekey="lblFolderResource1"></asp:Label>
                            </span>
                        </ItemTemplate>
                        <ItemStyle Width="200px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="變更前" SortExpression="EVENT_BEFORE" meta:resourcekey="TemplateFieldResource7">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%#: Bind("EVENT_BEFORE") %>' ID="TextBox7" meta:resourcekey="TextBox7Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#: Bind("EVENT_BEFORE") %>' ID="lblBefore" meta:resourcekey="lblBeforeResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="100px" Wrap="False" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="變更後" SortExpression="EVENT_AFTER" meta:resourcekey="TemplateFieldResource8">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%#: Bind("EVENT_AFTER") %>' ID="TextBox8" meta:resourcekey="TextBox8Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#: Bind("EVENT_AFTER") %>' ID="lblAfter" meta:resourcekey="lblAfterResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="100px" Wrap="False" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="wbtnDeleteLog" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lblDocType" runat="server" Text="文件" Visible="False" meta:resourcekey="lblDocTypeResource1"></asp:Label>
    <asp:Label ID="lblFolderType" runat="server" Text="目錄" Visible="False" meta:resourcekey="lblFolderTypeResource1"></asp:Label>
    <asp:Label ID="lblAdd" runat="server" Text="新增" Visible="False" meta:resourcekey="lblAddResource1"></asp:Label>
    <asp:Label ID="lblDelete" runat="server" Text="刪除" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:Label ID="lblModify" runat="server" Text="修改" Visible="False" meta:resourcekey="lblModifyResource1"></asp:Label>
    <asp:Label ID="lblDownload" runat="server" Text="下載" Visible="False" meta:resourcekey="lblDownloadResource1"></asp:Label>
    <asp:Label ID="lblView" runat="server" Text="觀看" Visible="False" meta:resourcekey="lblViewResource1"></asp:Label>
    <asp:Label ID="lblPrint" runat="server" Text="列印" Visible="False" meta:resourcekey="lblPrintResource1"></asp:Label>
    <asp:Label ID="lblRelease" runat="server" Text="產生離線文件" Visible="False" meta:resourcekey="lblReleaseResource1"></asp:Label>
    <asp:Label ID="lblCheckDeleteLog" runat="server" Text="確定刪除全部的事件嗎?" Visible="False" meta:resourcekey="lblCheckDeleteLogResource1"></asp:Label>
    <asp:Label ID="lblSecurityType" runat="server" Text="安全性" Visible="False" meta:resourcekey="lblSecurityTypeResource1"></asp:Label>
    <asp:HiddenField ID="hfUserGuid" runat="server" />
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="Ede.Uof.DMS.DMSEvent" OldValuesParameterFormatString="original_{0}" SelectMethod="GetChoiceLog" EnablePaging="True" MaximumRowsParameterName="RowCount" SelectCountMethod="GetSelectCount" StartRowIndexParameterName="StartIndex" SortParameterName="sortExpression">
        <SelectParameters>
            <asp:Parameter Name="sortExpression" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

