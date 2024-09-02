<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocLend_DocLendDeny" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DocLendDeny.aspx.cs" %>

<%@ Import Namespace="Ede.Uof.Utility" %>

<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript">

        function DownloadDialog(docid, status) {
            $uof.dialog.open2("~/DMS/DocStore/DocLend.aspx", this, "", 700, 700,
                                    function (returnValue) {
                                        return true;
                                    }
                                    , { "docid": docid, "status": status });
            return false;
        }
        function ConfirmCancelLend() {
            try {
                if (window.confirm("<%=labCancelLend.Text %>"))
                return true;
            else
                return false;
        }
        catch (e) {
            return false;
        }
    }

    </script>

    <center>
        <table border="1" cellpadding="0" cellspacing="0" class="PopTable" style="width: 100%;height: 100%">
            <tr>
                <td align="right" style="width: 22%; ">
                    <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="文件名稱"></asp:Label></td>
                <td colspan="3" style="text-align:left;">
                    <span style="word-break:break-all; width:350px;">
                    <asp:Label ID="labDocName" runat="server"></asp:Label>
                    </span>
                    </td>
            </tr>
            <tr>
                <td align="right" style="width: 22%; ">
                    <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource2" Text="目錄"></asp:Label></td>
                <td colspan="3" style="text-align:left;">
                    <img src="../../images/closed.gif" />
                    <asp:Label ID="lblFolderName" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td align="right" style="width: 22%; ">
                    <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1" Text="機密等級"></asp:Label></td>
                <td style="width: 28%; text-align:left;">
                    <asp:Label ID="lblSecret" runat="server"></asp:Label></td>
                <td align="right" style="width: 22%; ">
                    <asp:Label ID="Label6" runat="server" meta:resourcekey="Label6Resource1" Text="狀態"></asp:Label></td>
                <td style="width: 28%; text-align:left;">
                    <asp:Label ID="lblStatus" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td align="right" style="width: 22%; ">
                    <asp:Label ID="Label7" runat="server" meta:resourcekey="Label18Resource1" Text="原稿控制"></asp:Label></td>
                <td style="width: 28%; text-align:left;">
                    <asp:Label ID="labSourceControl" runat="server" Text="Label" meta:resourcekey="labSourceControlResource1"></asp:Label></td>
                <td align="right" style="width: 22%; ">
                    &nbsp;<asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="版本"></asp:Label></td>
                <td style="width: 28%; text-align:left;">
                    &nbsp;<asp:Label ID="labDocVersion" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td align="right" style="width: 22%">
                    <asp:Label ID="Label4" runat="server" Text="調閱期限" meta:resourcekey="Label4Resource1"></asp:Label></td>
                <td align="left" style="width: 28%">
                    <telerik:RadDatePicker ID="dateStart" runat="server" EnableTyping="false" ></telerik:RadDatePicker>
                </td>
                <td align="center" style="width: 22%">
                    <asp:Label ID="Label8" runat="server" Text="至" meta:resourcekey="Label8Resource1"></asp:Label></td>
                <td align="left" style="width: 28%">
                    <telerik:RadDatePicker ID="dateEnd" runat="server" EnableTyping="false" ></telerik:RadDatePicker>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="4" style="text-align:center;">
                    &nbsp;<asp:Label ID="Label9" runat="server" Text="拒絕原因" meta:resourcekey="Label9Resource1"></asp:Label>&nbsp;</td>
            </tr>
            <tr>
                <td class="PopTableRightTD" colspan="4" style="text-align:left;" valign="middle">
                    <telerik:RadTabStrip ID="tabApprove" runat="server" SelectedIndex="0" MultiPageID="RadMultiPage1" Width="347px">
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
                        <telerik:RadPageView ID="RadPageView1" runat="server">
                             <asp:Label ID="labApproveResult" runat="server" meta:resourcekey="labApproveResultResource1"
                                    Text="審核結果："></asp:Label><asp:Label ID="labResult" runat="server" 
                                        Style="color: Red"></asp:Label><br />
                <asp:Label ID="Label11" runat="server" Text="審核模式：" meta:resourcekey="Label11Resource1"></asp:Label><asp:Label ID="labFlowType" runat="server" ForeColor="Blue"></asp:Label><br  />
                                <asp:Label ID="lblFinishTime" runat="server" meta:resourcekey="lblFinishTimeResource1"
                                    Text="審核時間："></asp:Label><asp:Label ID="labApproHelp" runat="server"></asp:Label><br />
                                <asp:Label ID="lblUseWKFList" runat="server" Text="審核流程：" meta:resourcekey="lblUseWKFListResource1"></asp:Label>
                                <asp:DropDownList ID="ddlUseWKFList" runat="server" Enabled="False" Width="161px" Visible="False">
                </asp:DropDownList>
                            <telerik:RadButton ID="btnQueryFlow" runat="server"  text="觀看流程" meta:resourcekey="btnQueryFlowResource1" AutoPostBack="false"></telerik:RadButton>                                
                &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblLastApproveUser" runat="server" Visible="False"></asp:Label>
                        </telerik:RadPageView>
                        <telerik:RadPageView ID="RadPageView2" runat="server">
                            <asp:TextBox ID="txtLendReason" runat="server" Height="100%" ReadOnly="True" TextMode="MultiLine"
                                    Width="100%" ></asp:TextBox>
                        </telerik:RadPageView>
                        <telerik:RadPageView ID="RadPageView3" runat="server">
                            <asp:TextBox ID="txtApproveComment" runat="server" Height="100%" ReadOnly="True" TextMode="MultiLine"
                                    Width="100%"></asp:TextBox>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>                    
                    </td>
            </tr>
        </table>
    </center>
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
    <asp:Label ID="labNoActive" runat="server" meta:resourcekey="labNoActiveResource1"
        Text="未生效" Visible="False"></asp:Label><asp:Label ID="labYes" runat="server" meta:resourcekey="labYesResource1"
            Text="是" Visible="False"></asp:Label><asp:Label ID="labNo" runat="server" meta:resourcekey="labNoResource1"
                Text="否" Visible="False"></asp:Label>&nbsp;
    <asp:Label ID="lblLendAgain" runat="server" Text="重新申請調閱" Visible="False" meta:resourcekey="lblLendAgainResource1"></asp:Label>
    <asp:Label ID="lblLendCancel" runat="server" Text="取消調閱" Visible="False" meta:resourcekey="lblLendCancelResource1"></asp:Label><asp:Label
        ID="lblDeny" runat="server" meta:resourcekey="lblDenyResource1" Text="拒絕調閱" Visible="False"></asp:Label><asp:Label
            ID="lblLastApprove" runat="server" meta:resourcekey="lblLastApproveResource1"
            Text="審核者：" Visible="False"></asp:Label><asp:Label ID="labUseDef" runat="server"
                meta:resourcekey="labUseDefResource1" Text="簡易審核" Visible="False"></asp:Label><asp:Label
                    ID="labWKF" runat="server" meta:resourcekey="labWKFResource1" Text="電子簽核" Visible="False"></asp:Label>
    <asp:Label ID="labError" runat="server" Text="取消時發生錯誤!" meta:resourcekey="labErrorResource1" Visible="False"></asp:Label>
    <asp:Label ID="labCancelLend" runat="server" Text="確定要取消調閱?" meta:resourcekey="labCancelLendResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblDeleteLend" runat="server" Text="調閱資料已被刪除，請重新申請調閱" Visible="False" meta:resourcekey="lblDeleteLendResource"></asp:Label>
    <asp:Label ID="labDocIsDelete" runat="server" Text="文件已被銷毀" Visible="false" meta:resourcekey="labDocIsDeleteResource1"></asp:Label>
    <asp:Label ID="lblUpdating" runat="server" Text="改版中" Visible="False" meta:resourcekey="lblUpdatingResource1"></asp:Label>
    <asp:Label ID="lblVioding" runat="server" Text="(作廢審核中)" Visible="False" meta:resourcekey="lblViodingResource1"></asp:Label>
</asp:Content>

