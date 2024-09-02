<%@ Page Title="代理人設定" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Agent_AgentSettingEdit" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="AgentSettingEdit.aspx.cs" %>

<%@ Register Src="../../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <table cellspacing="1" class="PopTable" width="100%">
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label1" runat="server" Text="人員姓名"
                            meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblUser" runat="server" meta:resourcekey="lblUserResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label2" runat="server" Text="第一代理人"
                            meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td>
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <asp:Label ID="lblAgentFirst" runat="server"
                                        meta:resourcekey="lblAgentFirstResource1"></asp:Label>
                                </td>
                                <td style="width: 120px;">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                <uc1:UC_BtnChoiceOnce ID="UC_BtnChoiceOnceAgent1" runat="server" />
                                            </td>
                                            <td>
                                                <telerik:RadButton ID="rdbtnDeleteAgent1" runat="server" Text="刪除" OnClick="rdbtnDeleteAgent1_Click" meta:resourcekey="rdbtnDeleteAgent1Resource1"></telerik:RadButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="第二代理人"
                            meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td>
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <asp:Label ID="lblAgentSecond" runat="server" meta:resourcekey="lblAgentSecondResource1"></asp:Label>
                                </td>
                                <td style="width: 120px;">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                <uc1:UC_BtnChoiceOnce ID="UC_BtnChoiceOnceAgent2" runat="server" />
                                            </td>
                                            <td>
                                                <telerik:RadButton ID="rdbtnDeleteAgent2" runat="server" Text="刪除" OnClick="rdbtnDeleteAgent2_Click" meta:resourcekey="rdbtnDeleteAgent2Resource1"></telerik:RadButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="第三代理人" meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>
                    <td>
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <asp:Label ID="lblAgentThird" runat="server" meta:resourcekey="lblAgentThirdResource1"></asp:Label>
                                </td>
                                <td style="width: 120px;">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                <uc1:UC_BtnChoiceOnce ID="UC_BtnChoiceOnceAgent3" runat="server" />
                                            </td>
                                            <td>
                                                <telerik:RadButton ID="rdbtnDeleteAgent3" runat="server" Text="刪除" OnClick="rdbtnDeleteAgent3_Click" meta:resourcekey="rdbtnDeleteAgent3Resource1"></telerik:RadButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <asp:CustomValidator ID="cvCheckSetting" Display="Dynamic"  runat="server" ErrorMessage="代理人不可設定為自己" meta:resourcekey="cvCheckSettingResource1"></asp:CustomValidator>

            <asp:Label ID="lblUpdate" runat="server" Text="修改" Visible="False" meta:resourcekey="lblUpdateResource1"></asp:Label>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

