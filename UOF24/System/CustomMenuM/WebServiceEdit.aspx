<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="WebServiceEdit.aspx.cs" Inherits="System_CustomMenuM_WebServiceEdit" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
     Sys.Application.add_load(
          function  () {
            if ($('#<%=hfPostBack.ClientID%>').val() != 'True') return;
            $('#<%=hfPostBack.ClientID%>').val('False');

            // 清空欄位
            $('#<%=txtWSUrl.ClientID%>').val('');
            $('#<%=txtWSMethod.ClientID%>').val('');  

            var curwindow = $uof.dialog.getOpener();
            var pd;
            if (curwindow) {
                pd = curwindow.document;
            } else if (typeof (dialogArguments) != 'undefined') {
                pd = dialogArguments.document;
            }

            if (pd) {                    
                // 載入webservice資料
                if ($("#<%=Request.QueryString["url"]%>", pd) != null) {
                    var hfurlClientID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["url"] ,true)%>');
                    var wsUrl = $("#" + hfurlClientID, pd).val().trim();
                    $('#<%=txtWSUrl.ClientID%>').val(wsUrl);           
                }
                if ($("#<%=Request.QueryString["method"]%>", pd) != null) {
                    var hfmethodClientID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["method"] ,true)%>');
                    var wsMethod = $("#" + hfmethodClientID, pd).val().trim();
                    $('#<%=txtWSMethod.ClientID%>').val(wsMethod);           
                }
            }
        });

        function UpdateWSData() {       
            var curwindow = $uof.dialog.getOpener();
            var pd;
            var txtWSUrl = $('#<%=txtWSUrl.ClientID%>').val();
            var txtWSMethod = $('#<%=txtWSMethod.ClientID%>').val();

            if (curwindow) {
                pd = curwindow.document;
            }
            else if (typeof (dialogArguments) != "undefined") {
                pd = dialogArgument.document;
            }
            // 回傳webservice資料
            $('#<%=Request.QueryString["url"]%>', pd).val(txtWSUrl);
            $('#<%=Request.QueryString["method"]%>', pd).val(txtWSMethod);          
        }
    </script>
    <table class="PopTable" style="width: 100%">
        <tr>
            <td style="width: 15%; white-space: nowrap">
                <asp:Label ID="lblWSUrl" runat="server" Text="來源網址" meta:resourcekey="lblWSUrlResource1"></asp:Label>
            </td>
            <td style="width: 85%; white-space: nowrap; border-top: none">
                <asp:TextBox ID="txtWSUrl" runat="server" MaxLength="200" Width="99%" meta:resourcekey="txtWSUrlResource1"></asp:TextBox>
                <br><asp:CustomValidator ID="cvWSUrlValid" runat="server" ErrorMessage="請輸入來源網址" Display="Dynamic" meta:resourcekey="cvWSUrlValidResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 15%; white-space: nowrap; border-top: none">
                <asp:Label ID="lblWSMethod" runat="server" Text="呼叫的方法" meta:resourcekey="lblWSMethodResource1" />
            </td>
            <td style="width: 85%; white-space: nowrap; border-top: none">
                <asp:TextBox ID="txtWSMethod" runat="server" MaxLength="100" Width="99%" meta:resourcekey="txtWSMethodResource1"></asp:TextBox>
                <br><asp:CustomValidator ID="cvWSMethodValid" runat="server" ErrorMessage="請輸入呼叫的方法" Display="Dynamic" meta:resourcekey="cvWSMethodValidResource1"></asp:CustomValidator>
            </td>
        </tr>
    </table>
    <telerik:RadButton ID="btnTest" runat="server" Text="連線測試" OnClick="btnTest_Click" meta:resourcekey="btnTestResource1" style="position: relative;" />
    <asp:Label ID="lblSuccess" runat="server" Text="連線成功" ForeColor="Blue" Visible="False" meta:resourcekey="lblSuccessResource1" />
    <asp:Label ID="lblFail" runat="server" Text="連線失敗" ForeColor="Blue" Visible="False" meta:resourcekey="lblFailResource1" />
    <br>
    <asp:Label ID="lblInfo" runat="server" Text="透過來源及呼叫方法取得的資訊會顯示於面板名稱下方。" ForeColor="Blue" meta:resourcekey="lblInfoResource1" />
    <br>    
    <asp:HyperLink ID="hyLink" runat="server" NavigateUrl="~/System/CustomMenuM/Image/webserviceInfo.png" Text="顯示範例" Target="_blank" meta:resourcekey="lbtnLinkResource1"></asp:HyperLink>
    <br>   
    <asp:HiddenField ID="hfMenuId" runat="server" />
    <asp:HiddenField ID="hfPostBack" runat="server" Value="True" />
</asp:Content>
