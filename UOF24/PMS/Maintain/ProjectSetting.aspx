<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="PMS_Maintain_ProjectSetting" Title="新增專案" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ProjectSetting.aspx.cs" %>
<%@ Register Src="../Common/UC_NoticeType.ascx" TagName="UC_NoticeType" TagPrefix="uc3" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc2" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function fnProjName(source, arguments) {
            var projName = $('#<%= txtProjName.ClientID %>');
            if (projName.val() == '') {
                arguments.IsValid = false;
            }
            else {
                arguments.IsValid = true;
            }
        }
        function fnPMGUID(source, arguments) {
            var PMGUID = $('#<%= hidPMGUID.ClientID %>');
            if ($uof.tool.htmlDecode(PMGUID.val()) == '') {
                arguments.IsValid = false;
            }
            else {
                arguments.IsValid = true;
            }
        }
        function DialogCreatePre() {
            var Mode = $uof.tool.htmlDecode($('#<%= hidMode.ClientID %>').val());
            var ProjGUID = $uof.tool.htmlDecode($('#<%= hidProjGUID.ClientID %>').val());
            var CopyUser = $uof.tool.htmlDecode($('#<%= hidCopyUser.ClientID %>').val());
            var FileGroupId = $uof.tool.htmlDecode($('#<%= hidFileGroupId.ClientID %>').val());
            window.location.href = "CreateProject.aspx?Mode=" + Mode + "&PROJECT_GUID=" + ProjGUID + "&includeUser=" + CopyUser + "&FileGroupId=" + FileGroupId;
            return false;
        }
        function DialogAuditTrack() {
            var ProjGUID = $uof.tool.htmlDecode($('#<%= hidProjGUID.ClientID %>').val());
            var Type = "Project";
            $uof.dialog.open2("~/PMS/Audit/Track.aspx", this, "", 450, 400, function () { return false; }, { "Type": Type, "PROJECT_GUID": ProjGUID });
            return false;
        }
    </script>
    <asp:CustomValidator ID="cvMessage" runat="server" Display="Dynamic" ForeColor="Red" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="cvNoAuthority" runat="server" Display="Dynamic" ErrorMessage="您沒有權限瀏覽此專案" ForeColor="Red" meta:resourcekey="cvNoAuthorityResource1"></asp:CustomValidator>
    <table id="table1" class="PopTable" cellspacing="1" width="100%">
        <tr>
            <td style="width: 30%; white-space:nowrap;">
                <span style="color: #ff0000">*</span>
                <asp:Label ID="Label1" runat="server" Text="專案名稱" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtProjName" runat="server" MaxLength="50" meta:resourcekey="txtProjNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvProjName" runat="server" ErrorMessage="請輸入專案名稱" ForeColor="Red" ControlToValidate="txtProjName" Display="Dynamic" meta:resourcekey="rfvProjNameResource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvNameDuplicate" runat="server" ErrorMessage="該專案名稱已經存在！" ForeColor="Red" Display="Dynamic" meta:resourcekey="cvNameDuplicateResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="專案說明" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtProjDesc" runat="server" Columns="30" Rows="5" TextMode="MultiLine" MaxLength="200" meta:resourcekey="txtProjDescResource1"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="起案日" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td>
                <telerik:RadDatePicker ID="rdpStart" runat="server"
                    meta:resourcekey="rdpStartResource1">

                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>

                    <DateInput LabelWidth="64px" Width=""></DateInput>

                    <DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>

                </telerik:RadDatePicker>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="結案日" meta:resourcekey="Label4Resource1"></asp:Label></td>
            <td>
                <telerik:RadDatePicker ID="rdpEnd" runat="server"
                    meta:resourcekey="rdpEndResource1">
                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>

                    <DateInput LabelWidth="64px" Width=""></DateInput>

                    <DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                </telerik:RadDatePicker>
                <asp:CustomValidator ID="cvDateErr" runat="server" ForeColor="Red" ErrorMessage="結案日早於起案日，請重新輸入" Display="Dynamic" meta:resourcekey="cvDateErrResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" Text="預計開始日" meta:resourcekey="Label12Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblExpStart" runat="server" meta:resourcekey="lblExpStartResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label14" runat="server" Text="預計結束日" meta:resourcekey="Label14Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblExpEnd" runat="server" meta:resourcekey="lblExpEndResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label16" runat="server" Text="實際開始日" meta:resourcekey="Label16Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblPhyStart" runat="server" meta:resourcekey="lblPhyStartResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label17" runat="server" Text="實際結束日" meta:resourcekey="Label17Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblPhyEnd" runat="server" meta:resourcekey="lblPhyEndResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="附件" meta:resourcekey="Label5Resource1"></asp:Label></td>
            <td>                
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="審核者" meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
            <td abbr="hidAuditorGUID">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:HiddenField ID="hidAuditorGUID" runat="server" />
                        <asp:Label ID="lblAuditor" runat="server" meta:resourcekey="lblAuditorResource1"></asp:Label>
                        <uc2:UC_BtnChoiceOnce ID="ucBtnAuditor" runat="server" />
                        <telerik:RadButton ID="btnClear" runat="server" Text="清除" OnClick="btnClear_Click" CausesValidation="false" meta:resourcekey="btnClearResource1"></telerik:RadButton>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="通知類別" meta:resourcekey="Label7Resource1"></asp:Label></td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <contenttemplate>
                <uc3:UC_NoticeType ID="ucNoticeType" runat="server"/>
                    </contenttemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <span style="color: #ff0000">*</span>
                <asp:Label ID="Label8" runat="server" Text="專案負責人" meta:resourcekey="Label8Resource1"></asp:Label></td>
            <td>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:HiddenField ID="hidPMGUID" runat="server" />
                        <asp:Label ID="lblPM" runat="server" meta:resourcekey="lblPMResource1"></asp:Label>
                        <uc2:UC_BtnChoiceOnce ID="ucBtnPM" runat="server" />
                        <asp:CustomValidator ID="cvPM" runat="server" ErrorMessage="請選擇專案負責人" ClientValidationFunction="fnPMGUID" Display="Dynamic" meta:resourcekey="cvPMResource1"></asp:CustomValidator>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="專案狀態" meta:resourcekey="Label9Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label10" runat="server" Text="建立者" meta:resourcekey="Label10Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblCreator" runat="server" meta:resourcekey="lblCreatorResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text="建立時間" meta:resourcekey="Label11Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblCreateTime" runat="server" meta:resourcekey="lblCreateTimeResource1"></asp:Label></td>
        </tr>
    </table>
    <asp:Label ID="lblSave" runat="server" Text="確定" Visible="False"
        meta:resourcekey="lblSaveResource1"></asp:Label>


    <asp:Label ID="lblSelectMsg" runat="server" Text="選擇" Visible="False" meta:resourcekey="lblSelectMsgResource1"></asp:Label>
    <asp:Label ID="lblPreMsg" runat="server" Text="上一步" Visible="False" meta:resourcekey="lblPreMsgResource1"></asp:Label>
    <asp:Label ID="lblAuditTrackMsg" runat="server" Text="查看審核歷程" Visible="False" meta:resourcekey="lblAuditTrackMsgResource1"></asp:Label>
    <asp:Label ID="lblNoAuthorityMsg" runat="server" Text="您沒有設定該專案的權限！" Visible="False" meta:resourcekey="lblNoAuthorityMsgResource1"></asp:Label>
    <asp:Label ID="lblNotAllowedStatusMsg" runat="server" Text="該專案的狀態不能被設定！" Visible="False" meta:resourcekey="lblNotAllowedStatusMsgResource1"></asp:Label>
    <asp:Label ID="lblFileNotFoundMsg" runat="server" Text="文件無法加載！" Visible="False" meta:resourcekey="lblFileNotFoundMsgResource1"></asp:Label>
    <asp:Label ID="lblFileOpenErrorMsg" runat="server" Text="文件無法打開！" Visible="False" meta:resourcekey="lblFileOpenErrorMsgResource1"></asp:Label>
    <asp:Label ID="lblProjNotSetMsg" runat="server" Text="父階段尚未設定！" Visible="False" meta:resourcekey="lblProjNotSetMsgResource1"></asp:Label>
    <asp:Label ID="lblAuditMsg" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblAuditMsgResource1"></asp:Label>
    <asp:Label ID="lblCloseMsg" runat="server" Text="已結案" Visible="False" meta:resourcekey="lblCloseMsgResource1"></asp:Label>
    <asp:Label ID="lblDraftMsg" runat="server" Text="草稿" Visible="False" meta:resourcekey="lblDraftMsgResource1"></asp:Label>
    <asp:Label ID="lblNotYetBeginMsg" runat="server" Text="尚未開始" Visible="False" meta:resourcekey="lblNotYetBeginMsgResource1"></asp:Label>
    <asp:Label ID="lblProceedingMsg" runat="server" Text="進行中" Visible="False" meta:resourcekey="lblProceedingMsgResource1"></asp:Label>
    <asp:Label ID="lblSuspendMsg" runat="server" Text="已中止" Visible="False" meta:resourcekey="lblSuspendMsgResource1"></asp:Label>

    <asp:Label ID="lblExcelAuditorGUIDEmptyMsg" runat="server" Text="專案審核人員帳號不存在" Visible="False" meta:resourcekey="lblExcelAuditorGUIDEmptyMsgResource1"></asp:Label>
    <asp:Label ID="lblExcelPMGUIDEmptyMsg" runat="server" Text="專案負責人員帳號不存在" Visible="False" meta:resourcekey="lblExcelPMGUIDEmptyMsgResource1"></asp:Label>
    <asp:Label ID="lblExcelDirectorEmptyMsg" runat="server" Text="階段或任務人員帳號不存在" Visible="False" meta:resourcekey="lblExcelDirectorEmptyMsgResource1"></asp:Label>
    <asp:Label ID="lblExcelSeriesMsg" runat="server" Text="找不到該工作的父階段" Visible="False" meta:resourcekey="lblExcelSeriesMsgResource1"></asp:Label>
    <asp:Label ID="lblLineNum" runat="server" Text="第{0}行" Visible="False" meta:resourcekey="lblLineNumMsgResource1"></asp:Label>
    <asp:Label ID="lblAccountErr" runat="server" Text="(使用者帳號已無效)" Visible="False" meta:resourcekey="lblAccountErrResource1"></asp:Label>

    <asp:Label ID="lblDisableMSDTCMsg" runat="server" Text=" 已停用分散式交易管理員 (MSDTC) 的網路存取，<br/>請通知系統管理員修正。" Visible="False" meta:resourcekey="lblDisableMSDTCMsgResource1"></asp:Label>
    <asp:Label ID="lblMSDTCErrMsg" runat="server" Text=" 分散式交易管理員 (MSDTC) 的網路存取發生錯誤，<br/>請通知系統管理員修正。" Visible="False" meta:resourcekey="lblMSDTCErrMsgResource1"></asp:Label>
    <asp:HiddenField ID="hidProjGUID" runat="server" />
    <asp:HiddenField ID="hidOrgProjGUID" runat="server" />
    <asp:HiddenField ID="hidMode" runat="server" />
    <asp:HiddenField ID="hidCopyUser" runat="server" />
    <asp:HiddenField ID="hidFileGroupId" runat="server" />
    <asp:HiddenField ID="hidStatus" runat="server" />
    <asp:HiddenField ID="hidAuditTrack" runat="server" value="" />

</asp:Content>

