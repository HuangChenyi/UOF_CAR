<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_Query_LandHistoryStatus" Title="調閱資訊" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="LandHistoryStatus.aspx.cs" %>


<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceOnce.ascx" TagName="UC_ChoiceOnce"
    TagPrefix="uc1" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(function() {
            if ($("#<%=ddlUseWKFList.ClientID %>").length > 0)
                $("#Approve").hide();

            if ($("#<%=labApproHelp.ClientID %>").length == 0)
                $("#ApproHelp").hide();
        });

    </script>
    <table border="1" cellpadding="0" cellspacing="0" class="PopTable" style="width: 100%;">
        <tr>
            <td style="white-space: nowrap;">
                <asp:Label ID="Label4" runat="server" Text="調閱期限" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td style="white-space: nowrap;">
                <table style="width: 250px;">
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="dateStart" runat="server" EnableTyping="False" Width="125px">
                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>
                                <DateInput LabelWidth="40%" ReadOnly="True"></DateInput>
                                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <asp:Label ID="Label12" runat="server" Text="~"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadDatePicker ID="dateEnd" runat="server" Width="125px" EnableTyping="False">
                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>
                                <DateInput LabelWidth="40%" ReadOnly="True"></DateInput>
                                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                            </telerik:RadDatePicker>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="PopTableHeader" colspan="4" >
                <div style="text-align:center;">
                    <asp:Label ID="Label9" runat="server" Text="調閱審核狀態" meta:resourcekey="Label9Resource1"></asp:Label>
                </div>                
            </td>
        </tr>
        <tr>
            <td align="left" class="PopTableRightTD" colspan="4" style="text-align: left;" valign="top">
                <telerik:RadTabStrip ID="tabApprove" runat="server" Width="347px" SelectedIndex="0" MultiPageID="RadMultiPage1" meta:resourcekey="tabApproveResource1">
                    <Tabs>
                        <telerik:RadTab runat="server" Text="審核者" meta:resourcekey="TabResource1">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Text="調閱理由" meta:resourcekey="TabResource2">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Text="審核意見" meta:resourcekey="TabResource3">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0">
                    <telerik:RadPageView ID="RadPageView1" runat="server" BackColor="White" BorderStyle="Inset" BorderWidth="0.5" Height="100%">
                        <asp:Label ID="labApproveResult" runat="server" Text="審核結果："
                            meta:resourcekey="labApproveResultResource1"></asp:Label>
                        <asp:Label ID="labResult" runat="server" meta:resourcekey="labResultResource1"></asp:Label><br />
                        <asp:Label ID="Label11" runat="server" Text="審核模式：" meta:resourcekey="Label11Resource1"></asp:Label>
                        <asp:Label ID="labFlowType" runat="server" ForeColor="Blue"
                            meta:resourcekey="labFlowTypeResource1"></asp:Label><br />
                        <span id="ApproHelp">
                            <asp:Label ID="labApproHelp" runat="server"
                                ForeColor="Blue" Text="由下列任一人員審核通過即可" meta:resourcekey="labApproHelpResource1"></asp:Label><br />
                        </span>
                        <asp:Label ID="lblWKFList" runat="server" Text="審核流程：" Visible="False"
                            meta:resourcekey="lblWKFListResource1"></asp:Label>
                        <asp:DropDownList ID="ddlUseWKFList" runat="server" Enabled="False"
                            Width="161px" Visible="False" meta:resourcekey="ddlUseWKFListResource1">
                        </asp:DropDownList>
                        <telerik:RadButton ID="btnQueryFlow" runat="server" AutoPostBack="false"
                            Text="觀看流程" meta:resourcekey="btnQueryFlowResource1">
                        </telerik:RadButton>
                        <uc2:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="false"
                            IsAllowEdit="false" />
                        <span id="Approve">&nbsp; &nbsp;<asp:Label ID="lblLastApproveUser"
                            runat="server" Visible="False" meta:resourcekey="lblLastApproveUserResource1"></asp:Label></span>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="RadPageView2" runat="server" Height="100%">
                        <asp:TextBox ID="txtLendReason" runat="server" Rows="5" ReadOnly="True" TextMode="MultiLine"
                            Width="100%" meta:resourcekey="txtLendReasonResource1"></asp:TextBox>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="RadPageView3" runat="server" Height="100%">
                        <asp:TextBox ID="txtApproveComment" runat="server" Rows="5"
                            ReadOnly="True" TextMode="MultiLine"
                            Width="100%" meta:resourcekey="txtApproveCommentResource1"></asp:TextBox>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </td>
        </tr>
    </table>

    <asp:Label ID="labDocStore" runat="server" Text="文件庫" Visible="False" meta:resourcekey="labDocStoreResource1"></asp:Label>
    <asp:Label ID="lblApproval" runat="server" Text="審核中" Visible="False"  meta:resourcekey="lblApprovalResource1"></asp:Label>
    <asp:Label ID="labUseDef" runat="server" Text="簡易審核" Visible="False" meta:resourcekey="labUseDefResource1"></asp:Label>
    <asp:Label ID="labApproveFlow" runat="server" Text="引用審核流程" Visible="False" meta:resourcekey="labApproveFlowResource1"></asp:Label>
    <asp:Label ID="labWKF" runat="server" Text="電子簽核" Visible="False" meta:resourcekey="labWKFResource1"></asp:Label>
    <asp:Label ID="lblNoApprove" runat="server" Text="此目錄無設定目錄管理者，無法進行審核設定" Visible="False" meta:resourcekey="lblNoApproveResource1"></asp:Label>
    <asp:Label ID="lblFinishTime" runat="server" Text="審核時間：" Visible="False"  meta:resourcekey="lblFinishTimeResource1"></asp:Label>
    <asp:Label ID="lblLastApprove" runat="server" Text="審核者：" Visible="False" meta:resourcekey="lblLastApproveResource1"></asp:Label>
    <asp:Label ID="lblApproving" runat="server" Text="調閱審核中" Visible="False" meta:resourcekey="lblApprovingResource1"></asp:Label>
    <asp:Label ID="lblAccept" runat="server" Text="允許調閱" Visible="False" meta:resourcekey="lblAcceptResource1"></asp:Label>
    <asp:Label ID="lblDeny" runat="server" Text="拒絕調閱" Visible="False" meta:resourcekey="lblDenyResource1"></asp:Label>
    <asp:Label ID="labDocNoApprove" runat="server" Text="文件不需審核" Visible="False" meta:resourcekey="labDocNoApproveResource"></asp:Label>
    <asp:Label ID="lblDeleteLend" runat="server" Text="調閱資料已被刪除，請重新申請調閱" Visible="False" meta:resourcekey="lblDeleteLendResource"></asp:Label>
    <asp:Label ID="labDocIsDelete" runat="server" Text="文件已被銷毀" Visible="False" meta:resourcekey="labDocIsDeleteResource1"></asp:Label>
    <asp:Label ID="lblCancel" runat="server" Text="調閱取消" Visible="False" meta:resourcekey="labLendCancelesource"></asp:Label>
    <asp:Label ID="lblTimeUp" runat="server" Text="期限到期未審核" Visible="False" meta:resourcekey="labUnauditedResource"></asp:Label>
</asp:Content>

