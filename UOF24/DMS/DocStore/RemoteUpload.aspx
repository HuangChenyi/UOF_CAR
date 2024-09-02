<%@ Page Title="異地發佈" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_RemoteUpload" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="RemoteUpload.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">

        var currentSelNode;
        var currentSelNodeLend;
        var nodeCurrentSelect;//目錄
        var DemandNodeID = "";
        function Button1ClientOnClick(docId, allowSameNamePublish, remoteSitefolderId, wsUrl, docName, remoteUploadId, remoteSiteUrl) {
            var actionMode = "<%=actionMode %>";
            if (actionMode == "Publish") {
                $uof.dialog.open2("~/DMS/DocStore/RemoteUploadVersion.aspx", this, "", 500, 200, OpenDialogResult, { "docId": docId, "allowSameNamePublish": allowSameNamePublish, "remoteSitefolderId": remoteSitefolderId, "wsUrl": wsUrl, "docName": docName, "remoteUploadId": remoteUploadId, "remoteSiteUrl": remoteSiteUrl });
                return false;
            }
        }

        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) == 'undefined' || returnValue == null)
                return false;
            else {
                $uof.dialog.set_returnValue(returnValue);
                var pathdata = [$("#<%=hfRemoteFolderPath.ClientID %>").val(), $("#<%=hfRemoteUploadId.ClientID %>").val()];
                $uof.pageMethod.sync("UpdateRemoteFolderPath", pathdata);

                //top.close();
                $uof.dialog.close();

                //return false;
            }
        }


        function myFolderTree_NodeClicking(sender, args) {
            $("#<%=hidSelectNose.ClientID%>").val(args.get_node().get_value());
        }
    </script>

    <asp:Image ID="Image1" runat="server" ImageUrl="~/DMS/images/open.gif" meta:resourcekey="Image1Resource1" />
    <asp:Label ID="lblFilePath" runat="server" Text="Label" meta:resourcekey="lblFilePathResource1"></asp:Label>
    <fieldset style="width: 99%">
        <legend>
            <asp:Label ID="Label1" runat="server" Text="選擇發佈集團" meta:resourcekey="Label1Resource1"></asp:Label>
        </legend>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table style="width: 100%">
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="選擇集團" meta:resourcekey="Label2Resource1"></asp:Label>
                            <asp:DropDownList ID="ddlGroupSite" runat="server" AutoPostBack="True"
                                OnSelectedIndexChanged="ddlGroupSite_SelectedIndexChanged"
                                meta:resourcekey="ddlGroupSiteResource1">
                            </asp:DropDownList>
                            <asp:Label ID="lblGroupSite" runat="server" meta:resourcekey="lblGroupSiteResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="cbPermit" runat="server" Text="若文件名稱重複允許異地發佈" meta:resourcekey="cbPermitResource1" />
                        </td>
                    </tr>
                    <tr>
                        <td style="overflow: auto; vertical-align: top; height: 350px">
                            <telerik:RadTreeView ID="myFolderTree" runat="server" OnClientNodeClicking="myFolderTree_NodeClicking" EnableNodeTextHtmlEncoding="true"></telerik:RadTreeView>
                        </td>
                    </tr>
                </table>
                <asp:HiddenField ID="hfWsUrl" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlGroupSite" EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>



    </fieldset>

    <fieldset style="width: 99%">
        <legend>
            <asp:Label ID="Label4" runat="server" Text="注意事項" ForeColor="Blue" meta:resourcekey="Label4Resource1"></asp:Label>
        </legend>
        <asp:Label ID="Label5" runat="server" Text="1. 具有文管目錄作者或目錄管理者權限，才能使用異地發佈功能。" ForeColor="Blue" meta:resourcekey="Label5Resource1"></asp:Label><br />
        <asp:Label ID="Label6" runat="server" Text="2. 要進行異地發佈到其他集團，需具有該集團作者或目錄管理者權限。" ForeColor="Blue" meta:resourcekey="Label6Resource1"></asp:Label><br />
        <asp:Label ID="Label7" runat="server" Text="3. 文件直接公布不經過審核" ForeColor="Blue" meta:resourcekey="Label7Resource1"></asp:Label><br />
        <asp:Label ID="Label8" runat="server" Text="4. 文件屬性繼承該目錄" ForeColor="Blue" meta:resourcekey="Label8Resource1"></asp:Label><br />
        <asp:Label ID="Label9" runat="server" Text="5. 文件名稱重複" ForeColor="Blue" meta:resourcekey="Label9Resource1"></asp:Label><br />
        &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label10" runat="server" Text="- 允許異地發佈，則發佈的文件版本會自動加一版(EX: 2.0 => 3.0)。" ForeColor="Blue" meta:resourcekey="Label10Resource1"></asp:Label><br />
        &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label11" runat="server" Text="- 文件名稱重複時，不允許異地發佈，會出現提示訊息" ForeColor="Blue" meta:resourcekey="Label11Resource1"></asp:Label><br />
    </fieldset>

    <asp:Label ID="lblDMSRoot" runat="server" Text="文件庫" Visible="False" meta:resourcekey="lblDMSRootResource1"></asp:Label>
    <asp:Label ID="lblConnectionError" runat="server" Text="WebService連線失敗" Visible="False" meta:resourcekey="lblConnectionErrorResource1"></asp:Label>
    <asp:Label ID="lblNotAllowUpload" runat="server" Text="文件名稱重複，不允許異地發佈" Visible="False" meta:resourcekey="lblNotAllowUploadResource1"></asp:Label>
    <asp:Label ID="lblAccountNotFind" runat="server" Text="目前使用者的帳號不存在所選集團中" Visible="False" meta:resourcekey="lblAccountNotFindResource1"></asp:Label>
    <asp:Label ID="lblAccountLocked" runat="server" Text="目前使用者的帳號在所選集團中已被鎖定" Visible="False" meta:resourcekey="lblAccountLockedResource1"></asp:Label>
    <asp:Label ID="lblAccountExpired" runat="server" Text="目前使用者的帳號在所選集團中已過期" Visible="False" meta:resourcekey="lblAccountExpiredResource1"></asp:Label>
    <asp:Label ID="lblAccountSuspended" runat="server" Text="目前使用者的帳號在所選集團中已停用" Visible="False" meta:resourcekey="lblAccountSuspendedResource1"></asp:Label>
    <asp:Label ID="lblInProcessing" runat="server" Text="此文件要發佈的路徑已存在於排程進行中" Visible="False" meta:resourcekey="lblInProcessingResource1"></asp:Label>
    <asp:Label ID="lblPublish" runat="server" Text="公佈" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
    <asp:Label ID="lblPrivilege" runat="server" Text="無此目錄的發佈權限" Visible="False" meta:resourcekey="lblPrivilegeResource1"></asp:Label>
    <asp:Label ID="lblCheckOut" runat="server" Text="異地端文件非發佈狀態，不允許異地發佈" Visible="False" meta:resourcekey="lblCheckOutResource1"></asp:Label>
    <asp:HiddenField ID="hfHdFilePath" runat="server" />
    <asp:HiddenField ID="hfOtherSitefolderId" runat="server" />
    <asp:HiddenField ID="hfFileId" runat="server" />
    <asp:HiddenField ID="hfDocName" runat="server" />
    <asp:HiddenField ID="hidNotShowFolder" runat="server" Value="''" />
    <asp:HiddenField ID="hidNotShowChildFolderID" runat="server" Value="''" />
    <asp:HiddenField ID="hidSelectNose" runat="server" />
    <asp:HiddenField ID="hfRemoteFolderPath" runat="server" />
    <asp:HiddenField ID="hfRemoteUploadId" runat="server" />
    <asp:HiddenField ID="hdTreeID" runat="server" />
    <asp:Label ID="lblSelect" runat="server" Text="請選擇"  meta:resourcekey="lblSelectResource1" Visible="false"></asp:Label>
</asp:Content>
