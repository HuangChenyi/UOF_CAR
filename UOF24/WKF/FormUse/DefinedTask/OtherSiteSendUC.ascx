<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormUse_DefinedTask_OtherSiteSendUC" CodeBehind="OtherSiteSendUC.ascx.cs" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceOnce.ascx" TagName="UC_ChoiceOnce" TagPrefix="uc2" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc3" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceListMobile.ascx" TagPrefix="uc1" TagName="UC_ChoiceListMobile" %>
<%@ Register Src="~/WKF/FlowManagement/UC_SignDirections.ascx" TagPrefix="uc1" TagName="UC_SignDirections" %>



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
        <td class="PopTableHeader" colspan="4" style="height: 25px; text-align: center">
            <asp:Label ID="Label5" runat="server" Text="下一站點資訊" meta:resourcekey="Label5Resource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Literal ID="lNextSiteSet" runat="server" EnableViewState="False" Text="簽核型態" meta:resourcekey="lblNextSiteSetResource1" Visible="false"></asp:Literal>
            <asp:Label ID="lblNextSiteSet" runat="server" EnableViewState="False" Text="簽核型態" meta:resourcekey="lblNextSiteSetResource1"></asp:Label>
        </td>
        <td style="white-space: nowrap">
            <asp:RadioButtonList ID="rblSignType" runat="server"
                RepeatDirection="Horizontal" meta:resourcekey="rblSignTypeResource1"
                AutoPostBack="True" OnSelectedIndexChanged="rblSignType_SelectedIndexChanged">
                <asp:ListItem Value="General" Text="一般" meta:resourcekey="ListItemResource1"></asp:ListItem>
                <asp:ListItem Value="Or" Text="並簽" meta:resourcekey="ListItemResource2"></asp:ListItem>
                <asp:ListItem Value="And" Text="會簽" meta:resourcekey="ListItemResource3"></asp:ListItem>
            </asp:RadioButtonList>
            <uc1:UC_SignDirections runat="server" ID="UC_SignDirections" />
        </td>
        <td>
            <asp:Label ID="lblTimeoutTitle" runat="server" EnableViewState="False" Text="逾時設定"
                meta:resourcekey="lblTimeoutTitleResource1"></asp:Label>
        </td>
        <td valign="middle">
            <asp:TextBox ID="tbTimeoutCount" runat="server" Width="36px"
                meta:resourcekey="tbTimeoutCountResource1"></asp:TextBox>
            <asp:Label ID="Label2"
                runat="server" Text="小時" meta:resourcekey="Label2Resource1"></asp:Label>
            <br />
            <asp:Label ID="lblTimeOutComment" runat="server" Text="[0表示不會逾時]"
                ForeColor="Blue" meta:resourcekey="lblTimeOutCommentResource1"></asp:Label>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tbTimeoutCount"
                Display="Dynamic" ErrorMessage="此數字需介於0-1000" MaximumValue="1000" MinimumValue="0"
                Type="Integer" meta:resourcekey="RangeValidator1Resource1"></asp:RangeValidator>

        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblNextSiteSigner" runat="server" EnableViewState="False"
                Text="簽核人員" meta:resourcekey="lblNextSiteSignerResource1"></asp:Label>
        </td>
        <td>
            <uc1:UC_ChoiceListMobile runat="server" ID="UC_ChoiceListMobile" ChoiceType="User" Visible="false" />
            <uc1:UC_ChoiceList ID="UC_ChoiceList_Signer" runat="server" ShowMember="false" />
        </td>
        <td>
            <asp:Label ID="lblNextSiteAlerter" runat="server" EnableViewState="False"
                Text="知會人員" meta:resourcekey="lblNextSiteAlerterResource1"></asp:Label>
        </td>
        <td>
            <uc1:UC_ChoiceList ID="UC_ChoiceList_AlertUsers" runat="server" ShowMember="false" />
        </td>
    </tr>

</table>
<asp:Label ID="lblMsgAssignSite" runat="server" ForeColor="Blue" Text="下一站點為[指定式站點]，請設定站點資訊後送出!<br>" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgAssignSiteResource1"></asp:Label>

<asp:Label ID="lblMsgMutiSignersNoSendExcept" runat="server"
    ForeColor="Red" Text="一般站點不允許多人簽核，請修改下一站點資訊或聯絡管理人員修改流程!<br>" Visible="False"
    EnableViewState="False" meta:resourcekey="lblMsgMutiSignersNoSendExceptResource1"></asp:Label>
<asp:Label ID="lblMsgNoSignersNoSendExcept" runat="server" ForeColor="Red"
    Text="沒有簽核人員，請修改下一站點資訊或聯絡管理人員修改流程!<br>" Visible="False" EnableViewState="False"
    meta:resourcekey="lblMsgNoSignersNoSendExceptResource1"></asp:Label>
<asp:Label ID="lblNotifyMsg" runat="server" CssClass="SizeMemo"></asp:Label>
<asp:Label ID="lblSignerSuspended" runat="server" Text="下一站簽核者帳號已被停用，表單送出後系統會同步通知管理員進行表單指定簽核，以避免影響簽核時效性。" Visible="False" meta:resourcekey="lblSignerSuspendedResource1"></asp:Label>
<telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="true" HtmlTag="None" Visible="false">
    <telerik:LayoutRow RowType="Generic">
        <Rows>
            <telerik:LayoutRow ID="lrSignType" runat="server"></telerik:LayoutRow>
        </Rows>
    </telerik:LayoutRow>
</telerik:RadPageLayout>
<asp:HiddenField ID="hfType" runat="server" Value="pc" />


