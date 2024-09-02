<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_OrganizationCalendar_ChangeEvent" Title="修改事件" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ChangeEvent.aspx.cs" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<%@ Register Src="../Calendar/Common/UC_Periodicity.ascx" TagName="UC_Periodicity" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="沒有權限設定" meta:resourcekey="CustomValidator3Resource1" ></asp:CustomValidator>
    <table class="PopTable" cellspacing="1" width="100%">
        <tr>
            <td >
                <font color="red">*</font><asp:Label ID="Label1" runat="server" Text="主旨" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td >
                <asp:TextBox ID="txtSubject" runat="server" MaxLength="50" meta:resourcekey="txtSubjectResource1" Width="100%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubject"
                    Display="Dynamic" ErrorMessage="請填入主旨" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label2" runat="server" Text="說明" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server" Height="200px" TextMode="MultiLine" Width="100%" meta:resourcekey="txtDescriptionResource1"></asp:TextBox></td>
        </tr>
        <tr runat="server" id="tr_DisplayTimeZone">
            <td>
                <asp:Label ID="Label7" runat="server" Text="時區" meta:resourcekey="Label7Resource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlDisplayTimeZone" runat="server"></asp:DropDownList>                
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <asp:Label ID="Label3" runat="server" Text="開始時間" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td style="white-space:nowrap;">
                <table border="0" cellpadding="0" cellspacing="0" >
                    <tr>
                        <td>
                            <asp:Label ID="lblStartTime" runat="server" Visible="false"></asp:Label>
                            <telerik:RadDatePicker ID="rdpStartDate" Runat="server"  
                                meta:resourcekey="rdpStartDateResource1">
                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>

                            <DateInput  LabelWidth="64px" Width=""></DateInput>

                            <DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                            </telerik:RadDatePicker>
                       </td>
                       <td >
                            <telerik:RadTimePicker ID="rdpStartTime" Runat="server"
                                meta:resourcekey="rdpStartTimeResource1">
                                <Calendar runat="server"  UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>

                                <DatePopupButton Visible="False" CssClass="" ImageUrl="" HoverImageUrl="" ></DatePopupButton>

                                <TimeView  runat="server" CellSpacing="-1" Columns="6" TimeFormat="HH:mm" ></TimeView>

                                <TimePopupButton CssClass="" ImageUrl="" HoverImageUrl=""></TimePopupButton>

                                <DateInput runat="server"   Width="" DisplayDateFormat="HH:mm" DateFormat="HH:mm" LabelWidth="64px"></DateInput>
                            </telerik:RadTimePicker>
                        </td>
                        <td style="width: 5px;" align="center">
                        </td>
                        <td >
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="全天" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" meta:resourcekey="CheckBox1Resource1"  />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label4" runat="server" Text="結束時間" meta:resourcekey="Label4Resource1"></asp:Label></td>
            <td >
                <asp:Label ID="lblEndTime" runat="server" Visible="false"></asp:Label>
                <table border="0" cellpadding="0" cellspacing="0">
                <tr><td width="20%">
                            <telerik:RadDatePicker ID="rdpEndDate" Runat="server"  
                                meta:resourcekey="rdpEndDateResource1">
                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>

                            <DateInput  LabelWidth="64px" Width=""></DateInput>

                            <DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                            </telerik:RadDatePicker>
                </td>
                <td>
                            <telerik:RadTimePicker ID="rdpEndTime" Runat="server"
                                meta:resourcekey="rdpEndTimeResource1" >
                                <Calendar ID="Calendar1" runat="server"   UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>

                                <DatePopupButton Visible="False" CssClass="" ImageUrl="" HoverImageUrl=""></DatePopupButton>

                                <TimeView ID="TimeView1" runat="server"  CellSpacing="-1" Columns="6" TimeFormat="HH:mm"></TimeView>

                                <TimePopupButton CssClass="" ImageUrl="" HoverImageUrl=""></TimePopupButton>

                                <DateInput ID="DateInput1" runat="server"  Width="" DisplayDateFormat="HH:mm" DateFormat="HH:mm"   LabelWidth="64px"></DateInput>
                            </telerik:RadTimePicker>
                </td>
                <td style="width: 5px;" align="center">
                </td>
                <td  align="center">
                </td>
                </tr>
                <tr>
                <td colspan="3" >
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請填入開始結束時間或勾選全天" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="請填入開始時間" ForeColor="Red" OnServerValidate="CustomValidator2_ServerValidate" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="請填入結束時間" ForeColor="Red" OnServerValidate="CustomValidator4_ServerValidate1" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic" ErrorMessage="開始時間需在結束時間之前" ForeColor="Red" OnServerValidate="CustomValidator5_ServerValidate" meta:resourcekey="CustomValidator5Resource1"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator6" runat="server" Display="Dynamic" ErrorMessage="週期性事件僅限當日" ForeColor="Red" OnServerValidate="CustomValidator6_ServerValidate" meta:resourcekey="CustomValidator6Resource1"></asp:CustomValidator></td>
                </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="建立人員" meta:resourcekey="Label5Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblCreateuser" runat="server" meta:resourcekey="lblCreateuserResource1"></asp:Label></td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label6" runat="server" Text="週期性" meta:resourcekey="Label6Resource1"></asp:Label></td>
            <td >
                <uc1:UC_Periodicity ID="UC_Periodicity1" runat="server" />
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:Label ID="lblSelect" runat="server" Text="請選擇" Visible="false" meta:resourcekey="lblSelectResource1"></asp:Label>
</asp:Content>

