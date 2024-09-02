<%@ Page Title="辦識結果" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocOCRResult" Codebehind="DocOCRResult.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="PopTable" style="border:1px; height:100%;">
        <tr>
            <td class="PopTableLeftTD" style=" height:100%;">
                <asp:Label ID="lblContent" runat="server" Text="辨識內容"></asp:Label>
            </td>
            <td class="PopTableRightTD" style=" height:100%;">
                <asp:TextBox ID="txtContent" runat="server" Width="100%" Height="100%" ReadOnly="true" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfFileID" runat="server" />
    <asp:HiddenField ID="hfType" runat="server" />
    <asp:HiddenField ID="hfStatus" runat="server" />
    <asp:HiddenField ID="hfStartTime" runat="server" />
    <asp:Label ID="lblRecognizing" runat="server" Text="檔案辨識中。" Visible="false"></asp:Label>
    <asp:Label ID="lblError" runat="server" Text="檔案辨識異常，請重新辨識。" Visible="false"></asp:Label>
    <asp:Label ID="lblTimeout" runat="server" Text="檔案辨識逾時，請重新辨識。" Visible="false"></asp:Label>
    <asp:Label ID="lblOtherError" runat="server" Text="無辨識資訊，請重新啟動OCR排程。" Visible="false"></asp:Label>
    <asp:Label ID="lblTimeoutError" runat="server" Text="無逾時參數，請由Web.config設定。" Visible="false"></asp:Label>
</asp:Content>

