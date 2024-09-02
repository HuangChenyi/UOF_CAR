<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Report_LoginLog_SendNotLoginUserMail" Title="輸入郵件內容" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SendNotLoginUserMail.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />


    <table id="TABLE1" cellspacing="1" class="PopTable" style="width: 100%; height: 250px">
        <tr>
            <td class="PopTableLeftTD" style="width: 60px; height: 30px">
                <asp:Label ID="lblSubject" runat="server" Text="主旨：" Width="60px" meta:resourcekey="lblSubjectResource1"></asp:Label></td>
            <td class="PopTableRightTD" style=" height: 30px">
                <asp:TextBox ID="txtSubject" runat="server" Width="100%" meta:resourcekey="txtSubjectResource1" Text="U-Office Force系統使用通知"></asp:TextBox><asp:RequiredFieldValidator
                    ID="rfvSubject" runat="server" ControlToValidate="txtSubject"
                    ErrorMessage="請輸入主旨" Font-Size="X-Small" Display="Dynamic" meta:resourcekey="rfvSubjectResource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="width: 60px; height: 100px">
                <asp:Label ID="lblBody" runat="server" Text="內容：" Width="60px" meta:resourcekey="lblBodyResource1"></asp:Label></td>
            <td class="PopTableRightTD" style=" height: 100px">
                <asp:TextBox ID="txtBody" runat="server" Height="174px" TextMode="MultiLine" Width="100%" meta:resourcekey="txtBodyResource1" Text="親愛的使用者，您好&#13;&#10;根據系統記錄，您已經有許多天未使用U-Office Force系統了，特發送e-Mail提醒您，系統內有很多重要資訊和待辦工作，請您務必要經常登入系統作業&#13;&#10;       謝謝您!!! [@]  系統管理員&#13;&#10;網址：#"></asp:TextBox><asp:RequiredFieldValidator ID="rfvBody" runat="server" ControlToValidate="txtBody" ErrorMessage="請輸入內容" Font-Size="X-Small" Display="Dynamic" meta:resourcekey="rfvBodyResource1"></asp:RequiredFieldValidator></td>
        </tr>
    </table>
    <asp:Label ID="lblSendOK" runat="server" Text="郵件寄送成功" Visible="False" meta:resourcekey="lblSendOKResource1"></asp:Label>

</asp:Content>

