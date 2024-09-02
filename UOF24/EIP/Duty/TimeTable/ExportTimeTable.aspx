<%@ Page Title="匯出班表" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ExportTimeTable.aspx.cs" Inherits="Ede.Uof.Web.EIP.Duty.TimeTable.ExportTimeTable" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>


<%@ Register Src="~/Common/Organization/DepartmentTree.ascx" TagPrefix="uc1" TagName="DepartmentTree" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function OnValueChanging(sender, args) {
            if (args.get_newValue() == "") {
                args.set_newValue(args.get_oldValue());
            }
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <table width="100%" class="PopTable" cellspacing="1">
                <tr>
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label3" runat="server" Text="匯出日期" meta:resourcekey="Label3Resource1" ></asp:Label></td>
                    <td>
                        <telerik:RadDatePicker ID="rdStart" runat="server"  meta:resourcekey="rdStartResource1">
                            <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                            </Calendar>
                            <DateInput LabelWidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                <ClientEvents OnValueChanging="OnValueChanging" />
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
                        <asp:Label ID="Label4" runat="server" Text="~" meta:resourcekey="Label4Resource1"></asp:Label>
                        <telerik:RadDatePicker ID="rdEnd" runat="server"  meta:resourcekey="rdEndResource1">
                            <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                            </Calendar>
                            <DateInput LabelWidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                <ClientEvents OnValueChanging="OnValueChanging" />
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
                <tr>
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label1" runat="server" Text="選擇部門" meta:resourcekey="Label1Resource1"></asp:Label></td>
                    <td>
                        <div style="height: 350px; overflow-x: hidden; overflow-y: auto;">
                            <uc1:DepartmentTree runat="server" ID="DepartmentTree" DisplayActiveControl="true"/>
                        </div>
                    </td>
                </tr>

            </table>
            <asp:Label ID="lblExportMsg" runat="server" Text="匯出Excel" Visible="False" meta:resourcekey="lblExportMsgResource1"></asp:Label>            
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
