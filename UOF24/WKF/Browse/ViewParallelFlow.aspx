<%@ Page Title="觀看平行流程" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Browse_ViewParallelFlow" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ViewParallelFlow.aspx.cs" %>

<%@ Register src="UC_SubFlowLayOut/UC_ParallelSite.ascx" tagname="UC_ParallelSite" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                    <table class="PopTable" cellspacing="1" border="0" cellpadding="1" width="100%">
                        <tr>
                            <td class="PopTableHeader" colspan="2" style="text-align:center!important">
                                <asp:Label ID="lbTitle1" runat="server" Text="平行流程資訊" 
                                    meta:resourcekey="lbTitle1Resource1"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="lblTitleFlowName" runat="server" Text="流程名稱" 
                                    meta:resourcekey="lblTitleFlowNameResource1" ></asp:Label></td>
                            <td class="PopTableRightTD" style="text-align:left">
                                <asp:Label ID="lblFlowName" runat="server" 
                                    meta:resourcekey="lblFlowNameResource1" ></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="PopTableHeader" colspan="2" style="text-align:center!important">
                                <asp:Label ID="lbTitle2" runat="server" Text="流程站點" meta:resourcekey="lbTitle2Resource1"></asp:Label></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Panel ID="Panel1" runat="server" Height="498px" ScrollBars="Auto" Width="100%" meta:resourcekey="Panel1Resource1">
                        <uc1:UC_ParallelSite ID="UC_ParallelSite1" runat="server" />
                        
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

