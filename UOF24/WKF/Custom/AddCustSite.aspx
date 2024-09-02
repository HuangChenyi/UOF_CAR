<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Custom_AddCustSite" Title="自訂流程" Culture="auto"  UICulture="auto" meta:resourcekey="PageResource1" Codebehind="AddCustSite.aspx.cs" %>

<%@ Register Src="UC_CustomFlow.ascx" TagName="UC_CustomFlow" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="text-align: center">
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                    <table class="PopTable" cellspacing="1" border="0" cellpadding="1" width="100%">
                        <tr>
                            <td class="PopTableHeader" colspan="2" align="center">
                            <center>
                                <asp:Label ID="lbTitle1" runat="server" Text="使用者自訂流程" meta:resourcekey="lbTitle1Resource1"></asp:Label>
                                </center>
                                </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" style="background-color: #f1faf7;">
                    <asp:Panel ID="Panel1" runat="server" Height="100%" ScrollBars="Auto" meta:resourcekey="Panel1Resource1">
                        <uc1:UC_CustomFlow ID="UC_CustomFlow1" runat="server" />
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <asp:Label ID="lblMsgFlowStart" runat="server" Text="流程起始依據" Visible="False" meta:resourcekey="lblMsgFlowStartResource1"></asp:Label><asp:Label
        ID="lblMsgApplicant" runat="server" Text="申請者" Visible="False" meta:resourcekey="lblMsgApplicantResource1"></asp:Label>
</asp:Content>
