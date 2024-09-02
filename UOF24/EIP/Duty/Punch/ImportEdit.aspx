<%@ Page Title="匯入檔案" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Punch_ImportEdit" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ImportEdit.aspx.cs" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="PopTable" cellspacing="1">
        <tr>
            <td style="white-space: nowrap;">
                <asp:Label ID="Label1" runat="server" Text="選擇匯入檔案" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>                
                <uc2:UC_FileCenter runat="server" id="UC_FileCenter" AllowedMultipleFileSelection="false" AllowedFileType="Excel" />                
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/EIP/Duty/Punch/ImportPunchSample.xls"
                    Text="下載Excel範例" Target="_blank" meta:resourcekey="HyperLink1Resource1"></asp:HyperLink>
            </td>
        </tr>
    </table>
    <asp:TextBox ID="txtMsg" runat="server" ReadOnly="True" Rows="15" TextMode="MultiLine" Visible="false" Width="100%"></asp:TextBox>
    <asp:Label ID="lblMsgCardNo" runat="server" Text="人員卡片號碼為必填" Visible="False" meta:resourcekey="lblMsgCardNoResource1"></asp:Label>
    <asp:Label ID="lblMsgPunchTime" runat="server" Text="刷卡時間為必填" Visible="False" meta:resourcekey="lblMsgPunchTimeResource1"></asp:Label>
    <asp:Label ID="lblMsgPunchTimeFormat" runat="server" Text="日期格式不正確" Visible="False" meta:resourcekey="lblMsgPunchTimeFormatResource1"></asp:Label>
    <asp:Label ID="lblMsgType" runat="server" Text="上下班卡類別為必填(Off:下班卡;Work:上班卡)" Visible="False" meta:resourcekey="lblMsgTypeResource1"></asp:Label>
    <asp:Label ID="lblMsgTypeFormat" runat="server" Text="格式不正確(Off:下班卡;Work:上班卡)" Visible="False" meta:resourcekey="lblMsgTypeFormatResource1"></asp:Label>
    <asp:Label ID="lblSuccess" runat="server" Text="匯入成功,共匯入{0}筆資料" Visible="False" meta:resourcekey="lblSuccessResource1"></asp:Label>
    <asp:Label ID="lblMsgUser" runat="server" Text="此卡號不存在" Visible="False" meta:resourcekey="lblMsgUserResource1"></asp:Label>
    <asp:Label ID="lblFormateErrorMsg" runat="server" Text="匯入檔案格式錯誤，請重新上傳！" Visible="False" meta:resourcekey="lblFormateErrorMsgResource1"></asp:Label>
    <asp:Label ID="lblFileNotParse" runat="server" Visible="False" Text="匯入的檔案無法解析" meta:resourcekey="lblFileNotParseResource1"></asp:Label>        

</asp:Content>
