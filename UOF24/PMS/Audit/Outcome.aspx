<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="PMS_Audit_Outcome" Title="審核" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Outcome.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    function DialogAuditTrack()
    {
        var ProjGUID = $uof.tool.htmlDecode($('#<%= hidProjGUID.ClientID %>').val());
        var GUID = $uof.tool.htmlDecode($('#<%= hidGUID.ClientID %>').val());
        var Type = $uof.tool.htmlDecode($('#<%= hidType.ClientID %>').val());
        $uof.dialog.open2("~/PMS/Audit/Track.aspx", this, "", 500, 400, function () { return false; }, { "PROJECT_GUID": ProjGUID, "GUID": GUID, "Type": Type });
        return false;
    } 
    function DialogReportBackTrack()
    {
        var ProjGUID = $uof.tool.htmlDecode($('#<%= hidProjGUID.ClientID %>').val());
        var GUID = $uof.tool.htmlDecode($('#<%= hidGUID.ClientID %>').val());
        var Type = $uof.tool.htmlDecode($('#<%= hidType.ClientID %>').val());
        $uof.dialog.open2("~/PMS/ReportBack/Track.aspx", this, "", 800, 400, function () { return false; }, { "PROJECT_GUID": ProjGUID, "GUID": GUID, "Type": Type });
        return false;
    } 
    function fnOutcome(source, arguments)
    {
        var outcome0 = $('#<%= rbtOutcome.ClientID %>'+'_0');
        var outcome1 = $('#<%= rbtOutcome.ClientID %>'+'_1');
        if (!outcome0.is(":checked") && !outcome1.is(":checked"))
        {
            arguments.IsValid = false;
        }
        else 
        {
            arguments.IsValid = true;
        }
    }
    function fnOpinion(source, arguments)
    {
        var outcome1 = $('#<%= rbtOutcome.ClientID %>'+'_1');
        var opinion = $('#<%= txtOpinion.ClientID %>').val();
        if (outcome1.is(":checked") && opinion=="")
        {
            arguments.IsValid = false;
        }
        else 
        {
            arguments.IsValid = true;
        }
    }
    
</script>  
<asp:CustomValidator ID="cvMessage" runat="server" Display="Dynamic" ForeColor="Red" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
<asp:CustomValidator ID="cvTaskStatus" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="該任務已被審核過,請重新查看審核結果" meta:resourcekey="cvTaskStatusResource1"></asp:CustomValidator>
<asp:CustomValidator ID="cvSeriseStatus" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="該階段已被修改,請重新查看審核結果" meta:resourcekey="cvSeriseStatusResource1"></asp:CustomValidator>
<asp:CustomValidator ID="cvProjectStatus" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="該專案已被修改,請重新查看審核結果" meta:resourcekey="cvProjectStatusResource1"></asp:CustomValidator>
 <asp:CustomValidator ID="cvAuditorError" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="階段/專案負責人資料不存在, 無法送審" meta:resourcekey="cvAuditorErrorResource1" ></asp:CustomValidator>


    <table class="PopTable" cellspacing="1">
        <tr>
            <td style="white-space:nowrap;">
                <asp:Label ID="Label1" runat="server" Text="名稱" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblTarget" runat="server" meta:resourcekey="lblTargetResource1"></asp:Label>
                </td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <asp:Label ID="Label2" runat="server" Text="送審者" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblUser" runat="server" meta:resourcekey="lblUserResource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <span style="color: #ff0000">*</span><asp:Label ID="Label3" runat="server" Text="審核結果" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td>
            <table cellpadding="0" cellspacing="0" border="0"><tr>
            <td>
                <asp:RadioButtonList ID="rbtOutcome" runat="server" meta:resourcekey="rbtOutcomeResource1">
                    <asp:ListItem Value="true" meta:resourcekey="ListItemResource1">通過</asp:ListItem>
                    <asp:ListItem Value="false" meta:resourcekey="ListItemResource2">不通過</asp:ListItem>
                </asp:RadioButtonList>
                </td><td>
                    <asp:RequiredFieldValidator ID="rfvOutcome" runat="server" ErrorMessage="請選擇審核結果" Display="Dynamic" ForeColor="Red" ControlToValidate="rbtOutcome" meta:resourcekey="rfvOutcomeResource1"></asp:RequiredFieldValidator>                
                </tr></table>
                </td>                
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <asp:Label ID="Label4" runat="server" Text="審核意見" meta:resourcekey="Label4Resource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtOpinion" runat="server" Columns="30" Rows="5" TextMode="MultiLine" Width="100%" meta:resourcekey="txtOpinionResource1"></asp:TextBox>
                <asp:CustomValidator ID="cvOpinion" runat="server" ErrorMessage="請輸入審核意見" ForeColor="Red" Display="Dynamic" ClientValidationFunction="fnOpinion" meta:resourcekey="cvOpinionResource1"></asp:CustomValidator>                 
               </td> 
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <asp:Label ID="Label5" runat="server" Text="審核者" meta:resourcekey="Label5Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblAuditor" runat="server" meta:resourcekey="lblAuditorResource1"></asp:Label></td>
        </tr>
    </table>
    <asp:Label ID="lblAuditTrackMsg" runat="server" Text="審核歷程" Visible="False" meta:resourcekey="lblAuditTrackMsgResource1"></asp:Label>
    <asp:Label ID="lblReportBackTrackMsg" runat="server" Text="回報歷程" Visible="False" meta:resourcekey="lblReportBackTrackMsgResource1"></asp:Label>
    <asp:HiddenField ID="hidAuditorGUID" runat="server" />
    <asp:HiddenField ID="hidUserGUID" runat="server" />
    <asp:HiddenField ID="hidAuditGUID" runat="server" />
    <asp:HiddenField ID="hidProjGUID" runat="server" />
    <asp:HiddenField ID="hidGUID" runat="server" />
    <asp:HiddenField ID="hidType" runat="server" />
    <asp:HiddenField ID="hidMode" runat="server" />
    <asp:Label ID="lblNotAllowedStatusMsg" runat="server" Text="該對象的狀態不能被審核" Visible="False" meta:resourcekey="lblNotAllowedStatusMsgResource1"></asp:Label>
    <asp:Label ID="lblNoAuthorityMsg" runat="server" Text="您沒有操作權限。" Visible="False" meta:resourcekey="lblNoAuthorityMsgResource1"></asp:Label>
    
    <asp:Label ID="lblDisableMSDTCMsg" runat="server" Text=" 已停用分散式交易管理員 (MSDTC) 的網路存取，<br/>請通知系統管理員修正。" Visible="False" meta:resourcekey="lblDisableMSDTCMsgResource1"></asp:Label> 
   <asp:Label ID="lblMSDTCErrMsg" runat="server" Text=" 分散式交易管理員 (MSDTC) 的網路存取發生錯誤，<br/>請通知系統管理員修正。" Visible="False" meta:resourcekey="lblMSDTCErrMsgResource1"></asp:Label>    

<%--    <asp:Label ID="lblNoUser" runat="server" Text="" Visible="False" ></asp:Label>
--%>
</asp:Content>

