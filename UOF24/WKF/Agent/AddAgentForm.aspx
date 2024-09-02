<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Agent_AgentForm" Title="設定表單代理人" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="AddAgentForm.aspx.cs" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceOnce.ascx" TagName="UC_ChoiceOnce"
    TagPrefix="uc2" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce"
    TagPrefix="uc3" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="100%" class="PopTable" cellspacing="1">
   <tr>
      <td class="PopTableHeader" align="center" style="height: 25px" colspan="2">
      <center>
          <asp:Label ID="lblAgentSet" runat="server" Text="設定代理人" meta:resourcekey="lblAgentSetResource1"></asp:Label>
      </center>
      </td>
   </tr>
   <colgroup class="PopTableLeftTD"></colgroup>
   <colgroup class="PopTableRightTD"></colgroup>
   <tr>
      <td style="height: 25px;">
          <asp:Label ID="lblFormTitle" runat="server" Text="表單名稱" meta:resourcekey="lblFormTitleResource1"></asp:Label></td>
      <td >
          <asp:Label ID="lblFormName" runat="server" meta:resourcekey="lblFormNameResource1"></asp:Label></td>
   </tr>
   <tr>
      <td style="width: 30%; height: 25px;">
          <asp:Label ID="lblIsAgent" runat="server" Text="此表單是否啟動代理" style="word-break: keep-all;" meta:resourcekey="lblIsAgentResource1"></asp:Label></td>
      <td >
          <asp:CheckBox ID="cbIsAgent" runat="server" meta:resourcekey="cbIsAgentResource1" />
          <asp:Label ID="lblFormDesc" runat="server" Text="不啟動代理機制" meta:resourcekey="lblFormDescResource1"></asp:Label></td>
   </tr>
   <tr>      
      <td style="height: 25px;">
          <asp:Label ID="lblFormAgent" runat="server" Text="代理人" meta:resourcekey="lblFormAgentResource1"></asp:Label></td>
      <td >
          <asp:UpdatePanel id="UpdatePanel1" runat="server">
            <contenttemplate>
                <table>
                    <tr>
                        <td>
                            <uc3:UC_BtnChoiceOnce ID="UC_BtnChoiceOnce1" runat="server" ShowMember="False" />
                            <asp:Label ID="lblAgent" runat="server" meta:resourcekey="lblAgentResource1"></asp:Label>
                            <asp:Label ID="lblAgentGuid" runat="server" Visible="False" meta:resourcekey="lblAgentGuidResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CustomValidator ID="cvCheckSetting" runat="server" Display="Dynamic" ErrorMessage="代理人不可設定為自己" 
                                meta:resourcekey="cvCheckSettingResource1"></asp:CustomValidator>
                        </td>
                    </tr>
                </table>
            </contenttemplate>
          </asp:UpdatePanel>
      </td>
   </tr>
</table>
    <asp:Label ID="lblSelect" runat="server" Text="選取人員" Visible="False" meta:resourcekey="lblSelectResource1"></asp:Label>
   <asp:Label ID="lblAgentDesc" runat="server" Text="說明：不使用一般代理人，請自行設定" CssClass="SizeMemo"  meta:resourcekey="lblAgentDescResource1"></asp:Label> 
</asp:Content>

