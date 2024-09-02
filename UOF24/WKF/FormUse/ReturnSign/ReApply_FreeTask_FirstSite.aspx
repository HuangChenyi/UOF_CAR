<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_ReturnSign_ReApply_FreeTask_FirstSite" Title="" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ReApply_FreeTask_FirstSite.aspx.cs" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/WKF/FlowManagement/UC_SignDirections.ascx" TagPrefix="uc1" TagName="UC_SignDirections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="contentDV" style="display:none">
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
                <asp:Label ID="lblNextSiteInfo" runat="server" EnableViewState="False" 
                    Text="下一站點資訊" meta:resourcekey="lblNextSiteInfoResource1"></asp:Label></center>
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lblSiteType" runat="server" EnableViewState="False" Text="型態" 
                    meta:resourcekey="lblSiteTypeResource1" ></asp:Label></td>
            <td style="white-space: nowrap">
                <asp:RadioButtonList ID="rblSiteType" runat="server" RepeatDirection="Horizontal"
                    meta:resourcekey="rblSiteTypeResource1">
                    <asp:ListItem Selected="True" Value="0" meta:resourcekey="ListItemResource1" Text="一般"></asp:ListItem>
                    <asp:ListItem Value="1" meta:resourcekey="ListItemResource2" Text="並簽"></asp:ListItem>
                    <asp:ListItem Value="2" meta:resourcekey="ListItemResource3" Text="會簽"></asp:ListItem>
                </asp:RadioButtonList>
                <uc1:UC_SignDirections runat="server" ID="UC_SignDirections" />
            </td>
            <td><asp:Label ID="lblTimeout" runat="server" EnableViewState="False" Text="逾時" 
                    meta:resourcekey="lblTimeoutResource1" ></asp:Label></td>
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
            <td><asp:Label ID="Label3" runat="server" EnableViewState="False" Text="簽核" 
                    meta:resourcekey="Label3Resource1" ></asp:Label></td>
            <td><uc1:UC_ChoiceList  ID="UC_ChoiceList_Signer" runat="server" 
                    ShowMember="False" /></td>
            <td><asp:Label ID="Label4" runat="server" EnableViewState="False" Text="知會" 
                    meta:resourcekey="Label4Resource1" ></asp:Label></td>
            <td><uc1:UC_ChoiceList ID="UC_ChoiceList_AlertUsers" runat="server" 
                    ShowMember="False" /></td>
        </tr>
    </table>
    </div>
                    <asp:Label ID="lblSiteGeneralMsg" runat="server" EnableViewState="False" ForeColor="Red"
                    Text="一般簽核只能有一個人" Visible="False" meta:resourcekey="lblSiteGeneralMsgResource1"></asp:Label>
                <asp:Label ID="lblNoSignerMsg" runat="server" Text="至少需有一名簽核人員" EnableViewState="False"
                    ForeColor="Red" Visible="False" meta:resourcekey="lblNoSignerMsgResource1"></asp:Label>

    
    <asp:Panel ID="panelAgent" runat="server" Width="100%" Visible="False" meta:resourcekey="panelAgentResource1">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <asp:Label ID="lbeAgentMsg" runat="server" ForeColor="Red" Text="下列人員有啟動代理設定，但系統找不到他的代理人，表單將只會送給原簽核者!"
                        EnableViewState="False" meta:resourcekey="lbeAgentMsgResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="height: 54px">
                    <asp:TextBox ID="tbAgent" runat="server" Width="100%" Height="50px" EnableViewState="False"
                        meta:resourcekey="tbAgentResource1" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Label ID="lblSendMsg" runat="server" Text="表單 {0} 已建立" Visible="False" meta:resourcekey="lblSendMsgResource1"></asp:Label>
    <asp:Label ID="lblFormNum" runat="server" Text="表單編號為:" Visible="False" meta:resourcekey="lblFormNumResource1"></asp:Label>
        <asp:Label ID="lblSubmitTxt" runat="server" Text="確定" Visible="False" meta:resourcekey="lblSubmitTxtResource1"></asp:Label>
        <asp:Label ID="lblReturnTxt" runat="server" Text="返回" Visible="False" meta:resourcekey="lblReturnTxtResource1"></asp:Label>
   <asp:Label ID="lblNotSop" runat="server" meta:resourcekey="lblNotSopResource1"
                    Text="非正常程序開啟表單" Visible="False"></asp:Label>
    <asp:Label ID="lblNoAuth" runat="server" meta:resourcekey="lblNoAuthResource1" Text="無權限處理或觀看此表單" Visible="False"></asp:Label>
</asp:Content>