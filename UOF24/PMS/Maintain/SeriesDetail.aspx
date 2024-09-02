<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="PMS_Maintain_SeriesDetail" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SeriesDetail.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce"
    TagPrefix="uc1" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc3" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    function DialogAuditTrack()
    {//審核歷程
        var ProjGUID = $uof.tool.htmlDecode($('#<%= hidProjGUID.ClientID %>').val());
        var GUID = $uof.tool.htmlDecode($('#<%= hidGUID.ClientID %>').val());
        var Type = "Series";
        $uof.dialog.open2("~/PMS/Audit/Track.aspx", this, "", 500, 400, function () { return false; }, { "PROJECT_GUID": ProjGUID, "GUID": GUID, "Type": Type });
        return false;
    } 
   
    function DialogAuditOutcome() {//審核
        var ProjGUID = $uof.tool.htmlDecode($('#<%= hidProjGUID.ClientID %>').val());
        var GUID = $uof.tool.htmlDecode($('#<%= hidGUID.ClientID %>').val());
        var Type = "Series";
        var mode = "Audit";
        var auditGUID = $uof.tool.htmlDecode($('#<%= hidAuditGUID.ClientID %>').val());

        $uof.dialog.open2("~/PMS/Audit/Outcome.aspx", this, "", 500, 400,
            function openDialogResult(returnValue) {
                if (typeof (returnValue) == "undefined" || returnValue == "Close") {
                    return false;
                }
                $uof.dialog.set_returnValue("AuditOutcome");
                $uof.dialog.close();
                return true;
            }, { "PROJECT_GUID": ProjGUID, "GUID": GUID, "Type": Type, "Mode": mode, "AUDIT_GUID": auditGUID });
        return false;
    }

    function fnSeriesName(source, arguments)
    {
            var seriesName = $('#<%= txtSeriesName.ClientID %>');
            if (seriesName.val() == '') 
            {
                arguments.IsValid = false;
            }
            else 
            {
                arguments.IsValid = true;
            }
    }
    function fnAudit(source, arguments)
    {
        var audit0 = $('#<%=rbtAudit.ClientID %>').find("input[value='true']");
        var audit1 = $('#<%=rbtAudit.ClientID %>').find("input[value='false']");

    
        if (!audit0.is(":checked") && !audit1.is(":checked"))
        {
            arguments.IsValid = false;
        }
        else 
        {
            arguments.IsValid = true;
        }
    }

    function btnRemind_Click()
    {
        var projGUID = $uof.tool.htmlDecode($('#<%= hidProjGUID.ClientID %>').val());
        var GUID = $uof.tool.htmlDecode($('#<%= hidGUID.ClientID %>').val());

        $uof.dialog.open2("~/PMS/Maintain/Remind.aspx", this, "", 500, 300, function () { return false; }, { "PROJECT_GUID": projGUID, "SeriesGUID": GUID });
        return false;
    }

    function rbtAudit_click()
    {
        var rbtAutoAudit = $('#<%=rbtAudit.ClientID %>').find("input[value='true']");
        var rbtHandAudit = $('#<%=rbtAudit.ClientID %>').find("input[value='false']");

    
        var lblAutoAuditMsg = $('#<%=lblAutoAuditMsg.ClientID %>');
        var lblHandAuditMsg = $('#<%=lblHandAuditMsg.ClientID %>');
        if(rbtAutoAudit.is(":checked"))
        {
            lblAutoAuditMsg.show();
            lblHandAuditMsg.hide();
        } 
        else if (rbtHandAudit.is(":checked"))
        {
            lblAutoAuditMsg.hide();
            lblHandAuditMsg.show();
        } 
    }

    function Button4Click() {
        return confirm('<%=lblAuditConfirmMsg.Text %>');
    }
    
    function Button5Click() {
        return confirm('<%=lblDelConfirmMsg.Text %>');
    }
</script>
<asp:CustomValidator ID="cvMessage" runat="server" Display="Dynamic" ForeColor="Red" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
    <table id="table1" class="PopTable" cellspacing="1" width="100%">
        <tr>
            <td>
                <asp:Label ID="Label15" runat="server" Text="專案名稱" meta:resourcekey="Label15Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblProjName" runat="server" meta:resourcekey="lblProjNameResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <span style="color: #ff0000">*</span>
                <asp:Label ID="Label1" runat="server" Text="階段名稱" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td>
            <table cellpadding="0" cellspacing="0" border="0"><tr>
            <td>
                <asp:Label ID="lblSEQ" runat="server" meta:resourcekey="lblSEQResource1"></asp:Label> 
                <asp:TextBox ID="txtSeriesName" runat="server" MaxLength="50" meta:resourcekey="txtSeriesNameResource1"></asp:TextBox>
                </td>
            <td>
                <asp:CustomValidator ID="cvSeriesName" runat="server" ClientValidationFunction="fnSeriesName" ErrorMessage="請輸入階段名稱" meta:resourcekey="cvSeriesNameResource1"></asp:CustomValidator>
                </td>
            </tr></table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="階段說明" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtSeriesDesc" runat="server" Rows="5" Columns="30" TextMode="MultiLine" MaxLength="200" meta:resourcekey="txtSeriesDescResource1"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="預計開始日" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblPredStart" runat="server" meta:resourcekey="lblPredStartResource1"></asp:Label>
                        </td>
                        <td class="SizeMemo">
                            <asp:Label ID="lblExpectedStartMsg" runat="server" Text="此日期由系統自動計算，為所有子階段/任務的最早預計開始日" ForeColor="Blue" meta:resourcekey="lblExpectedStartMsgResource1"></asp:Label> 
                        </td>
                    </tr>
                </table>
               </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="預計完成日" meta:resourcekey="Label4Resource1"></asp:Label>                
                </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblPredEnd" runat="server" meta:resourcekey="lblPredEndResource1"></asp:Label>
                        </td>
                        <td class="SizeMemo">
                            <asp:Label ID="lblExpectedEndMsg" runat="server" Text="此日期由系統自動計算，為所有子階段/任務的最晚預計完成日" ForeColor="Blue" meta:resourcekey="lblExpectedEndMsgResource1"></asp:Label> 
                        </td>
                    </tr>
                </table>
                
                
                </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="實際開始日" meta:resourcekey="Label5Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblPhyStart" runat="server" meta:resourcekey="lblPhyStartResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="實際完成日" meta:resourcekey="Label6Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblPhyEnd" runat="server" meta:resourcekey="lblPhyEndResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="階段附件" meta:resourcekey="Label7Resource1"></asp:Label></td>
            <td>                
                <uc3:UC_FileCenter runat="server" ID="UC_FileCenter" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="階段負責人" meta:resourcekey="Label8Resource1"></asp:Label></td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lblSeriesDirector" runat="server" meta:resourcekey="lblSeriesDirectorResource1"></asp:Label>
                        <asp:Label ID="lblSeriesDirectorGUID" runat="server" Visible="False" meta:resourcekey="lblSeriesDirectorGUIDResource1"></asp:Label>
                        <uc1:UC_BtnChoiceOnce ID="ucBtnDirector" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <span style="color: #ff0000">*</span>
                <asp:Label ID="Label9" runat="server" Text="送審方式" meta:resourcekey="Label9Resource1"></asp:Label></td>
            <td>
            <table cellpadding="0" cellspacing="0" border="0"><tr>
            <td>
                <asp:RadioButtonList ID="rbtAudit" runat="server" RepeatDirection="Horizontal" onClick="rbtAudit_click()" meta:resourcekey="rbtAuditResource1">
                    <asp:ListItem Value="true" Selected="True" meta:resourcekey="ListItemResource1">自動</asp:ListItem>
                    <asp:ListItem Value="false" meta:resourcekey="ListItemResource2">手動</asp:ListItem>
                </asp:RadioButtonList>
                </td><td>
                <asp:CustomValidator ID="cvAudit" runat="server" ClientValidationFunction="fnAudit" ForeColor="Red" ErrorMessage="請選擇送審方式" meta:resourcekey="cvAuditResource1"></asp:CustomValidator></td>
                </tr>
                <tr>
                    <td colspan="2" class="SizeMemo">
                   <asp:Label ID="lblAutoAuditMsg" runat="server" ForeColor="Blue" Text="當此階段底下所有工作項目的狀態階為「已完成」時，<br/>系統會自動將此階段送審" meta:resourcekey="lblAutoAuditMsgResource1"></asp:Label> 
                   <asp:Label ID="lblHandAuditMsg" runat="server" ForeColor="Blue" Text="當此階段底下所有工作項目的狀態階為「已完成」時，<br/>此階段負責人需要自行將此階段送審" meta:resourcekey="lblHandAuditMsgResource1"></asp:Label> 
                    </td>
                </tr>
            </table>
                
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
            <td>
                <asp:Label ID="Label10" runat="server" Text="階段狀態" meta:resourcekey="Label10Resource1"></asp:Label></td>
            <td>            
               <table><tr>
               <td><asp:Label ID="lblSeriesStatus" runat="server" meta:resourcekey="lblSeriesStatusResource1"></asp:Label></td>
               <td>
                <asp:Panel ID="panAuditor" runat="server" meta:resourcekey="panAuditorResource1">
                    (<asp:Label ID="lblAuditor" runat="server" meta:resourcekey="lblAuditorResource1"></asp:Label>) 
                </asp:Panel>
                </td></tr></table> 
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text="階段建立者" meta:resourcekey="Label11Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblCreator" runat="server" meta:resourcekey="lblCreatorResource1"></asp:Label><asp:Label ID="lblCreatorGUID" runat="server" Visible="False" meta:resourcekey="lblCreatorGUIDResource1"></asp:Label></td>
        </tr>
        <tr>
            <td style=" white-space:nowrap;">
                <asp:Label ID="Label12" runat="server" Text="階段建立時間" meta:resourcekey="Label12Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblCreateTime" runat="server" meta:resourcekey="lblCreateTimeResource1"></asp:Label></td>
        </tr>

    </table>
    <asp:Label ID="lblOK" runat="server" Text="確定" Visible="False" meta:resourcekey="lblOKResource1"></asp:Label>
    <asp:Label ID="lblAuditTrack" runat="server" Text="審核歷程" Visible="False" meta:resourcekey="lblAuditTrackResource1"></asp:Label>
    <asp:Label ID="lblRemindMsg" runat="server" Text="提醒" Visible="False" meta:resourcekey="lblRemindMsgResource1"></asp:Label>
    <asp:Label ID="lblAuditMsg" runat="server" Text="送審" Visible="False" meta:resourcekey="lblAuditMsgResource1"></asp:Label>
    <asp:Label ID="lblAudit" runat="server" Text="審核" Visible="False" meta:resourcekey="lblAuditResource1"></asp:Label> 
    <asp:Label ID="lblAuditConfirmMsg" runat="server" Text="確定要送審嗎？" Visible="False" meta:resourcekey="lblAuditConfirmMsgResource1"></asp:Label>
    <asp:Label ID="lblDelMsg" runat="server" Text="刪除" Visible="False" meta:resourcekey="lblDelMsgResource1"></asp:Label>
    <asp:Label ID="lblDelConfirmMsg" runat="server" Text="確定要刪除嗎？" Visible="False" meta:resourcekey="lblDelConfirmMsgResource1"></asp:Label>
    <asp:Label ID="lblSelectMsg" runat="server" Text="選擇" Visible="False" meta:resourcekey="lblSelectMsgResource1"></asp:Label> 
    
    <asp:Label ID="lblEmptyMsg" runat="server" Text="沒有資料" Visible="False" meta:resourcekey="lblEmptyMsgResource1"></asp:Label>
    <asp:Label ID="lblSeriesNameEmpty" runat="server" Text="請輸入階段名稱" Visible="False" meta:resourcekey="lblSeriesNameEmptyResource1"></asp:Label>
    <asp:Label ID="lblAuditEmpty" runat="server" Text="請選擇審核方式" Visible="False" meta:resourcekey="lblAuditEmptyResource1"></asp:Label><br />
    <asp:Label ID="lblDelNotAllowedStatusMsg" runat="server" Text="{0}狀態的階段不能被刪除" Visible="False" meta:resourcekey="lblDelNotAllowedStatusMsgResource1"></asp:Label>
    <asp:Label ID="lblDelNoAuthorityMsg" runat="server" Text="您沒有刪除權限" Visible="False" meta:resourcekey="lblDelNoAuthorityMsgResource1"></asp:Label>
    <asp:Label ID="lblSeriesHasItemsMsg" runat="server" Text="該階段下面尚有子階段或任務，不能被刪除。" Visible="False" meta:resourcekey="lblSeriesHasItemsMsgResource1"></asp:Label>
    <asp:Label ID="lblNoAuthorityMsg" runat="server" Text="您沒有操作權限。" Visible="False" meta:resourcekey="lblNoAuthorityMsgResource1"></asp:Label>
    <asp:Label ID="lblCreateChildNotAllowedStatusMsg" runat="server" Text="該階段的狀態不能增加子階段" Visible="False" meta:resourcekey="lblCreateChildNotAllowedStatusMsgResource1"></asp:Label>
    <asp:Label ID="lblAddNotAllowedStatusMsg" runat="server" Text="該專案的狀態不能增加階段" Visible="False" meta:resourcekey="lblAddNotAllowedStatusMsgResource1"></asp:Label>
    <asp:Label ID="lblUpdateNotAllowedStatusMsg" runat="server" Text="該階段的狀態不能被修改" Visible="False" meta:resourcekey="lblUpdateNotAllowedStatusMsgResource1"></asp:Label>
    <asp:Label ID="lblAuditNotAllowedStatusMsg" runat="server" Text="存在未完成的子階段或任務，不能被送審" Visible="False" meta:resourcekey="lblAuditNotAllowedStatusMsgResource1"></asp:Label>
    <asp:Label ID="lblAuditNotAllowedActionMsg" runat="server" Text="該階段為自動送審，不能被手動送審" Visible="False" meta:resourcekey="lblAuditNotAllowedActionMsgResource1"></asp:Label>
    <asp:Label ID="lblAuditNoAuthorityMsg" runat="server" Text="您沒有送審權限" Visible="False" meta:resourcekey="lblAuditNoAuthorityMsgResource1"></asp:Label>
    <asp:Label ID="lblProjectNotSetMsg" runat="server" Text="該任務所屬專案不存在或已被刪除。" Visible="False" meta:resourcekey="lblProjectNotSetMsgResource1"></asp:Label>
    <asp:Label ID="lblDataSetNoRowsMsg" runat="server" Text="該任務不存在或已被刪除。" Visible="False" meta:resourcekey="lblDataSetNoRowsMsgResource1"></asp:Label>

    <asp:Label ID="lblAuditStatusMsg" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblAuditStatusMsgResource1"></asp:Label>
    <asp:Label ID="lblCompletedStatusMsg" runat="server" Text="已完成" Visible="False" meta:resourcekey="lblCompletedStatusMsgResource1"></asp:Label>
    <asp:Label ID="lblNotYetBeginStatusMsg" runat="server" Text="尚未開始" Visible="False" meta:resourcekey="lblNotYetBeginStatusMsgResource1"></asp:Label>
    <asp:Label ID="lblProceedingStatusMsg" runat="server" Text="進行中" Visible="False" meta:resourcekey="lblProceedingStatusMsgResource1"></asp:Label>

    <asp:HiddenField ID="hidProjGUID" runat="server" value="Test-Project" />
    <asp:HiddenField ID="hidGUID" runat="server" />
    <asp:HiddenField ID="hidMode" runat="server" />
    <asp:HiddenField ID="hidProjStatus" runat="server" value="" />
    <asp:HiddenField ID="hidSeriesStatus" runat="server" />
    <asp:HiddenField ID="hidParentSeriesStatus" runat="server" />
    <asp:HiddenField ID="hidParentSeriesGUID" runat="server" />
    <asp:HiddenField ID="hidDirectorRMID" runat="server" />
    <asp:HiddenField ID="hidAuditGUID" runat="server" />
    <asp:HiddenField ID="hidAuditorGUID" runat="server" />
    <asp:Label ID="lblAccountErr" runat="server" Text="(使用者帳號已無效)" Visible="false"></asp:Label> 
    <asp:Label ID="lblDisableMSDTCMsg" runat="server" Text=" 已停用分散式交易管理員 (MSDTC) 的網路存取，<br/>請通知系統管理員修正。" Visible="false"></asp:Label> 
   <asp:Label ID="lblMSDTCErrMsg" runat="server" Text=" 分散式交易管理員 (MSDTC) 的網路存取發生錯誤，<br/>請通知系統管理員修正。" Visible="false"></asp:Label>   
</asp:Content>

