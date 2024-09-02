<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Admin_SetNodeAgent" Title="設定代理人" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetNodeAgent.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce"
    TagPrefix="uc1" %>
<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellspacing="1" class="PopTable" width="100%">
        <colgroup class="PopTableLeftTD">
        </colgroup>
        <colgroup class="PopTableRightTD">
        </colgroup>
        <tr>
            <td align="center" class="PopTableHeader" colspan="2" style="height: 25px">
                <asp:Label ID="lblAgentTimeSet" runat="server" meta:resourcekey="lblAgentTimeSetResource1"
                    Text="設定代理時間"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblStartTime" runat="server" meta:resourcekey="lblStartTimeResource1"
                    Text="時間起"></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <table cellpadding=0 cellspacing=0>
                                <tr>
                                    <td>
                                        <telerik:RadDateTimePicker ID="StartTimeWDC" runat="server"></telerik:RadDateTimePicker>
                                    </td>
                                </tr>
                                <tr>
                                    <Td>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ErrorMessage="*代理日期起不可空白" ControlToValidate="StartTimeWDC" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </Td>
                                </tr>
                            </table>

                          
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblEndTime" runat="server" meta:resourcekey="lblEndTimeResource1"
                    Text="時間訖"></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <table cellpadding=0 cellspacing=0>
                                <tr>
                                    <td>
                                        <telerik:RadDateTimePicker ID="EndTimeWDC" runat="server"></telerik:RadDateTimePicker>
                                    </td>
                                </tr>
                                <tr>
                                    <Td>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ErrorMessage="*代理日期迄不可空白" ControlToValidate="EndTimeWDC" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </Td>
                                </tr>
                            </table>
                         
                           
                        </td>

                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSetAgent" runat="server" meta:resourcekey="lblSetAgentResource1" Text="代理人"></asp:Label></td>
            <td>
                <asp:UpdatePanel id="UpdatePanel1" runat="server">
                    <contenttemplate>
<uc1:UC_BtnChoiceOnce runat="server" ID="UC_BtnChoiceOnce1"></uc1:UC_BtnChoiceOnce>
<asp:Label runat="server" ID="lblAgent" meta:resourceKey="lblAgentResource1" __designer:wfdid="w50"></asp:Label>
<asp:Label runat="server" ID="lblAgentGuid" Visible="False" meta:resourceKey="lblAgentGuidResource1" __designer:wfdid="w51"></asp:Label>

</contenttemplate>
                </asp:UpdatePanel>
    <asp:CustomValidator ID="cvRequireAgent" runat="server" ErrorMessage="請選擇代理人" Display="Dynamic" meta:resourcekey="cvRequireAgentResource1"></asp:CustomValidator>
            </td>
        </tr>
        
        <tr>
                <td style="height: 35px;" class="PopTableLeftTD" nowrap="nowrap"><asp:Label ID="lblAgentForm" runat="server" Text="代理原因" meta:resourcekey="lblAgentFormResource1" style="text-align: center"></asp:Label></td>
                <td style="height: 35px;" class="PopTableRightTD" nowrap="nowrap">
                    <asp:TextBox ID="AgentFormComment" runat="server" Height="70px" 
                        TextMode="MultiLine" Width="100%" meta:resourcekey="AgentFormCommentResource1"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="AgentFormComment" Display="Dynamic" ErrorMessage="請填寫代理原因" 
                        SetFocusOnError="True" meta:resourcekey="RequiredFieldValidator1Resource1">請填寫代理原因</asp:RequiredFieldValidator>
                </td>
        </tr>
        
    </table>
    <asp:CustomValidator ID="cvEndTimeGreaterThanStartTime" runat="server" Display="Dynamic"
        ErrorMessage="結束時間必須晚於起始時間" meta:resourcekey="cvEndTimeGreaterThanStartTimeResource1"></asp:CustomValidator>
    <asp:Label ID="lblSelect" runat="server" meta:resourcekey="lblSelectResource1" Text="選取人員"
        Visible="False"></asp:Label>
    <asp:Label ID="lblOldAgent" runat="server" Visible="False" meta:resourcekey="lblOldAgentResource1"></asp:Label>
</asp:Content>

