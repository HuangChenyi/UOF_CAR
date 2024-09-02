<%@ Page Title="交辦討論" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="DevolveForum.aspx.cs" Inherits="Ede.Uof.Web.EIP.Calendar.DevolveForum.DevolveForum" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/EIP/Calendar/DevolveForum/UC_DevolveForumArticle.ascx" TagPrefix="uc1" TagName="UC_DevolveForumArticle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">

        function RadToolBar1_OnClientButtonClicking(sender, args) {
              if (args.get_item().get_value() === "createArticle") {
                  args.set_cancel(true);
                  $uof.dialog.open2('~/EIP/Calendar/DevolveForum/CreateArticle.aspx', args.get_item(), '<%=lblCreateTitle.Text%>', 900, 720, openDialogResult, { "devolveGuid": "<%=hfDevolveGuid.Value%>"});
              }
          }

          function openDialogResult(returnValue) {
              if (typeof (returnValue) == "undefined") {
                  return false;
              }
              return true;
          }
    </script>
    <table border="0" class="table2" style="width: 100%; text-align: left">
        <tr>
            <td>
                <telerik:RadToolBar ID="RadToolBar1" runat="server" Visible="False" Width="100%" OnClientButtonClicking="RadToolBar1_OnClientButtonClicking" OnButtonClick="RadToolBar1_ButtonClick1" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                    <Items>
                        <telerik:RadToolBarButton Value="createArticle" runat="server" Text="新增討論" PostBack="true"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m12.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m12.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m12.gif"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m12.gif" meta:resourcekey="RadToolBarButtonResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton Value="separator1" IsSeparator="true" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <uc1:UC_DevolveForumArticle runat="server" id="UC_DevolveForumArticle" />
                    </ContentTemplate>
                </asp:UpdatePanel>

                <asp:Label ID="lbNoArticle" runat="server" Text="此交辦尚無討論文章。" Visible="False" meta:resourcekey="lbNoArticleResource1"></asp:Label>
                <asp:CustomValidator ID="cvReadAuthority" runat="server" Display="Dynamic" ErrorMessage="沒有權限閱讀" ForeColor="Red" meta:resourcekey="cvReadAuthorityResource1"></asp:CustomValidator>
                <asp:CustomValidator ID="cvNoSuchArticle" runat="server" Display="Dynamic" ErrorMessage="無此文章存在" ForeColor="Red" meta:resourcekey="cvNoSuchArticleResource1"></asp:CustomValidator>
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
    <asp:Label ID="msgLockconfirm" runat="server" Text="確定要鎖定?" Visible="False" meta:resourcekey="msgLockconfirmResource1"></asp:Label>
    <asp:Label ID="msgContentdeleted" runat="server" Text="內容已被刪除" Visible="False" meta:resourcekey="msgContentdeletedResource1"></asp:Label>
    <asp:HiddenField ID="hidPageDown" runat="server" />
    <asp:HiddenField ID="hidShowPageIndex" runat="server" />
    <asp:Label ID="lblCreateTitle" runat="server" Text="新增討論" Visible="False" meta:resourcekey="lblCreateTitleResource1"></asp:Label>
    <asp:HiddenField ID="hfDevolveGuid" runat="server" Visible="false" />

</asp:Content>