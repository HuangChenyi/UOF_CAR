<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="PMS_Audit_Reform" Title="專案改善" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Reform.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../Common/UC_ProjectWorkItem.ascx" TagName="UC_ProjectWorkItem" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">

        function DialogAuditTrack() {
            var ProjGUID = $uof.tool.htmlDecode($('#<%= hidProjGUID.ClientID %>').val());
            var GUID = $uof.tool.htmlDecode($('#<%= hidGUID.ClientID %>').val());
            var Type = "Series";
            $uof.dialog.open2("~/PMS/Audit/Track.aspx", this, "", 500, 400, function () { return false; }, { "PROJECT_GUID": ProjGUID, "GUID": GUID, "Type": Type });
            return false;
        }

        function toolBarReform_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            if (value == "btnReform") {
                var msg = $uof.tool.htmlDecode('<%= lblReformCheckMsg.Text %>');;
                args.set_cancel(!confirm(msg));
            }
        }

    </script>
    <table class="PopTable" cellpadding="0" cellspacing="0">
        <td style="text-align: left">
            <table>
                <tr>
                    <td style="text-align: left" class="SizeMemo">
                        <asp:Label ID="Label2" runat="server" Text="當階段送審被否決時，利用改善的功能可以快速的複製需要重新指派的任務。" ForeColor="Blue" meta:resourcekey="Label2Resource1"></asp:Label>
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="請勾選下列欲改善的任務" ForeColor="Blue" meta:resourcekey="Label3Resource1"></asp:Label>

                        <asp:Label ID="lblReformedMsg" runat="server" Text="(該階段已經改善過)" Font-Bold="True" ForeColor="Blue" meta:resourcekey="lblReformedMsgResource1"></asp:Label>
                    </td>

            </table>
            <telerik:RadToolBar ID="toolBarReform" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="toolBarReform_ButtonClicking" meta:resourcekey="toolBarReformResource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="改善" Value="btnReform"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m01.png" DisabledImageUrl="~/Common/Images/Icon/icon_m01.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m01.png" ImageUrl="~/Common/Images/Icon/icon_m01.png" meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:CustomValidator ID="cvMessage" runat="server" Display="Dynamic" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
                    <telerik:RadTreeView ID="rdCompletetree" runat="server" EnableNodeTextHtmlEncoding="true"></telerik:RadTreeView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="toolBarReform" EventName="ButtonClick"></asp:AsyncPostBackTrigger>
                </Triggers>
            </asp:UpdatePanel>
        </td>
    </table>
    <br />
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <table class="PopTable" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="text-align: left" class="SizeMemo">
                        <asp:Label ID="Label5" runat="server" Text="注意:改善後的預計開始日預設為今天，請到任務內容調整至您所需的日期。" meta:resourcekey="Label5Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="PopTableHeader">
                        <asp:Label ID="Label4" runat="server" Text="待改善階段預覽" meta:resourcekey="Label4Resource1"></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text="(只顯示{0}下尚未完成的階段或任務)" meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:left;">
                        <asp:Label ID="lblNoData" runat="server" Text="沒有尚未完成的階段或任務" meta:resourcekey="lblNoDataResource1"></asp:Label>
                        <div id="divWorkItem" runat="server">
                            <uc1:UC_ProjectWorkItem ID="ucProjectWorkItem" runat="server" />
                        </div>
                    </td>
                </tr>
            </table>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="toolBarReform" EventName="ButtonClick"></asp:AsyncPostBackTrigger>
        </Triggers>
    </asp:UpdatePanel>
    &nbsp;

    <asp:HiddenField ID="hidProjGUID" runat="server" />
    <asp:HiddenField ID="hidGUID" runat="server" />

    <asp:Label ID="lblAuditTrack" runat="server" Text="審核歷程" Visible="False" meta:resourcekey="lblAuditTrackResource1"></asp:Label>
    <asp:Label ID="lblNotAllowedActionMsg" runat="server" Text="不允許做改善操作" Visible="False" meta:resourcekey="lblNotAllowedActionMsgResource1"></asp:Label>
    <asp:Label ID="lblNoAuthorityMsg" runat="server" Text="您沒有操作權限" Visible="False" meta:resourcekey="lblNoAuthorityMsgResource1"></asp:Label>
    <asp:Label ID="lblReformCheckMsg" runat="server" Text="您確定要將勾選的階段或任務重新加入{0}下嗎?" Visible="False" meta:resourcekey="lblReformCheckMsgResource1"></asp:Label>
    <asp:Label ID="lblReform" runat="server" Text="改善" Visible="False" meta:resourcekey="lblReformResource1"></asp:Label>

    <asp:Label ID="lblDisableMSDTCMsg" runat="server" Text=" 已停用分散式交易管理員 (MSDTC) 的網路存取，<br/>請通知系統管理員修正。" Visible="False" meta:resourcekey="lblDisableMSDTCMsgResource1"></asp:Label>
    <asp:Label ID="lblMSDTCErrMsg" runat="server" Text=" 分散式交易管理員 (MSDTC) 的網路存取發生錯誤，<br/>請通知系統管理員修正。" Visible="False" meta:resourcekey="lblMSDTCErrMsgResource1"></asp:Label>
</asp:Content>

