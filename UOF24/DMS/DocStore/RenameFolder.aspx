<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_RenameFolder" Title="目錄重新命名" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="RenameFolder.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/jscript">

        function RenameScript(folderName) {

            var curwindow = $uof.dialog.getOpener();
            if (curwindow) {
                curwindow.nodeFolderRename(folderName);

            } else if (typeof (dialogArguments) != "undefined") {
                var callerWindowObj = dialogArguments;
                callerWindowObj.nodeFolderRename(folderName);
            }
        }


    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table border="1" cellpadding="0" cellspacing="0" width="100%" class="PopTable">
                <tr>
                    <td style="width: 30%">
                        <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="路徑"></asp:Label></td>
                    <td>
                        <img src="../../DMS/images/open.gif" />
                        <asp:Label ID="lblPath" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="舊目錄名稱"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblOldFolderName" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1" Text="新目錄名稱"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtFolderName" runat="server" MaxLength="300" Width="204px" onKeyDown="if (event.keyCode==13)return false;"></asp:TextBox>
                        <asp:CheckBox ID="cbCultureSetting" runat="server" Text="設定語系" AutoPostBack="True" OnCheckedChanged="cbCultureSetting_CheckedChanged" meta:resourcekey="cbCultureSettingResource1" />
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFolderName"
                            Display="Dynamic" ErrorMessage="請輸入目錄名稱" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="此目錄名稱已存在" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr runat="server" id="trCulture" visible="false">
                    <td colspan="2" style="padding: 0px;">
                        <asp:Table ID="tbCulture" runat="server" Style="border-style: hidden;" class="PopTable"></asp:Table>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblFolderIsDelete" runat="server" Text="目錄已被刪除" Visible="false" meta:resourcekey="lblFolderIsDeleteResource1"></asp:Label>
            <asp:Label ID="labDocStore" runat="server" meta:resourcekey="labDocStoreResource1"
                Text="文件庫" Visible="False"></asp:Label>
            <asp:Label ID="lblNonEmpty" runat="server" meta:resourcekey="lblNonEmptyResource1" Text="不可空白" Visible="False"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
