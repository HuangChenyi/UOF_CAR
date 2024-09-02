<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Config_SmtpConn" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SmtpConn.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class=PopTable cellspacing=1 width=100%>
        <tr>
            <td>
                <span style="color: #ff0000">*</span><asp:Label ID="lbLeftSmtp" runat="server" Text="SMTP Server" meta:resourcekey="lbLeftSmtpResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txbSmtp" runat="server" MaxLength="50" 
                    meta:resourcekey="txbSmtpResource1" Columns="50"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbSmtp"
                    Display="Dynamic" ErrorMessage="SMTP Server 不允許為空白" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td>
                <span style="color: #ff0000">*</span><asp:Label ID="lbLeftPort" runat="server" Text="Port" meta:resourcekey="lbLeftPortResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txbPort" runat="server" Width="40px" MaxLength="50" meta:resourcekey="txbPortResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txbPort"
                    Display="Dynamic" ErrorMessage="Port 不允許為空白" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txbPort"
                    Display="Dynamic" ErrorMessage="請輸入數字" Operator="DataTypeCheck" Type="Integer" meta:resourcekey="CompareValidator2Resource1"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <span style="color: #ff0000"></span><asp:Label ID="lbLeftAccount" runat="server" Text="SMTP認證帳號" meta:resourcekey="lbLeftAccountResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txbAccount" runat="server" MaxLength="50" 
                    meta:resourcekey="txbAccountResource1" Columns="50"></asp:TextBox>&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbLeftPwd" runat="server" Text="SMTP認證密碼" meta:resourcekey="lbLeftPwdResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txbPwd" runat="server" TextMode="Password" autocomplete="off"
                    meta:resourcekey="txbPwdResource1" Columns="50"></asp:TextBox>&nbsp;
            </td>
        </tr>
         <tr>
            <td>
                <asp:Label ID="lblSSL" runat="server" Text="啟用SSL" meta:resourcekey="lblSSLResource1"></asp:Label></td>
            <td>
               <asp:CheckBox ID="chkSSL" runat="server" />&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <span style="color: #ff0000">*</span><asp:Label ID="lbLeftSender" runat="server" Text="預設寄件人" meta:resourcekey="lbLeftSenderResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txbSender" runat="server" MaxLength="300" 
                    meta:resourcekey="txbSenderResource1" Columns="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txbSender"
                    ErrorMessage="寄件人不允許為空白" Display="Dynamic" meta:resourcekey="RequiredFieldValidator4Resource1"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txbSender"
                    Display="Dynamic" ErrorMessage="請輸入正確的Email格式" 
                    ValidationExpression="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$|^.+\&lt;([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})\&gt;$" 
                    meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td>
                <span style="color: #ff0000">*</span><asp:Label ID="lblReceiver" runat="server" 
                    Text="收件人" meta:resourcekey="lblReceiverResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txbReceiver" runat="server" MaxLength="300" 
                    meta:resourcekey="txbSenderResource1" Columns="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txbReceiver"
                    ErrorMessage="收件人不允許為空白" Display="Dynamic" 
                    meta:resourcekey="RequiredFieldValidator4Resource1"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txbReceiver"
                    Display="Dynamic" ErrorMessage="請輸入正確的Email格式" 
                    ValidationExpression="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$|^.+\&lt;([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})\&gt;$" 
                    meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbLeftSubject" runat="server" Text="主旨" meta:resourcekey="lbLeftSubjectResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txbSubject" runat="server" MaxLength="300" 
                    meta:resourcekey="txbSubjectResource1" Text="來自1'st U-Office Force系統的測試信" Columns="50"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbLeftBody" runat="server" Text="內容" meta:resourcekey="lbLeftBodyResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txbBody" runat="server" MaxLength="300" 
                    meta:resourcekey="txbBodyResource1" Text="來自1'st U-Office Force系統的測試信" Columns="50"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lbLeftResult" runat="server" Text="測試結果" meta:resourcekey="lbLeftResultResource1"></asp:Label></td>
            <td align=left>
                <asp:Label ID="lblSuccess" runat="server" Text="測試連線成功" Visible=False ForeColor="Blue" meta:resourcekey="lbSuccessResource1"></asp:Label>
                <asp:Label ID="lblFailed" runat="server" Text="測試連線失敗" Visible=False ForeColor=Red meta:resourcekey="lbFailedResource1"></asp:Label>
                <br />
                <asp:Label ID="lblFailedMsg" runat="server" Visible="false" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:Label ID="lbBeginTest" runat="server" Text="開始測試" Visible="False" meta:resourcekey="lbBeginTestResource1"></asp:Label>
</asp:Content>

