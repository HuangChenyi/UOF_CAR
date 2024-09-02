<%@ Control Language="C#" AutoEventWireup="true" Inherits="Ede.Uof.EIP.Schedule.UI.UC_MonthListWithMenu" CodeBehind="UC_MonthListWithMenu.ascx.cs" %>
<%@ Register Src="UC_MonthList.ascx" TagName="UC_MonthList" TagPrefix="uc3" %>
<%@ Register Src="UC_Calendar.ascx" TagName="UC_Calendar" TagPrefix="uc1" %>
<%@ Register Src="UC_CalendarMenu.ascx" TagName="UC_CalendarMenu" TagPrefix="uc2" %>

<div onclick="Window_OnClick()">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table border="1" cellpadding="1" cellspacing="1" width="100%" style="background-color: white; vertical-align: top">
                <tr>
                    <td align="left" style="width: 180px; vertical-align: top">
                        <uc1:UC_Calendar ID="UC_Calendar1" runat="server" />
                        <uc2:UC_CalendarMenu ID="UC_CalendarMenu1" runat="server" />
                        <p></p>
                        <br />
                    </td>
                    <td style="vertical-align: top; text-align: left">
                        <uc3:UC_MonthList ID="UC_MonthList1" runat="server" ShowQueryType="True" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenXML" runat="server" />
            <asp:Label ID="lblXML" runat="server" Text="" Visible="false"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
