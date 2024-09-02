<%@ Control Language="C#" AutoEventWireup="true" Inherits="PMS_Common_UC_TaskDetail" Codebehind="UC_TaskDetail.ascx.cs" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc3" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc1" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>


<script type="text/javascript" >
function fnTaskName(source, arguments)
{
        var taskName = $('#<% = txtTaskName.ClientID %>').val();
        if (taskName == '') 
        {
            arguments.IsValid = false;
        }
        else 
        {
            arguments.IsValid = true;
        }
}

function fnPredStart(source, arguments)
{
        var predStart = $('#<% = rdpPredStart.ClientID %>').val();
        if (predStart == '') 
        {
            arguments.IsValid = false;
        }
        else 
        {
            arguments.IsValid = true;
        }
}

function fnPredEnd(source, arguments)
{
        var predEnd = $('#<% = rdpPredEnd.ClientID %>').val();
        if (predEnd == '') 
        {
            arguments.IsValid = false;
        }
        else 
        {
            arguments.IsValid = true;
        }
}

function fnChoiceList(source, arguments)
{
    var choiceList = $('#<%= ucChoiceList.ClientID %>' + "_hiddenJSON").val();<%--<%=ucChoiceList.UserSet.Items.Count %>;--%>
    var result = JSON.parse(choiceList);
    
        //alert(choiceList);
    if (result == null)
    {
            arguments.IsValid = false;
    }
    var list = [];
    list.push.apply(list, result["UserSet"]["Element"]);
    if (list.length == 0) {
        arguments.IsValid = false;
    }
    else {
        arguments.IsValid = true;
    }
}
    function DialogRelationTask(oButton, oEvent) {
        var Mode = "Show";
        var projGUID = $('#<% = hidRelationTaskProjGUID.ClientID %>').val();
        var relatonGUID = $('#<% = hidRelationTaskGUID.ClientID %>').val();
        var TaskStatus = $('#<% = hidRelationTaskStatus.ClientID %>').val();
        $uof.dialog.open2("~/PMS/Maintain/TaskDetail.aspx", oButton, "", 500, 600, function () { return false; },
            { "Mode": Mode, "PROJECT_GUID": projGUID, "GUID": relatonGUID, "TaskStatus": TaskStatus });
        return false;
    }
</script>    
    
<table id="table1" class="PopTable" width="100%" cellspacing="1">
    <tr>
        <td style="white-space:nowrap">
            <span style="color: #ff0000"></span>
            <asp:Label ID="Label15" runat="server" Text="專案名稱" meta:resourcekey="Label15Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblProjName" runat="server" meta:resourcekey="lblProjNameResource1"></asp:Label></td>
    </tr>
    <tr>
        <td style="white-space:nowrap">
            <span style="color: #ff0000">*</span><asp:Label ID="Label1" runat="server" Text="任務名稱" meta:resourcekey="Label1Resource1"></asp:Label></td>
        <td>
            <table cellpadding="0" cellspacing="0" border="0"><tr>
            <td>
            <asp:Label ID="lblSEQ" runat="server" meta:resourcekey="lblSEQResource1"></asp:Label> 
            <asp:TextBox ID="txtTaskName" runat="server" MaxLength="50" Width="100%" meta:resourcekey="txtTaskNameResource1"></asp:TextBox>
            <asp:HiddenField ID="hidTaskGUID" runat="server" />
            </td>
            <td><asp:CustomValidator ID="cvTaskName" runat="server" ForeColor="Red" ClientValidationFunction="fnTaskName" Display="Dynamic" meta:resourcekey="cvTaskNameResource1"></asp:CustomValidator>
            </td>
            </tr></table>
            </td>
    </tr>
    <tr>
        <td style="white-space:nowrap">
            <asp:Label ID="Label2" runat="server" Text="任務說明" meta:resourcekey="Label2Resource1"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtTaskDesc" runat="server" Rows="5" Columns="30" TextMode="MultiLine" MaxLength="200" Width="100%" meta:resourcekey="txtTaskDescResource1"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="white-space:nowrap">
            <span style="color: #ff0000">*</span><asp:Label ID="Label3" runat="server" Text="預計開始日" meta:resourcekey="Label3Resource1"></asp:Label></td>
        <td>
            <table cellpadding="0" cellspacing="0" border="0"><tr>
            <td>
                <telerik:RadDatePicker ID="rdpPredStart" runat="server"></telerik:RadDatePicker>
            </td>
            <td>
                <asp:CustomValidator ID="cvPredStart" runat="server" ClientValidationFunction="fnPredStart" ForeColor="Red" Display="Dynamic" meta:resourcekey="cvPredStartResource1"></asp:CustomValidator>
            </td>
            </tr></table></td>
    </tr>
    <tr>
        <td style="white-space:nowrap">
            <span style="color: #ff0000">*</span><asp:Label ID="Label4" runat="server" Text="預計完成日" meta:resourcekey="Label4Resource1"></asp:Label></td>
        <td>
        <table cellpadding="0" cellspacing="0" border="0"><tr>
            <td>
                <telerik:RadDatePicker ID="rdpPredEnd" runat="server"></telerik:RadDatePicker>
            </td>
            <td>
                <asp:CustomValidator ID="cvPredEnd" runat="server" ClientValidationFunction="fnPredEnd" ForeColor="Red" Display="Dynamic" meta:resourcekey="cvPredEndResource1"></asp:CustomValidator>
            </td>
            </tr></table></td>
    </tr>
    <tr>
        <td style="white-space:nowrap">
            <asp:Label ID="Label5" runat="server" Text="實際開始日" meta:resourcekey="Label5Resource1"></asp:Label></td>
        <td>
            <asp:Label ID="lblPhyStart" runat="server" meta:resourcekey="lblPhyStartResource1"></asp:Label></td>
    </tr>
    <tr>
        <td style="white-space:nowrap">
            <asp:Label ID="Label6" runat="server" Text="實際完成日" meta:resourcekey="Label6Resource1"></asp:Label></td>
        <td>
            <asp:Label ID="lblPhyEnd" runat="server" meta:resourcekey="lblPhyEndResource1"></asp:Label></td>
    </tr>
    <tr>
        <td style="white-space:nowrap">
            <asp:Label ID="Label7" runat="server" Text="任務附件" meta:resourcekey="Label7Resource1"></asp:Label></td>
        <td>            
            <uc2:UC_FileCenter runat="server" ID="UC_FileCenter" />
        </td>
    </tr>
    <tr>
        <td style="white-space:nowrap">
            <span style="color: #ff0000">*</span><asp:Label ID="Label8" runat="server" Text="任務負責人" meta:resourcekey="Label8Resource1"></asp:Label></td>
        <td>
        <table cellpadding="0" cellspacing="0" border="0"><tr>
            <td>
            <uc3:UC_ChoiceList ID="ucChoiceList" runat="server" />
            </td>
            <td>
            <asp:CustomValidator ID="cvChoiceList" runat="server" ClientValidationFunction="fnChoiceList" Display="Dynamic" ForeColor="Red" meta:resourcekey="cvChoiceListResource1"></asp:CustomValidator>
        </td>
            </tr></table></td>
    </tr>
    <tr>
        <td style="height: 21px; white-space:nowrap">
            <asp:Label ID="Label9" runat="server" Text="關聯任務" meta:resourcekey="Label9Resource1"></asp:Label></td>
        <td style="height: 21px">
            <asp:LinkButton ID="lbtRelationTask" runat="server" OnClientClick="return DialogRelationTask();" CausesValidation="False" meta:resourcekey="lbtRelationTaskResource1"></asp:LinkButton>
            <asp:HiddenField ID="hidRelationTaskGUID" runat="server" />
            <asp:HiddenField ID="hidRelationTaskStatus" runat="server" />
            <asp:HiddenField ID="hidRelationTaskProjGUID" runat="server" />
        </td>
    </tr>
        <tr>
            <td>
                <asp:Label ID="lblBCWS" runat="server" Text="預估成本" meta:resourcekey="lblBCWSResource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="radnumBCWS" runat="server" Type="Number" DataType="System.Decimal" MinValue="0" MaxValue="2147483647"  MaxLength="10" >
                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                </telerik:RadNumericTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblBCWP" runat="server" Text="實際成本" meta:resourcekey="lblBCWPResource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="radnumBCWP" runat="server" Type="Number" DataType="System.Decimal" MinValue="0" MaxValue="2147483647"  MaxLength="10" >
                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                </telerik:RadNumericTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblACWP" runat="server" Text="已執行成本" meta:resourcekey="lblACWPResource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="radnumACWP" runat="server" Type="Number" DataType="System.Decimal" MinValue="0" MaxValue="2147483647"  MaxLength="10" >
                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                </telerik:RadNumericTextBox>
            </td>
        </tr>
    <tr>
        <td style="white-space:nowrap">
            <asp:Label ID="Label10" runat="server" Text="任務狀態" meta:resourcekey="Label10Resource1"></asp:Label></td>
        <td>            
           <table><tr>
           <td><asp:Label ID="lblTaskStatus" runat="server" meta:resourcekey="lblTaskStatusResource1"></asp:Label></td>
           <td>
            <asp:Panel ID="panAuditor" runat="server" meta:resourcekey="panAuditorResource1">
                (<asp:Label ID="lblAuditor" runat="server" meta:resourcekey="lblAuditorResource1"></asp:Label>) 
            </asp:Panel>
            </td></tr></table> </td>
    </tr>
    <tr>
        <td style="white-space:nowrap">
            <asp:Label ID="Label13" runat="server" Text="平均任務進度" meta:resourcekey="Label13Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblProgress" runat="server" meta:resourcekey="lblProgressResource1"></asp:Label><asp:Label ID="lblPecent" runat="server" Text="%" meta:resourcekey="lblPecentResource1"></asp:Label></td>
    </tr>
    <tr>
        <td style="white-space:nowrap">
            <asp:Label ID="Label11" runat="server" Text="任務建立者" meta:resourcekey="Label11Resource1"></asp:Label></td>
        <td>
            <asp:Label ID="lblCreator" runat="server" meta:resourcekey="lblCreatorResource1"></asp:Label><asp:Label ID="lblCreatorGUID" runat="server" Visible="False" meta:resourcekey="lblCreatorGUIDResource1"></asp:Label></td>
    </tr>
    <tr>
        <td style="white-space:nowrap">
            <asp:Label ID="Label12" runat="server" Text="任務建立時間" meta:resourcekey="Label12Resource1"></asp:Label></td>
        <td>
            <asp:Label ID="lblCreateTime" runat="server" meta:resourcekey="lblCreateTimeResource1"></asp:Label></td>
    </tr>
</table>
<asp:HiddenField ID="hidAuditorGUID" runat="server" />
<asp:HiddenField ID="hidScheduleGUID" runat="server" />
<asp:HiddenField ID="hidReadOnly" runat="server" value="false" />
<asp:HiddenField ID="hidDrirectorRMID" runat="server" />
<asp:HiddenField ID="hidTaskStatus" runat="server" />
<asp:Label ID="lblAuditStatusMsg" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblAuditStatusMsgResource1"></asp:Label>
<asp:Label ID="lblCompletedStatusMsg" runat="server" Text="已完成" Visible="False" meta:resourcekey="lblCompletedStatusMsgResource1"></asp:Label>
<asp:Label ID="lblNotYetBeginStatusMsg" runat="server" Text="尚未開始" Visible="False" meta:resourcekey="lblNotYetBeginStatusMsgResource1"></asp:Label>
<asp:Label ID="lblProceedingStatusMsg" runat="server" Text="進行中" Visible="False" meta:resourcekey="lblProceedingStatusMsgResource1"></asp:Label>
<asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="您沒有觀看此任務的權限" ForeColor="Red" Visible="False" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
<asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="該任務已被刪除" ForeColor="Red" Visible="False" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
<asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="該任務尚未設置預計時程" ForeColor="Red" Visible="False" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>