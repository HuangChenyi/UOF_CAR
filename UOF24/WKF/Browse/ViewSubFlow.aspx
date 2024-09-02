<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Browse_ViewSubFlow" Title="觀看副流程"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ViewSubFlow.aspx.cs" %>

<%@ Register Src="UC_SubFlowLayOut/UC_SubFlow.ascx" TagName="UC_SubFlow" TagPrefix="uc2" %>
<%@ Register Src="../FlowManagement/UC_SubFlow.ascx" TagName="UC_SubFlow" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <head>
        <style>
            .SubFlowTD {vertical-align:top; background-attachment: fixed; background-image: url("<%=themePath %>/images/wkf/line1.gif"); background-repeat: repeat-y;}
            .EmptyTable {padding:0px;border:0px;margin:0px;text-align:center}
            .SignerTD {color:blue;text-align:left}
            .SiteLeftTD {background-image: url("<%=themePath %>/images/wkf/site_left.gif"); background-repeat: repeat-y;}
            .SiteMiddleTD {background-image: url("<%=themePath %>/images/wkf/app_con.gif"); background-repeat: repeat-y;}
            .SiteRightTD {width:8px;background-image: url("<%=themePath %>/images/wkf/site_right.gif"); background-repeat: repeat-y;}
            .CondTextTD {text-align:center;font-weight:bold;}
            .CondLeftTD {background-image: url("<%=themePath %>/images/wkf/site_left_big.gif"); background-repeat: repeat-y;}
            .CondMiddleTD { background-image: url("<%=themePath %>/images/wkf/cond_con.gif");background-repeat: repeat-y;text-align:center}
            .CondRightTD {background-image: url("<%=themePath %>/images/wkf/site_rig_big.gif"); background-repeat: repeat-y;}
            td_{text-align:center;vertical-align:top;font-size:12px;width:120;}
            table_{text-align:center;border:0px}
        </style>
    </head>
    <div style="text-align: center">
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                    <table class="PopTable" cellspacing="1" border="0" cellpadding="1" width="100%">
                        <tr>
                            <td class="PopTableHeader" colspan="2" align="center">
                                <asp:Label ID="lbTitle1" runat="server" Text="副流程資訊" meta:resourcekey="lbTitle1Resource1"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="lblTitleFlowName" runat="server" Text="流程名稱" meta:resourcekey="lbFlowNameResource1"></asp:Label></td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblFlowName" runat="server" meta:resourcekey="lblFlowNameResource1"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="lblTitleFlowBasis" runat="server" Text="流程起始依據" meta:resourcekey="lblTitleFlowBasisResource1"></asp:Label></td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblFlowBasis" runat="server" meta:resourcekey="lblFlowBasisResource1"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="PopTableHeader" colspan="2" align="center">
                                <asp:Label ID="lbTitle2" runat="server" Text="流程站點" meta:resourcekey="lbTitle2Resource1"></asp:Label></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Panel ID="Panel1" runat="server" Height="498px" ScrollBars="Auto" Width="100%" meta:resourcekey="Panel1Resource1">
                        <uc2:UC_SubFlow ID="UC_SubFlow1" runat="server" />
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <asp:Label ID="lblMsgFlowStart" runat="server" Text="流程起始依據" Visible="False" meta:resourcekey="lblMsgFlowStartResource1"></asp:Label><asp:Label
        ID="lblMsgApplicant" runat="server" Text="申請者" Visible="False" meta:resourcekey="lblMsgApplicantResource1"></asp:Label>
        <asp:Label runat="server" ID="lblMsgFirstSite" Visible="false" Text="第一站點" meta:resourcekey="lblMsgFirstSiteResource1"></asp:Label>
        <asp:Label runat="server" ID="lblMsgPreSite" Visible="false" Text="上一站點" meta:resourcekey="lblMsgPreSiteResource1"></asp:Label>
</asp:Content>
