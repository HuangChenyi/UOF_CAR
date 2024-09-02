<%@ Page Title="預覽班表" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKFOptionalFields_PreviewTimeTable" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="PreviewTimeTable.aspx.cs" %>
<%@ Register assembly="Ede.Uof.Utility.Component.Grid" namespace="Ede.Uof.Utility.Component" tagprefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        Sys.Application.add_load(function () {
            var curwindow = $uof.dialog.getOpener();
            var pd;
            if (curwindow) {
                pd = curwindow.document;
            } else if (typeof (dialogArguments) != "undefined") {
                pd = dialogArguments.document;
            }
            if (pd) {

                $("#<%=hidUser.ClientID %>").val($("#<%=Request.QueryString["users"]%>", pd).val());
                if ($('#<%= hidPostBack.ClientID%>').val() === "First") {
                    $('#<%= btnLoadUser.ClientID%>').click();
                }
            }
        });
        
    </script>
<table width="100%" class="PopTable">
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="查詢日期" 
                meta:resourcekey="Label1Resource1"></asp:Label>
        </td>
        <td>
            <telerik:RadDatePicker ID="rdDate" runat="server" AutoPostBack="True" OnSelectedDateChanged="rdDate_SelectedDateChanged">
                <Calendar runat="server" UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>
                <DateInput runat="server"  LabelWidth="40%" AutoPostBack="True"></DateInput>
                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
            </telerik:RadDatePicker>
        </td>
    </tr>
</table>
 <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False"
                                        AutoGenerateColumns="False" 
                                        DataKeyOnClientWithCheckBox="False" 
                            DefaultSortDirection="Ascending"
                                        EnhancePager="True" OnRowDataBound="Grid1_RowDataBound" 
                            PageSize="15" 
                                         Width="100%" 
                            EmptyDataText="沒有資料" KeepSelectedRows="False" 
                            meta:resourcekey="Grid1Resource1" 
        onsorting="Grid1_Sorting" AllowSorting="True" 
          >
                                        <ExportExcelSettings AllowExportToExcel="False" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="人員" meta:resourcekey="TemplateFieldResource1">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUser" runat="server" meta:resourcekey="lblUserResource1"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="工時" SortExpression="WORK_HOUR" 
                                                meta:resourcekey="TemplateFieldResource3">
                                                <ItemTemplate>                                                    
                                                    <asp:Label  ID="txtWorkHour" runat="server" Text='<%# Bind("WORK_HOUR") %>' 
                                                        meta:resourcekey="txtWorkHourResource1" ></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="彈性最早上班時間" SortExpression="WORK_TIME_ET" 
                                                meta:resourcekey="TemplateFieldResource4">
                                                <ItemTemplate>                                                    
                                                    <asp:Label  ID="txtWTE" runat="server" 
                                                        Text='<%# GetTime(Eval("WORK_TIME_ET")) %>' meta:resourcekey="txtWTEResource1" ></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="上班時間" SortExpression="WORK_TIME" 
                                                meta:resourcekey="TemplateFieldResource5">
                                                <ItemTemplate>
                                                    <asp:Label  ID="txtWT" runat="server" Text='<%# GetTime(Eval("WORK_TIME")) %>' 
                                                        meta:resourcekey="txtWTResource1" ></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" />
                                            </asp:TemplateField>                                            
                                            <asp:TemplateField HeaderText="彈性最晚上班時間" SortExpression="WORK_TIME_LT" 
                                                meta:resourcekey="TemplateFieldResource6">
                                                <ItemTemplate>
                                                    <asp:Label  ID="txtWTL" runat="server" 
                                                        Text='<%# GetTime(Eval("WORK_TIME_LT")) %>' meta:resourcekey="txtWTLResource1" ></asp:Label>
                                                </ItemTemplate>
                                                 <HeaderStyle Wrap="False" />
                                                    <ItemStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="休息開始時間" SortExpression="LUNCH_TIME_BT" 
                                                meta:resourcekey="TemplateFieldResource7">
                                                <ItemTemplate>
                                                    <asp:Label  ID="txtLTB" runat="server" 
                                                        Text='<%# GetTime(Eval("LUNCH_TIME_BT")) %>' 
                                                        meta:resourcekey="txtLTBResource1" ></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="休息結束時間" SortExpression="LUNCH_TIME_ET" 
                                                meta:resourcekey="TemplateFieldResource8">
                                                <ItemTemplate>
                                                    <asp:Label  ID="txtLTE" runat="server" 
                                                        Text='<%# GetTime(Eval("LUNCH_TIME_ET")) %>' 
                                                        meta:resourcekey="txtLTEResource1" ></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="彈性最早下班時間" SortExpression="OFF_TIME_ET" 
                                                meta:resourcekey="TemplateFieldResource9">
                                                <ItemTemplate>
                                                    <asp:Label  ID="txtOTE" runat="server" 
                                                        Text='<%# GetTime(Eval("OFF_TIME_ET")) %>' meta:resourcekey="txtOTEResource1" ></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="下班時間" SortExpression="OFF_TIME" 
                                                meta:resourcekey="TemplateFieldResource10">
                                                <ItemTemplate>
                                                    <asp:Label  ID="txtOT" runat="server" Text='<%# GetTime(Eval("OFF_TIME")) %>' 
                                                        meta:resourcekey="txtOTResource1" ></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="彈性最晚下班時間" SortExpression="OFF_TIME_LT" 
                                                meta:resourcekey="TemplateFieldResource11">
                                                <ItemTemplate>
                                                    <asp:Label  ID="txtOTL" runat="server" 
                                                        Text='<%# GetTime(Eval("OFF_TIME_LT")) %>' meta:resourcekey="txtOTLResource1" ></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="類型" meta:resourcekey="TemplateFieldResource13">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblHolidayType" runat="server" meta:resourcekey="lblHolidayTypeResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="備註"   
                                                meta:resourcekey="TemplateFieldResource12">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtRemark" runat="server" Rows="2" TextMode="MultiLine" 
                                                        ReadOnly="True" Text='<%# Eval("REMARK") %>' 
                                                        meta:resourcekey="txtRemarkResource1"  ></asp:TextBox>                                                   
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                            </asp:TemplateField>                                            
                                            <%--<asp:BoundField DataField="REMARK" HeaderText="備註"   />--%>
                                        </Columns>
                                        <EnhancePagerSettings
                                            ShowHeaderPager="True" />
                                    </Fast:Grid>
<br />
    <asp:Label ID="lblNoTimetable" runat="server" Text="未匯入班表" Visible="False" 
        meta:resourcekey="lblNoTimetableResource1"></asp:Label>
    <asp:Label ID="lblWorkDay" runat="server" Text="工作日" Visible="False" meta:resourcekey="lblWorkDayResource1"></asp:Label>
    <asp:Label ID="lblDayoff" runat="server" Text="休息日" Visible="False" meta:resourcekey="lblDayoffResource1"></asp:Label>
    <asp:Label ID="lblRoutine" runat="server" Text="例假日" Visible="False" meta:resourcekey="lblRoutineResource1"></asp:Label>
    <asp:Label ID="lblHoliday" runat="server" Text="國定假日" Visible="False" meta:resourcekey="lblHolidayResource1"></asp:Label>
    <asp:HiddenField ID="hidPostBack" runat="server" />
    <asp:HiddenField ID="hidUser" runat="server" />
    <div style="display: none">
        <asp:Button ID="btnLoadUser" runat="server" Text="" onclick="btnLoadUser_Click" />    
    </div>
</asp:Content>

