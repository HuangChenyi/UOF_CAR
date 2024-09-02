<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Admin_AddAgentForm" Title="設定表單代理人" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="AddAgentForm.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellspacing="1" class="PopTable" width="100%">
        <tr>
            <td align="center" class="PopTableHeader" colspan="2" style="height: 25px">
                <asp:Label ID="lblAgentSet" runat="server" meta:resourcekey="lblAgentSetResource1"
                    Text="設定代理人"></asp:Label>
            </td>
        </tr>
        <colgroup class="PopTableLeftTD">
        </colgroup>
        <colgroup class="PopTableRightTD">
        </colgroup>
        <tr>
            <td style="height: 25px">
                <asp:Label ID="lblFormTitle" runat="server" meta:resourcekey="lblFormTitleResource1"
                    Text="表單名稱"></asp:Label></td>
            <td>
                <asp:Label ID="lblFormName" runat="server" meta:resourcekey="lblFormNameResource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 30%; height: 25px">
                <asp:Label ID="lblIsAgent" runat="server" meta:resourcekey="lblIsAgentResource1"
                    Text="此表單是否啟動代理" style="word-break: keep-all;"></asp:Label></td>
            <td>
                <asp:CheckBox ID="cbIsAgent" runat="server" meta:resourcekey="cbIsAgentResource1" />
                <asp:Label ID="lblFormDesc" runat="server" meta:resourcekey="lblFormDescResource1"
                    Text="不啟動代理機制"></asp:Label></td>
        </tr>
        <tr>
            <td style="height: 25px">
                <asp:Label ID="lblFormAgent" runat="server" meta:resourcekey="lblFormAgentResource1"
                    Text="代理人"></asp:Label></td>
            <td>
                <asp:UpdatePanel id="UpdatePanel1" runat="server">
                    <contenttemplate>
                        <table>
                            <tr>
                                <td>
                                    <uc1:UC_BtnChoiceOnce runat="server" ID="UC_BtnChoiceOnce1"></uc1:UC_BtnChoiceOnce>
                                    <asp:Label runat="server" ID="lblAgent" meta:resourceKey="lblAgentResource1"></asp:Label>
                                    <asp:Label runat="server" ID="lblAgentGuid" Visible="False" meta:resourceKey="lblAgentGuidResource1"></asp:Label>
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
    <asp:Label ID="lblSelect" runat="server" meta:resourcekey="lblSelectResource1" Text="選取人員"
        Visible="False"></asp:Label>
    <asp:Label ID="lblAgentDesc" runat="server" CssClass="SizeMemo" meta:resourcekey="lblAgentDescResource1"
        Text="說明：不使用一般代理人，請自行設定"></asp:Label>
</asp:Content>

