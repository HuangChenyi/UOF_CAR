<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Basic_Personal_PrivateMessage_TransferMessage" Title="訊息轉成工作" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="TransferMessage.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="White" BackColor="Red" meta:resourcekey="ValidationSummary1Resource1" />
    <table width="100%" class="PopTable" cellspacing="1">
        <tr>
            <td style="width: 10%; white-space: nowrap;">
                <span style="color: #ff0000">*</span><asp:Label ID="lbLeftTopic" runat="server" Text="主旨" meta:resourcekey="lbLeftTopicResource1"></asp:Label></td>
            <td style="width: 90%;">
                <asp:TextBox ID="txbTopic" runat="server" Width="100%" MaxLength="200" meta:resourcekey="txbTopicResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbTopic" ForeColor="Red"
                    Display="None" ErrorMessage="必須輸入主旨" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 100px; white-space: nowrap;">
                <asp:Label ID="lbLeftContent" runat="server" Text="內容" meta:resourcekey="lbLeftContentResource1"></asp:Label></td>
            <td style="width: 90%;">
                <asp:TextBox ID="txbContent" runat="server" Height="470px" TextMode="MultiLine" Width="100%" meta:resourcekey="txbContentResource1"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 100px; white-space: nowrap;">
                <asp:Label ID="lbLeftBeginTime" runat="server" Text="開始時間" meta:resourcekey="lbLeftBeginTimeResource1"></asp:Label></td>
            <td style="width: 90%;">
                <table>
                    <tr>
                        <td>
                            <telerik:RadDateTimePicker ID="rdtpDateChooserBegin" runat="server"
                                meta:resourcekey="rdtpDateChooserBeginResource1">
                            </telerik:RadDateTimePicker>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 100px; white-space: nowrap;">
                <asp:Label ID="lbLeftEndTime" runat="server" Text="結束時間" meta:resourcekey="lbLeftEndTimeResource1"></asp:Label></td>
            <td style="width: 90%;">
                <table>
                    <tr>
                        <td>
                            <telerik:RadDateTimePicker ID="rdtpDateChooserEnd" runat="server"
                                meta:resourcekey="rdtpDateChooserEndResource1">
                            </telerik:RadDateTimePicker>
                        </td>
                        <td>
                            <asp:CustomValidator ID="cvIllegalTime" runat="server" Display="None" ForeColor="Red"
                                ErrorMessage="結束時間需晚於開始時間" meta:resourcekey="cvIllegalTimeResource1"></asp:CustomValidator>
                            <asp:CustomValidator ID="cvBeginTime" runat="server" Display="None" ForeColor="Red"
                                ErrorMessage="請填入開始時間" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                            <asp:CustomValidator ID="cvEndTime" runat="server" Display="None"
                                ErrorMessage="請填入結束時間" ForeColor="Red"
                                meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
    </table>
    <asp:Label ID="lbMsgId" runat="server" Visible="False" meta:resourcekey="lbMsgIdResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
