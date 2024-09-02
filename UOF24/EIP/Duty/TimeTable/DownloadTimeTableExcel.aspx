<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DownloadTimeTableExcel.aspx.cs" Title="匯出班表" Inherits="Ede.Uof.Web.EIP.Duty.TimeTable.DownloadTimeTableExcel" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblEmpNbr" runat="server" Text="員工編號" meta:resourcekey="lblEmpNbrResource1"></asp:Label>
        <asp:Label ID="lblName" runat="server" Text="姓名" meta:resourcekey="lblNameResource1"></asp:Label>
        <asp:Label ID="lblNoTimeTable" runat="server" Text="沒有班表" meta:resourcekey="lblNoTimeTableResource1"></asp:Label>
        <asp:Label ID="lblWorkDay" runat="server" Text="工作日" Visible="False" meta:resourcekey="lblWorkDayResource1"></asp:Label>
        <asp:Label ID="lblDayoff" runat="server" Text="休息日" Visible="False" meta:resourcekey="lblDayoffResource1"></asp:Label>
        <asp:Label ID="lblRoutine" runat="server" Text="例假日" Visible="False" meta:resourcekey="lblRoutineResource1"></asp:Label>
        <asp:Label ID="lblHoliday" runat="server" Text="國定假日" Visible="False" meta:resourcekey="lblHolidayResource2"></asp:Label>
    </div>
    </form>
</body>
</html>