<%@ Page Title="刷卡記錄" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="QueryPunchDetail.aspx.cs" Inherits="Ede.Uof.Web.EIP.Duty.Report.QueryPunchDetail" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="PopTable" style="width: 100%">
        <tr>
            <td style="width: 25%; white-space: nowrap;">
                <asp:Label ID="Label1" runat="server" Text="人員:" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td style="width: 25%; white-space: nowrap;">
                <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
            </td>
            <td style="width: 25%; white-space: nowrap;">
                <asp:Label ID="Label3" runat="server" Text="月份:" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td style="width: 25%; white-space: nowrap;">
                <asp:DropDownList ID="ddlYears" runat="server" meta:resourcekey="ddlYearsResource1">
                </asp:DropDownList>
                <asp:Label ID="Label4" runat="server" Text="年" meta:resourcekey="Label4Resource1"></asp:Label>
                <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged" meta:resourcekey="ddlMonthResource1">
                </asp:DropDownList>
                <asp:Label ID="Label5" runat="server" Text="月" meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Ede:Grid ID="punchGrid" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                EmptyDataText="沒有資料" EnhancePager="True"
                KeepSelectedRows="False" PageSize="31" Width="100%" AllowPaging="True" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" OnRowDataBound="punchGrid_RowDataBound" meta:resourcekey="punchGridResource1">
                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

                <ExportExcelSettings AllowExportToExcel="False" ExportType="DataSource"></ExportExcelSettings>
                <Columns>
                    <asp:TemplateField HeaderText="日期" meta:resourcekey="TemplateFieldResource1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" meta:resourcekey="TextBox4Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDate" runat="server" meta:resourcekey="lblDateResource1"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="星期" meta:resourcekey="TemplateFieldResource2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDayOfWeek" runat="server" meta:resourcekey="lblDayOfWeekResource1"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="50px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="簽到" meta:resourcekey="TemplateFieldResource3">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <table style="width: 80px" align="Center">
                                <tr>
                                    <td style="width: 5px;"></td>
                                    <td style="text-align: right; width: 50px; white-space: nowrap;">
                                        <asp:Label ID="lblWorkClockTime" runat="server" Text='<%# Bind("WORK_CLOCK_TIME") %>' meta:resourcekey="lblWorkClockTimeResource1"></asp:Label>
                                    </td>
                                    <td style="width: 5px;"></td>
                                    <td style="text-align: left; width: 15px; white-space: nowrap;">
                                        <asp:ImageButton ID="imgWorkLocation" runat="server" Visible="False" ImageUrl="~/Common/Images/Icon/icon_m207.png" meta:resourcekey="imgWorkLocationResource1" />
                                    </td>
                                    <td style="width: 5px;"></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="簽退" meta:resourcekey="TemplateFieldResource4">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <table style="width: 80px" align="Center">
                                <tr>
                                    <td style="width: 5px;"></td>
                                    <td style="text-align: right; width: 50px; white-space: nowrap;">
                                        <asp:Label ID="lblOffClockTime" runat="server" Text='<%# Bind("OFF_CLOCK_TIME") %>' meta:resourcekey="lblOffClockTimeResource1"></asp:Label>
                                    </td>
                                    <td style="width: 5px;"></td>
                                    <td style="text-align: left; width: 15px; white-space: nowrap;">
                                        <asp:ImageButton ID="imgOffLocation" runat="server" Visible="False" ImageUrl="~/Common/Images/Icon/icon_m207.png" meta:resourcekey="imgOffLocationResource1" />
                                    </td>
                                    <td style="width: 5px;"></td>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="False" />
                    </asp:TemplateField>
                </Columns>
            </Ede:Grid>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlMonth" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:Label ID="lblMonday" runat="server" Text="一" Visible="False" meta:resourcekey="lblMondayResource1"></asp:Label>
    <asp:Label ID="lblTuesday" runat="server" Text="二" Visible="False" meta:resourcekey="lblTuesdayResource1"></asp:Label>
    <asp:Label ID="lblWednesday" runat="server" Text="三" Visible="False" meta:resourcekey="lblWednesdayResource1"></asp:Label>
    <asp:Label ID="lblThursday" runat="server" Text="四" Visible="False" meta:resourcekey="lblThursdayResource1"></asp:Label>
    <asp:Label ID="lblFriday" runat="server" Text="五" Visible="False" meta:resourcekey="lblFridayResource1"></asp:Label>
    <asp:Label ID="lblSaturday" runat="server" Text="六" Visible="False" meta:resourcekey="lblSaturdayResource1"></asp:Label>
    <asp:Label ID="lblSunday" runat="server" Text="日" Visible="False" meta:resourcekey="lblSundayResource1"></asp:Label>
    <asp:Label ID="lblMapTitle" runat="server" Text="刷卡位置" Visible="False" meta:resourcekey="lblMapTitleResource1"></asp:Label>
</asp:Content>
