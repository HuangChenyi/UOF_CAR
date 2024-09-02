<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocLend_DocLendHisFlowLog" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="DocLendHisFlowLog.aspx.cs" %>

<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="panelProcess" runat="server" Height="50px" Visible="False" Width="100%">
        <br />
        &nbsp;
        <asp:Label ID="labApproveHelp" runat="server" ForeColor="Blue" Text="由下列任一「目錄管理者」進行審核中" meta:resourcekey="labApproveHelpResource1"></asp:Label><br />
        <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" IsAllowEdit="false" />
    </asp:Panel>
    <asp:Panel ID="panelFinish" runat="server">
        <table style="width: 100%;height:100%;" border="1" cellpadding="0" cellspacing="0" class="PopTable">
            <tr>
                <td align="right" class="PopTableLeftTD">
                    <asp:Label ID="Label1" runat="server" Text="審核者：" meta:resourcekey="Label1Resource1"></asp:Label>
                </td>
                <td class="PopTableRightTD">
                    <asp:Label ID="lblApproveUser" runat="server" Visible="false"></asp:Label>
                    <asp:LinkButton ID="linkApproveUser" runat="server"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td align="right" class="PopTableLeftTD">
                    <asp:Label ID="Label4" runat="server" Text="時間：" meta:resourcekey="Label4Resource1"></asp:Label>
                </td>
                <td class="PopTableRightTD" >
                    <asp:Label ID="labTime" runat="server"></asp:Label>
                </td>
            </tr>

            <tr>
                <td align="right" class="PopTableLeftTD">
                    <asp:Label ID="Label2" runat="server" Text="結果：" meta:resourcekey="Label2Resource1"></asp:Label>
                </td>
                <td class="PopTableRightTD" >
                    <asp:Label ID="labStatus" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center!important;" class="PopTableHeader">
                    <asp:Label ID="Label3" runat="server" Text="審核意見" meta:resourcekey="Label3Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="PopTableRightTD" style="word-break: break-all; height: 170px">
                    <asp:TextBox ID="txtApproveContent" runat="server" Height="100%" ReadOnly="True" TextMode="MultiLine" Width="100%"></asp:TextBox><br />
                </td>
            </tr>
        </table>
        <asp:Label ID="labDeny" runat="server" Text="拒絕調閱" Visible="False" meta:resourcekey="labDenyResource1"></asp:Label>
        <asp:Label ID="labAccept" runat="server" Text="允許調閱" Visible="False" meta:resourcekey="labAcceptResource1"></asp:Label>
    </asp:Panel>
    <asp:Label ID="lblCancel" runat="server" Text="調閱取消" Visible="False" meta:resourcekey="labLendCancelesource"></asp:Label>
    <asp:Label ID="lblTimeUp" runat="server" Text="期限到期未審核" Visible="False" meta:resourcekey="labUnauditedResource"></asp:Label>
</asp:Content>


