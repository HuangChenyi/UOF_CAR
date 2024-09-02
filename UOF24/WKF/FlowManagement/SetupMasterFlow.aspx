<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_SetupMasterFlow"
    Title="設定主流程" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetupMasterFlow.aspx.cs" %>

<%@ Register Src="UC_MasterFlow.ascx" TagName="UC_MasterFlow" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript">
    // =============================================================================
        function saveScrollPosition() {
            $('#<%=HiddenField1.ClientID%>').val($('#<%=Panel1.ClientID%>').scrollTop());

              }

              $(function () {
                  $('#<%=Panel1.ClientID%>').scrollTop($('#<%=HiddenField1.ClientID%>').val())


        });
        
    // =============================================================================


    </script>

    <div style="text-align: center">
        <table cellspacing="1" class="PopTable" width="100%">
            <tr>
                <td align="center" class="PopTableHeader" colspan="3">
                <center>
                    <asp:Label ID="lbTitle1" runat="server" Text="主流程資訊" meta:resourcekey="lbTitle1Resource1"></asp:Label>
                    </center>
                    </td>
            </tr>
        </table>
        <asp:Panel ID="Panel1" runat="server" Height="640px" ScrollBars="Auto" Width="100%">
            <uc1:UC_MasterFlow ID="UC_MasterFlow1" runat="server" EnableViewState="False" />
        </asp:Panel>
    </div>
    <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
</asp:Content>
