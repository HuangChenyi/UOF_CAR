<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_SendPW" Title="" Culture="auto"
    meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SendPW.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/jscript">
        $(function () {            
            var curwindow = $uof.dialog.getOpener();
            var pd;
            if (curwindow) {
                pd = curwindow.document;
            } else if (typeof (dialogArguments) != "undefined") {
                pd = dialogArguments.document;
            }

            if (pd) {
                var obj = $("#<%=Request.QueryString["hideCheckedUserID"]%>", pd);
                if (obj != null) {
                    $("#<%=hideUsers.ClientID %>").val(obj.val());
                }
            }
        });
function ValidateContext(source, arguments) {
    var result1 = arguments.Value.indexOf("[NewPassword]");
    var result2 = arguments.Value.indexOf("[Account]");
    if (result1 < 0 || result2 < 0) {
        arguments.IsValid = false;
    }
    else {
        arguments.IsValid = true;
    }
}
    </script>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubject"
        Display="Dynamic" ErrorMessage="請輸入主旨" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContext"
        Display="Dynamic" ErrorMessage="請輸入內容" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
    <asp:CustomValidator ID="cvContext" runat="server" ClientValidationFunction="ValidateContext"
        ControlToValidate="txtContext" Display="Dynamic" ErrorMessage="[Account]、[NewPassword]字樣請勿修改"
        meta:resourcekey="cvContextResource1"></asp:CustomValidator>
    <table class="PopTable" cellspacing="1" width="100%">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="主旨" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSubject" runat="server" Text="密碼通知函" Width="100%" meta:resourcekey="txtSubjectResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="內容" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtContext" runat="server" Rows="12" TextMode="MultiLine" Width="100%"
                    Text="親愛的使用者，您好&#13;&#10;&#13;&#10;您的帳號：[Account]&#13;&#10;您的臨時密碼 : [NewPassword]&#13;&#10;&#13;&#10;請於下次登入時使用上述密碼，並請於登入後立即變更密碼&#13;&#10;謝謝您!!!  &#13;&#10;                   系統管理員&#13;&#10;網址：[URL]"
                    meta:resourcekey="txtContextResource1"></asp:TextBox>
            </td>
        </tr>
    </table>

    <asp:Label ID="lblContextDes" runat="server" Text="上述內容中的[Account]、[NewPassword]字樣請勿修改"
        ForeColor="blue" meta:resourcekey="lblContextDesResource1"></asp:Label><br />
    <asp:Label ID="Label3" runat="server" ForeColor="Blue" Text="系統管理員將在稍後收到一則載明密碼清單的私人訊息"
        meta:resourcekey="Label3Resource1"></asp:Label>
    <asp:Label ID="lblSendOK" runat="server" Text="發送成功" Visible="False" meta:resourcekey="lblSendOKResource1"></asp:Label>
    <asp:Label ID="lblSendFail" runat="server" Text="發送失敗" Visible="False" meta:resourcekey="lblSendFailResource1"></asp:Label>&nbsp;
    <input id="hideUsers" type="hidden" runat="server" />
</asp:Content>
