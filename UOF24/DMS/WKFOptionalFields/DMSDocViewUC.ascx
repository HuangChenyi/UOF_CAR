<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DMSDocViewUC.ascx.cs" Inherits="Ede.Uof.Web.DMS.WKFOptionalFields.DMSDocViewUC" %>

<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc1" TagName="UC_HtmlEditor" %>
<%@ Register Src="~/DMS/WKFOptionalFields/UC_DMSUimgViewer.ascx" TagPrefix="uc1" TagName="UC_DMSUimgViewer" %>
<%@ Register Src="~/Edoc/Common/UC_EdocViewer.ascx" TagPrefix="uc1" TagName="UC_EdocViewer" %>

<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

    <script type="text/javascript">
    
        $(function () {
            //電子公文的UC_EdocViewer，必須在父層用div限制最大寬度，否則一放大會跑版
            var tdContWidth = $(".tdCont").width();
            $(".divContentViewer").css('maxWidth', tdContWidth);
        })
    
    </script>

</telerik:RadCodeBlock >

<asp:UpdatePanel ID="UpdateDmsDocDocView" runat="server">
    <ContentTemplate>
        <table border="0" cellpadding="0" cellspacing="0" style="width: 99%">
            <tr id="trVisible" runat="server">
                <td style="word-break: break-all; white-space: normal" class="tdCont">
                    <div id="divCont" runat="server">
                        <asp:TextBox ID="txtEditor" runat="server" Width="99%" TextMode="MultiLine" Height="300px" Visible="False" meta:resourcekey="txtEditorResource1"></asp:TextBox>
                        <uc1:UC_HtmlEditor runat="server" id="RadEditor1" width="99%" modulename="WKF" enabletheming="True" Enabled="false" />
                    </div>
                    <uc1:UC_DMSUimgViewer runat="server" ID="UC_DMSUimgViewer" Visible="False" Width="900" />

                    <div class="divContentViewer" style="width:99%; height:99%;">
                        <uc1:UC_EdocViewer runat="server" ID="UC_EdocViewer" Visible="False" Width="900" />
                    </div>
                    <asp:Label runat="server" ID="lblMessage" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblConverting" runat="server" Text="正在進行檔案轉換，請稍後再觀看" Visible="False" meta:resourcekey="lblConvertingResource1"></asp:Label>
<asp:Label ID="lblDocNotFound" runat="server" Text="文件已被銷毀" Visible="False" meta:resourcekey="lblDocNotFoundResource1"></asp:Label>
<asp:Label ID="lblDocCantView" runat="server" Text="此文件已下架、失效或作廢，無法觀看或下載" Visible="False" meta:resourcekey="lblDocCantViewResource1"></asp:Label>
<asp:Label ID="lblNoLendAuth" runat="server" Text="無觀看文件權限, 請洽文件管理管理員" Visible="false" meta:resourcekey="lblNoLendAuthResource1"></asp:Label>
<asp:Label ID="lblConvertError" runat="server" Text="轉檔失敗" Visible="False" meta:resourcekey="lblConvertErrorResource1"></asp:Label>
<asp:Label ID="lblNotsupportDoc" runat="server" Text="目錄設定為必須轉檔，但此檔案類型並不支援" Visible="False" meta:resourcekey="lblNotsupportDocResource1"></asp:Label>
<asp:Label ID="lblFileHasPassword" runat="server" Text="原始檔案有設定密碼，無法轉檔" Visible="false" meta:resourcekey="lblFileHasPasswordResource1"></asp:Label>
<asp:Label ID="lblFilePageOutLimitMsg" runat="server" Text="檔案頁數{0}頁，超過可轉檔上限。" Visible="false" meta:resourcekey="lblFilePageOutLimitMsgResource1"></asp:Label>
<asp:Label ID="lblProtectMsg" runat="server" Text="此為保全文件無法線上觀看" Visible="False" meta:resourcekey="lblProtectMsgResource1"></asp:Label>
