<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Report_QueryTimeTableByUser" Codebehind="QueryTimeTableByUser.aspx.cs" %>
<%@ Register assembly="Ede.Uof.Utility.Component.Grid" namespace="Ede.Uof.Utility.Component" tagprefix="Fast" %>
<%@ Register src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" tagname="UC_ChoiceList" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="PopTable" cellspacing="1" width="80%">
        <tr>
            <td style="white-space:nowrap; width:25%;">
                <asp:Label ID="Label3" runat="server" Text="人員" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td style="white-space:nowrap; width:25%;">
                <asp:Label ID="lbUser" runat="server" meta:resourcekey="lbUserResource1"></asp:Label>
            </td>
            <td style="white-space:nowrap; width:25%;">
                <asp:Label ID="Label2" runat="server" Text="年度" meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="/"></asp:Label>
                <asp:Label ID="Label4" runat="server" Text="月份" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td style="white-space:nowrap; width:25%;">
                <asp:DropDownList ID="ddlAnnual" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlAnnual_SelectedIndexChanged" 
                    meta:resourcekey="ddlAnnualResource1">
                </asp:DropDownList>
                <asp:Label ID="Label5" runat="server" Text="/"></asp:Label>
                <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlMonth_SelectedIndexChanged" 
                    meta:resourcekey="ddlMonthResource1">
                    <asp:ListItem meta:resourcekey="ListItemResource1">1</asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource2">2</asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource3">3</asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource4">4</asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource5">5</asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource6">6</asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource7">7</asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource8">8</asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource9">9</asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource10">10</asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource11">11</asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource12">12</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" RenderMode="Inline">
                    <ContentTemplate>
                        <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False"
                                        AutoGenerateColumns="False"  DataKeyNames="DAY"
                                        DataKeyOnClientWithCheckBox="False" 
                            DefaultSortDirection="Ascending" EnableModelValidation="True"
                                        EnhancePager="True" OnRowDataBound="Grid1_RowDataBound" 
                            PageSize="15" 
                                         Width="100%" DefaultSortColumnName="DAY" 
                            onsorting="Grid1_Sorting" AllowSorting="True" 
                            EmptyDataText="沒有資料" KeepSelectedRows="False" 
                            meta:resourcekey="Grid1Resource1">
                                        <ExportExcelSettings AllowExportToExcel="False" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="日期" SortExpression="DAY" 
                                                meta:resourcekey="TemplateFieldResource1">
                                                <ItemTemplate>                                               
                                                    <asp:Label ID="lbDate" runat="server" Text='<%# GetDateName(Eval("DAY")) %>' meta:resourcekey="lbDateResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False"   />
                                            </asp:TemplateField>                                           
                                            <asp:TemplateField HeaderText="星期" meta:resourcekey="TemplateFieldResource2">
                                                <ItemTemplate>                                                    
                                                    <asp:Label  ID="txtWeekDay" runat="server" 
                                                        Text='<%# GetWeekName(Eval("DAY")) %>' meta:resourcekey="txtWeekDayResource1" ></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="工時" SortExpression="WORK_HOUR" 
                                                meta:resourcekey="TemplateFieldResource3">
                                                <ItemTemplate>                                                    
                                                    <asp:Label  ID="txtWorkHour" runat="server" Text='<%# Bind("WORK_HOUR") %>' 
                                                        meta:resourcekey="txtWorkHourResource1" ></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Right"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="彈性最早上班時間" SortExpression="WORK_TIME_ET" 
                                                meta:resourcekey="TemplateFieldResource4">
                                                <ItemTemplate>                                                    
                                                    <asp:Label  ID="txtWTE" runat="server" 
                                                        Text='<%# GetTime(Eval("WORK_TIME_ET")) %>' meta:resourcekey="txtWTEResource1" ></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="上班時間" SortExpression="WORK_TIME" 
                                                meta:resourcekey="TemplateFieldResource5">
                                                <ItemTemplate>
                                                    <asp:Label  ID="txtWT" runat="server" Text='<%# GetTime(Eval("WORK_TIME")) %>' 
                                                        meta:resourcekey="txtWTResource1" ></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                                            </asp:TemplateField>                                            
                                            <asp:TemplateField HeaderText="彈性最晚上班時間" SortExpression="WORK_TIME_LT" 
                                                meta:resourcekey="TemplateFieldResource6">
                                                <ItemTemplate>
                                                    <asp:Label  ID="txtWTL" runat="server" 
                                                        Text='<%# GetTime(Eval("WORK_TIME_LT")) %>' meta:resourcekey="txtWTLResource1" ></asp:Label>
                                                </ItemTemplate>
                                                 <HeaderStyle Wrap="False" />
                                                    <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="休息開始時間" SortExpression="LUNCH_TIME_BT" 
                                                meta:resourcekey="TemplateFieldResource7">
                                                <ItemTemplate>
                                                    <asp:Label  ID="txtLTB" runat="server" 
                                                        Text='<%# GetTime(Eval("LUNCH_TIME_BT")) %>' 
                                                        meta:resourcekey="txtLTBResource1" ></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="休息結束時間" SortExpression="LUNCH_TIME_ET" 
                                                meta:resourcekey="TemplateFieldResource8">
                                                <ItemTemplate>
                                                    <asp:Label  ID="txtLTE" runat="server" 
                                                        Text='<%# GetTime(Eval("LUNCH_TIME_ET")) %>' 
                                                        meta:resourcekey="txtLTEResource1" ></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="彈性最早下班時間" SortExpression="OFF_TIME_ET" 
                                                meta:resourcekey="TemplateFieldResource9">
                                                <ItemTemplate>
                                                    <asp:Label  ID="txtOTE" runat="server" 
                                                        Text='<%# GetTime(Eval("OFF_TIME_ET")) %>' meta:resourcekey="txtOTEResource1" ></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="下班時間" SortExpression="OFF_TIME" 
                                                meta:resourcekey="TemplateFieldResource10">
                                                <ItemTemplate>
                                                    <asp:Label  ID="txtOT" runat="server" Text='<%# GetTime(Eval("OFF_TIME")) %>' 
                                                        meta:resourcekey="txtOTResource1" ></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="彈性最晚下班時間" SortExpression="OFF_TIME_LT" 
                                                meta:resourcekey="TemplateFieldResource11">
                                                <ItemTemplate>
                                                    <asp:Label  ID="txtOTL" runat="server" 
                                                        Text='<%# GetTime(Eval("OFF_TIME_LT")) %>' meta:resourcekey="txtOTLResource1" ></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="類型" meta:resourcekey="TemplateFieldResource13">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblHolidayType" runat="server" meta:resourcekey="lblHolidayTypeResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="備註"   
                                                meta:resourcekey="TemplateFieldResource12">
                                                <ItemTemplate>
                                                   <%-- <asp:Label ID="lblRemark" runat="server" Text='<%#Eval("REMARK") %>'></asp:Label>--%>
                                                    <asp:TextBox ID="txtRemark" runat="server" Rows="2" TextMode="MultiLine" ReadOnly="true" style=" width:100%;" Text='<%#Eval("REMARK") %>'  ></asp:TextBox>                                                   
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                            </asp:TemplateField>                                            
                                            <%--<asp:BoundField DataField="REMARK" HeaderText="備註"   />--%>
                                        </Columns>
                                        <EnhancePagerSettings
                                            ShowHeaderPager="True" />
                                    </Fast:Grid>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlAnnual" 
                            EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ddlMonth" 
                            EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:Label ID="lblWorkDay" runat="server" Text="工作日" Visible="False" meta:resourcekey="lblWorkDayResource1"></asp:Label>
    <asp:Label ID="lblDayoff" runat="server" Text="休息日" Visible="False" meta:resourcekey="lblDayoffResource1"></asp:Label>
    <asp:Label ID="lblRoutine" runat="server" Text="例假日" Visible="False" meta:resourcekey="lblRoutineResource1"></asp:Label>
    <asp:Label ID="lblHoliday" runat="server" Text="國定假日" Visible="False" meta:resourcekey="lblHolidayResource1"></asp:Label>
</asp:Content>
