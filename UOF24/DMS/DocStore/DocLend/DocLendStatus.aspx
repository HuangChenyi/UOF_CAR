<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocLendStatus" Title="調閱申請狀態" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DocLendStatus.aspx.cs" %>

<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceOnce.ascx" TagName="UC_ChoiceOnce" TagPrefix="uc1" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(function () {

            if (typeof ($("#<%=ddlUseWKFList.ClientID %>")) != "undefined")
                $("#Approve").hide();

            if ($("#<%=labApproHelp.ClientID %>") == null)
                $("#ApproHelp").hide();
        });



        //2012-5-24 ELTON, add for download file by [FileCenterV2 FileControlHandler]
        function DownloadFileWithHandler(sHandlerUrl, sUserProxyIndex) {
            $uof.download(sHandlerUrl, sUserProxyIndex);
            return false;
        }
        //放大視窗(本文模式時使用)
        function maxsize() {
            window.dialogWidth = '700px';
            window.dialogHeight = '725px';

            document.getElementById("body").style.width = "670px";
        }

    </script>
    <table id="body" border="1" cellpadding="0" cellspacing="0" class="PopTable" style="width: 100%; ">
        <tr>
            <td style="width: 25%; white-space: nowrap;">
                <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="文件名稱"></asp:Label>
            </td>
            <td colspan="3">
                <span style="word-break: break-all;">
                    <asp:Label ID="labDocName" runat="server" meta:resourcekey="labDocNameResource1"></asp:Label>
                </span>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource2" Text="目錄"></asp:Label>
            </td>
            <td colspan="3">
                <img src="../../images/closed.gif" />
                <asp:Label ID="lblFolderName" runat="server" meta:resourcekey="lblFolderNameResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1" Text="機密等級"></asp:Label>
            </td>
            <td style="width: 25%; white-space: nowrap;">
                <asp:Label ID="lblSecret" runat="server" meta:resourcekey="lblSecretResource1"></asp:Label>
            </td>
            <td style="width: 25%; white-space: nowrap;">
                <asp:Label ID="Label6" runat="server" meta:resourcekey="Label6Resource1" Text="狀態"></asp:Label>
            </td>
            <td style="width: 25%; white-space: nowrap;">
                <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" meta:resourcekey="Label18Resource1" Text="原稿控制"></asp:Label>
            </td>
            <td>
                <asp:Label ID="labSourceControl" runat="server" meta:resourcekey="labSourceControlResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="版本"></asp:Label>
            </td>
            <td>
                <asp:Label ID="labDocVersion" runat="server" meta:resourcekey="labDocVersionResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="調閱期限" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td colspan="3" style="white-space: nowrap;">
                <table style="width: 250px;">
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="dateStart" runat="server" EnableTyping="False"  meta:resourcekey="dateStartResource1">
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <asp:Label ID="Label12" runat="server" Text="~"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadDatePicker ID="dateEnd" runat="server" EnableTyping="False"  meta:resourcekey="dateEndResource1">
                            </telerik:RadDatePicker>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="PopTableHeader" colspan="4">
                <div style="text-align: center;">
                    <asp:Label ID="Label9" runat="server" Text="調閱審核狀態" meta:resourcekey="Label9Resource1"></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td align="left" class="PopTableRightTD" colspan="4" style="text-align: left;">
                <telerik:RadTabStrip ID="tabApprove" runat="server" SelectedIndex="0" MultiPageID="RadMultiPage1" meta:resourcekey="tabApproveResource1">
                    <Tabs>
                        <telerik:RadTab runat="server" Text="審核者" PageViewID="RadPageView1" meta:resourcekey="TabResource1">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Text="調閱理由" PageViewID="RadPageView2" meta:resourcekey="TabResource2">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Text="審核意見" PageViewID="RadPageView3" meta:resourcekey="TabResource3">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" meta:resourcekey="RadMultiPage1Resource1">
                    <telerik:RadPageView ID="RadPageView1" runat="server" meta:resourcekey="RadPageView1Resource1">
                        <asp:Label ID="labApproveResult" runat="server" Text="審核結果：" meta:resourcekey="labApproveResultResource1"></asp:Label><asp:Label ID="labResult" runat="server" meta:resourcekey="labResultResource1"></asp:Label><br />
                        <asp:Label ID="Label11" runat="server" Text="審核模式：" meta:resourcekey="Label11Resource1"></asp:Label><asp:Label ID="labFlowType" runat="server" ForeColor="Blue" meta:resourcekey="labFlowTypeResource1"></asp:Label><br />
                        <span id="ApproHelp">
                            <asp:Label ID="labApproHelp" runat="server" ForeColor="Blue" Text="由下列任一人員審核通過即可" meta:resourcekey="labApproHelpResource1"></asp:Label><br />
                        </span>
                        <asp:Label ID="lblWKFList" runat="server" Text="審核流程：" Visible="False" meta:resourcekey="lblWKFListResource1"></asp:Label><asp:DropDownList ID="ddlUseWKFList" runat="server" Enabled="False" Width="161px" Visible="False" meta:resourcekey="ddlUseWKFListResource1">
                        </asp:DropDownList>
                        <telerik:RadButton ID="btnQueryFlow" runat="server" Text="觀看流程" meta:resourcekey="btnQueryFlowResource1" AutoPostBack="False"></telerik:RadButton>

                        <uc2:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="false" IsAllowEdit="false" />
                        <span id="Approve">&nbsp; &nbsp;<asp:Label ID="lblLastApproveUser" runat="server" Visible="False" meta:resourcekey="lblLastApproveUserResource1"></asp:Label></span>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="RadPageView2" runat="server" meta:resourcekey="RadPageView2Resource1">
                        <asp:TextBox ID="txtLendReason" runat="server" Rows="5" ReadOnly="True" TextMode="MultiLine"
                            Width="100%" meta:resourcekey="txtLendReasonResource1"></asp:TextBox>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="RadPageView3" runat="server" meta:resourcekey="RadPageView3Resource1">
                        <asp:TextBox ID="txtApproveComment" runat="server" Rows="5" ReadOnly="True" TextMode="MultiLine" Width="100%" meta:resourcekey="txtApproveCommentResource1"></asp:TextBox>
                    </telerik:RadPageView>
                    </telerik:RadMultiPage>
                </td>
        </tr>
    </table>
    <asp:Label ID="labDocStore" runat="server" meta:resourcekey="labDocStoreResource1"
        Text="文件庫" Visible="False"></asp:Label><asp:Label ID="lblSecretm" runat="server"
            meta:resourcekey="lblSecretmResource1" Text="密" Visible="False"></asp:Label><asp:Label
                ID="lblXSecret" runat="server" meta:resourcekey="lblXSecretResource1" Text="機密"
                Visible="False"></asp:Label><asp:Label ID="lblXXSecret" runat="server" meta:resourcekey="lblXXSecretResource1"
                    Text="極機密" Visible="False"></asp:Label><asp:Label ID="lblTopSecret" runat="server"
                        meta:resourcekey="lblTopSecretResource1" Text="絕對機密" Visible="False"></asp:Label><asp:Label
                            ID="lblNormal" runat="server" meta:resourcekey="lblNormalResource1" Text="一般"
                            Visible="False"></asp:Label><asp:Label ID="lblCheckin" runat="server" meta:resourcekey="lblCheckinResource1"
                                Text="已存回" Visible="False"></asp:Label><asp:Label ID="lblCheckOut" runat="server"
                                    meta:resourcekey="lblCheckOutResource1" Text="已取出" Visible="False"></asp:Label><asp:Label
                                        ID="lblApproval" runat="server" meta:resourcekey="lblApprovalResource1" Text="審核中"
                                        Visible="False"></asp:Label><asp:Label ID="lblPublish" runat="server" meta:resourcekey="lblPublishResource1"
                                            Text="已公佈" Visible="False"></asp:Label><asp:Label ID="lblInactive" runat="server"
                                                meta:resourcekey="lblInactiveResource1" Text="已失效" Visible="False"></asp:Label><asp:Label
                                                    ID="lblVoid" runat="server" meta:resourcekey="lblVoidResource1" Text="已作廢" Visible="False"></asp:Label><asp:Label
                                                        ID="lblTempInact" runat="server" meta:resourcekey="lblTempInactResource1" Text="已下架"
                                                        Visible="False"></asp:Label><asp:Label ID="lblOldVer" runat="server" meta:resourcekey="lblOldVerResource1"
                                                            Text="舊版本" Visible="False"></asp:Label><asp:Label ID="lblReAct" runat="server" meta:resourcekey="lblReActResource1"
                                                                Text="已上架" Visible="False"></asp:Label><asp:Label ID="labDocDeny" runat="server"
                                                                    meta:resourcekey="labDocDenyResource1" Text="發佈拒絕" Visible="False"></asp:Label>
    <asp:Label ID="labNoActive" runat="server" meta:resourcekey="labNoActiveResource1" Text="未生效" Visible="False"></asp:Label>
    <asp:Label ID="labYes" runat="server" meta:resourcekey="labYesResource1" Text="是" Visible="False"></asp:Label>
    <asp:Label ID="labNo" runat="server" meta:resourcekey="labNoResource1" Text="否" Visible="False"></asp:Label>
    <asp:Label ID="labUseDef" runat="server" Text="簡易審核" Visible="False" meta:resourcekey="labUseDefResource1"></asp:Label>
    <asp:Label ID="labApproveFlow" runat="server" Text="引用審核流程" Visible="False" meta:resourcekey="labApproveFlowResource1"></asp:Label>
    <asp:Label ID="labWKF" runat="server" Text="電子簽核" Visible="False" meta:resourcekey="labWKFResource1"></asp:Label>
    <asp:Label ID="lblNoApprove" runat="server" Text="此目錄無設定目錄管理者，無法進行審核設定" Visible="False" meta:resourcekey="lblNoApproveResource1"></asp:Label>
    <asp:Label ID="lblFinishTime" runat="server" Text="審核時間：" Visible="False" meta:resourcekey="lblFinishTimeResource1"></asp:Label>
    <asp:Label ID="lblLastApprove" runat="server" Text="審核者：" Visible="False" meta:resourcekey="lblLastApproveResource1"></asp:Label>
    <asp:Label ID="lblApproving" runat="server" Text="調閱審核中" Visible="False" meta:resourcekey="lblApprovingResource1"></asp:Label>
    <asp:Label ID="lblAccept" runat="server" Text="允許調閱" Visible="False" meta:resourcekey="lblAcceptResource1"></asp:Label>
    <asp:Label ID="lblDeny" runat="server" Text="拒絕調閱" Visible="False" meta:resourcekey="lblDenyResource1"></asp:Label>
    <asp:Label ID="labDocNoApprove" runat="server" Text="文件不需審核" Visible="False" meta:resourcekey="labDocNoApproveResource"></asp:Label>
    <asp:Label ID="lblDownload" runat="server" Text="下載文件" Visible="False" meta:resourcekey="lblDownloadResource"></asp:Label>
    <asp:Label ID="lblDeleteLend" runat="server" Text="調閱資料已被刪除，請重新申請調閱" Visible="False" meta:resourcekey="lblDeleteLendResource"></asp:Label>
    <asp:Label ID="labDocIsDelete" runat="server" Text="文件已被銷毀" Visible="False" meta:resourcekey="labDocIsDeleteResource1"></asp:Label>

    <!--2012-5-23 ELTON, 因檔案仍在Proxy尚未傳輸到UOF, 需顯示警告訊息-->
    <asp:Label ID="lblFileNotTransferToUof" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False" ForeColor="Blue" meta:resourcekey="lblFileNotTransferToUofResource1"></asp:Label>
    <asp:Label ID="lblUpdating" runat="server" Text="改版中" Visible="False" meta:resourcekey="lblUpdatingResource1"></asp:Label>
    <asp:Label ID="lblVioding" runat="server" Text="(作廢審核中)" Visible="False" meta:resourcekey="lblViodingResource1"></asp:Label>

</asp:Content>

