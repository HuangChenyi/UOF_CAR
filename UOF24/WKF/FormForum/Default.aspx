<%@ Page Title="" Language="C#" MasterPageFile="../../Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="FormForum_Default" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="Default.aspx.cs" %>
<%@ Register src="UC_FormForum.ascx" tagname="UC_FormForum" tagprefix="uc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script id="ForumSubjectDetail_pageLoaded" type="text/javascript">
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_pageLoaded(pageLoaded);

        function pageLoaded(sender, args) {
            var BoardChanged = $("<%#UC_FormForum1.BoardChangedClientID%>").val();
            var SubjectChanged = $("<%#UC_FormForum1.SubjectChangedClientID%>").val();
            if (BoardChanged == "1" || SubjectChanged == "1") {
                ClearSiteMapNode();
                AddForumBoardSiteMapNode();
                $("<%#UC_FormForum1.BoardChangedClientID%>").val() = "0";
                $("<%#UC_FormForum1.SubjectChangedClientID%>").val() = "0";

            }
        }


    Sys.Application.add_load(function () {
        self.moveTo(0, 0);
        self.resizeTo(screen.width, screen.height);
    });

    function OnBarMainClick(sender, args) {
        if (args.get_item().get_value() == "createArticle") {
            args.set_cancel(true);
            $uof.dialog.open2('~/WKF/FormForum/NewArticleDialog.aspx', args.get_item(), '', 900, 720, openDialogResult, { "taskid": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["taskid"], true)%>" });
        }
    }
        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }
</script>

    <asp:UpdatePanel ID="UpdatePanelGrid" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table border="0" class="table2" style="width: 100%; text-align: left">
                <tr>
                    <td>
                        <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" Visible="False" OnClientButtonClicking="OnBarClicking" meta:resourcekey="RadToolBar1Resource1">
                            <Items>
                                <telerik:RadToolBarButton Value="createArticle" runat="server" Text="新增討論"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                    ImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m12.gif" meta:resourcekey="RadToolBarButtonResource1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton Value="separator1" IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>

                            </Items>
                        </telerik:RadToolBar>
                        <asp:Label ID="lbNoArticle" runat="server" Text="此表單尚無討論文章。" Visible="False" meta:resourcekey="lbNoArticleResource1"></asp:Label>
                        <asp:CustomValidator ID="cvReadAuthority" runat="server" Display="Dynamic" ErrorMessage="沒有權限閱讀" meta:resourcekey="cvReadAuthorityResource1" ForeColor="Red"></asp:CustomValidator>
                        <asp:CustomValidator ID="cvNoSuchArticle" runat="server" Display="Dynamic" ErrorMessage="無此文章存在" meta:resourcekey="cvNoSuchArticleResource1" ForeColor="Red"></asp:CustomValidator>
                    </td>
                </tr>
            </table>
            <uc1:UC_FormForum ID="UC_FormForum1" runat="server" />

        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
    <asp:Label ID="msgLockconfirm" runat="server" Text="確定要鎖定?" Visible="False" meta:resourcekey="msgLockconfirmResource1"></asp:Label>
    <asp:Label ID="msgContentdeleted" runat="server" Text="內容已被刪除" Visible="False"
        meta:resourcekey="msgContentdeletedResource1"></asp:Label>

    <script type="text/javascript">
        var GridObj = $('#' + GetGridKey()).get(0);
        if (GridObj != null) {
            var rowObj = GridObj.rows;
            var count;
            var hyperlinks;

            for (k = 3; k < rowObj.length; k++) {
                count = k - 1;
                if (k < 11) {
                    hyperlinks = $("#ctl00_ContentPlaceHolder1_UC_FormForum1_Grid1_ctl0" + count + "_div1 a");
                }
                else {
                    hyperlinks = $("#ctl00_ContentPlaceHolder1_UC_FormForum1_Grid1_ctl" + count + "_div1 a");
                }

                for (i = 0; i < hyperlinks.length; i++) {
                    hyperlinks[i].setAttribute('target', '_blank');
                }
            }
        }
        

        function setBlank() {
            var GridObj = $('#' + GetGridKey()).get(0);
            if (GridObj != null) {
                var rowObj = GridObj.rows;
                var count;
                var hyperlinks;

                for (k = 3; k < rowObj.length; k++) {
                    count = k - 1;
                    if (k < 11) {
                        hyperlinks = $("#ctl00_ContentPlaceHolder1_UC_FormForum1_Grid1_ctl0" + count + "_div1 a");
                    }
                    else {
                        hyperlinks = $("#ctl00_ContentPlaceHolder1_UC_FormForum1_Grid1_ctl" + count + "_div1 a");
                    }

                    for (i = 0; i < hyperlinks.length; i++) {
                        hyperlinks[i].setAttribute('target', '_blank');
                    }
                }
            }
        }
    </script>
    <asp:HiddenField ID="hidPageDown" runat="server" />
      <asp:HiddenField ID="hidShowPageIndex" runat="server" />
    <asp:Label ID="lbHome" runat="server" Text="我的首頁" Visible="False" meta:resourcekey="lbHomeResource1"></asp:Label>
    <asp:Label ID="lbFlow" runat="server" Text="電子簽核" Visible="False" meta:resourcekey="lbFlowResource1"></asp:Label>
    <asp:Label ID="lbFormForum" runat="server" Text="表單討論" Visible="False" meta:resourcekey="lbFormForumResource1"></asp:Label>
</asp:Content>

