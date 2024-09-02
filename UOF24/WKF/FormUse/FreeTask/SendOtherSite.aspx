<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_FreeTask_SendOtherSite" Title="送出表單" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SendOtherSite.aspx.cs" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/WKF/FlowManagement/UC_SignDirections.ascx" TagPrefix="uc1" TagName="UC_SignDirections" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .panelDiv {padding:0px;border:solid 1px black;vertical-align:top;display:none}
    </style>
<script id="SendOtherSitejs" type="text/javascript">
<!--
    function checkEnd()
    {
        if('<%=rblEndType.SelectedValue %>'=='Y')
        {
//            if(confirm('<%=lblEndAlert.Text %>')==false)
//            {       
//                oEvent.cancel = true;
//            }
       }
    }

// -->
</script>

    <table width="100%" class="PopTable" cellspacing="1">
        <colgroup class="PopTableLeftTD" style="width: 70px; text-align: right">
        </colgroup>
        <colgroup class="PopTableRightTD" style="width: 200px">
        </colgroup>
        <colgroup class="PopTableLeftTD" style="width: 70px; text-align: right">
        </colgroup>
        <colgroup class="PopTableRightTD" style="width: 200px">
        </colgroup>
        <tr>
            <td colspan="4" class="PopTableHeader" style="height: 25px; text-align: center">
            <center>
                <asp:Label ID="lblFlowControl" runat="server" EnableViewState="False" 
                    Text="流程切換" meta:resourcekey="lblFlowControlResource1"></asp:Label></center>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSign" runat="server" Text="核准" 
                    meta:resourcekey="lblSignResource1"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rbListSignResult" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rbListSignResult_SelectedIndexChanged"
                    RepeatDirection="Horizontal" meta:resourcekey="rbListSignResultResource1">
                    <asp:ListItem Selected="True" Value="Approve" meta:resourcekey="ListItemResource1"
                        Text="同意"></asp:ListItem>
                    <asp:ListItem Value="Disapprove" meta:resourcekey="ListItemResource2" Text="否決"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:Label ID="lblMaster" runat="server" Text="主流程" 
                    meta:resourcekey="lblMasterResource1"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rblEndType" runat="server" RepeatDirection="Horizontal"
                    AutoPostBack="True" OnSelectedIndexChanged="rblEndType_SelectedIndexChanged"
                    meta:resourcekey="rblEndTypeResource1">
                    <asp:ListItem Value="Y" meta:resourcekey="ListItemResource4" Text="結案"></asp:ListItem>
                    <asp:ListItem Value="N" Selected="True" meta:resourcekey="ListItemResource5" Text="往下一站點"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
      <asp:Panel ID="pnlVisibleCtrl" runat="server" Width="100%" meta:resourcekey="pnlVisibleCtrlResource1" CssClass="panelDiv">
        <tr>
            <td colspan="4" class="PopTableHeader" style="height: 25px; text-align: center">
            <center>
                <asp:Label ID="lblNextSite" runat="server" EnableViewState="False" Text="下一站點" 
                    meta:resourcekey="lblNextSiteResource1"></asp:Label></center>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSiteType" runat="server" EnableViewState="False" Text="型態" 
                    meta:resourcekey="lblSiteTypeResource2"></asp:Label>
            </td>
            <td style="white-space:nowrap">
                <asp:RadioButtonList ID="rblSignType" runat="server" RepeatDirection="Horizontal"
                    meta:resourcekey="rblSignTypeResource1">
                    <asp:ListItem Selected="True" Value="General" meta:resourcekey="ListItemResource6"
                        Text="一般"></asp:ListItem>
                    <asp:ListItem Value="Or" meta:resourcekey="ListItemResource7" Text="並簽"></asp:ListItem>
                    <asp:ListItem Value="And" meta:resourcekey="ListItemResource8" Text="會簽"></asp:ListItem>
                </asp:RadioButtonList>
                <uc1:UC_SignDirections runat="server" ID="UC_SignDirections" />
            </td>
            <td>
                <asp:Label ID="lblTimeout" runat="server" EnableViewState="False" Text="逾時" 
                    meta:resourcekey="lblTimeoutResource2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbTimeoutCount" runat="server" MaxLength="4" Width="40px" Style="text-align: right"
                    meta:resourcekey="tbTimeoutCountResource1" Text="0"></asp:TextBox><asp:Label ID="Label2"
                        runat="server" Text="小時" meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tbTimeoutCount"
                    Display="Dynamic" ErrorMessage="此數字需介於0-1000" MaximumValue="1000" MinimumValue="0"
                    Type="Integer" meta:resourcekey="RangeValidator1Resource1"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" EnableViewState="False" Text="簽核" 
                    meta:resourcekey="Label3Resource2"></asp:Label>
            </td>
            <td>
                <uc1:UC_ChoiceList ID="UC_ChoiceList_Signer" runat="server" ShowMember="false"/>
            </td>
            <td>
                <asp:Label ID="Label4" runat="server" EnableViewState="False" Text="知會" 
                    meta:resourcekey="Label4Resource2"></asp:Label>
            </td>
            <td>
                <uc1:UC_ChoiceList ID="UC_ChoiceList_AlertUsers" runat="server" ShowMember="false"/>
            </td>
        </tr>
    </asp:Panel>

    </table>
                      <asp:Label ID="lblNoSignerMsg" runat="server" Text="至少需有一名簽核人員" EnableViewState="False"
                        ForeColor="Red" Visible="False" meta:resourcekey="lblNoSignerMsgResource1"></asp:Label>
                    <asp:Label ID="lblSiteGeneralMsg" runat="server" EnableViewState="False" ForeColor="Red"
                        Text="一般簽核只能有一個人" Visible="False" meta:resourcekey="lblSiteGeneralMsgResource1"></asp:Label>
    
                        <asp:Label ID="lblMsgNonResult" runat="server" EnableViewState="False" ForeColor="Red"
                        meta:resourcekey="lblMsgNonResultResource1" Text="!!目前站點尚未形成簽核共識，請點選送出，等待其他人簽核!<br>"
                        Visible="False"></asp:Label>
                     <asp:Label ID="lblMsgDisapprove" runat="server" EnableViewState="False"
                            ForeColor="Red" meta:resourcekey="lblMsgDisapproveResource1" Text="!!你選擇了否決此張表單，此張表單將在此結案!<br>"
                            Visible="False"></asp:Label>
    
    
    <asp:Panel ID="panelAgent" runat="server" Width="100%" Visible="False" meta:resourcekey="panelAgentResource1">
        <table width="100%">
            <tr>
                <td style="background-color: white">
                    <asp:Label ID="lbeAgentMsg" runat="server" ForeColor="Red" Text="下列人員有啟動代理設定，但系統找不到他的代理人，表單將只會送給原簽核者!"
                        EnableViewState="False" meta:resourcekey="lbeAgentMsgResource1"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="tbAgent" runat="server" Width="100%" Height="50px" EnableViewState="False"
                        meta:resourcekey="tbAgentResource1"></asp:TextBox></td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="PanelMessage" runat="server" Height="50px" Visible="False" Width="125px" meta:resourcekey="PanelMessageResource1">
        <asp:Label ID="lblSendMsg" runat="server" Text="送出" meta:resourcekey="lblSendMsgResource1"></asp:Label>
        <asp:Label ID="lblReturnMsg" runat="server" Text="返回" meta:resourcekey="lblReturnMsgResource1"></asp:Label>
        <asp:Label ID="lblSignFail" runat="server" Text="簽核失敗，可能同時間有人異動表單狀態" meta:resourcekey="lblSignFailResource1" ></asp:Label>
        <asp:Label ID="lblEndAlert" runat="server" Text="這張表單將在此結案，確定嗎?" meta:resourcekey="lblEndAlertResource1" ></asp:Label>
        <asp:Label ID="lblSendContinue" runat="server" Text="確定後繼續" meta:resourcekey="lblSendContinueResource1" ></asp:Label>
        </asp:Panel>

</asp:Content>

