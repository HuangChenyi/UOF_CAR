<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SendRevisedDocMessage.aspx.cs" Inherits="Ede.Uof.Web.DMS.Query.SendRevisedDocMessage" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .choiceListAttr {
            overflow: auto;
            max-height: 150px;
        }
    </style>
    <script>
        Sys.Application.add_load(
            function () {
                if ($('#<%=hfPostBack.ClientID%>').val() != 'True') return;
              $('#<%=hfPostBack.ClientID%>').val('False');

            var curwindow = $uof.dialog.getOpener();
            var pd;
            if (curwindow) {
                pd = curwindow.document;
            } else if (typeof (dialogArguments) != 'undefined') {
                pd = dialogArguments.document;
            }
            var selectType = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["hfSelectType"] ,true)%>');
            if (pd && selectType == "SELECT") {
                if ($("#<%=Request.QueryString["hfSelectDoc"]%>", pd) != null) {
                    var hfDocClientID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["hfSelectDoc"] ,true)%>');
                    var selectDoc = $("#" + hfDocClientID, pd).val();
                    $('#<%=hfSelectDoc.ClientID %>').val(selectDoc);
                }
            }
            else if (pd && selectType == "ALL") {
                if ($("#<%=Request.QueryString["hfAllAuthorListClientId"]%>", pd) != null) {
                    var hfAllAuthorListClientId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["hfAllAuthorListClientId"] ,true)%>');
                    var allAuthorList = $("#" + hfAllAuthorListClientId, pd).val();
                    $('#<%=hfAuthorList.ClientID %>').val(allAuthorList);
                }
            }
            $('#<%= btnLoadUser.ClientID%>').click();
            });

    </script>
    <table class="PopTable" style="width: 100%">
        <tr>
            <td>
                <asp:Label ID="lblStar" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblStarResource1"></asp:Label>
                <asp:Label ID="lblSubject" runat="server" Text="主旨" meta:resourcekey="lblSubjectResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSubject" runat="server" Width="99%" MaxLength="200" Text="文件未完成改版通知" meta:resourcekey="txtSubjectResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfSubjectVaild" runat="server" Display="Dynamic" ControlToValidate="txtSubject" ErrorMessage="主旨不可為空白" meta:resourcekey="rfSubjectVaildResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblRecevier" runat="server" Text="收件人" meta:resourcekey="lblRecevierResource1"></asp:Label>
            </td>
            <td>
                <div class="choiceListAttr">
                    <uc1:UC_ChoiceList ID="UC_AuthorChoiceList" runat="server" ChioceType="User" IsAllowEdit="false" />
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblContent" runat="server" Text="內容" meta:resourcekey="lblContentResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtContent" runat="server" Rows="6" Width="99%" TextMode="MultiLine" meta:resourcekey="txtContentResource1"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:Button ID="btnLoadUser" runat="server" Style="display: none" OnClick="btnLoadUser_Click" meta:resourcekey="btnLoadUserResource1" />
    <asp:HiddenField ID="hfPostBack" runat="server" Value="True" />
    <asp:HiddenField ID="hfAuthorList" runat="server" />
    <asp:HiddenField ID="hfDocList" runat="server" />
    <asp:HiddenField ID="hfSelectDoc" runat="server" />
    <asp:HiddenField ID="hfCurrentGuid" runat="server" />
    <asp:Label ID="lblHello" runat="server" Text="您好" Visible="False" meta:resourcekey="lblHelloResource1"></asp:Label>
    <asp:Label ID="lblContentMsg" runat="server" Text="以下為改版中文件列表，提醒您盡快完成改版作業。" Visible="False" meta:resourcekey="lblContentMsgResource1"></asp:Label>
</asp:Content>
