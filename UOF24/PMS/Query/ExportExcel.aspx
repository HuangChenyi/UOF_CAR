<%@ Page Language="C#" AutoEventWireup="true" Inherits="PMS_Query_ExportExcel" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ExportExcel.aspx.cs" %>

<!DOCTYPE html>
<html>
    <head runat="server">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <title></title>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <asp:Label ID="lblDraft" runat="server" Text="草稿" Visible="False" meta:resourcekey="lblDraftResource1" />
    <asp:Label ID="lblAudit" runat="server" Text="審核中"  Visible="False" meta:resourcekey="lblAuditResource1"/>
    <asp:Label ID="lblNotYetBegin" runat="server" Text="尚未開始" Visible="False" meta:resourcekey="lblNotYetBeginResource1" />
    <asp:Label ID="lblProceeding" runat="server" Text="進行中" Visible="False" meta:resourcekey="lblProceedingResource1" />
    <asp:Label ID="lblSuspend" runat="server" Text="已中止" Visible="False" meta:resourcekey="lblSuspendResource1" />
    <asp:Label ID="lblClose" runat="server" Text="已結案" Visible="False" meta:resourcekey="lblCloseResource1" />
    <asp:Label ID="lblCompleted" runat="server" Text="已完成" Visible="False" meta:resourcekey="lblCompletedResource1" />

    <asp:Label ID="lblPastDueTimeStart" runat="server" Text="逾時" Visible="False" meta:resourcekey="lblPastDueTimeStartResource1" />
    <asp:Label ID="lblPastDueTimeEnd" runat="server" Text="天" Visible="False" meta:resourcekey="lblPastDueTimeEndResource1" />
    
    <asp:Label ID="lblProjName" runat="server" Text="*專案名稱" Visible="False" meta:resourcekey="lblProjNameResource1" />
    <asp:Label ID="lblDEscript" runat="server" Text="說明" Visible="False" meta:resourcekey="lblDEscriptResource1" />
    <asp:Label ID="lblStartTime" runat="server" Text="起案日" Visible="False" meta:resourcekey="lblStartTimeResource1" />
    <asp:Label ID="lblEndTime" runat="server" Text="結案日" Visible="False" meta:resourcekey="lblEndTimeResource1" />
    <asp:Label ID="lblAuditor" runat="server" Text="*審核者" Visible="False" meta:resourcekey="lblAuditorResource1" />
    <asp:Label ID="lblPMAccout" runat="server" Text="*專案負責人帳號" Visible="False" meta:resourcekey="lblPMAccoutResource1" />
    <asp:Label ID="lblPMName" runat="server" Text="專案負責人姓名" Visible="False" meta:resourcekey="lblPMNameResource1" />
    <asp:Label ID="lblStatus" runat="server" Text="目前狀態" Visible="False" meta:resourcekey="lblStatusResource1" />
    
    <asp:Label ID="lblSeiresAndTaskName" runat="server" Text="階段/任務名稱" Visible="False" meta:resourcekey="lblSeiresAndTaskNameResource1" />
    <asp:Label ID="lblExpectedEnd" runat="server" Text="預計完成日" Visible="False" meta:resourcekey="lblExpectedEndResource1" />
    <asp:Label ID="lblExpectedStart" runat="server" Text="預計開始日" Visible="False" meta:resourcekey="lblExpectedStartResource1" />
    <asp:Label ID="lblPracticalEnd" runat="server" Text="實際完成日"  Visible="False" meta:resourcekey="lblPracticalEndResource1"/>
    <asp:Label ID="lblPracticalStart" runat="server" Text="實際開始日" Visible="False" meta:resourcekey="lblPracticalStartResource1" /> 
    <asp:Label ID="lblYesNoSeires" runat="server" Text="*是否為階段" Visible="False" meta:resourcekey="lblYesNoSeiresResource1" />
    <asp:Label ID="lblSEQCode" runat="server" Text="*階層編號" Visible="False" meta:resourcekey="lblSEQCodeResource1" />
    <asp:Label ID="lblAccout" runat="server" Text="*負責人帳號" Visible="False" meta:resourcekey="lblAccoutResource1" />
    <asp:Label ID="lblName" runat="server" Text="負責人姓名" Visible="False" meta:resourcekey="lblNameResource1" />
    <asp:Label ID="lblBCWS" runat="server" Text="預估成本" Visible="False" meta:resourcekey="lblBCWSResource1" />
    <asp:Label ID="lblBCWP" runat="server" Text="實際成本" Visible="False"  meta:resourcekey="lblBCWPResource1"/>
    <asp:Label ID="lblACWP" runat="server" Text="已執行成本" Visible="False" meta:resourcekey="lblACWPResource1" />
    </form>
</body>
</html>
