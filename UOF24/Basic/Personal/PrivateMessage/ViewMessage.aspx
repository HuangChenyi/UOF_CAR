<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Basic_Personal_PrivateMessage_ViewMessage" Title="瀏覽訊息" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ViewMessage.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<style type="text/css">
td.JustAddBorder table tr td {
    border-width:1px;
    border-style:solid;
}
</style>
    <script type="text/javascript">
        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            if (value == "reply") {
                args.set_cancel(true);
                $uof.dialog.open2("~/Basic/Personal/PrivateMessage/ReplyMessage.aspx", args.get_item(), "Reply Message", 1024, 768, OpenDialogResult, { "msgId": "<%=lbMsgId.Text%>" });         
            }
            else if (value == "replyall") {
                args.set_cancel(true);
                $uof.dialog.open2("~/Basic/Personal/PrivateMessage/ReplyMessage.aspx", args.get_item(), "Reply Message", 1024, 768, OpenDialogResult, { "msgId": "<%=lbMsgId.Text%>", "Receive": "<%=lbIsReceive.Text %>" , "replyall": 1 });
            }
            else if (value == "forward") {
                args.set_cancel(true);
                $uof.dialog.open2("~/Basic/Personal/PrivateMessage/NewMessage.aspx", args.get_item(), "New Message", 1024, 768, OpenDialogResult, { "msgId": "<%=lbMsgId.Text%>" });           
            }
            else if (value == "transfer") {
                args.set_cancel(true);
                $uof.dialog.open2("~/Basic/Personal/PrivateMessage/TransferMessage.aspx",args.get_item(), "Transfer Message", 1024, 768, OpenDialogResult, { "msgId": "<%=lbMsgId.Text%>" });       
            }
            else if (value == "delete") {
                if (confirm('<%=msgDelconfirm.Text %>') == false)
                    args.set_cancel(true);
            }
        }

        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) == 'undefined')
                return false;
            else
                return true;
        }

        function PrintMessage() {
        var msgId = '<%=lbMsgId.Text%>';
        var Receive = '<%=lbIsReceive.Text%>';
        var fontsize = $("#<%=hfFontSize.ClientID%>").val();     
        var url = '../PrivateMessage/PrintMessage.aspx?msgId=' + msgId + '&Receive=' + Receive + '&fontsize=' + fontsize;        
        window.open(url, "", "width = 980, height = 700");
        return false;
    }
    </script>
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_ButtonClicking" meta:resourcekey="RadToolBar1Resource1">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="刪除訊息" Value="delete"
                ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="回覆訊息" Value="reply"
                ClickedImageUrl="~/Common/Images/Icon/icon_m34.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m34.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m34.gif" ImageUrl="~/Common/Images/Icon/icon_m34.gif" meta:resourcekey="RadToolBarButtonResource3">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="s3">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="全部回覆" Value="replyall" 
                ClickedImageUrl="~/Common/Images/Icon/icon_m224.png" DisabledImageUrl="~/Common/Images/Icon/icon_m224.png"
                HoveredImageUrl="~/Common/Images/Icon/icon_m224.png" ImageUrl="~/Common/Images/Icon/icon_m224.png" meta:resourcekey="RadToolBarButtonResource13">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="s4">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="轉寄訊息" Value="forward"
                ClickedImageUrl="~/Common/Images/Icon/icon_m35.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m35.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m35.gif" ImageUrl="~/Common/Images/Icon/icon_m35.gif" meta:resourcekey="RadToolBarButtonResource5">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="s1" meta:resourcekey="RadToolBarButtonResource6">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="上一筆" Value="prev"
                ClickedImageUrl="~/Common/Images/Icon/icon_m36.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m36.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m36.gif" ImageUrl="~/Common/Images/Icon/icon_m36.gif" meta:resourcekey="RadToolBarButtonResource7">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="prevSeparator">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="下一筆" Value="next"
                ClickedImageUrl="~/Common/Images/Icon/icon_m37.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m37.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m37.gif" ImageUrl="~/Common/Images/Icon/icon_m37.gif" meta:resourcekey="RadToolBarButtonResource9">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="nextSeparator">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="轉成工作" Value="transfer"
                ClickedImageUrl="~/Common/Images/Icon/icon_m38.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m38.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m38.gif" ImageUrl="~/Common/Images/Icon/icon_m38.gif" meta:resourcekey="RadToolBarButtonResource11">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="s2" meta:resourcekey="RadToolBarButtonResource12">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <asp:ValidationSummary ID="ValidationSummary1" ForeColor="White" BackColor="Red" runat="server" meta:resourcekey="ValidationSummary1Resource1" />
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="None" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <div id="printTable">    
    <table class="PopTable" style="width:100%">
        <tr>
            <td style="width: 8%; white-space: nowrap;">
                <asp:Label ID="lbLeftTopic" runat="server" Text="主旨" meta:resourcekey="lbLeftTopicResource1"></asp:Label></td>
            <td style="width: 92%; word-wrap: break-word;">
                <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto" meta:resourcekey="Panel2Resource1">
                    <asp:Label ID="lbTopic" runat="server"  meta:resourcekey="lbTopicResource1"></asp:Label>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="width: 8%; white-space: nowrap;">
                <asp:Label ID="lbLeftReader" runat="server" Text="收件人" meta:resourcekey="lbLeftReaderResource1"></asp:Label>
            </td>
            <td style="width: 92%">
                <asp:Label ID="lbReader" runat="server" meta:resourcekey="lbReaderResource1"></asp:Label>
                <br />
                <asp:LinkButton ID="lbQueryAllReceiver" Visible="false" runat="server" Text="查看所有收件人" meta:resourcekey="lbQueryAllReceiverResource1"></asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td style="width: 8%; white-space: nowrap;">
                <asp:Label ID="lbLeftSender" runat="server" Text="寄件人" meta:resourcekey="lbLeftSenderResource1"></asp:Label></td>
            <td style="width: 92%"><asp:Label ID="lbSender" runat="server" meta:resourcekey="lbSenderResource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 8%; white-space: nowrap;">
                <asp:Label ID="lbLeftCreateTime" runat="server" Text="寄件時間" meta:resourcekey="lbLeftCreateTimeResource1"></asp:Label></td>
            <td style="width: 92%"><asp:Label ID="lbCreateTime" runat="server" meta:resourcekey="lbCreateTimeResource1"></asp:Label></td>
        </tr>
        <tr id="readTR" runat="server">
            <td style="width: 8%; white-space: nowrap;">
                <asp:Label ID="lbLeftReadedTime" runat="server" Text="閱讀時間" meta:resourcekey="lbLeftReadedTimeResource1"></asp:Label></td>
            <td style="width: 92%"><asp:Label ID="lbReadedTime" runat="server" meta:resourcekey="lbReadedTimeResource1"></asp:Label></td>
        </tr>
        <tr id="replyTR" runat="server">
            <td style="width: 8%; white-space: nowrap;">
                <asp:Label ID="lbLeftReplyTime" runat="server" Text="回覆時間" meta:resourcekey="lbLeftReplyTimeResource1"></asp:Label></td>
            <td style="width: 92%"><asp:Label ID="lbReplyTime" runat="server" meta:resourcekey="lbReplyTimeResource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 8%; white-space: nowrap;">
                <asp:Label ID="lbLeftContent" runat="server" Text="訊息內容" meta:resourcekey="lbLeftContentResource1"></asp:Label></td>
            <td style="line-height: normal; width: 92%; height:260px;" class="editorcontentstyle JustAddBorder">
                <asp:Literal ID="ltContext" runat="server" meta:resourcekey="ltContextResource1"></asp:Literal></td>
        </tr>
        <tr>
            <td style="width: 8%; white-space: nowrap;">
                <asp:Label ID="lbFile" runat="server" Text="附件" meta:resourcekey="lbFileResource1"></asp:Label></td>
            <td style="width: 92%">                
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" />
            </td>
        </tr>
    </table>    
    </div>
    <asp:HiddenField ID="hiddenOrder" runat="server" />
    <asp:HiddenField ID="hiddenOrderCol" runat="server" />
    <asp:Label ID="lbMsgId" runat="server" Visible="False" meta:resourcekey="lbMsgIdResource1"></asp:Label>
    <asp:Label ID="lbIsReceive" runat="server" Visible="False" meta:resourcekey="lbIsReceiveResource1"></asp:Label>
    <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
    <asp:Label ID="msgNopreviousmsg" runat="server" Text="無上一筆訊息" Visible="False" meta:resourcekey="msgNopreviousmsgResource1"></asp:Label>
    <asp:Label ID="msgNonextmsg" runat="server" Text="無下一筆訊息" Visible="False" meta:resourcekey="msgNonextmsgResource1"></asp:Label>
    <asp:Label ID="lblPrint" runat="server" Text="列印" Visible="False" meta:resourcekey="lblPrintResource1"></asp:Label>    
    <asp:HiddenField ID="hfFontSize" runat="server" />
    <asp:Label ID="lblNotExist" runat="server" Text="訊息內容不存在" Visible="false" meta:resourcekey="lblNotExistResource1"></asp:Label>

    <asp:Label ID="lblTotalAmount" runat="server" Text="...共{0}人" Visible="false" meta:resourcekey="lblTotalAmountResource1"></asp:Label>
    <asp:Label ID="lblViewAllReceiverTitle" runat="server" Text="所有收件人" Visible="false" meta:resourcekey="lblViewAllReceiverTitleResource1"></asp:Label>
</asp:Content>
