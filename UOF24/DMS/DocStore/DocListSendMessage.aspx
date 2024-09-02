<%@ Page Title="發送文件到期訊息通知" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocListSendMessage" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="DocListSendMessage.aspx.cs" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">   
        
        function ForcePostBack() {
            var curwindow = $uof.dialog.getOpener();
            var pd;
            if (curwindow) {
                pd = curwindow.document;
            } else if (typeof (dialogArguments) != "undefined") {
                pd = dialogArguments.document;
            }
            
            if (pd) {
                var Author = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["Author"], true)%>");
                var ChooseFolder = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["ChooseFolder"], true)%>");
                $("#<%=hfAuthor.ClientID%>").val($("#" + Author, pd).val());
                $("#<%=hfFolder.ClientID%>").val($("#"+ ChooseFolder, pd).val());
            }            

            $("#<%=btnPostBack.ClientID%>").click();
        }

    </script>

    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubject"
        Display="Dynamic" ErrorMessage="請輸入主旨" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContext"
        Display="Dynamic" ErrorMessage="請輸入內容" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
    <table class="PopTable" cellspacing="1" width="100%">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="主旨" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSubject" runat="server" Text="文件到期通知" Width="100%" meta:resourcekey="txtSubjectResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>                
                <asp:Label ID="lblMsgUser" runat="server" Text="收件人" meta:resourcekey="lblMsgUserResource1"></asp:Label>                
            </td>
            <td>
                <div style="overflow: auto; width: 100%; height:50px">
                    <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" IsAllowEdit="false" />
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="內容" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtContext" runat="server" Rows="12" TextMode="MultiLine" Width="100%"
                    Text="您好&#13;&#10;&#13;&#10;以下為文件即將過期列表" meta:resourcekey="txtContextResource1"></asp:TextBox>
            </td>
        </tr>
    </table>

    <asp:Label ID="lblDocTitle" runat="server" Text="文件標題" Visible="False" meta:resourcekey="lblDocTitleResource1"></asp:Label>
    <asp:Label ID="lblDocVersion" runat="server" Text="版本" Visible="False" meta:resourcekey="lblDocVersionResource1"></asp:Label>
    <asp:Label ID="lblPathTitle" runat="server" Text="目錄" Visible="False" meta:resourcekey="lblPathTitleResource1"></asp:Label>
    <asp:Label ID="lblInvalidDate" runat="server" Text="到期日" Visible="False" meta:resourcekey="lblInvalidDateResource1"></asp:Label>
    <asp:Label ID="lblDmsRoot" runat="server" Text="文件庫" Visible="False" meta:resourcekey="lblDmsRootResource1"></asp:Label>
    <asp:HiddenField ID="hfAuthor" runat="server" />
    <asp:HiddenField ID="hfFolder" runat="server" />
    <asp:Button ID="btnPostBack" runat="server" Text="Button" OnClick="btnPostBack_Click" style="display:none" meta:resourcekey="btnPostBackResource1" />
</asp:Content>

