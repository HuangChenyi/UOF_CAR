<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Admin_SendNextSite" Title="送出表單"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SendNextSite.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
    <table width="100%" class="PopTable" cellspacing="1">
        <tr>
            <td style="background-color: White; text-align: center;" valign="top" colspan="2">&nbsp;<asp:Label
                ID="Label1" runat="server" Text="簽核種類：一般" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <tr>
                <td style="background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif);
                    width: 50%; height: 25px;text-align:center" >
                    <asp:Label ID="Label3" runat="server" EnableViewState="False" Text="簽核人員" meta:resourcekey="Label3Resource1"></asp:Label>
                </td>
                <td style="background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif);
                    width: 50%; height: 25px" align="center">
                    <asp:Label ID="Label4" runat="server" EnableViewState="False" Text="知會人員" meta:resourcekey="Label4Resource1"></asp:Label></td>
            </tr>
        <tr>
            <td style="background-color: White; width: 50%;text-align:left" valign="top">
                <asp:Label ID="lblSiteGeneralMsg" runat="server" EnableViewState="False" ForeColor="Red"
                    Text="一般簽核只能有一名簽核人員" Visible="False" meta:resourcekey="lblSiteGeneralMsgResource1"></asp:Label>
                <asp:Label ID="lblNoSignerMsg" runat="server" EnableViewState="False" ForeColor="Red"
                    meta:resourcekey="lblSiteGeneralMsgResource1" Text="一般簽核必須有一名簽核人員" Visible="False"></asp:Label>
                <uc1:UC_ChoiceList ID="UC_ChoiceList_Signer" runat="server" 
                    ShowMember="False" />
            </td>
            <td style="background-color: White; width: 50%;" valign="top">
                <uc1:UC_ChoiceList ID="UC_ChoiceList_AlertUsers" runat="server" 
                    ShowMember="False" />
            </td>
        </tr>        
    </table>
    <br />
    <table width="100%" class="PopTable" cellspacing="1">
    <tr>
                <td style="height: 35px;" class="PopTableLeftTD" nowrap="nowrap"><asp:Label ID="lblAssignForm" runat="server" Text="原因說明" meta:resourcekey="lblAssignFormResource1" style="text-align: center"></asp:Label></td>
                <td style="height: 35px;" class="PopTableRightTD" nowrap="nowrap">
                    <asp:TextBox ID="AssignFormComment" runat="server" Height="100px" 
                        TextMode="MultiLine" Width="100%" meta:resourcekey="AssignFormCommentResource1"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="AssignFormComment" Display="Dynamic" ErrorMessage="請填寫原因說明" 
                        SetFocusOnError="True" meta:resourcekey="RequiredFieldValidator1Resource1">請填寫原因說明</asp:RequiredFieldValidator>
                </td>
        </tr>
        </table>
</asp:Content>
