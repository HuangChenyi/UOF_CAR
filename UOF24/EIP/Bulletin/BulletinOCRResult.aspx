<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Bulletin_BulletinOCRResult" Codebehind="BulletinOCRResult.aspx.cs" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table class="PopTable" style="border:1px; height:100%;">
        <tr>
            <td class="PopTableLeftTD" style=" height:100%;">
                <asp:Label ID="lblContent" runat="server" Text="辨識內容" meta:resourcekey="lblContentResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style=" height:100%;">
                <asp:TextBox ID="txtContent" runat="server" Width="100%" Height="100%" ReadOnly="True" TextMode="MultiLine" meta:resourcekey="txtContentResource1"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfFileID" runat="server" />
    <asp:HiddenField ID="hfStatus" runat="server" />
    <asp:HiddenField ID="hfStartTime" runat="server" />
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:Label ID="lblRecognizing" runat="server" Text="檔案辨識中。" Visible="False" meta:resourcekey="lblRecognizingResource1"></asp:Label>
    <asp:Label ID="lblError" runat="server" Text="檔案辨識異常，請重新辨識。" Visible="False" meta:resourcekey="lblErrorResource1"></asp:Label>
    <asp:Label ID="lblTimeout" runat="server" Text="檔案辨識逾時，請重新辨識。" Visible="False" meta:resourcekey="lblTimeoutResource1"></asp:Label>
    <asp:Label ID="lblOtherError" runat="server" Text="無辨識資訊，請重新啟動OCR排程。" Visible="False" meta:resourcekey="lblOtherErrorResource1"></asp:Label>
    <asp:Label ID="lblTimeoutError" runat="server" Text="無逾時參數，請由Web.config設定。" Visible="False" meta:resourcekey="lblTimeoutErrorResource1"></asp:Label>
</asp:Content>

