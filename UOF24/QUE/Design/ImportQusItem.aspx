<%@ Page Title="匯入問卷題目" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ImportQusItem.aspx.cs" Inherits="Ede.Uof.Web.QUE.Design.ImportQusItem" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function replaceWarning() {
            if (!confirm('<%=lblReplaceWarring.Text %>')) {
                return false;
            }
        }
    </script>
    <table class="PopTable" cellspacing="1">
        <tr>
            <td style="white-space: nowrap;">
                <asp:Label ID="Label1" runat="server" Text="選擇匯入檔案" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <uc2:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedMultipleFileSelection="false" AllowedFileType="Excel" />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/QUE/Design/ImportQusItemExample.xls"
                    Text="下載Excel範例" Target="_blank" meta:resourcekey="HyperLink1Resource1"></asp:HyperLink>
            </td>
        </tr>
    </table>
    <asp:TextBox ID="txtMsg" runat="server" ReadOnly="True" Rows="5" TextMode="MultiLine" Visible="False" Width="100%" meta:resourcekey="txtMsgResource1"></asp:TextBox>    
    
    <asp:Label ID="lblOther" runat="server" Text="其他" Visible="False" meta:resourcekey="lblOtherResource1"></asp:Label>
    <asp:Label ID="lblLinesLimit" runat="server" Text="第{0}行 {1}範圍1~10" Visible="False" meta:resourcekey="lblLinesLimitResource1"></asp:Label>
    <asp:Label ID="lblScoreLimit" runat="server" Text="第{0}行 {1}範圍-999~999" Visible="False" meta:resourcekey="lblScoreLimitResource1"></asp:Label>
    <asp:Label ID="lblFormateErrorMsg" runat="server" Text="匯入檔案格式錯誤，請重新上傳！" Visible="False" meta:resourcekey="lblFormateErrorMsgResource1"></asp:Label>
    <asp:Label ID="lblQuestuinIDRepeat" runat="server" Text="問卷題目代號:{0}重複" Visible="False" meta:resourcekey="lblQuestuinIDRepeatResource1"></asp:Label>    
    <asp:Label ID="lblFormatErr" runat="server" Text="第{0}行 {1}欄位格式設定錯誤" Visible="False" meta:resourcekey="lblFormatErrResource1"></asp:Label>    
    <asp:Label ID="lblMustInput" runat="server" Text="第{0}行 {1}欄位不能為空白" Visible="False" meta:resourcekey="lblMustInputResource1"></asp:Label>    
    <asp:Label ID="lblReplaceWarring" runat="server" Text="已有設定的問卷內容，請確認是否要取代？" Visible="False" meta:resourcekey="lblReplaceWarringResource1"></asp:Label>    
    <asp:Label ID="lblModifyXLS" runat="server" Text="，請確認" Visible="False" meta:resourcekey="lblModifyXLSResource1"></asp:Label>    
    <asp:Label ID="lblFileNotParse" runat="server" Visible="False" Text="匯入的檔案無法解析" meta:resourcekey="lblFileNotParseResource1"></asp:Label>        
</asp:Content>
