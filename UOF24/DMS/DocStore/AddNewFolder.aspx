<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_AddNewFolder" Title="新增子目錄" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" CodeBehind="AddNewFolder.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/jscript">

        $(function () {


            if ($("#panelPrivilege").get(0)) {
                $("#panelPrivilege").prop("disabled", true);
            }

        });

        //$(function () { });

        function AddFolder(folderGUID, folderName) {
            var curwindow = $uof.dialog.getOpener();
            if (curwindow) {
                curwindow.nodeAddFolder(folderName, folderGUID);

            } else if (typeof (dialogArguments) != "undefined") {
                var callerWindowObj = dialogArguments;
                callerWindowObj.nodeAddFolder(folderName, folderGUID);

            }
        }

    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" border="0">
                <tr>
                    <td align="center" class="PopTableHeader" style="text-align: center!important">
                        <asp:Label ID="Label12" runat="server" Text="新增子目錄" meta:resourcekey="Label12Resource1"></asp:Label></td>
                </tr>
            </table>
            <table runat="server" id="tableaaa" border="1" cellpadding="0" cellspacing="0" class="PopTable">

                <tr>
                    <td align="right" style="width: 20%; white-space: nowrap;">
                        <img alt="" src="../../DMS/images/open.gif" />
                        <asp:Label ID="Label1" runat="server" Text="上層目錄" meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblPath" runat="server"></asp:Label>
                        <asp:HiddenField ID="hidFolderID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 20%; white-space: nowrap;">
                        <asp:Label ID="Label2" runat="server" Text="子目錄名稱" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td>
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtFolderName" runat="server" Width="100%" MaxLength="300" onKeyDown="if (event.keyCode==13)event.keyCode=9;"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFolderName" Display="Dynamic" ErrorMessage="請輸入目錄名稱" SetFocusOnError="True" meta:resourcekey="RequiredFieldValidator1Resource1">
                                    </asp:RequiredFieldValidator>
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="目錄名稱已存在" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                                </td>
                                <td style="padding: 0px 0px 0px 5px;">
                                    <asp:CheckBox ID="cbCultureSetting" runat="server" AutoPostBack="True" meta:resourcekey="cbCultureSettingResource1" OnCheckedChanged="cbCultureSetting_CheckedChanged" Text="設定語系" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server" id="trCulture" visible="false">
                    <td colspan="2" style="padding: 0px;">
                        <asp:Table ID="tbCulture" runat="server" Style="border-style: hidden;" class="PopTable"></asp:Table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%;">
                        <asp:Label ID="Label3" runat="server" Text="備註" meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMemo" runat="server" Rows="10" TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <asp:Label ID="labNoNoAuthority" runat="server" ForeColor="Red" Text="無新增目錄的權限!" Visible="False" meta:resourcekey="labNoNoAuthorityResource1"></asp:Label>
            <asp:HiddenField ID="hdFolderName" runat="server" />
            <asp:Label ID="lblFolderIsDelete" runat="server" Text="目錄已被刪除" Visible="false" meta:resourcekey="lblFolderIsDeleteResource1"></asp:Label>
            <asp:Label ID="labDocStore" runat="server" meta:resourcekey="labDocStoreResource1" Text="文件庫" Visible="False"></asp:Label>
            <asp:Label ID="lblDefaultCulture" runat="server" meta:resourcekey="lblDefaultCultureResource1" Text="預設語系" Visible="False"></asp:Label>
            <asp:Label ID="lblNonEmpty" runat="server" meta:resourcekey="lblNonEmptyResource1" Text="不可空白" Visible="False"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


