<%@ Page Language="C#" AutoEventWireup="true" Inherits="EIP_Duty_Report_ExportMonthDataDetailByUser" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ExportMonthDataDetailByUser.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblWeek" runat="server" Text="星期" Visible ="False" meta:resourcekey="lblWeekResource1"></asp:Label>
        <asp:Label ID="lblSignIn" runat="server" Text="簽到" Visible ="False" meta:resourcekey="lblSignInResource1"></asp:Label>
        <asp:Label ID="lblSignOut" runat="server" Text="簽退" Visible ="False" meta:resourcekey="lblSignOutResource1"></asp:Label>
        <asp:Label ID="lblLeave" runat="server" Text="請假" Visible ="False" meta:resourcekey="lblLeaveResource1"></asp:Label>
        <asp:Label ID="lblOverTime" runat="server" Text="加班" Visible ="False" meta:resourcekey="lblOverTimeResource1"></asp:Label>
        <asp:Label ID="lblTrival" runat="server" Text="出差" Visible ="False" meta:resourcekey="lblTrivalResource1"></asp:Label>
        <asp:Label ID="lblStatus" runat="server" Text="狀態" Visible ="False" meta:resourcekey="lblStatusResource1"></asp:Label>
        <asp:Label ID="lblName" runat="server" Text="人員:" Visible ="False" meta:resourcekey="lblNameResource1"></asp:Label>
        <asp:Label ID="lblMonday" runat="server" Text="一" Visible="False" meta:resourcekey="lblMondayResource1"></asp:Label>
        <asp:Label ID="lblTuesday" runat="server" Text="二" Visible="False" meta:resourcekey="lblTuesdayResource1"></asp:Label>
        <asp:Label ID="lblWednesday" runat="server" Text="三" Visible="False" meta:resourcekey="lblWednesdayResource1"></asp:Label>
        <asp:Label ID="lblThursday" runat="server" Text="四" Visible="False" meta:resourcekey="lblThursdayResource1"></asp:Label>
        <asp:Label ID="lblFriday" runat="server" Text="五" Visible="False" meta:resourcekey="lblFridayResource1"></asp:Label>
        <asp:Label ID="lblSaturday" runat="server" Text="六" Visible="False" meta:resourcekey="lblSaturdayResource1"></asp:Label>
        <asp:Label ID="lblSunday" runat="server" Text="日" Visible="False" meta:resourcekey="lblSundayResource1"></asp:Label>
        <asp:Label ID="lblNormal" runat="server" Text="正常" Visible="False" meta:resourcekey="lblNormalResource1"></asp:Label> 
        <asp:Label ID="lblLate" runat="server" Text="遲到" Visible="False" meta:resourcekey="lblLateResource1"></asp:Label> 
        <asp:Label ID="lblAbsent" runat="server" Text="曠職" Visible="False" meta:resourcekey="lblAbsentResource1"></asp:Label> 
        <asp:Label ID="lblLateAndAnsent" runat="server" Text="遲到又曠職" Visible="False" meta:resourcekey="lblLateAndAnsentResource1"></asp:Label> 
        <asp:Label ID="lblNoTimeTable" runat="server" Text="無班表" Visible="False" meta:resourcekey="lblNoTimeTableResource1"></asp:Label> 
   
        
         <asp:Label ID="lblStaticts" runat="server" Text="統計" Visible ="False" meta:resourcekey="lblStatictsResource1" ></asp:Label>
         <asp:Label ID="lblLateDetail" runat="server" Text="遲到明細" Visible ="False" meta:resourcekey="lblLateDetailResource1" ></asp:Label>
         <asp:Label ID="lblForgetDetail" runat="server" Text="忘刷卡明細" Visible ="False" meta:resourcekey="lblForgetDetailResource1" ></asp:Label>
         <asp:Label ID="lblAbsentDetail" runat="server" Text="曠職明細" Visible ="False" meta:resourcekey="lblAbsentDetailResource1" ></asp:Label>
        <asp:Label ID="lblAccount" runat="server" Text="帳號"  Visible="False" meta:resourcekey="lblAccountResource1" ></asp:Label>
          <asp:Label ID="lblUserName" runat="server" Text="姓名" Visible="False" meta:resourcekey="lblUserNameResource1"></asp:Label>
         <asp:Label ID="lblEmpNo" runat="server" Text="員工編號" Visible="False" meta:resourcekey="lblEmpNoResource1"></asp:Label>
         <asp:Label ID="lblGroupName" runat="server" Text="部門名稱" Visible="False" meta:resourcekey="lblGroupNameResource1"></asp:Label>
        <asp:Label ID="lblLateDate" runat="server" Text="遲到日期" Visible="False" meta:resourcekey="lblLateDateResource1"></asp:Label>
         <asp:Label ID="lblLateMins" runat="server" Text="遲到分鐘數" Visible="False" meta:resourcekey="lblLateMinsResource1"></asp:Label>
        
          <asp:Label ID="lblPunchDate" runat="server" Text="補刷卡日期" Visible="False" meta:resourcekey="lblPunchDateResource1"></asp:Label>
          <asp:Label ID="lblPunchWork" runat="server" Text="上班忘刷卡" Visible="False" meta:resourcekey="lblPunchWorkResource1"></asp:Label>
          <asp:Label ID="lblPunchOff" runat="server" Text="下班忘刷卡" Visible="False" meta:resourcekey="lblPunchOffResource1"></asp:Label>
        
            <asp:Label ID="lblAbsentDate" runat="server" Text="曠職日期" Visible="False" meta:resourcekey="lblAbsentDateResource1"></asp:Label>
          <asp:Label ID="lblAbsentHours" runat="server" Text="曠職時數" Visible="False" meta:resourcekey="lblAbsentHoursResource1"></asp:Label>
        
         </div>
    </form>
</body>
</html>
