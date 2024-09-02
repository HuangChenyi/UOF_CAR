<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_VersionFieldUserControl_ProposerUC" CodeBehind="ProposerUC.ascx.cs" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc2" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceListMobile.ascx" TagName="UC_ChoiceListMobile" TagPrefix="uc3" %>

<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>

<%-- 為了避免designer錯誤，所以要與Mobile元件同步 --%>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate></ContentTemplate>
</asp:UpdatePanel>

<asp:Panel ID="PanelNormal" runat="server" Width="100%">
    <asp:Image ID="imgProposer" runat="server" meta:resourcekey="imgProposerResource1" />
    <asp:Label ID="lblProposer" runat="server" meta:resourcekey="lblProposerResource1"></asp:Label>
    <asp:Label ID="lblDafaultApplicant" runat="server" Text="申請者" Visible="False" meta:resourcekey="lblDafaultApplicantResource1"></asp:Label>
    <asp:Label ID="lblDafaultDept" runat="server" Text="申請者部門" Visible="False" meta:resourcekey="lblDafaultDeptResource1"></asp:Label>
    <asp:Label ID="lblDafaultPost" runat="server" Text="申請者職級" Visible="False" meta:resourcekey="lblDafaultPostResource1"></asp:Label>
    <asp:Label ID="lblDefaultFunction" runat="server" Text="申請者職務" Visible="False" meta:resourcekey="lblDefaultFunctionResource1"></asp:Label>
</asp:Panel>

<asp:Panel ID="PanelCond" runat="server" Visible="false" Width="100%">
    <table cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td>
                <asp:Label ID="lblDialogResult" runat="server" ForeColor="Blue"></asp:Label>
                <asp:Label ID="lblDialogResultValue" runat="server" Visible="false"></asp:Label>
                <asp:Image ID="imgAllUser" runat="server" Visible="false" meta:resourcekey="imgAllUserResource1" />
                <uc2:UC_BtnChoiceOnce ID="UC_BtnChoiceOnce1" runat="server" ShowMember="False" />
                <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ShowMember="False" Visible="false" />
            </td>
        </tr>
    </table>
</asp:Panel>
<span style="display: none">
    <asp:Label ID="lblRealValue" runat="server" meta:resourcekey="lblRealValueResource1"></asp:Label>
</span>
<asp:Label ID="lblChooseFunction" runat="server" Visible="False" Text="選取職務" meta:resourcekey="lblChooseFunctionResource1"></asp:Label>